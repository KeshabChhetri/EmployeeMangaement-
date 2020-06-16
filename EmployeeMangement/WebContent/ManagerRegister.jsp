
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manager Registration</title>
</head>
<body>
<h1>Manager Register</h1>
<form action = "./mRegister.jsp" method = "post">
<table>

<tr>
<td> <input type = "hidden" name = "eid"></td>
</tr>

<tr>
<td>Username: </td>
<td> <input type = "text" name = "user"></td>
</tr>


<tr>
<td>Password: </td>
<td> <input type = "password" name = "pass"></td>
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
<td align = "center" ><input type = "submit" value= "Register"></td>
</tr>



</table>
</form>
</body>
</html>
