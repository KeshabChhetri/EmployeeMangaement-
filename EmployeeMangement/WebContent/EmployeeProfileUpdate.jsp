<%@page import = "java.sql.* "%>

<%

Class.forName("com.mysql.cj.jdbc.Driver");

String url = "jdbc:mysql://localhost:3306/officemanagement";
String username = "root";
String password = "root";

Connection con = DriverManager.getConnection(url,username,password);

String user = request.getParameter("user");

String email = request.getParameter("email");

String phone = request.getParameter("phone");
Long mobile = Long.parseLong(phone);
String department = request.getParameter("department");
String x = request.getParameter("eid");
int id = Integer.parseInt(x);

PreparedStatement ps = con.prepareStatement("update employee set username=?, email=?, phone=?, department=? where eid=?");

ps.setString(1,user);
ps.setString(2,email);
ps.setLong(3,mobile);
ps.setString(4,department);
ps.setInt(5,id);

int k = ps.executeUpdate();
if (k!=0)
{
	response.sendRedirect("./EmployeeProfile.jsp");
}
%>