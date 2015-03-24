package com.appshelf.weblyweddings.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.appshelf.weblyweddings.beans.User;
import com.appshelf.weblyweddings.beans.Wedding;
import com.appshelf.weblyweddings.dao.UserDAO;
import com.appshelf.weblyweddings.dao.WeddingDAO;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class JoinWeddingController
 */
public class JoinWeddingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Connection connection;
	PreparedStatement preparedStatement;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinWeddingController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String weddingName = request.getParameter("weddingName").trim();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		UserDAO userDao=new UserDAO();
		WeddingDAO weddingDao=new WeddingDAO();
		Wedding wedding=null;
			
			try {
				if(userDao.insertUserToInvite(user.getUserID(),weddingName))
				{
					
					wedding=weddingDao.getWeddingByName(weddingName);
					
					session.setAttribute("wedding", wedding);
					System.out.println(wedding.getWeddingName());
					RequestDispatcher rd = request.getRequestDispatcher("jsp/wedding.jsp");
					rd.forward(request, response);
				}
				else
				{
					request.setAttribute("errorMsg", "Failed to join the wedding");
					RequestDispatcher rd = request.getRequestDispatcher("jsp/error.jsp");
					rd.forward(request, response);
				}
			} catch (SQLException | ClassNotFoundException e) {
				request.setAttribute("errorMsg", e.getMessage());
				RequestDispatcher rd = request.getRequestDispatcher("jsp/error.jsp");
				rd.forward(request, response);
			}
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	

	
}
