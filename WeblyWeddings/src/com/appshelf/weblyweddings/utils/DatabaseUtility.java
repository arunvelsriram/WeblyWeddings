package com.appshelf.weblyweddings.utils;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;


public class DatabaseUtility {
	
	public static final String URL = "jdbc:mysql://localhost:3306/weblyweddings";
	public static final String USERNAME = "root";
	public static final String PASSWORD = "root";
	
	public static Connection getConnection() throws SQLException {
		Connection connection = null;
		connection = (Connection) DriverManager.getConnection(URL, USERNAME, PASSWORD);
		return connection;
	}
	public static void closeConnection(Connection connection) throws SQLException {
		connection.close();
	}
	
	public static void closeResultSetAndStatement(Statement statement, ResultSet resultSet) throws SQLException {
		if(statement != null) {
			statement.close();
		}
		if(resultSet != null) {
			resultSet.close();
		}
	}
}
