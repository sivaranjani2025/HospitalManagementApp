<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Doctors</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
    }

    table {
        width: 50%;
        border-collapse: collapse;
        margin: 20px auto;
        background-color: #fff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
   table, th, td {
        border: 1px solid #d32f2f; /* Red border for table */
    }
    th, td {
        border: 1px solid #e2e2e2;
        padding: 12px;
        text-align: center;
    }

    th {
        background-color: #ff4d4d; /* Red theme for headers */
        color: white;
    }

    td {
        background-color: #f8d7da; /* Light red for table rows */
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
