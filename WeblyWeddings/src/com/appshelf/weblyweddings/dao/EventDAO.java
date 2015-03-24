package com.appshelf.weblyweddings.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import org.apache.tomcat.util.buf.TimeStamp;

import com.appshelf.weblyweddings.beans.Event;
import com.appshelf.weblyweddings.utils.DatabaseUtility;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class EventDAO {
	private Connection connection = null;
	private PreparedStatement preparedStatement = null;
	private ResultSet resultSet;

	public Event addEvent(String weddingName, String eventName, Timestamp ts,
			String eventVenue, int i) throws SQLException {

		Event e = new Event();
		e.setEventName(eventName);
		e.setEventDateTime(ts);
		e.setVenue(eventVenue);
		connection = DatabaseUtility.getConnection();
		preparedStatement = (PreparedStatement) connection
				.prepareStatement("insert into T_EVENT values(?,?,?,?)");
		preparedStatement.setString(1, weddingName);
		preparedStatement.setString(2, eventName);
		preparedStatement.setTimestamp(3, ts);
		e.setVenue(("e" + i + "Venue"));
		preparedStatement.setString(4, eventVenue);
		preparedStatement.executeUpdate();
		return e;

	}
}
