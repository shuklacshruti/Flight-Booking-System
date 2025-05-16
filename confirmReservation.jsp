<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="JavaStuff.FlightDao" %>
<%@ page import="JavaStuff.ReservationDao" %>
<%@ page import="JavaStuff.Reservation" %>
<%@ page import="JavaStuff.Flight" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Confirm Reservation</title>
</head>
<body>
    <h2>Reservation Confirmed!</h2>
    <%
        String flightNumber = request.getParameter("flightNumber");
        String customerName = request.getParameter("customerName");

        FlightDao flightDao = new FlightDao();
        ReservationDao reservationDao = new ReservationDao();

        Flight flight = flightDao.getAllFlights().stream()
                                 .filter(f -> f.getFlightNumber().equals(flightNumber))
                                 .findFirst().orElse(null);

        if (flight != null) {
            Reservation reservation = new Reservation(flight, customerName, "Confirmed");
            reservationDao.addReservation(reservation); 
    %>
            <p>Flight: <%= flight.getFlightNumber() %> from <%= flight.getOrigin() %> to <%= flight.getDestination() %></p>
            <p>Customer: <%= customerName %></p>
            <p>Status: Confirmed</p>
    <% 
        } else {
    %>
            <p>Flight not found.</p>
    <% 
        }
    %>
</body>
</html>
