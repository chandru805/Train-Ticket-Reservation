<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Startup Page</title>
</head>
<body style='background-color: #40E0D0;'>
<div align="center">
<form action="Adminn.jsp" method="get">
<table align="center" border="1" cellspacing="2" cellpadding="2">
<tr>
<td><input type="submit" name="admin" value="ADMIN" /></td>
</tr>
</table>
</form>
</div>
<div align="center">
<form action="UserLogin.jsp" method="post">
<table align="center" border="1" cellspacing="2" cellpadding="2">
<tr>
<td><input type="submit" name="user" value="USER" /></td>
</tr>
</table>
</form>
</div>
</body>
</html>