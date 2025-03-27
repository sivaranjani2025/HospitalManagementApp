<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Appointments</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f8f8;
        color: #333;
    }
    h1 {
        color: #d32f2f; /* Red color for the header */
        text-align: center;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
    }
    table, th, td {
        border: 1px solid #d32f2f; /* Red border for table */
    }
    th, td {
        padding: 10px;
        text-align: center;
    }
    th {
        background-color: #d32f2f; /* Red background for table header */
        color: white;
    }
    td {
        background-color: #f9f9f9;
    }
    button {
        background-color: #d32f2f; /* Red button */
        color: white;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
    }
    button:hover {
        background-color: #c62828; /* Darker red on hover */
    }
</style>
</head>
<body>

<nav>
    <a href="dashboard.html">Dashboard</a>
    <a href="login.html">Logout</a>
</nav>
<h1>All Appointments</h1>
    <table>
        <tr>
            <th>AppointmentId</th>
            <th>Date and Time</th>
            <th>Department</th>
            <th>Doctor</th>
            <th>Patient</th>
            <th>Payment</th>
            <th>Status</th>
        </tr>
        <tr>
            <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "mysql@siva");
                // Prepare the query
                PreparedStatement statement = connection.prepareStatement("select a.appointmentId,a.dateAndTime, a.department, d.name AS doctor_name,  p.name AS patient_name,a.payment, a.status from appointment a JOIN patient p ON a.patientId = p.patientId JOIN doctor d ON a.doctorId = d.doctorId");
                // Execute the query
                ResultSet resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    int id = resultSet.getInt("appointmentId");
                    String date = resultSet.getString("dateAndTime");
                    String department = resultSet.getString("department");
                    String docname = resultSet.getString("doctor_name");
                    String patientname = resultSet.getString("patient_name");
                    int payment = resultSet.getInt("payment");
                    String status = resultSet.getString("status");
            %>
            <td><%=id%></td>
            <td><%=date%></td>
            <td><%=department%></td>
            <td><%=docname%></td>
            <td><%=patientname%></td>
            <td><%=payment%></td>
            <td><%=status%></td>
             
            <td>
            <form action="CancelAppointment.jsp" >
                    <input type="hidden" name="id" value="<%=id%>">
                    <button type="submit">Cancel Appointment</button>
                </form>
            </td>
        </tr>
        <%
        }
        // close the connection
        connection.close();
        } catch (Exception e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
        }
        %>
    </table>
</body>
</html>
