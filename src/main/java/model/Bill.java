package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Bill {
	private static Connection getcon() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String jdbcurl = "jdbc:mysql://localhost:3306/Miniproject";
        Connection con = DriverManager.getConnection(jdbcurl,"root","Shivam@123");
        return con;
	}
	
	public static void InitializeBill() throws ClassNotFoundException, SQLException {
		Connection con=getcon();
		String query="delete from bill";
        Statement stmt = con.createStatement();
        stmt.executeUpdate(query);
	}
	
	public static void add(int id,int qt) throws ClassNotFoundException, SQLException {
		int productId = 0;
		float price = 0;
		String name = null;
		
		Connection con=getcon();
        String query="select * from product";
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        while(rs.next()) {
        	if(rs.getInt(1)==id) {
        		productId=rs.getInt(1);
        		name=rs.getString(2);
        		price=rs.getFloat(3);
        	}
        }
        
        query="INSERT into bill values("+productId+","+name+","+price+","+qt+");";
        stmt.executeUpdate(query);
        
	}
}
