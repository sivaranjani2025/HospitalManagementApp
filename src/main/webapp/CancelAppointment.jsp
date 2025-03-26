<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



	<%
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "mysql@siva");
		//	prepare the query
		PreparedStatement statement = connection
		.prepareStatement("update appointment set status ='Cancel' where appointmentid= ? ");

		statement.setString(1, request.getParameter("id"));
		//String status = request.getParameter("status");

		//Execute the query
		int noOfRowsAffected = statement.executeUpdate();
		if (noOfRowsAffected >= 1) {
            
			out.println("<p> Your Appointment Cancelled " + "</p>");

		} else {
			System.err.println("something went wrong");
		}

		// close the connection
		connection.close();

	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
	
	


	<%
	response.sendRedirect("AllAppointments.jsp");
	
	%>
	
	<form>
   <button type="button" disabled>Cancel Appointment</button>
	</form>
</body>
</html>