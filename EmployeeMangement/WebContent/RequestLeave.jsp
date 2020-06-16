<%@page import="java.sql.*, java.util.*, java.text.*" %>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/officemanagement";
String username = "root";
String password = "root";
Connection con = DriverManager.getConnection(url,username,password);


String user = request.getParameter("user");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
long mobile = Long.parseLong(phone);
String department = request.getParameter("dept");
String stD = request.getParameter("start");
String enD = request.getParameter("end");
String roL = request.getParameter("Reason");



SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
long d = (sdf.parse(enD)).getTime() - (sdf.parse(stD)).getTime();
int a = (int)(d/(24*60*60*1000)); // calculating leave days
int b; // to assign the value of a with certain condition
if (a<0) //when leave days are  negative( start days > end days)
{
	b=0;
}
else
	b=a; // when leave days are not negative (start days < end days)
	
	
	Object o = session.getAttribute("id");
	int id = (Integer)o;

	
	PreparedStatement ps = con.prepareStatement("insert into leave_request (username,email,phone,department,start_day,end_day,no_of_days,reason_for_leave,eid) values(?,?,?,?,?,?,?,?,?)");
	ps.setString(1,user);
	ps.setString(2, email);
	ps.setLong(3, mobile );
	ps.setString(4, department);
	ps.setString (5, stD);
	ps.setString(6,enD);
	ps.setInt(7,b);
	ps.setString(8,roL);
	ps.setInt(9,id);
	
	int x = ps.executeUpdate();
	
	if (x!=0) {
		response.sendRedirect("./eHome.jsp");
		//pw.println("<html><body>");
		//pw.println("<center><h1>  "+username+" has submitted leave application </h1></center>");
		//pw.println("</body></html>");
	  	
	}
	
%>