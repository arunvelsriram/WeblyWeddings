package com.appshelf.weblyweddings.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.appshelf.weblyweddings.beans.Event;
import com.appshelf.weblyweddings.beans.Photo;
import com.appshelf.weblyweddings.beans.Wedding;
import com.appshelf.weblyweddings.utils.DatabaseUtility;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class WeddingDAO {
	private Connection connection=null;
	private PreparedStatement preparedStatement=null;
	Wedding wedding=null;
	public Wedding getWeddingByName(String w_name) throws SQLException,ClassNotFoundException
	{
		connection = DatabaseUtility.getConnection();
		preparedStatement = (PreparedStatement) connection.prepareStatement("select * from T_WEDDING where w_name=?");
		preparedStatement.setString(1, w_name);
		ResultSet resultSet = preparedStatement.executeQuery();
		if(resultSet.next()) {
			 wedding = new Wedding();
			wedding.setWeddingName(resultSet.getString(1));
			String bride = getNameFromId(resultSet.getInt(2));
			wedding.setBride(bride);
			String brideGroom = getNameFromId(resultSet.getInt(3));
			wedding.setBrideGroom(brideGroom);
			wedding.setDateTime(resultSet.getTimestamp(4));
			wedding.setVenue(resultSet.getString(5));
			ArrayList<Photo> photos = getPhotos(wedding);
			wedding.setPhotos(photos);
			
			ArrayList<Event> events = getEvents(wedding);
			wedding.setEvents(events);
			
		}
		return wedding;
			
		
	}
		private String getNameFromId(int id) throws SQLException {
			connection = DatabaseUtility.getConnection();
			preparedStatement = (PreparedStatement) connection.prepareStatement("select u_name from T_USER where u_id=?");
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			resultSet.next();
			return resultSet.getString(1);
		}
		
		
		
		private ArrayList<Event> getEvents(Wedding w) throws SQLException {
			connection = DatabaseUtility.getConnection();
			preparedStatement = (PreparedStatement) connection.prepareStatement("select * from T_EVENT where w_name=?");
			preparedStatement.setString(1, w.getWeddingName());
			ResultSet resultSet = preparedStatement.executeQuery();
			ArrayList<Event> events = new ArrayList<>();
			while(resultSet.next()) {
				Event event = new Event();
				event.setEventName(resultSet.getString(2));
				event.setEventDateTime(resultSet.getTimestamp(3));
				event.setVenue(resultSet.getString(4));
				events.add(event);
			}
			return events;
		}

		private ArrayList<Photo> getPhotos(Wedding w) throws SQLException {
			connection = DatabaseUtility.getConnection();
			preparedStatement = (PreparedStatement) connection.prepareStatement("select photo_id from T_PHOTO where w_name=?");
			preparedStatement.setString(1, w.getWeddingName());
			ResultSet resultSet = preparedStatement.executeQuery();
			ArrayList<Photo> photos = new ArrayList<>();
			while(resultSet.next()) {
				Photo photo = new Photo();
				photo.setPhotoId(resultSet.getString(1));
				photos.add(photo);
			}
			return photos;
		}
		
		public Wedding createWedding(String weddingName,Integer brideId,Integer brideGroomId,Timestamp ts,String venue) throws SQLException,ClassNotFoundException
		{
			Wedding wedding=new Wedding();
			connection = DatabaseUtility.getConnection();
			preparedStatement = (PreparedStatement) connection
					.prepareStatement("insert into T_WEDDING values(?,?,?,?,?)");
			
			preparedStatement.setString(1, weddingName);
			preparedStatement.setInt(2, brideId);
			preparedStatement.setInt(3, brideGroomId);
			// System.out.println(ts.toString());
			preparedStatement.setTimestamp(4, ts);
			preparedStatement.setString(5, venue);
			preparedStatement.executeUpdate();
			wedding=this.getWeddingByName(weddingName);
			return wedding;
			
			
		}
	
}
	
