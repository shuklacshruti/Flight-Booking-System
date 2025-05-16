<%@ page import="JavaStuff.UserDao" %>
<%@ page import="JavaStuff.User" %>
<%@ page import="java.io.*" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    UserDao userDao = new UserDao();
    User user = userDao.getUser(username, password);

    if (user != null) {
        session.setAttribute("username", user.getUsername());
        session.setAttribute("role", user.getRole());

        if ("admin".equals(user.getRole())) {
            response.sendRedirect("AdminDashboard.jsp");
        } else if ("customer".equals(user.getRole())) {
            response.sendRedirect("userDashboard.jsp");
        } else if ("customerRep".equals(user.getRole())) {
            response.sendRedirect("repDashboard.jsp");
        }
    }

%>
