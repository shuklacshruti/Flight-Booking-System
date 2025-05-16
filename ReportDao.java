package JavaStuff;

import java.util.*; 
import java.util.stream.Collectors;

public class ReportDao {

    public Map<String, Double> getSalesByMonth(List<Reservation> reservations, String month) {
        return reservations.stream()
                .filter(r -> r.getFlight().getDate().startsWith(month))
                .collect(Collectors.groupingBy(
                        r -> r.getFlight().getFlightNumber(),
                        Collectors.summingDouble(r -> r.getFlight().getPrice())
                ));
    }

    public Map<String, Double> getRevenueSummary(List<Reservation> reservations, String mode) {
        switch (mode.toLowerCase()) {
            case "flight":
                return reservations.stream().collect(Collectors.groupingBy(
                        r -> r.getFlight().getFlightNumber(),
                        Collectors.summingDouble(r -> r.getFlight().getPrice())));
            case "airline":
                return reservations.stream().collect(Collectors.groupingBy(
                        r -> r.getFlight().getAirline(),
                        Collectors.summingDouble(r -> r.getFlight().getPrice())));
            case "customer":
                return reservations.stream().collect(Collectors.groupingBy(
                        Reservation::getCustomerName,
                        Collectors.summingDouble(r -> r.getFlight().getPrice())));
            default:
                return new HashMap<>();
        }
    }

    public String getTopRevenueCustomer(List<Reservation> reservations) {
        return reservations.stream()
                .collect(Collectors.groupingBy(
                        Reservation::getCustomerName,
                        Collectors.summingDouble(r -> r.getFlight().getPrice())))
                .entrySet().stream()
                .max(Map.Entry.comparingByValue())
                .map(Map.Entry::getKey)
                .orElse("None");
    }

    public String getMostActiveFlight(List<Reservation> reservations) {
        return reservations.stream()
                .collect(Collectors.groupingBy(
                        r -> r.getFlight().getFlightNumber(),
                        Collectors.counting()))
                .entrySet().stream()
                .max(Map.Entry.comparingByValue())
                .map(Map.Entry::getKey)
                .orElse("None");
    }

    public void addUser(List<User> users, User newUser) {
        users.add(newUser);
    }

    public void deleteUser(List<User> users, String username) {
        users.removeIf(u -> u.getUsername().equalsIgnoreCase(username));
    }

    public void updateUser(List<User> users, String username, String newRole) {
        for (User u : users) {
            if (u.getUsername().equalsIgnoreCase(username)) {
                u.setRole(newRole);
                break;
            }
        }
    }
}