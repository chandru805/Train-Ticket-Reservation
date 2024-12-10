package Pack;


import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Jdbc1 {
	public Connection dbconnect() throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		String user="root",pass="e18itr013";
		String url="jdbc:mysql://localhost:3306/passenger";
		Connection con=DriverManager.getConnection(url, user, pass);
		return con;
		
	}
}
