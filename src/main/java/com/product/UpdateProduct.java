package com.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class UpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Taking Parameters to variables
		String prodId = request.getParameter("id");
		String name = request.getParameter("name");
		String price = request.getParameter("price");
		String quantity = request.getParameter("quantity");
		String category = request.getParameter("category");
		String description = request.getParameter("description");
		String max = request.getParameter("maxunits");
		
		//Debug Lines
		System.out.println("Updating Product: ID=" + prodId);
        System.out.println("Name: " + name);
        System.out.println("Price: " + price);
        System.out.println("Quantity: " + quantity);
        System.out.println("Max Units: " + max);
        System.out.println("Category: " + category);
        System.out.println("Description: " + description);
        
        boolean isTrue;

        //Calling function
        isTrue = ProductDBUtil.updateProduct(name, price, quantity, category, description, max, prodId);

        
        //if successful
        if (isTrue) {
            System.out.println("Updated Successfully");

            List<Product> prodDetails = ProductDBUtil.viewproduct();

            request.setAttribute("prodDetails", prodDetails);

            RequestDispatcher dis = request.getRequestDispatcher("/backend/manager/manageprod.jsp");
            dis.forward(request, response);
            
        //if unsuccessful
        } else {
            System.out.println("Update failed");
            List<Product> prodDetails = ProductDBUtil.viewproduct();

            request.setAttribute("prodDetails", prodDetails);

            RequestDispatcher dis = request.getRequestDispatcher("/backend/manager/manageprod.jsp");
            dis.forward(request, response);
        }
    }
}
