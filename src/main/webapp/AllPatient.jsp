<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Patients</title>
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
        background-color: #f5c6cb; /* Light red button */
        color: #721c24; /* Dark red text */
        padding: 5px 10px;
        border: none;
        cursor: pointer;
        border-radius: 5px;
    }

    button:hover {
        background-color: #f1a1b6; /* Darker red on hover */
    }
</style>
</head>
<body>
<nav>
	<a href="dashboard.html">Dashboard</a> <a href="login.html">Logout</a>
</nav>
<h1>All Patients</h1>
<table>
	<tr>
		<th>Patient id</th>
		<th>Name</th>
		<th>Age</th>
		<th>Mobile</th>
		<th>Address</th>
		<th>Gender</th>
	</tr>
	<%
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "mysql@siva");
		//	prepare the query
		PreparedStatement statement = connection.prepareStatement("select * from patient");
		//	Execute the query
		ResultSet resultSet = statement.executeQuery();
		while (resultSet.next()) {
			int id = resultSet.getInt("patientId");
			String name = resultSet.getString("name");
			int age = resultSet.getInt("age");
			long mobile = resultSet.getLong("mobile");
			String address = resultSet.getString("address");
			String gender = resultSet.getString("gender");
	%>
	<tr>
		<td><%=id%></td>
		<td><%=name%></td>
		<td><%=age%></td>
		<td><%=mobile%></td>
		<td><%=address%></td>
		<td><%=gender%></td>
		<td>
			<form action="PatientHistory.jsp">
				<input type="hidden" name="id" value="<%=id%>">
				<button type="submit">Patient history</button>
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
