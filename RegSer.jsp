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
String name=request.getParameter("ename");
String designation=request.getParameter("desg");
String email=request.getParameter("mail");
String user=request.getParameter("usser");
String pass=request.getParameter("psswd");
Jdbc1 db=new Jdbc1();
Connection con=db.dbconnect();
if(request.getParameter("save")!=null)
{
	out.print(con);
	if(name.length()>0)
			{
		//int id=Integer.parseInt(empid);
		Statement st=con.createStatement();
		String sql="insert into reg values('"+name+"','"+designation+"','"+email+"','"+user+"','"+pass+"')";
		System.out.println(sql);
		int n=st.executeUpdate(sql);
		st.close();
		JOptionPane.showMessageDialog(null, "inserted");
		%>
		<jsp:forward page="Registration.jsp"/>
		<%
			}
	else
	{
		JOptionPane.showMessageDialog(null, "invalid");
		%>
				<jsp:forward page="Registration.jsp"/>
		<%
	}
}
else if(request.getParameter("open")!=null)
{
	if(name.length()>0)
	{
		//int id=Integer.parseInt(empid);
		Statement st=con.createStatement();
		String sql="select *from reg where emp_name='"+name+"'";
		System.out.println(sql);
		ResultSet rs=st.executeQuery(sql);
		if(rs.next())
		{
		%>
		<jsp:forward page="Registration.jsp">
		<jsp:param value="<%=rs.getString(1)%>" name="ename"/>
		<jsp:param value="<%=rs.getString(2)%>" name="desg"/>
		<jsp:param value="<%=rs.getString(3)%>" name="mail"/>
		<jsp:param value="<%=rs.getString(4)%>" name="usser"/>
		<jsp:param value="<%=rs.getString(5)%>" name="psswd"/>
		</jsp:forward>
		<%
	}
		else
		{
			JOptionPane.showInternalMessageDialog(null, "no records found");
			%>
			<jsp:forward page="Registration.jsp"/>
			<%
		}
}
}
else if(request.getParameter("update")!=null)
{
	if((name.length()>0)&&(email.length()>0))
	{
		//int id=Integer.parseInt(empid);
		Statement st=con.createStatement();
		String sql="update reg set emp_name='"+name+"' where emp_mail='"+email+"'";
		System.out.println(sql);
		int n=st.executeUpdate(sql);
		st.close();
		JOptionPane.showMessageDialog(null, "updated");
		%>
		<jsp:forward page="Registration.jsp"/>
		<%
	}
	else
	{
		JOptionPane.showMessageDialog(null, "invalid");
		%>
		<jsp:forward page="Registration.jsp"/>
		<% 
	}
}
else if(request.getParameter("delete")!=null)
{
	if(email.length()>0)
	{
		//int id=Integer.parseInt(empid);
		Statement st=con.createStatement();
		String sql="delete from  reg where emp_mail='"+email+"'";
		System.out.println(sql);
		int n=st.executeUpdate(sql);
		st.close();
		JOptionPane.showMessageDialog(null, "deleted");
		%>
		<jsp:forward page="Registration.jsp"/>
		<%
	}
	else
	{
		JOptionPane.showMessageDialog(null, "invalid");
		%>
		<jsp:forward page="Registration.jsp"/>
		<% 
	}
}
else if(request.getParameter("select")!=null)
{
	Statement st=con.createStatement();
	String sql="select * from reg";
	System.out.println(sql);
	ResultSet rs=st.executeQuery(sql);
	%>
	<jsp:include page="Registration.jsp"/>
	<table align="center" border="1">
	<tr>
	
	<th>Employee Name</th>
	<th>Designation</th>
	<th>Email</th>
	<th>User Name</th>
	<th>Password</th>
	</tr>
	<%
	while(rs.next())
	{
		%>
		<tr>
		
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
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