package com.order;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class InsertStockOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String prodId = request.getParameter("productId");
		int productID = Integer.parseInt(prodId);
		
		String quantity = request.getParameter("qty");
		int qty = Integer.parseInt(quantity);
		
		boolean isTrue;
		
		isTrue = OrderDBUtil.insertStockOrder(productID,qty);
		
		if(isTrue == true) {
			List <StockOrder> StockOrders = OrderDBUtil.viewStockOrders();
			System.out.println("Retrieved All Orders");
			request.setAttribute("StockOrders", StockOrders);
			
			RequestDispatcher dis = request.getRequestDispatcher("/backend/smanager/stockorderlist.jsp");
			dis.forward(request, response);
		}
		else {
			List <StockOrder> StockOrders = OrderDBUtil.viewStockOrders();
			System.out.println("Retrieved All Orders");
			request.setAttribute("StockOrders", StockOrders);
			
			RequestDispatcher dis = request.getRequestDispatcher("/backend/smanager/stockorderlist.jsp");
			dis.forward(request, response);
		}
	}

}
