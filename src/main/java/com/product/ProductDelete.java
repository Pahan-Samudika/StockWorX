package com.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ProductDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Taking Parameters to variables
		String productID = request.getParameter("productId");
		
		boolean isTrue;
		
		//Calling function
		isTrue = ProductDBUtil.deleteProduct(productID);
		
		//If successful
		if(isTrue==true) {
			List <Product> prodDetails = ProductDBUtil.viewproduct();

			request.setAttribute("prodDetails", prodDetails);

			RequestDispatcher dis = request.getRequestDispatcher("/backend/manager/manageprod.jsp");
			dis.forward(request, response);
			
		//If unsuccessful
		}else {
			List <Product> prodDetails = ProductDBUtil.viewproduct();

			request.setAttribute("prodDetails", prodDetails);

			RequestDispatcher dis = request.getRequestDispatcher("/backend/manager/manageprod.jsp");
			dis.forward(request, response);
		}
	}


}
