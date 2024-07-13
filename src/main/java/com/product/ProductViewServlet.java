package com.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ProductViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List <Product> prodDetails = ProductDBUtil.viewproduct();

		request.setAttribute("prodDetails", prodDetails);

		RequestDispatcher dis = request.getRequestDispatcher("/backend/manager/manageprod.jsp");
		dis.forward(request, response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List <Product> prodDetails = ProductDBUtil.viewproduct();

		request.setAttribute("prodDetails", prodDetails);

		RequestDispatcher dis = request.getRequestDispatcher("/backend/manager/manageprod.jsp");
		dis.forward(request, response);
	}

}
