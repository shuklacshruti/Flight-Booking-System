package JavaStuff;

public class Reservation {
    private Flight flight;        
    private String customerName;
    private String status;

    public Reservation(Flight flight, String customerName, String status) {
        this.flight = flight;
        this.customerName = customerName;
        this.status = status;
    }

    public Reservation(String username, Flight flight2) {
		// TODO Auto-generated constructor stub
	}

    public Flight getFlight() {
        return flight;  
    }

    public void setFlight(Flight flight) {
        this.flight = flight;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
