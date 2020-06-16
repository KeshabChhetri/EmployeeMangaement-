<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Profile </title>
</head>
<body bgcolor = "wheat">
<table align = "center" width = "300" height = "100">
<br> <br> <br> <br>
<tr>
<td><a href="eHome.jsp"> Employee Home</a></td>
<td><a href = "index.html">Employee Logout</a></td>

</tr>

</table>
<br><br><br><br>

<%@page import="java.sql.*"%>

<table border="3px" width="700" height="100">

<tr>
<td>eid</td>
<td>Username</td>
<td>Email</td>
<td>Phone</td>
<td>Department</td>
<td>Total Leave Days</td>
<td>Action </td>


</tr>




<%
Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/officemanagement";
String username = "root";
String password = "root";
Connection con = DriverManager.getConnection(url,username,password);


Object o = session.getAttribute("id");
int id = (Integer)o;

PreparedStatement ps = con.prepareStatement("select * from employee where eid=?");
ps.setInt(1,id);

ResultSet rs = ps.executeQuery();
while(rs.next())
{
%>
<tr>
<td> <%=rs.getInt("eid") %></td> 
<td> <%=rs.getString("username") %></td> 
<td> <%=rs.getString("email") %></td>
<td> <%=rs.getLong("phone") %></td> 
<td> <%=rs.getString("department") %></td>
<td> <%=rs.getString("leavedays")%></td>
<td> <a href="Employee_Update.jsp?id=<%=rs.getInt("eid")%>">Update</a></td>

</tr>
<%
}
%>
</table>

</body>
</html>