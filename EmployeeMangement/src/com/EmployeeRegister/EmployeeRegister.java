package com.EmployeeRegister;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class EmployeeRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con = null;
	PreparedStatement ps = null;
	
	public void init(ServletConfig config) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String url ="jdbc:mysql://localhost:3306/officemanagement";
		String username="root";
		String password ="root";
		try {
			 con = DriverManager.getConnection(url,username,password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
		
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String username = request.getParameter("user");
		String password = request.getParameter("pass");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		long mobile = Long.parseLong(phone);
		String department = request.getParameter("dept");
		
		try {
			
			ps = con.prepareStatement("insert into employee (username,password,email,phone,department) values(?,?,?,?,?)");
			ps.setString(1,username);
			ps.setString(2, password);
			ps.setString(3, email );
			ps.setLong(4, mobile);
			ps.setString(5, department);
			int x = ps.executeUpdate();
			
			
			
			
			PrintWriter pw = response.getWriter();
			if (x!=0) {
				response.sendRedirect("./eLoginform.jsp");
				//pw.println("<html><body>");
				//pw.println("<center><h1> "+username+" Registered Successfully</h1></center>");
				//pw.println("</body></html>");
			  	
			}
			
			
			
			
			
		} catch (SQLException e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
			}

}
