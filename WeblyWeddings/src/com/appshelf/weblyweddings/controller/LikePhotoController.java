package com.appshelf.weblyweddings.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.appshelf.weblyweddings.beans.Photo;
import com.appshelf.weblyweddings.beans.User;
import com.appshelf.weblyweddings.dao.PhotoDAO;

/**
 * Servlet implementation class LikePhotoController
 */
public class LikePhotoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikePhotoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String photoId = request.getParameter("photoId");
		User user = ((User) request.getSession().getAttribute("user"));
		int userId = user.getUserID();
		
		System.out.println(photoId);
		
		PhotoDAO photoDao=new PhotoDAO();
		Photo photo=new Photo();
		
		try {
			String message=photoDao.likePhoto(photoId, userId);
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write(message);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
