<%@ page import="JavaStuff.ReservationDao, JavaStuff.Reservation, JavaStuff.FlightDao, JavaStuff.Flight" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Representative Dashboard</title>
</head>
<body>
    <h1>Customer Representative Dashboard</h1>

    <h2>View Reservations</h2>
    <form method="get" action="viewReservations.jsp">
        <label for="customerName">Customer Name:</label>
        <input type="text" name="customerName" placeholder="Customer Name"><br>
        <label for="flightNumber">Flight Number:</label>
        <input type="text" name="flightNumber" placeholder="Flight Number"><br>
        <input type="submit" value="Search Reservations">
    </form>

    <hr>

    <h2>Manage Customer Questions</h2>
    <p>View customer inquiries and respond to them.</p>

    <hr>

    <h2>Manage Reservations</h2>
    <form method="get" action="manageReservations.jsp">
        <label for="reservationId">Reservation ID:</label>
        <input type="text" name="reservationId" placeholder="Reservation ID"><br>
        <input type="submit" value="Manage Reservation">
    </form>

    <hr>

    <a href="admin.jsp">Back to Admin Dashboard</a> <!-- If user is admin -->
    <a href="userDashboard.jsp">Back to User Dashboard</a> <!-- If user is a customer -->
</body>
</html>
