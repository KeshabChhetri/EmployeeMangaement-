<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Leave Request</title>
</head>
<body>
<h1>Request for Leave</h1>

<form action = "./RequestLeave.jsp" method = "post">
<table>


<tr>
<td><input type="hidden" name="lid"></td>
</tr>

<tr>
<td>Username: </td>
<td> <input type = "text" name = "user"></td>
</tr>


<tr>
<td>Email: </td>
<td> <input type = "text" name = "email"></td>
</tr>

<tr>
<td>Phone: </td>
<td> <input type = "text" name = "phone"></td>
</tr>

<tr>
<td>Department: </td>
<td> <input type = "text" name = "dept"></td>
</tr>

<tr>
<td>Reason for Leave: </td>
<td> <input type = "text" name = "Reason"></td>
</tr>

<tr>
<td>Start Day: </td>
<td> <input type = "date" name = "start"></td>
</tr>

<tr>
<td>End Day: </td>
<td> <input type = "date" name = "end"></td>
</tr>

<tr>
<td align = "center" ><input type = "submit" value= "Submit Application"></td>
</tr>



</table>
</form>
</body>
</html>
    