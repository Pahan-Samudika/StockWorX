package com.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserView
 */

public class UserViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<User> userDetails = UserDBUtil.viewUser();

		request.setAttribute("userDetails", userDetails);
		
		RequestDispatcher dis = request.getRequestDispatcher("/backend/admin/admin.jsp");
		dis.forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<User> userDetails = UserDBUtil.viewUser();

		request.setAttribute("userDetails", userDetails);
		
		RequestDispatcher dis = request.getRequestDispatcher("/backend/admin/admin.jsp");
		dis.forward(request, response);
		
		
	}

}
