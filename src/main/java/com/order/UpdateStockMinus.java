package com.order;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class UpdateStockMinus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String orderID = request.getParameter("id");
		String prodId = request.getParameter("prodId");
		String Qty = request.getParameter("newqty");
		
		int plusQty = Integer.parseInt(Qty);
		
		boolean isTrue;
		
		isTrue = OrderDBUtil.updateStockMinus(orderID,prodId,plusQty);
		
		if(isTrue==true) {
			List <BuyerOrder> ApprovedBuyerOrderlist = OrderDBUtil.ReadyBuyerOrderList("Approved");
			System.out.println("Retrieved Pending Orders");
			request.setAttribute("ApprovedBuyerOrderlist", ApprovedBuyerOrderlist);
			
			RequestDispatcher dis = request.getRequestDispatcher("/backend/whstaff/approvedorders.jsp");
	        dis.forward(request, response);
		}
	}

}
