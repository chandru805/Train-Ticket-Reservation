<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Table</title>
</head>
<body style='background-color: #40E0D0;'>
<%
String name=""+request.getParameter("ename");
String designation=""+request.getParameter("desg");
String email=""+request.getParameter("mail");
String user=""+request.getParameter("usser");
String pass=""+request.getParameter("psswd");
%>
<form action="RegSer.jsp" method="get">
<table align="center" border="1" cellspacing="2" cellpadding="2">
<tr>
<td>Employee Name</td>
<%
if(name.equals("null"))
{
	%>
	<td><input type="text" name="ename" value=""/>
	</td>
	<%
}
else
{
	%>
	<td><input type="text" name="ename" value="<%=name%>"/>
	</td>
	<%
}
%>
</tr>

<tr>
<td>Designation</td>
<%
if(designation.equals("null"))
{
	%>
	<td><input type="text" name="desg" value=""/>
	</td>
	<%
}
else
{
	%>
	<td><input type="text" name="desg" value="<%=designation%>"/>
	</td>
	<%
}
%>
</tr>
<tr>
<td>Email</td>
<%
if(email.equals("null"))
{
	%>
	<td><input type="text" name="mail" value=""/>
	</td>
	<%
}
else
{
	%>
	<td><input type="text" name="mail" value="<%=email%>"/>
	</td>
	<%
}
%>
</tr>
<tr>
<td>User Name</td>
<%
if(user.equals("null"))
{
	%>
	<td><input type="text" name="usser" value=""/>
	</td>
	<%
}
else
{
	%>
	<td><input type="text" name="usser" value="<%=user%>"/>
	</td>
	<%
}
%>
</tr>
<tr>
<td>Password</td>
<%
if(pass.equals("null"))
{
	%>
	<td><input type="password" name="psswd" value=""/>
	</td>
	<%
}
else
{
	%>
	<td><input type="password" name="psswd" value="<%=pass%>"/>
	</td>
	<%
}
%>
</tr>
<tr>
<td colspan="2">

<table border="1">
<tr>
<td><input type="submit" name="save" value="ADD"/></td>
<td><input type="submit" name="open" value="SEARCH"/></td>
<td><input type="submit" name="update" value="UPDATE"/></td>
<td><input type="submit" name="delete" value="DELETE"/></td>
<td><a href="Admin.jsp">LOGOUT</a></td>
</tr>
</table>
</td>
</tr>
</table>
</form>
</body>
</html>