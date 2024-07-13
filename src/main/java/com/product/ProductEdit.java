package com.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProductEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String productId = request.getParameter("productId");
		
		List <Product> prodDetails = ProductDBUtil.viewproduct(productId);

		request.setAttribute("prodDetails", prodDetails);

		RequestDispatcher dis = request.getRequestDispatcher("/backend/manager/productedit.jsp");
		dis.forward(request, response);
	}

}
