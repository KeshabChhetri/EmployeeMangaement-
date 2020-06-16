<%@page import="java.sql.*,java.text.*,java.util.*"%>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/officemanagement";
String username = "root";
String password = "root";
Connection con = DriverManager.getConnection(url,username,password);


String id = request.getParameter("id");
int lid = Integer.parseInt(id);
PreparedStatement ps = con.prepareStatement("select a.lid,a.username,a.email,a.department,a.no_of_days,a.eid,b.leavedays from leave_request a inner join employee b on a.eid=b.eid where lid=?;");
ps.setInt(1,lid);
ResultSet rs = ps.executeQuery();
if(rs.next())
{
	int a = rs.getInt("leavedays");
	int b = rs.getInt("no_of_days");
	int c = rs.getInt("eid");
	int d = rs.getInt("lid");
	if(b<a)
	{
		PreparedStatement ps1 = con.prepareStatement("update employee set leavedays=(?-?) where eid=?");
		ps1.setInt(1,a);
		ps1.setInt(2,b);
		ps1.setInt(3,c);
		int x = ps1.executeUpdate();
		
		PreparedStatement ps2 = con.prepareStatement("update leave_request set action='Accepted' where lid=?");
		ps2.setInt(1,d);
		int y = ps2.executeUpdate();
		if (x!=0 && y!=0)
			response.sendRedirect("./Leave_Application.jsp?msg=Accepted");
	}
	else
	{
		PreparedStatement ps2 = con.prepareStatement("update leave_request set action = 'Limit Exceed' where lid=?");
		ps2.setInt(1,lid);
		int y = ps2.executeUpdate();
		if (y!=0)
			response.sendRedirect("./Leave_Application.jsp?msg=Denied! Exceeded your total leave days");
	}
}
%>