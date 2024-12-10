<%@page import="java.util.Date"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="javax.swing.JOptionPane" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@page import="java.util.Random"%>
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
java.util.Date javaDate=new java.util.Date();
String pname=request.getParameter("psname");
String cate=request.getParameter("categ");
String gender=request.getParameter("gen");
String mobile=request.getParameter("mob");
String bstation=request.getParameter("bsta");
String dstation=request.getParameter("dsta");
String compat=request.getParameter("comp");
String price=request.getParameter("pric");
String tcktid=request.getParameter("tid");
String date=request.getParameter("dat");
Random r=new Random();
int otp=r.nextInt(9999999);
java.sql.Date mySQLDate=new java.sql.Date(javaDate.getTime());
Jdbc1 db=new Jdbc1();
Connection con=db.dbconnect();
if(request.getParameter("open")!=null)
{
	
	if(tcktid.length()>0)
	{
		long id=Long.parseLong(tcktid);
		Statement st=con.createStatement();
		String sql="select *from overall where ticketid="+id;
		System.out.println(sql);
		ResultSet rs=st.executeQuery(sql);
		if(rs.next())
		{
			//System.out.print(rs.getString(1));
		%>
		<jsp:forward page="BookingTable.jsp">
		<jsp:param value="<%=rs.getString(1)%>" name="psname"/>
		<jsp:param value="<%=rs.getString(2)%>" name="categ"/>
		<jsp:param value="<%=rs.getString(3)%>" name="gen"/>
		<jsp:param value="<%=rs.getString(5)%>" name="bsta"/>
		<jsp:param value="<%=rs.getString(6)%>" name="dsta"/>
		<jsp:param value="<%=rs.getLong(4)%>" name="mob"/>
		<jsp:param value="<%=rs.getString(7)%>" name="comp"/>
		<jsp:param value="<%=rs.getInt(8)%>" name="pric"/>
		<jsp:param value="<%=rs.getLong(9)%>" name="tid"/>
		<jsp:param value="<%=rs.getDate(10)%>" name="dat"/>
		</jsp:forward>
		<%
	}
		else
		{
			JOptionPane.showInternalMessageDialog(null, "no records found");
			%>
			<jsp:forward page="Overall.jsp"/>
			<%
		}
}
}

else if(request.getParameter("select")!=null)
{
	Statement st=con.createStatement();
	String sql="select * from overall";
	System.out.println(sql);
	ResultSet rs=st.executeQuery(sql);
	%>
	<jsp:include page="BookingTable.jsp"/>
	<table align="center" border="1">
	<tr>
	<th>Passenger Name</th>
	<th>Category</th>
	<th>Gender</th>
	<th>Mobile</th>
	<th>Boarding Station</th>
	<th>Destination Station</th>
	<th>Compartment</th>
	<th>Price</th>
	<th>Ticket Id</th>
	<th>Date</th>
	</tr>
	<%
	while(rs.next())
	{
		%>
		<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getLong(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td><%=rs.getString(6) %></td>
		<td><%=rs.getString(7) %></td>
		<td><%=rs.getInt(8) %></td>
		<td><%=rs.getLong(9) %></td>
		<td><%=rs.getDate(10) %></td>
		</tr>
		<%
	}
	%>
	</table>
	<%
	rs.close();
	st.close();
	}
con.close();
%>
}
</body>
</html>