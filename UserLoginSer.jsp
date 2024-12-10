<%@ page import="java.sql.ResultSet" %>
<%@ page import="javax.swing.JOptionPane" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="Pack.Jdbc1" %>
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
String user=request.getParameter("usser");
String pass=request.getParameter("psswd");
Jdbc1 db=new Jdbc1();
Connection con=db.dbconnect();
if(request.getParameter("Login")!=null)
{
	if(user.length()>0)
	{
		//int id=Integer.parseInt(empid);
		Statement st=con.createStatement();
		String sql="select *from reg where emp_user='"+user+"' and emp_pass='"+pass+"'";
		System.out.println(sql);
		ResultSet rs=st.executeQuery(sql);
		if(rs.next())
		{
		%>
		<jsp:forward page="Booking&Ticket.jsp">
		<jsp:param value="<%=rs.getString(1)%>" name="usser"/>
		<jsp:param value="<%=rs.getString(2)%>" name="psswd"/>
		</jsp:forward>
		<%
	}
		else
		{
			JOptionPane.showInternalMessageDialog(null, "no records found");
			%>
			<jsp:forward page="Admin.jsp"/>
			<%
		}
}
}
%>
</body>
</html>