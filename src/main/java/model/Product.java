package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Product {
	private static Connection getcon() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String jdbcurl = "jdbc:mysql://localhost:3306/Miniproject";
        Connection con = DriverManager.getConnection(jdbcurl,"root","Shivam@123");
        return con;
	}
	
	public static boolean check(int id) throws ClassNotFoundException, SQLException {
		Connection con=getcon();
        String query="select * from product";
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        boolean val=false;
        while(rs.next()) {
        	if(rs.getInt(1)==id) {
        		val=true;
        	}
        }
		return val;
	}
	
	public static boolean checkAvailability(int id,int qt) throws ClassNotFoundException, SQLException {
		Connection con=getcon();
        String query="select * from product";
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        boolean val=false;
        while(rs.next()) {
        	if(rs.getInt(1)==id && rs.getInt(4)>=qt) {
        		val=true;
        	}
        }
		return val;
	}
	
	public static void sell(int id,int qt) throws ClassNotFoundException, SQLException {
		Connection con=getcon();
        String query="UPDATE product SET Quantity=Quantity-"+qt+" WHERE pid="+id+"";
        Statement stmt = con.createStatement();
        stmt.executeUpdate(query);
	}
	
	public static void update(int id,String name,float price,int qt) throws ClassNotFoundException, SQLException {
		Connection con=getcon();
        String query="UPDATE product SET Quantity=?,name=?,price=? WHERE pid=?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, qt);
        pstmt.setString(2, name);
        pstmt.setFloat(3, price);
        pstmt.setInt(4, id);
        pstmt.executeUpdate();
	}
	
	public static void add(int id,String name,float price,int qt) throws ClassNotFoundException, SQLException {
		Connection con=getcon();
        String query="insert into product values(?,?,?,?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, id);
        pstmt.setString(2, name);
        pstmt.setFloat(3, price);
        pstmt.setInt(4, qt);
        pstmt.executeUpdate();
	}
	
//	public static void main(String []args) {
//		try {
//			sell(1,10);
//		} catch (ClassNotFoundException | SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
}
