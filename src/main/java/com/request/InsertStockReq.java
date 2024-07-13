package com.request;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.product.Product;
import com.product.ProductDBUtil;


public class InsertStockReq extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String uid = (String)session.getAttribute("userid");
		
		String prodId = request.getParameter("product");
		int productID = Integer.parseInt(prodId);
		String note = request.getParameter("AdditionalNote");
		
		boolean isTrue;
		
		isTrue = RequestDBUtil.insertReq(productID, note, uid);
		
		if(isTrue == true) {
			List <Product> StockDetails = ProductDBUtil.viewproduct();

			request.setAttribute("StockDetails", StockDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("/backend/whstaff/approvedorders.jsp");
			dis.forward(request, response);
		}
		else {
			List <Product> StockDetails = ProductDBUtil.viewproduct();

			request.setAttribute("StockDetails", StockDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("/backend/whstaff/approvedorders.jsp");
			dis.forward(request, response);
		}
		
	}
	

}
