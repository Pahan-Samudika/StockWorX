package com.order;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class BuyerOrderView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
        String uid = (String) session.getAttribute("userid");
        
        List<BuyerOrder> MyBuyerOrderlist = OrderDBUtil.viewBuyerOrders(uid);
        
        request.setAttribute("MyBuyerOrderlist",MyBuyerOrderlist);
        
        RequestDispatcher dis = request.getRequestDispatcher("/backend/buyer/myorders.jsp");
        dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
        String uid = (String) session.getAttribute("userid");
        
        List<BuyerOrder> MyBuyerOrderlist = OrderDBUtil.viewBuyerOrders(uid);
        request.setAttribute("MyBuyerOrderlist",MyBuyerOrderlist);
        
        RequestDispatcher dis = request.getRequestDispatcher("/backend/buyer/myorders.jsp");
        dis.forward(request, response);
	}

}
