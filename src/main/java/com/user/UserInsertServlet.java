package com.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserInsert
 */

public class UserInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username= request.getParameter("username");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String role = request.getParameter("role");

		boolean isTrue;

		isTrue = UserDBUtil.adduser(username, password, name, email, phone, role);

		if(isTrue == true) {
			List<User> userDetails = UserDBUtil.viewUser();

			request.setAttribute("userDetails", userDetails);
			RequestDispatcher dis = request.getRequestDispatcher("/backend/admin/admin.jsp");
			dis.forward(request, response);
			System.out.println("Inserted Successfully");
		}
		else {
			List<User> userDetails = UserDBUtil.viewUser();

			request.setAttribute("userDetails", userDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("/backend/admin/admin.jsp");
			dis.forward(request, response);
			System.out.println("Insertion failed");
		}
	}

}
