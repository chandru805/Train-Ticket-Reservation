
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login</title>
</head>
<body style='background-color: #40E0D0;'>
<form action="UserLoginSer.jsp" method="post">
<table align="center" border="1" cellspacing="2" cellpadding="2">
<tr>
<td>
Username:<input type="text" name="usser"/><br>
</td>
<tr>
<td>
Password:<input type="password" name="psswd"/><br>
</td>
</tr>
<tr>
<td>
<input type="submit" name="Login" value="Signin"/>
<a href="Registration.jsp">SIGNUP</a></td>
</tr>
</table>
</form>
</body>
</html>