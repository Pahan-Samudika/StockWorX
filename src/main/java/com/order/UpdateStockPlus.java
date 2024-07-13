package com.order;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class UpdateStockPlus extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String orderID = request.getParameter("id");
		String prodId = request.getParameter("prodId");
		String Qty = request.getParameter("newqty");
		
		int plusQty = Integer.parseInt(Qty);
		
		boolean isTrue;
		
		isTrue = OrderDBUtil.updateStockPlus(orderID,prodId,plusQty);
		
		if(isTrue==true) {
			List <StockOrder> ApprovedStockOrderlist = OrderDBUtil.ReadyStockOrderList("Approved");
			System.out.println("Retrieved Approved Orders");
			request.setAttribute("ReadyStock", ApprovedStockOrderlist);
			
			RequestDispatcher dis = request.getRequestDispatcher("/backend/manufac/readyupstock.jsp");
	        dis.forward(request, response);
		}
	}

}
