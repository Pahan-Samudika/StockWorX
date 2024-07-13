package com.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		try {
				//Validating user details relative to the credentials
				List<User> UserDetails = UserDBUtil.validate(username, password);
			
				request.setAttribute("UserDetails", UserDetails); 
				
				//If credentials are invalid
				if(UserDetails.isEmpty()) {
					System.out.println("Invalid Login");
				    request.setAttribute("loginError", true);
				    
				    RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
				    dispatcher.forward(request, response);
				    
				//If credentials are valid
				}else {
					//Getting info from the DB
					User user = UserDetails.get(0);
					String role = user.getRole();
					int uid = user.getId();
					String name = user.getName();
					
					//Creating a session
					HttpSession session = request.getSession();
					System.out.println("Session Created");

					//Setting session attributes
					session.setAttribute("userid",String.valueOf(uid));
					session.setAttribute("username",name);
					session.setAttribute("userrole",role);
					
					//If user is a Buyer
					if("Buyer".equals(role)) {
						System.out.println("Logged In as a Buyer");
						RequestDispatcher dis = request.getRequestDispatcher("/catalog");
						dis.forward(request,response);
					}
					//If user is a Sales Manager
					else if("SalesManager".equals(role)) {
						System.out.println("Logged In as a Sales Manager");
						RequestDispatcher dis = request.getRequestDispatcher("/view_stockreq");
						dis.forward(request,response);
					}
					//If user is a Manager
					else if("Manager".equals(role)) {
						System.out.println("Logged In as a Manager");
						RequestDispatcher dis = request.getRequestDispatcher("/view_products");
						dis.forward(request,response);
					}
					//If user is a Warehouse staff member
					else if("WarehouseStaff".equals(role)) {
						System.out.println("Logged In as a Warehouse Staff Member");
						RequestDispatcher dis = request.getRequestDispatcher("/order_list");
						dis.forward(request,response);
					}
					//If user is a Manufacturer
					else if("Manufacturer".equals(role)) {
						System.out.println("Logged In as a Manufacturer");
						RequestDispatcher dis = request.getRequestDispatcher("/readyup_view");
						dis.forward(request,response);
					}
					//If user is an Administrator
					else if("Admin".equals(role)) {
						System.out.println("Logged In as a Administrator");
						RequestDispatcher dis = request.getRequestDispatcher("/view_user");
						dis.forward(request,response);
					}
				}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
