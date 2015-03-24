package com.appshelf.weblyweddings.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.appshelf.weblyweddings.beans.User;
import com.appshelf.weblyweddings.utils.DatabaseUtility;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class UserDAO {
	private Connection connection=null;
	private PreparedStatement preparedStatement=null;
	private ResultSet resultSet;
	public Boolean insertUserToInvite(Integer user_id,String w_name) throws SQLException 
	{
			connection = DatabaseUtility.getConnection();
			preparedStatement = (PreparedStatement) connection.prepareStatement("insert into T_INVITE values(?,?)");
			preparedStatement.setInt(1, user_id );
			preparedStatement.setString(2, w_name );
			preparedStatement.executeUpdate();
			return true;
	}
	
	
	
	public User getUserByEmailPassword(String email,String password) throws SQLException,ClassNotFoundException,NullPointerException
	{
		connection = DatabaseUtility.getConnection();
		
		preparedStatement = (PreparedStatement) connection.prepareStatement("select * from T_USER where u_email=? and u_password=?");
		preparedStatement.setString(1, email);
		preparedStatement.setString(2, password);
		resultSet = preparedStatement.executeQuery();
		
		User user=null;
		if(resultSet.next())
		{
			user = new User();
			user.setUserID(resultSet.getInt(1));
			user.setUserName(resultSet.getString(2));
			user.setEmail(resultSet.getString(3));
		}
		return user;
	}
	
	public boolean weddingExists(Integer u_id) throws SQLException,ClassNotFoundException
	{
		
		connection = DatabaseUtility.getConnection();
		PreparedStatement preparedStatement = (PreparedStatement) connection
				.prepareStatement("select * from T_WEDDING where w_brideid=? or w_bridegroomid=?");
		preparedStatement.setInt(1, u_id);
		preparedStatement.setInt(2, u_id);
		resultSet = preparedStatement.executeQuery();
		if(resultSet.next())
			return true;
		else 
			return false;
	}
	
	public int getIdFromEmail(String email) throws SQLException {
		connection = DatabaseUtility.getConnection();
		preparedStatement = (PreparedStatement) connection
				.prepareStatement("select u_id from T_USER where u_email=?");
		preparedStatement.setString(1, email);
		ResultSet resultSet = preparedStatement.executeQuery();
		if (resultSet.next()) {
			return resultSet.getInt(1);
		} else {
			System.out.println("ID not found in T_USER");
		}
		return -1;
	}
	
	public void addToInvitedList(int id, String weddingName)
			throws SQLException {
		connection = DatabaseUtility.getConnection();
		PreparedStatement preparedStatement = (PreparedStatement) connection
				.prepareStatement("insert into T_INVITE values(?,?)");
		preparedStatement.setInt(1, id);
		preparedStatement.setString(2, weddingName);
		preparedStatement.executeUpdate();
	}
	
	
	public User createNewUser(String name,String email,String password) throws SQLException,ClassNotFoundException
	{
		User user=null;
		
		Connection connection = DatabaseUtility.getConnection();
		PreparedStatement preparedStatement = (PreparedStatement) connection.prepareStatement("insert into T_USER(u_name, u_email, u_password) values(?,?,?)");
		preparedStatement.setString(1, name);
		preparedStatement.setString(2, email);
		preparedStatement.setString(3, password);
		preparedStatement.executeUpdate();
		
		preparedStatement = (PreparedStatement) connection.prepareStatement("select u_id from T_USER where u_email=?");
		preparedStatement.setString(1, email);
		ResultSet resultSet = preparedStatement.executeQuery();
		resultSet.next();
		user = new User();
		user.setUserID(resultSet.getInt(1));
		user.setUserName(name);
		user.setEmail(email);
		
		
		return user;
		
		
	}
}
