<%@page import="java.sql.*" %>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/officemanagement";
String username = "root";
String password = "root";
Connection con = DriverManager.getConnection(url,username,password);


String user = request.getParameter("user");
String pass = request.getParameter("pass");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
long mobile = Long.parseLong(phone);
String department = request.getParameter("dept");
	
	PreparedStatement ps = con.prepareStatement("insert into manager (username,password,email,phone,department) values(?,?,?,?,?)");
	ps.setString(1,user);
	ps.setString(2, pass);
	ps.setString(3, email );
	ps.setLong(4, mobile);
	ps.setString(5, department);
	int x = ps.executeUpdate();
	
	if (x!=0) {
		response.sendRedirect("./mLogin.jsp");
		//pw.println("<html><body>");
		//pw.println("<center><h1>  "+username+" Registered Successfully</h1></center>");
		//pw.println("</body></html>");
	  	
	}
	
%>