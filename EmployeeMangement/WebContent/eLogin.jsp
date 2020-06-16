<%@page import="java.sql.*" %>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/officemanagement";
String username = "root";
String password = "root";
Connection con = DriverManager.getConnection(url,username,password);
String user = request.getParameter("user");
String pass = request.getParameter("pass");

//Object o = session.getAttribute("eid");
//int id = (Integer)o;
PreparedStatement ps = con.prepareStatement("select * from employee where username=? and password=?");
ps.setString(1,user);
ps.setString(2,pass);


ResultSet rs = ps.executeQuery();

if (rs.next())
{
	HttpSession hs = request.getSession();
	hs.setAttribute("id", rs.getInt("eid"));
	
	 response.sendRedirect("./eHome.jsp?msg=Success");
}
else
{
	response.sendRedirect("./eLoginform.jsp?msg=Failed");
}
%>