<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Price Checking Page</title>
</head>
<body style='background-color: #40E0D0;'>
<% 
String bstation=""+request.getParameter("bsta");
String dstation=""+request.getParameter("dsta");
String price=""+request.getParameter("pric");
String compat=""+request.getParameter("comp");
%>
<form action="PriceSer.jsp" method="get">
<table align="center" border="1" cellspacing="2" cellpadding="2">
<tr>
<td>Boarding Station</td>
<%
if(bstation.equals("null"))
{
	%>
	<td><input type="text" name="bsta" value=""/>
	</td>
	<%
}
else
{
	%>
	<td><input type="text" name="bsta" value="<%=bstation%>"/>
	</td>
	<%
}
%>
</tr>
<tr>
<td>Destination Station</td>
<%
if(dstation.equals("null"))
{
	%>
	<td><input type="text" name="dsta" value=""/>
	</td>
	<%
}
else
{
	%>
	<td><input type="text" name="dsta" value="<%=dstation%>"/>
	</td>
	<%
}
%>
</tr>
<tr>
<td>Price</td>
<%
if(price.equals("null"))
{
	%>
	<td><input type="text" name="pric" value=""/>
	</td>
	<%
}
else
{
	%>
	<td><input type="text" name="pric" value="<%=price%>"/>
	</td>
	<%
}
%>
</tr>
<tr>
<td>Compartment</td>
<td><select name="comp">
<%
if(compat.equals("ac"))
{
	%>
	<option value="AC" selected="selected">AC</option>
	<option value="Non-AC" >Non-AC</option>
	<%
}
else if(compat.equals("nac"))
{
	%>
	<option value="AC" >AC</option>
	<option value="Non-Ac" selected="selected">Non-AC</option>
	<%
}
else if(compat.equals("null"))
{
	%>
	<option value="AC" >AC</option>
	<option value="Non-AC" >Non-AC</option>
	<%
}	
%>
</select></td>
</tr>
<tr>
<td colspan="2">

<table border="1">
<tr>
<td><input type="submit" name="open" value="SEARCH"/></td>
<td><input type="submit" name="select" value="SELECT ALL"/></td>
</tr>
</table>
</td>
</tr>
</table>
</form>
</body>
</html>