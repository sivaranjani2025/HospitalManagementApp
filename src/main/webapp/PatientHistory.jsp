<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient History</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        color: #333;
    }

    nav {
        background-color: #ff4d4d;
        padding: 10px;
        text-align: center;
    }

    nav a {
        color: white;
        padding: 10px;
        text-decoration: none;
        margin: 0 15px;
        font-weight: bold;
    }

    nav a:hover {
        background-color: #d43f3a;
        border-radius: 5px;
    }

    h1 {
        text-align: center;
        color: #ff4d4d;
        margin-top: 20px;
    }

    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    table, th, td {
        border: 1px solid #d43f3a; /* Red border for table */
    }

    th, td {
        padding: 12px;
        text-align: center;
        border: 1px solid #e2e2e2;
    }

    th {
        background-color: #ff4d4d; /* Red header */
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
</style>
</head>
<body>
	<nav>
		<a href="dashboard.html">Dashboard</a> 
		<a href="login.html">Logout</a>
	</nav>
	<h1>Patient History</h1>
	<table>
		<tr>
			<th>Patient id</th>
			<th>Patient Name</th>
			<th>Age</th>
			<th>Appointment date and time</th>
			<th>Doctor</th>
			<th>Department</th>
			<th>Payment</th>
			<th>Status</th>
		</tr>
		<tr>
			<%
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "mysql@siva");
				PreparedStatement statement = connection.prepareStatement("SELECT p.patientId, p.name AS patient_name, p.age, p.mobile, a.dateAndTime, d.name AS doctor_name, d.department, a.payment, a.status FROM appointment a JOIN patient p ON a.patientId = p.patientId JOIN doctor d ON a.doctorId = d.doctorId WHERE p.patientId = ?");
				statement.setString(1, request.getParameter("id"));
				ResultSet resultSet = statement.executeQuery();
				while (resultSet.next()) {
					int id = resultSet.getInt("patientId");
					String name = resultSet.getString("patient_name");
					int age = resultSet.getInt("age");
					String dateAndTime = resultSet.getString("dateAndTime");
					String doctor = resultSet.getString("doctor_name");
					String department = resultSet.getString("department");
					int payment = resultSet.getInt("payment");
					String status = resultSet.getString("status");
			%>
			<td><%=id%></td>
			<td><%=name%></td>
			<td><%=age%></td>
			<td><%=dateAndTime%></td>
			<td><%=doctor%></td>
			<td><%=department%></td>
			<td><%=payment %></td>
			<td><%=status %></td>
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
