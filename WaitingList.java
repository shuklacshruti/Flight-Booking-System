package JavaStuff;

import java.util.ArrayList;
import java.util.List;

public class WaitingList {
    private Flight flight;
    private List<Reservation> passengers = new ArrayList<>();

    public WaitingList(Flight flight) {
        this.flight = flight;
    }

    public void addPassenger(Reservation reservation) {
        passengers.add(reservation);
    }

    public void removePassenger(Reservation reservation) {
        passengers.remove(reservation);
    }

    public List<Reservation> getPassengers() {
        return passengers;
    }

    public Flight getFlight() {
        return flight;
    }
}
