package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DT {
	private static Connection getcon() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String jdbcurl = "jdbc:mysql://localhost:3306/Miniproject";
        Connection con = DriverManager.getConnection(jdbcurl,"root","Shivam@123");
        return con;
	}
	public static void initialize() throws ClassNotFoundException, SQLException {
		Connection con=getcon();
        String query="create table if not exists employee(username varchar(30) primary key,firstname varchar(30),lastname varchar(30),email varchar(30),password varchar(30))";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.executeUpdate();
        
        query="create table if not exists product(PID int primary key,name varchar(30),price float,quantity int)";
        pstmt = con.prepareStatement(query);
        pstmt.executeUpdate();
        
        query="create table if not exists bill(PID int primary key,name varchar(30),price float,quantity int,total float)";
        pstmt = con.prepareStatement(query);
        pstmt.executeUpdate();
	}
}