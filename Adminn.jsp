<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
</head>
<body style='background-color: #40E0D0;'>
<% 
String uname=""+request.getParameter("user");
String pswd=""+request.getParameter("pass");
%>
<form action="AdminSer.jsp" method="get">
<table align="center" border="1" cellspacing="2" cellpadding="2">
<tr>
<td>User Name</td>
<%
if(uname.equals("null"))
{
	%>
	<td><input type="text" name="user" value=""/>
	</td>
	<%
}
else
{
	%>
	<td><input type="text" name="user" value="<%=uname%>"/>
	</td>
	<%
}
%>
</tr>
<tr>
<td>Password</td>
<%
if(pswd.equals("null"))
{
	%>
	<td><input type="password" name="pass" value=""/>
	</td>
	<%
}
else
{
	%>
	<td><input type="password" name="pass" value="<%=pswd%>"/>
	</td>
	<%
}
%>
</tr>
<tr>
<td colspan="2">
<table border="1">
<tr>
<td><input type="submit" name="signin" value="LOGIN"/></td>
<td><a href="Admin.jsp">LOGOUT</a></td>
</tr>
</table>
</td>
</table>
</form>
</body>
</html>