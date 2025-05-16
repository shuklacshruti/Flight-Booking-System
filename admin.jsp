<%@ page import="JavaStuff.UserDao" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
</head>
<body>
    <h2>Admin Dashboard</h2>
    <h3>User Management</h3>
    
    <form action="addUser.jsp" method="post">
        <input type="text" name="username" placeholder="Username" required><br>
        <input type="password" name="password" placeholder="Password" required><br>
        <select name="role">
            <option value="admin">Admin</option>
            <option value="customerRep">Customer Rep</option>
            <option value="customer">Customer</option>
        </select><br>
        <input type="submit" value="Add User">
    </form>

    <h3>Manage Users</h3>
    <a href="viewUsers.jsp">View All Users</a>

    <h3>Manage Reservations</h3>
    <a href="viewReservations.jsp">View All Reservations</a>

    <h3>Cancel Reservation</h3>
    <a href="rep.jsp">Cancel Reservation</a>
</body>
</html>
