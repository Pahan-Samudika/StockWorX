package com.order;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BuyerOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean isTrue;
		
		HttpSession session = request.getSession();
        String uid = (String) session.getAttribute("userid");
        
        
		String productID = request.getParameter("productID");
		String productname = request.getParameter("productname");
		String quantity = request.getParameter("qty");
		int qty = Integer.parseInt(quantity);
		String total = request.getParameter("cost");
		double cost = Double.parseDouble(total);
		String address = request.getParameter("address");
		String paymethod = request.getParameter("paymethod");
		
		isTrue = OrderDBUtil.insertbuyerorder(productID, productname, qty, cost, uid, address, paymethod);
		
		if(isTrue == true) {
			List<BuyerOrder> MyBuyerOrderlist = OrderDBUtil.viewBuyerOrders(uid);
	        request.setAttribute("MyBuyerOrderlist",MyBuyerOrderlist);
	        
			RequestDispatcher dis = request.getRequestDispatcher("/backend/buyer/myorders.jsp");
			dis.forward(request, response);
		}else {
			List<BuyerOrder> MyBuyerOrderlist = OrderDBUtil.viewBuyerOrders(uid);
	        request.setAttribute("MyBuyerOrderlist",MyBuyerOrderlist);
	        
			RequestDispatcher dis = request.getRequestDispatcher("/backend/buyer/myorders.jsp");
			dis.forward(request, response);
		}
	}

}
