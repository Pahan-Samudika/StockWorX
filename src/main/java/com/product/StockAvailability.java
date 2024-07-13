package com.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class StockAvailability extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List <Product> StockDetails = ProductDBUtil.viewproduct();

		request.setAttribute("StockDetails", StockDetails);

		RequestDispatcher dis = request.getRequestDispatcher("/backend/manager/stockavailability.jsp");
		dis.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List <Product> StockDetails = ProductDBUtil.viewproduct();

		request.setAttribute("StockDetails", StockDetails);

		RequestDispatcher dis = request.getRequestDispatcher("/backend/manager/stockavailability.jsp");
		dis.forward(request, response);
	}
}
