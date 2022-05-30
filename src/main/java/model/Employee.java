package model;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

//this file is a POJO: Plain old java object
public class Employee {
	
	private static Connection getcon() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String jdbcurl = "jdbc:mysql://localhost:3306/Miniproject"; //3306 is port id of mysql
        Connection con = DriverManager.getConnection(jdbcurl,"root","Shivam@123");
        return con;
	}
	
	public static boolean check(String us,String pass) throws ClassNotFoundException, SQLException {
        Connection con=getcon();
        String query="select * from employee";
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        boolean val=false;
        while(rs.next()) {
        	if((rs.getString(1)).compareToIgnoreCase(us)==0 && (rs.getString(5)).compareTo(pass)==0) {
        		val=true;
        	}
        }
		return val;
	}
	
	//add method 
	public static void add(String fname,String lname,String email,String username,String pass) throws ClassNotFoundException, SQLException {
		Connection con=getcon();
        String query="insert into employee values(?,?,?,?,?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, username);
        pstmt.setString(2, fname);
        pstmt.setString(3, lname);
        pstmt.setString(4, email);
        pstmt.setString(5, pass);
        pstmt.executeUpdate();
	}
	
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		System.out.println(check("sid56rajawat","password"));
	}
}
