<%@ page import="java.util.*" %>
<%@ page import="JavaStuff.FlightDao" %>
<%@ page import="JavaStuff.Flight" %>

<!DOCTYPE html>
<html>
<head>
    <title>Flight Search Results</title>
</head>
<form method="get" action="searchResults.jsp">
    <label for="sort">Sort by:</label>
    <select name="sort">
        <option value="price">Price</option>
        <option value="takeoffTime">Take-off Time</option>
    </select>
    
    <label for="filter">Filter by Airline:</label>
    <input type="text" name="airline">
    
    <input type="submit" value="Apply Filters">
</form>

<body>
    <h2>Available Flights</h2>
    <%
        String origin = request.getParameter("origin");
        String destination = request.getParameter("destination");
        String date = request.getParameter("date");

        FlightDao flightDao = new FlightDao();
        
        List<Flight> flights = flightDao.searchFlights(origin, destination, date, false);  // Assuming it's not a round trip for simplicity

        for (Flight flight : flights) {
            if (flight.getOrigin().equalsIgnoreCase(origin) && flight.getDestination().equalsIgnoreCase(destination)) {
    %>
                <p><%= flight.getFlightNumber() %> - <%= flight.getDate() %> - <%= flight.getPrice() %></p>
    <% 
            }
        }
    %>
</body>
</html>
