package com.request;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ViewStockReqList
 */

public class ViewStockReqList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<StockReq> stockReqList = RequestDBUtil.viewStockReqList();
		request.setAttribute("StockReqList", stockReqList);

       
        RequestDispatcher dis = request.getRequestDispatcher("/backend/smanager/stockreqlist.jsp");
        dis.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<StockReq> stockReqList = RequestDBUtil.viewStockReqList();
		request.setAttribute("StockReqList", stockReqList);

       
        RequestDispatcher dis = request.getRequestDispatcher("/backend/smanager/stockreqlist.jsp");
        dis.forward(request, response);
	}

}
