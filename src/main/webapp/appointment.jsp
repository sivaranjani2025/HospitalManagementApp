<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f8f8;
        color: #333;
    }
    nav {
        background-color: #e60000;
        padding: 10px;
        text-align: center;
    }
    nav a {
        color: white;
        margin: 0 15px;
        text-decoration: none;
        font-size: 18px;
    }
    nav a:hover {
        text-decoration: underline;
    }
    form {
        background-color: #fff;
        max-width: 600px;
        margin: 20px auto;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    form div {
        margin-bottom: 15px;
    }
    form label {
        display: block;
        font-size: 16px;
        margin-bottom: 5px;
    }
    form input, form select {
        width: 100%;
        padding: 10px;
        border: 2px solid #e60000;
        border-radius: 5px;
        font-size: 16px;
        box-sizing: border-box;
    }
    form input[type="datetime-local"] {
        padding: 8px;
    }
    form button {
        background-color: #e60000;
        color: white;
        border: none;
        padding: 12px 20px;
        font-size: 18px;
        border-radius: 5px;
        cursor: pointer;
        width: 100%;
    }
    form button:hover {
        background-color: #cc0000;
    }
</style>
</head>
<body>
<nav>
		<a href="dashboard.html">Dashboard</a> <a href="login.html">Logout</a>
</nav>

	<form action="bookAppointment" method="POST">
		<div>
			<label>Department</label> <input type="text" name="department">
		</div>
		<div>
			<label>PatientId</label> <input type="number" name="patientId">
		</div>
		<div>
			<label>Payment</label> <input type="number" name="payment">
		</div>
		<div>
			<label>Date</label> <input type="datetime-local" name="dateTime">
		</div>
		<div>
			<label>Choose Doctor</label> <select name="doctor">
				<%
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "mysql@siva");
					// Prepare the query
					PreparedStatement statement = connection
					.prepareStatement("select doctorId,name from doctor where availablity = true");
					// Execute the query
					ResultSet resultSet = statement.executeQuery();
					while (resultSet.next()) {
						int id = resultSet.getInt("doctorId");
						String name = resultSet.getString("name");
				%>
				<option value="<%=id%>"><%=name%></option>
				<%
				}
				// Close the connection
				connection.close();
				} catch (Exception e) {
				e.printStackTrace();
				}
				%>
			</select>
		</div>
		<button type="submit">Submit</button>
	</form>
</body>
</html>
