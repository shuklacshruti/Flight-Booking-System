package JavaStuff;

import java.time.LocalDate;

public class Flight {
    private String flightNumber;
    private String origin;
    private String destination;
    private String date;
    private double price;
    private int numberOfStops;  
    private String airline;     
    private boolean isAvailable;
    private String takeOffTime;
    private String landingTime;
    private int duration; 
    private String classType;


    public Flight(String flightNumber, String origin, String destination, String date,
            double price, int numberOfStops, String airline, boolean available,
            String takeOffTime, String landingTime, int duration) {
        this.flightNumber = flightNumber;
        this.origin = origin;
        this.destination = destination;
        this.date = date;
        this.price = price;
        this.numberOfStops = numberOfStops;
        this.airline = airline;
        this.isAvailable = isAvailable;
        this.takeOffTime = takeOffTime;
        this.landingTime = landingTime;
        this.duration = duration;
    }

    // Getters and Setters
    public String getFlightNumber() {
        return flightNumber;
    }

    public String getOrigin() {
        return origin;
    }

    public String getDestination() {
        return destination;
    }

    public String getDate() {
        return date;
    }

    public double getPrice() {
        return price;
    }

    public int getNumberOfStops() {
        return numberOfStops;
    }

    public String getAirline() {
        return airline;
    }

    public boolean isAvailable() {
        return isAvailable;
    }

    public String getTakeOffTime() {
        return takeOffTime;
    }

    public String getLandingTime() {
        return landingTime;
    }

    public int getDuration() {
        return duration;
	}
    
    public String getClassType() {
        return classType;
    }

}
