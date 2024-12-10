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
String bstation=request.getParameter("bsta");
String dstation=request.getParameter("dsta");
String price=request.getParameter("pric");
String compat=request.getParameter("comp");
Jdbc1 db=new Jdbc1();
Connection con=db.dbconnect();
if(request.getParameter("open")!=null)
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
		<jsp:forward page="Price.jsp">
		<jsp:param value="<%=rs.getString(1)%>" name="bsta"/>
		<jsp:param value="<%=rs.getString(2)%>" name="dsta"/>
		<jsp:param value="<%=rs.getInt(3)%>" name="pric"/>
		<jsp:param value="<%=rs.getString(4)%>" name="comp"/>
		</jsp:forward>
		<%
	}
		else
		{
			JOptionPane.showInternalMessageDialog(null, "no records found");
			%>
			<jsp:forward page="Price.jsp"/>
			<%
		}
}
}
else if(request.getParameter("select")!=null)
{
	Statement st=con.createStatement();
	String sql="select * from price";
	System.out.println(sql);
	ResultSet rs=st.executeQuery(sql);
	%>
	<jsp:include page="Price.jsp"/>
	<table align="center" border="1">
	<tr>
	<th>Boarding Station</th>
	<th>Destination Station</th>
	<th>Price</th>
	<th>Compartment</th>
	</tr>
	<%
	while(rs.next())
	{
		%>
		<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getInt(3) %></td>
		<td><%=rs.getString(4) %></td>
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