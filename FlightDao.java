package JavaStuff;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

public class FlightDao {

    private List<Flight> flights = new ArrayList<>();

    public FlightDao() {
    	flights.add(new Flight("AA101", "New York", "Los Angeles", "2025-05-20", 300.00, 1, "American Airlines", true, "08:00", "11:00", 180));
    	flights.add(new Flight("AA102", "New York", "Los Angeles", "2025-05-21", 350.00, 0, "Delta", true, "09:00", "12:00", 180));
    	flights.add(new Flight("AA103", "New York", "Chicago", "2025-05-22", 200.00, 2, "United", true, "07:00", "09:00", 120));

    }

    public List<Flight> getAllFlights() {
        return flights;
    }

    public List<Flight> searchFlights(String origin, String destination, String date, boolean isFlexible) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.ENGLISH);
        LocalDate baseDate = LocalDate.parse(date, formatter);

        return flights.stream()
                .filter(f -> f.getOrigin().equalsIgnoreCase(origin) && f.getDestination().equalsIgnoreCase(destination))
                .filter(f -> {
                    if (isFlexible) {
                        LocalDate flightDate = LocalDate.parse(f.getDate(), formatter);
                        return !flightDate.isBefore(baseDate.minusDays(3)) && !flightDate.isAfter(baseDate.plusDays(3));
                    } else {
                        return f.getDate().equals(date);
                    }
                })
                .collect(Collectors.toList());
    }

    public List<Flight> sortFlights(List<Flight> flights, String criteria) {
        switch (criteria.toLowerCase()) {
            case "price":
                return flights.stream().sorted(Comparator.comparingDouble(Flight::getPrice)).collect(Collectors.toList());
            case "takeofftime":
                return flights.stream().sorted(Comparator.comparing(Flight::getTakeOffTime)).collect(Collectors.toList());
            case "landingtime":
                return flights.stream().sorted(Comparator.comparing(Flight::getLandingTime)).collect(Collectors.toList());
            case "duration":
                return flights.stream().sorted(Comparator.comparingInt(Flight::getDuration)).collect(Collectors.toList());
            default:
                return flights;
        }
    }

    public List<Flight> filterFlights(List<Flight> flights, Double maxPrice, Integer maxStops, String airline, String takeOffAfter, String landBefore) {
        return flights.stream()
                .filter(f -> maxPrice == null || f.getPrice() <= maxPrice)
                .filter(f -> maxStops == null || f.getNumberOfStops() <= maxStops)
                .filter(f -> airline == null || f.getAirline().equalsIgnoreCase(airline))
                .filter(f -> takeOffAfter == null || f.getTakeOffTime().compareTo(takeOffAfter) >= 0)
                .filter(f -> landBefore == null || f.getLandingTime().compareTo(landBefore) <= 0)
                .collect(Collectors.toList());
    }

    public List<Flight> searchRoundTrip(String origin, String destination, String departureDate, String returnDate, boolean isFlexible) {
        List<Flight> outbound = searchFlights(origin, destination, departureDate, isFlexible);
        List<Flight> inbound = searchFlights(destination, origin, returnDate, isFlexible);
        List<Flight> roundTrip = new ArrayList<>();
        roundTrip.addAll(outbound);
        roundTrip.addAll(inbound);
        return roundTrip;
    }
}
