package com.order;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

import com.product.Product;


/**
 * Servlet implementation class CheckoutServlet
 */

public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//HttpSession session = request.getSession();
        //String uid = (String) session.getAttribute("userid");
		
		String prodId = request.getParameter("productId");
		String prodprice = request.getParameter("price");
		double price = Double.parseDouble(prodprice);
		String quantity = request.getParameter("quantity");
		int qty = Integer.parseInt(quantity);
		double total = price * qty;
		
		
		List<Product> prod = OrderDBUtil.getProductName(prodId);
		Product p = prod.get(0);
		String pname = p.getName();

		Order o = new Order(prodId , pname,qty, price,total);
		
		request.setAttribute("order", o);
		
		RequestDispatcher dis = request.getRequestDispatcher("/backend/buyer/checkout.jsp");
		dis.forward(request, response);
		
	}

}
