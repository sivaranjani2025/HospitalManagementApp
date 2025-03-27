<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Doctors</title>
<style>
    /* Red Color Theme */
    body {
        background-color: #f8d7da; /* Light red background */
        font-family: Arial, sans-serif;
        color: #721c24; /* Dark red text */
    }
    
    nav {
        background-color: #f5c6cb; /* Light red background for nav */
        padding: 10px;
        text-align: right;
    }
    
    nav a {
        color: #721c24; /* Dark red links */
        text-decoration: none;
        margin: 0 15px;
    }

    h1 {
        color: #721c24; /* Dark red title */
        text-align: center;
    }

    table {
        width: 100%;
        margin: 20px 0;
        border-collapse: collapse;
    }
     table, th, td {
        border: 1px solid #d32f2f; /* Red border for table */
    }
  

    th, td {
        padding: 12px;
        text-align: left;
    }

    th {
        background-color: #f5c6cb; /* Light red background for header */
        color: #721c24; /* Dark red text for headers */
    }

    td {
        background-color: #fff3f3; /* Lighter red background for table rows */
    }

    button {
        padding: 8px 15px;
        background-color: #ff4d4d; /* Red button */
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    button:hover {
        background-color: #d43f3a; /* Darker red when button is hovered */
    }

    h1 {
        text-align: center;
        color: #ff4d4d;
    }

    form {
        display: inline;
    }
</style>
</head>
<body>
<nav>
    <a href="dashboard.html">Dashboard</a>
    <a href="login.html">Logout</a>
</nav>
    <h1>All Doctors</h1>
    <table>
        <tr>
            <th>Doctor id</th>
            <th>Name</th>
            <th>Age</th>
            <th>Mobile</th>
            <th>Department</th>
            <th>Availability</th>
        </tr>
        <tr>
            <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "mysql@siva");
                PreparedStatement statement = connection.prepareStatement("select * from doctor");
                ResultSet resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    int id = resultSet.getInt("doctorId");
                    String name = resultSet.getString("name");
                    int age = resultSet.getInt("age");
                    long mobile = resultSet.getLong("mobile");
                    String department = resultSet.getString("department");
                    boolean availability = resultSet.getBoolean("availablity");
            %>
        <td><%=id%></td>
        <td><%=name%></td>
        <td><%=age%></td>
        <td><%=mobile%></td>
        <td><%=department%></td>
        <td>
            <% if (!availability) { %>
                <form action="makeDoctorAvailable" method="POST">
                    <input type="hidden" name="id" value="<%= id %>">
                    <button type="submit">Mark as Available</button>
                </form>
            <% } else { %>
                <!-- No action needed for available doctors -->
            <% } %>
            <% if (availability) { %>
                <form action="makeDoctorNotAvailable" method="POST">
                    <input type="hidden" name="id" value="<%= id %>">
                    <button type="submit">Mark as UnAvailable</button>
                </form>
            <% } else { %>
                <!-- No action needed for unavailable doctors -->
            <% } %>
        </td>
        </tr>
        <%
        }
        connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        %>
    </table>
</body>
</html>
