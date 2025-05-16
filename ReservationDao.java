package JavaStuff;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

public class ReservationDao {
    private List<Reservation> reservations = new ArrayList<>();
    private List<Reservation> waitingList = new ArrayList<>();

    public void addReservation(Reservation reservation) {
        reservations.add(reservation);
    }

    public List<Reservation> getAllReservations() {
        return reservations;
    }

    public void addToWaitingList(Reservation reservation) {
        waitingList.add(reservation);
    }

    public List<Reservation> getWaitingList(String flightNumber) {
        return waitingList.stream()
                .filter(r -> r.getFlight().getFlightNumber().equals(flightNumber))
                .collect(Collectors.toList());
    }

    public void cancelReservation(Reservation reservation) {
        if (reservation.getFlight().getClassType().equalsIgnoreCase("business") ||
            reservation.getFlight().getClassType().equalsIgnoreCase("first")) {
            reservations.remove(reservation);
            notifyWaitlist(reservation.getFlight().getFlightNumber());
        }
    }

    private void notifyWaitlist(String flightNumber) {
        System.out.println("ALERT: A seat just opened on flight " + flightNumber + ". Notifying waitlisted customers.");
    }

    public List<Reservation> getPastReservations(String customerName) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.ENGLISH);
        LocalDate today = LocalDate.now();

        return reservations.stream()
                .filter(r -> r.getCustomerName().equalsIgnoreCase(customerName))
                .filter(r -> LocalDate.parse(r.getFlight().getDate(), formatter).isBefore(today))
                .collect(Collectors.toList());
    }

    public List<Reservation> getUpcomingReservations(String customerName) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.ENGLISH);
        LocalDate today = LocalDate.now();

        return reservations.stream()
                .filter(r -> r.getCustomerName().equalsIgnoreCase(customerName))
                .filter(r -> !LocalDate.parse(r.getFlight().getDate(), formatter).isBefore(today))
                .collect(Collectors.toList());
    }
}
