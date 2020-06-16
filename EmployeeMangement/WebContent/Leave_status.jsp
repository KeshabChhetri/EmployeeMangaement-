<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Profile</title>

</head>
<body>
<h1>Leave Status</h1>
<table border="5"> <tr style="background-color:white"><td><a href = "index.html">Home</a></td></tr></table>
<br><br>
<table>
<tr><td><a href="EmployeeProfile.jsp">Profile</a> &nbsp;&nbsp;
</td><td><a href = "index.html">Logout</a></td>
</tr>
</table>
<br><br><br>
<%@page import="java.sql.*"%>
<table align="center" width="1000" height="150" border=1>
<tr>
<td>LeaveID</td>
<td>Username</td>
<td>Email</td>
<td>Phone</td>
<td>Department</td>
<td>Start Date</td>
<td>End Date</td>
<td>No of Leave Days</td>
<td>Reason</td>
<td>eid</td>
<td>Status</td>
</tr>

<%
Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/officemanagement";
String username = "root";
String password = "root";
Connection con = DriverManager.getConnection(url,username,password);

Object o = session.getAttribute("id");
int id = (Integer)o;

PreparedStatement ps = con.prepareStatement("select * from leave_request where eid=?");
ps.setInt(1, id);
ResultSet rs = ps.executeQuery(); 
 while(rs.next())
 {
%>
<tr>
<td><%=rs.getInt("lid") %></td>
<td><%=rs.getString("username")%></td>
<td><%=rs.getString("email")%></td>
<td><%=rs.getLong("phone")%></td>
<td><%=rs.getString("department")%></td>
<td><%=rs.getString("start_day")%></td>
<td><%=rs.getString("end_day")%></td>
<td><%=rs.getInt("no_of_days") %></td>
<td><%=rs.getString("reason_for_leave") %></td>
<td><%=rs.getInt("eid") %></td>
<td><%=rs.getString("action")%></td>
</tr>
<%
 }
%>
</table>
</body>
</html>