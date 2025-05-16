<!DOCTYPE html>
<html>
<head>
    <title>Flight Reservation</title>
</head>
<body>
    <h2>Flight Reservation</h2>
    <form action="confirmReservation.jsp" method="post">
        <label for="flightNumber">Flight Number:</label>
        <input type="text" name="flightNumber" required><br>
        <label for="customerName">Your Name:</label>
        <input type="text" name="customerName" required><br>
        <input type="submit" value="Reserve Flight">
    </form>
</body>
</html>
