<%@ page import="JavaStuff.FlightDao, JavaStuff.ReservationDao, JavaStuff.Reservation, JavaStuff.Flight" %>
<%@ page import="java.util.List, java.util.stream.Collectors" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Reservations</title>
</head>
<body>
    <h2>View Reservations</h2>

<%
    String role = (String) session.getAttribute("role");
    String currentUser = (String) session.getAttribute("username");

    String flightNumber = request.getParameter("flightNumber");
    String customerName = request.getParameter("customerName");

    // Assign a final variable for lambda use
    String actualCustomerName = (customerName == null || customerName.trim().isEmpty()) 
                                ? currentUser 
                                : customerName;

    ReservationDao reservationDao = new ReservationDao();
    FlightDao flightDao = new FlightDao();

    List<Reservation> allReservations = reservationDao.getAllReservations();
    List<Reservation> filtered = allReservations.stream()
        .filter(r -> r.getCustomerName().equalsIgnoreCase(actualCustomerName))
        .filter(r -> flightNumber == null || flightNumber.isEmpty() || r.getFlight().getFlightNumber().equalsIgnoreCase(flightNumber))
        .collect(Collectors.toList());

    if (!filtered.isEmpty()) {
%>
        <table border="1">
            <tr>
                <th>Flight #</th>
                <th>From</th>
                <th>To</th>
                <th>Status</th>
                <th>Customer</th>
            </tr>
<%
        for (Reservation r : filtered) {
            Flight f = r.getFlight();
%>
            <tr>
                <td><%= f.getFlightNumber() %></td>
                <td><%= f.getOrigin() %></td>
                <td><%= f.getDestination() %></td>
                <td><%= r.getStatus() %></td>
                <td><%= r.getCustomerName() %></td>
            </tr>
<%
        }
%>
        </table>
<%
    } else {
%>
        <p>No reservations found for <b><%= actualCustomerName %></b>.</p>
<%
    }

    if (!"customer".equalsIgnoreCase(role)) {
%>
    <h3>Search Reservations</h3>
    <form method="get" action="viewReservations.jsp">
        <input type="text" name="customerName" placeholder="Customer Name">
        <input type="text" name="flightNumber" placeholder="Flight Number">
        <input type="submit" value="Search">
    </form>
<%
    }
%>
<%
    String dashboard = "userDashboard.jsp"; // default
    if ("admin".equals(role)) {
        dashboard = "AdminDashboard.jsp";
    } else if ("customerRep".equals(role)) {
        dashboard = "repDashboard.jsp";
    }
%>
<a href="<%= dashboard %>">Back to Dashboard</a>
</body>
</html>
