<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
String uname=request.getParameter("user");
String pswd=request.getParameter("pass");
if(request.getParameter("signin")!=null)
{
	if(uname.equals("candy")&&pswd.equals("123"))
	{
		out.print("Login Sucessful");
		%>
		<jsp:forward page="BookingTable.jsp">
		<jsp:param value="<%=uname %>" name="user"/>
		</jsp:forward>
		<%
	}
	else
	{
		%>
		<jsp:include page="Adminn.jsp"/>
		<%
		out.println("Invalid Login");
	}
}
%>
</body>
</html>