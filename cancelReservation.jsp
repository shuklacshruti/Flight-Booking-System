<%@ page import="JavaStuff.FlightDao, JavaStuff.ReservationDao, JavaStuff.Reservation, JavaStuff.Flight" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cancel Reservation</title>
</head>
<body>
    <h2>Cancel Reservation</h2>
    <form action="cancelReservation.jsp" method="get">
        <label for="flightNumber">Flight Number:</label>
        <input type="text" name="flightNumber" required><br>
        <label for="customerName">Customer Name:</label>
        <input type="text" name="customerName" required><br>
        <input type="submit" value="Cancel Reservation">
    </form>

    <%
        String flightNumber = request.getParameter("flightNumber");
        String customerName = request.getParameter("customerName");

        FlightDao flightDao = new FlightDao();
        ReservationDao reservationDao = new ReservationDao();

        Flight flight = flightDao.getAllFlights().stream()
                                 .filter(f -> f.getFlightNumber().equals(flightNumber))
                                 .findFirst().orElse(null);

        if (flight != null) {
            Reservation reservation = reservationDao.getAllReservations().stream()
                .filter(r -> r.getFlight().getFlightNumber().equals(flightNumber) && r.getCustomerName().equals(customerName))
                .findFirst().orElse(null);

            if (reservation != null) {
                reservationDao.cancelReservation(reservation);
    %>
                <p>Reservation for flight <%= flight.getFlightNumber() %> has been successfully canceled.</p>
    <% 
            } else {
    %>
                <p>No reservation found for the specified flight number and customer.</p>
    <% 
            }
        } else {
    %>
            <p>Flight not found.</p>
    <% 
        }
    %>
</body>
</html>
