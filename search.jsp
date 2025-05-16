<!DOCTYPE html>
<html>
<head>
    <title>Search Flights</title>
</head>
<body>
    <h2>Search Flights</h2>
    <form action="searchResults.jsp" method="get">
        <label for="origin">Origin:</label>
        <input type="text" name="origin" required><br>
        <label for="destination">Destination:</label>
        <input type="text" name="destination" required><br>
        <label for="date">Date:</label>
        <input type="date" name="date" required><br>
        <input type="submit" value="Search Flights">
    </form>
</body>
</html>
