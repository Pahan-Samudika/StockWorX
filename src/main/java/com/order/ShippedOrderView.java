package com.order;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ShippedOrderView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List <BuyerOrder> ApprovedBuyerOrderlist = OrderDBUtil.ReadyBuyerOrderList("In Delivery");
		System.out.println("Retrieved In Delivery Orders");
		request.setAttribute("ApprovedBuyerOrderlist", ApprovedBuyerOrderlist);
		
		RequestDispatcher dis = request.getRequestDispatcher("/backend/whstaff/shipped.jsp");
        dis.forward(request, response);
	}

}
