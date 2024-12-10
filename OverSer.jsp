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
if(request.getParameter("check")!=null)
{
	if((bstation.length()>0)&&(dstation.length()>0)&&(compat.length()>0))
	{
		//int id=Integer.parseInt(preg);
		Statement st=con.createStatement();
		String sql="select *from price where pri_comp='"+compat+"' and pri_bsta='"+bstation+"' and pri_dsta='"+dstation+"'";
		System.out.println(sql);
		ResultSet rs=st.executeQuery(sql);
		if(rs.next())
		{
		%>
		<%--<jsp:forward page="Price.jsp">
		<jsp:param value="<%=rs.getString(1)%>" name="bsta"/>
		<jsp:param value="<%=rs.getString(2)%>" name="dsta"/>
		<jsp:param value="<%=rs.getInt(3)%>" name="pric"/>
		<jsp:param value="<%=rs.getString(4)%>" name="comp"/>
		</jsp:forward>
		--%>
		<jsp:forward page="Overall.jsp">
		<jsp:param value="<%=rs.getInt(3) %>" name="pric"/>
		<jsp:param value="<%=pname%>" name="psname"/>
		<jsp:param value="<%=cate%>" name="categ"/>
		<jsp:param value="<%=gender%>" name="gen"/>
		<jsp:param value="<%=mobile%>" name="mob"/>
		<jsp:param value="<%=bstation%>" name="bsta"/>
		<jsp:param value="<%=dstation%>" name="dsta"/>
		<jsp:param value="<%=compat%>" name="comp"/>
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
if(request.getParameter("save")!=null)
{
	out.print(con);
	if((pname.length()>0)&&(mobile.length()>0))
			{
		//int id=Integer.parseInt(pid);
		Statement st=con.createStatement();
		String sql="insert into overall values('"+pname+"','"+cate+"','"+gender+"','"+mobile+"','"+bstation+"','"+dstation+"','"+compat+"','"+price+"','"+otp+"','"+mySQLDate+"')";
		System.out.println(sql);
		int n=st.executeUpdate(sql);
		st.close();
		JOptionPane.showMessageDialog(null, "inserted");
		%>
		<jsp:forward page="Overall.jsp"/>
		<%
			}
	else
	{
		JOptionPane.showMessageDialog(null, "invalid");
		%>
				<jsp:forward page="Overall.jsp"/>
		<%
	}
}
else if(request.getParameter("open")!=null)
{
	
	if(mobile.length()>0)
	{
		long id=Long.parseLong(mobile);
		Statement st=con.createStatement();
		String sql="select *from overall where mobile="+id;
		System.out.println(sql);
		ResultSet rs=st.executeQuery(sql);
		if(rs.next())
		{
			//System.out.print(rs.getString(1));
		%>
		<jsp:forward page="Overall.jsp">
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
else if(request.getParameter("update")!=null)
{
	if((mobile.length()>0)&&(compat.length()>0))
	{
		
		Statement st=con.createStatement();
		String sql="update overall set compartment='"+compat+"' where mobile="+mobile;
		System.out.println(sql);
		int n=st.executeUpdate(sql);
		st.close();
		JOptionPane.showMessageDialog(null, "updated");
		%>
		<jsp:forward page="Overall.jsp"/>
		<%
	}
	else
	{
		JOptionPane.showMessageDialog(null, "invalid");
		%>
		<jsp:forward page="Overall.jsp"/>
		<% 
	}
}
else if(request.getParameter("delete")!=null)
{
	if(mobile.length()>0)
	{
		Statement st=con.createStatement();
		String sql="delete from  overall where mobile="+mobile;
		System.out.println(sql);
		int n=st.executeUpdate(sql);
		st.close();
		JOptionPane.showMessageDialog(null, "deleted");
		%>
		<jsp:forward page="Overall.jsp"/>
		<%
	}
	else
	{
		JOptionPane.showMessageDialog(null, "invalid");
		%>
		<jsp:forward page="Overall.jsp"/>
		<% 
	}
}

else if(request.getParameter("select")!=null)
{
	Statement st=con.createStatement();
	String sql="select * from overall";
	System.out.println(sql);
	ResultSet rs=st.executeQuery(sql);
	%>
	<jsp:include page="Overall.jsp"/>
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
