package com.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserDeleteServlet
 */

public class UserDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userId = request.getParameter("id");

		boolean isTrue;

		isTrue = UserDBUtil.deleteUser(userId);
		
		if(isTrue==true) {
			List<User> userDetails = UserDBUtil.viewUser();

			request.setAttribute("userDetails", userDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("/backend/admin/admin.jsp");
			dis.forward(request, response);
		}else {
			List<User> userDetails = UserDBUtil.viewUser();

			request.setAttribute("userDetails", userDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("/backend/admin/admin.jsp");
			dis.forward(request, response);
		}
		
			
		

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<User> userDetails = UserDBUtil.viewUser();

		request.setAttribute("userDetails", userDetails);
		
		RequestDispatcher dis = request.getRequestDispatcher("/backend/admin/admin.jsp");
		dis.forward(request, response);
	}

}
