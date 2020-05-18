package com.corrdingding.DriverDB;

import java.sql.*;

public class ConnectionDB {
	
	
	/*public Connection DriverDB() throws ClassNotFoundException, SQLException {
		Connection conn =  null;
		System.out.println("corrdingding db connection");
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcDriver = "jdbc:mysql://192.168.123.68:3306/corrdingding?" +
				"useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
		String dbUser = "corrdingding";
		String dbPass = "corrdingding";
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		System.out.println(conn +"<--- conn in ConnectionDB.JAVA ");
		return conn;
	}*/
	

	public Connection DriverDB() throws ClassNotFoundException, SQLException {
		Connection conn =  null;
		System.out.println("corrdingding db connection");
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcDriver = "jdbc:mysql://localhost:3306/corrdingding?" +
				"useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
		String dbUser = "root";
		String dbPass = "java0000";
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		System.out.println(conn +"<--- conn in ConnectionDB.JAVA ");
		return conn;
	}



}
