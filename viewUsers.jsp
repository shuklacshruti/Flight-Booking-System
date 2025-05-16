<%@ page import="java.util.List" %>
<%@ page import="JavaStuff.UserDao" %>
<%@ page import="JavaStuff.User" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Users</title>
</head>
<body>
    <h2>Manage Users</h2>
    
    <table border="1">
        <thead>
            <tr>
                <th>Username</th>
                <th>Password</th>
                <th>Role</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                UserDao userDao = new UserDao();
                List<User> users = userDao.getAllUsers(); // Assuming this method exists in UserDao

                for (User user : users) {
            %>
            <tr>
                <td><%= user.getUsername() %></td>
                <td><%= user.getPassword() %></td>
                <td><%= user.getRole() %></td>
                <td>
                    <a href="editUser.jsp?username=<%= user.getUsername() %>">Edit</a> | 
                    <a href="deleteUser.jsp?username=<%= user.getUsername() %>">Delete</a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>

    <br>
    <a href="admin.jsp">Back to Admin Dashboard</a>
</body>
</html>
