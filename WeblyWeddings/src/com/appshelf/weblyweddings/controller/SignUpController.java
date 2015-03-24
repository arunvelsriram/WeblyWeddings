package com.appshelf.weblyweddings.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.appshelf.weblyweddings.beans.User;
import com.appshelf.weblyweddings.dao.UserDAO;
import com.appshelf.weblyweddings.utils.DatabaseUtility;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class SignUpController
 */
public class SignUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		try {
			
			UserDAO userDao=new UserDAO();
			User user=userDao.createNewUser(name,email,password);	
			
			HttpSession session = request.getSession(true);
			session.setAttribute("user", user);
			System.out.println("session created for " + user.getUserName());
			
			RequestDispatcher rd = request.getRequestDispatcher("jsp/welcome.jsp");
			rd.forward(request, response);
		} catch (SQLException | ClassNotFoundException e) {
			request.setAttribute("errorMsg", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("jsp/error.jsp");
			rd.forward(request, response);
			e.printStackTrace();
		} 
	}

}
