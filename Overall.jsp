<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Overall Page</title>
</head>
<body style='background-color: #40E0D0;'>
<% 
String pname=""+request.getParameter("psname");
String cate=""+request.getParameter("categ");
String gender=""+request.getParameter("gen");
String mobile=""+request.getParameter("mob");
String bstation=""+request.getParameter("bsta");
String dstation=""+request.getParameter("dsta");
String compat=""+request.getParameter("comp");
String price=""+request.getParameter("pric");
String tcktid=""+request.getParameter("tid");
String date=""+request.getParameter("dat");
%>
<form action="OverSer.jsp" method="get">
<table align="center" border="1" cellspacing="2" cellpadding="2">
<tr>
<td>Passenger Name</td>
<%
if(pname.equals("null"))
{
	%>
	<td><input type="text" name="psname" value=""/>
	</td>
	<%
}
else
{
	%>
	<td><input type="text" name="psname" value="<%=pname%>"/>
	</td>
	<%
}
%>
</tr>
<td>Category</td>
<td><select name="categ">
<%
if(cate.equals("general"))
{
	%>
	<option value="general" selected="selected">General</option>
	<option value="tatkal" >Tatkal</option>
	<%
}
else if(cate.equals("tatkal"))
{
	%>
	<option value="general" >General</option>
	<option value="tatkal" selected="selected">Tatkal</option>
	<%
}
else if(cate.equals("null"))
{
	%>
	<option value="general" >General</option>
	<option value="tatkal" >Tatkal</option>
	<%
}	
%>
</select></td>
</tr>
<tr>
<td>Gender</td>
<%
if(gender.equals("null"))
{
	%>
	<td><input type="radio" name="gen" value="Male"/>Male
	<input type="radio" name="gen" value="Female"/>Female</td>
	<%
}
else if(gender.equalsIgnoreCase("Female"))
{
	%>
	<td><input type="radio" name="gen" value="Male"/>Male
	<input type="radio" name="gen" value="Female" checked="checked"/>Female</td>
	<%
}
else if(gender.equalsIgnoreCase("Male"))
{
	%>
	<td><input type="radio" name="gen" value="Male" checked="checked"/>Male
	<input type="radio" name="gen" value="Female" />Female</td>
	<%
}
%>
</tr>
<tr>
<td>Mobile Number</td>
<%
if(mobile.equals("null"))
{
	%>
	<td><input type="text" name="mob" value=""/>
	</td>
	<%
}
else
{
	%>
	<td><input type="text" name="mob" value="<%=mobile%>"/>
	</td>
	<%
}
%>
</tr>
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
<td>Compartment</td>
<td><select name="comp">
<%
if(compat.equals("Ac"))
{
	%>
	<option value="Ac" selected="selected">AC</option>
	<option value="Non-Ac" >Non-AC</option>
	<%
}
else if(compat.equals("Non-Ac"))
{
	%>
	<option value="Ac" >AC</option>
	<option value="Non-Ac" selected="selected">Non-AC</option>
	<%
}
else if(compat.equals("null"))
{
	%>
	<option value="Ac" >AC</option>
	<option value="Non-Ac" >Non-AC</option>
	<%
}	
%>
</select></td>
</tr>
<tr>
<td>Price</td>
<%
if(price.equals("null"))
{
	%>
	<td><input type="text" name="pric" value=""/><input type="submit" name="check" value="Check"/>
	</td>
	<%
}
else
{
	%>
	<td><input type="text" name="pric" value="<%=price%>"/><input type="submit" name="check" value="Check"/>
	</td>
	<%
}
%>
</tr>
<tr>
<td>Ticket Number</td>
<%
if(tcktid.equals("null"))
{
	%>
	<td><input type="text" name="tid" value=""/>
	</td>
	<%
}
else
{
	%>
	<td><input type="text" name="tid" value="<%=tcktid%>"/>
	</td>
	<%
}
%>
</tr>
<tr>
<td>Date</td>
<%
if(date.equals("null"))
{
	%>
	<td><input type="date" name="dat" value=""/>
	</td>
	<%
}
else
{
	%>
	<td><input type="date" name="dat" value="<%=date%>"/>
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