package com.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProductCatalog extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Calling function and putting into a List
		List<Product>productDetails=ProductDBUtil.viewproduct();

		//Setting attribute for retrieval
		request.setAttribute("productDetails", productDetails);
		
		//Forwarding to a relevant file
		RequestDispatcher dis = request.getRequestDispatcher("/backend/buyer/productcat.jsp");
		dis.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Calling function and putting into a List
		List<Product>productDetails=ProductDBUtil.viewproduct();

		//Setting attribute for retrieval
		request.setAttribute("productDetails", productDetails);

		//Forwarding to a relevant file
		RequestDispatcher dis = request.getRequestDispatcher("/backend/buyer/productcat.jsp");
		dis.forward(request, response);
	}

}
