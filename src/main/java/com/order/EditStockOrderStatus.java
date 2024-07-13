package com.order;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EditStockOrderStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
        String uid = (String) session.getAttribute("userid");
        
		String orderid = request.getParameter("id");
		String status = request.getParameter("value");
		
		boolean isTrue;
		
		isTrue = OrderDBUtil.UpdateStockOrderStatus(orderid, status,uid);
		
		if(isTrue==true) {
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
	        
		}else {
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
	

}
