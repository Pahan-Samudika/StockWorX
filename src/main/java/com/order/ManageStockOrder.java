package com.order;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ManageStockOrder
 */
@WebServlet("/ManageStockOrder")
public class ManageStockOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List <StockOrder> StockOrderList = OrderDBUtil.viewStockOrderList("Pending");
		System.out.println("Retrieved Pending Orders");
		request.setAttribute("StockOrderList", StockOrderList);
		
		List <StockOrder> ApprovedStockOrderlist = OrderDBUtil.viewStockOrderList("Approved");
		System.out.println("Retrieved Approved Orders");
		request.setAttribute("ApprovedStockOrderlist", ApprovedStockOrderlist);
		
		List <StockOrder> RejectedStockOrderlist = OrderDBUtil.viewStockOrderList("Rejected");
		System.out.println("Retrieved Rejected Orders");
		request.setAttribute("RejectedStockOrderlist", RejectedStockOrderlist);
		
		RequestDispatcher dis = request.getRequestDispatcher("/backend/manager/stockorders.jsp");
        dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List <StockOrder> StockOrderList = OrderDBUtil.viewStockOrderList("Pending");
		System.out.println("Retrieved Pending Orders");
		request.setAttribute("StockOrderList", StockOrderList);
		
		List <StockOrder> ApprovedStockOrderlist = OrderDBUtil.viewStockOrderList("Approved");
		System.out.println("Retrieved Approved Orders");
		request.setAttribute("ApprovedStockOrderlist", ApprovedStockOrderlist);
		
		List <StockOrder> RejectedStockOrderlist = OrderDBUtil.viewStockOrderList("Rejected");
		System.out.println("Retrieved Rejected Orders");
		request.setAttribute("RejectedStockOrderlist", RejectedStockOrderlist);
		
		RequestDispatcher dis = request.getRequestDispatcher("/backend/manager/stockorders.jsp");
        dis.forward(request, response);
	}

}
