package com.request;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.product.Product;
import com.product.ProductDBUtil;

/**
 * Servlet implementation class StockRequest
 */
@WebServlet("/StockRequest")
public class StockRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List <Product> prodDetails = ProductDBUtil.viewproduct();

		request.setAttribute("prodDetails", prodDetails);

		RequestDispatcher dis = request.getRequestDispatcher("/backend/whstaff/reqstock.jsp");
		dis.forward(request, response);
	}

}
