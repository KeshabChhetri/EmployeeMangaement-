<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>

</head>
<body>
<h1>Leave Details</h1>
<table border="5"> <tr style="background-color:white"><td><a href = "index.html">Home</a></td></tr></table>
<br><br>
<table>
<tr><td><a href="ManagerProfile.jsp">Profile</a> &nbsp;&nbsp;
</td><td><a href = "index.html">Logout</a></td>
</tr>
</table>
<br><br><br>
<%@page import="java.sql.*"%>
<table align="center" width="900" height="150" border=1>
<tr>
<td>lid</td>
<td>username</td>
<td>email</td>
<td>phone</td>
<td>department</td>
<td>startday</td>
<td>endday</td>
<td>no_of_days</td>
<td>eid</td>
<td>action</td>
</tr>

<%
Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/officemanagement";
String username = "root";
String password = "root";
Connection con = DriverManager.getConnection(url,username,password);

Object ob = session.getAttribute("id");
int id = (Integer)ob;
String department = (String) session.getAttribute("department");

PreparedStatement ps = con.prepareStatement("select * from leave_request where department=?");
ps.setString(1,department);
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
<td><%=rs.getString("no_of_days")%></td>
<td><%=rs.getInt("eid")%></td>
<td><a href="accept.jsp?id=<%=rs.getInt("lid")%>">Accept</a>
<a href="reject.jsp?id=<%=rs.getInt("lid")%>">Deny</a></td>
</tr>
<%
 }
%>
</table>
</body>
</html>