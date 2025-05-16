package JavaStuff;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class CustomerRepresentative {

    private List<Flight> flights;
    private List<Airport> airports;

    public CustomerRepresentative(List<Flight> flights, List<Airport> airports) {
        this.flights = flights;
        this.airports = airports;
    }

    public void makeReservationOnBehalf(User user, Flight flight, ReservationDao reservationDao) {
        reservationDao.addReservation(new Reservation(user.getUsername(), flight));
    }

    public void editReservation(ReservationDao reservationDao, String username, String flightNumber, Flight newFlight) {
        List<Reservation> reservations = reservationDao.getAllReservations();
        for (Reservation r : reservations) {
            if (r.getCustomerName().equalsIgnoreCase(username)
                    && r.getFlight().getFlightNumber().equalsIgnoreCase(flightNumber)) {
                r.setFlight(newFlight);
                break;
            }
        }
    }

    public void addFlight(Flight newFlight) {
        flights.add(newFlight);
    }

    public void deleteFlight(String flightNumber) {
        flights.removeIf(f -> f.getFlightNumber().equalsIgnoreCase(flightNumber));
    }

    public void addAirport(Airport newAirport) {
        airports.add(newAirport);
    }

    public void deleteAirport(String airportCode) {
        airports.removeIf(a -> a.getCode().equalsIgnoreCase(airportCode));
    }

    public List<Reservation> viewWaitlist(ReservationDao reservationDao, String flightNumber) {
        return reservationDao.getWaitingList(flightNumber);
    }

    public List<Flight> getFlightsForAirport(String airportName) {
        return flights.stream()
                .filter(f -> f.getOrigin().equalsIgnoreCase(airportName) || f.getDestination().equalsIgnoreCase(airportName))
                .collect(Collectors.toList());
    }

    public void replyToQuestion(QuestionDao questionDao, int questionId, String answer) {
        questionDao.answerQuestion(questionId, answer);
    }
}

class Airport {
    private String code;
    private String name;

    public Airport(String code, String name) {
        this.code = code;
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public String getName() {
        return name;
    }
} 
