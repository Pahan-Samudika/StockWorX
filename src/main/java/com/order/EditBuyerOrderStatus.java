package com.order;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class EditBuyerOrderStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
        String uid = (String) session.getAttribute("userid");
        
		String orderid = request.getParameter("id");
		String status = request.getParameter("value");
		
		boolean isTrue;
		
		isTrue = OrderDBUtil.UpdateBuyerOrderStatus(orderid, status,uid);
		
		if(isTrue==true) {
			List <BuyerOrder> BuyerOrderList = OrderDBUtil.viewBuyerOrderList("Pending");
			System.out.println("Retrieved Pending Orders");
			request.setAttribute("BuyerOrderList", BuyerOrderList);
			
			List <BuyerOrder> ApprovedBuyerOrderlist = OrderDBUtil.viewBuyerOrderList("Approved");
			System.out.println("Retrieved Approved Orders");
			request.setAttribute("ApprovedBuyerOrderlist", ApprovedBuyerOrderlist);
			
			List <BuyerOrder> RejectedBuyerOrderlist = OrderDBUtil.viewBuyerOrderList("Rejected");
			System.out.println("Retrieved Rejected Orders");
			request.setAttribute("RejectedBuyerOrderlist", RejectedBuyerOrderlist);
			
			RequestDispatcher dis = request.getRequestDispatcher("/backend/manager/buyerorders.jsp");
	        dis.forward(request, response);
	        
		}else {
			List <BuyerOrder> BuyerOrderList = OrderDBUtil.viewBuyerOrderList("Pending");
			System.out.println("Retrieved Pending Orders");
			request.setAttribute("BuyerOrderList", BuyerOrderList);
			
			List <BuyerOrder> ApprovedBuyerOrderlist = OrderDBUtil.viewBuyerOrderList("Approved");
			System.out.println("Retrieved Approved Orders");
			request.setAttribute("ApprovedBuyerOrderlist", ApprovedBuyerOrderlist);
			
			List <BuyerOrder> RejectedBuyerOrderlist = OrderDBUtil.viewBuyerOrderList("Rejected");
			System.out.println("Retrieved Rejected Orders");
			request.setAttribute("RejectedBuyerOrderlist", RejectedBuyerOrderlist);
			
			RequestDispatcher dis = request.getRequestDispatcher("/backend/manager/buyerorders.jsp");
	        dis.forward(request, response);
		}
				
	}

}
