package com.order;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class DeleteStockOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String orderID = request.getParameter("id");
		
		boolean isTrue;
		
		isTrue = OrderDBUtil.deleteStockOrder(orderID);
		
		if(isTrue==true) {
			List <StockOrder> StockOrders = OrderDBUtil.viewStockOrders();
			System.out.println("Retrieved All Orders");
			request.setAttribute("StockOrders", StockOrders);
			
			RequestDispatcher dis = request.getRequestDispatcher("/backend/smanager/stockorderlist.jsp");
	        dis.forward(request, response);
	        
		}else {
			List <StockOrder> StockOrders = OrderDBUtil.viewStockOrders();
			System.out.println("Retrieved All Orders");
			request.setAttribute("StockOrders", StockOrders);
			
			RequestDispatcher dis = request.getRequestDispatcher("/backend/smanager/stockorderlist.jsp");
	        dis.forward(request, response);
		}
	}

}
