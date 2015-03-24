package com.appshelf.weblyweddings.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.appshelf.weblyweddings.beans.Event;
import com.appshelf.weblyweddings.beans.User;
import com.appshelf.weblyweddings.beans.Wedding;
import com.appshelf.weblyweddings.dao.EventDAO;
import com.appshelf.weblyweddings.dao.UserDAO;
import com.appshelf.weblyweddings.dao.WeddingDAO;
import com.appshelf.weblyweddings.utils.DatabaseUtility;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class MyWeddingController
 */
public class MyWeddingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MyWeddingController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		UserDAO userDao = new UserDAO();
		Wedding wedding = null;
		WeddingDAO weddingDao = new WeddingDAO();

		String weddingName = request.getParameter("weddingName");

		try {
			if (userDao.weddingExists(user.getUserID())) {
				String message = "You are already married !";
				request.setAttribute("errorMsg", message);
				RequestDispatcher rd = request
						.getRequestDispatcher("jsp/error.jsp");
				rd.forward(request, response);
			} else {
				userDao = new UserDAO();
				int brideId = userDao.getIdFromEmail(request
						.getParameter("brideEmail"));
				int brideGroomId = userDao.getIdFromEmail(request
						.getParameter("bridegroomEmail"));

				System.out.println(brideId + " " + brideGroomId);
				if (brideId != -1 && brideGroomId != -1) {

					if (user.getUserID() == brideId
							|| user.getUserID() == brideGroomId) {

						Timestamp ts = Timestamp.valueOf(request
								.getParameter("date")
								+ " "
								+ request.getParameter("time") + ":00");
						String venue = request.getParameter("venue");
						wedding = weddingDao.createWedding(weddingName,
								brideId, brideGroomId, ts, venue);
					}
				} else {
					String message = "Both bride and bridegroom have to be registered";
					request.setAttribute("errorMsg", message);
					RequestDispatcher rd = request
							.getRequestDispatcher("jsp/error.jsp");
					rd.forward(request, response);
				}

				userDao = new UserDAO();
				userDao.addToInvitedList(brideId, weddingName);
				userDao.addToInvitedList(brideGroomId, weddingName);

				int i = 1;
				ArrayList<Event> events = new ArrayList<>();
				while (i <= 3) {
					Event event = new Event();
					String eventName = request.getParameter("e" + i + "Name")
							.trim();
					event.setEventName(eventName);
					if (!eventName.equals("")) {

						EventDAO eventDao = new EventDAO();
						Timestamp ts = Timestamp.valueOf(request
								.getParameter("e" + i + "Date")
								+ " "
								+ request.getParameter("e" + i + "Time")
								+ ":00");

						event = eventDao.addEvent(weddingName,
								event.getEventName(), ts, event.getVenue(), i);

						events.add(event);
					}
					i++;
				}

				wedding.setEvents(events);
				session.setAttribute("wedding", wedding);
				RequestDispatcher rd = request
						.getRequestDispatcher("jsp/wedding.jsp");
				rd.forward(request, response);
			}
		} catch (ClassNotFoundException | SQLException e) {
			request.setAttribute("errorMsg", e.getMessage());
			RequestDispatcher rd = request
					.getRequestDispatcher("jsp/error.jsp");
			rd.forward(request, response);
			e.printStackTrace();
		}

	}
}