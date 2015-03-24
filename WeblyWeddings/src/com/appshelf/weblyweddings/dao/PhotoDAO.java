package com.appshelf.weblyweddings.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.appshelf.weblyweddings.utils.DatabaseUtility;

public class PhotoDAO {
		public String likePhoto(String photoId,int userId) throws SQLException {
			System.out.println("PhotoDAO");
			Connection connection=DatabaseUtility.getConnection();
			PreparedStatement pstmt=connection.prepareStatement("insert into t_photolike values(?,?)");
			pstmt.setString(1, photoId);
			pstmt.setInt(2, userId);
			pstmt.executeUpdate();
			return "liked";
		}
}