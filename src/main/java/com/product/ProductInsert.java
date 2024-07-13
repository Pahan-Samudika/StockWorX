
package com.product;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024,  // 1 MB
	    maxFileSize = 1024 * 1024 * 10,  // 10 MB
	    maxRequestSize = 1024 * 1024 * 50  // 50 MB
	)

public class ProductInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Taking Parameters to variables
		String name = request.getParameter("name");
		String prc = request.getParameter("price");
		Double price = Double.parseDouble(prc);
		String quantity = request.getParameter("quantity");
		String category = request.getParameter("category");
		String description = request.getParameter("description");
		String max = request.getParameter("maxunits");
		int maxunits = Integer.parseInt(max);
		
		//to handle image file upload
		Part file = request.getPart("image");  
		String imageFileName = file.getSubmittedFileName();
		
		//Retrieve file path
		String uploadPath = "/images/products/"+imageFileName;
		
		System.out.println("Upload path : "+uploadPath);
		//File storing path
		String filepath = "/Users/pahanabhayawardhane/eclipse-workspace/StockWorX/src/main/webapp/images/products/"+imageFileName;
		
		try {
			FileOutputStream fos = new FileOutputStream(filepath);
			InputStream is = file.getInputStream();
			
			byte[] data=new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		boolean isTrue;

		//Calling function
		isTrue = ProductDBUtil.insertproduct(name, price, quantity, category, description, uploadPath, maxunits);

		
		//If successful
		if(isTrue == true) {
			System.out.println("Inserted Successfully");
			
			List <Product> prodDetails = ProductDBUtil.viewproduct();
			
			request.setAttribute("prodDetails", prodDetails);

			RequestDispatcher dis = request.getRequestDispatcher("/backend/manager/manageprod.jsp");
			dis.forward(request, response);
			
		//If unsuccessful
		} else {
			System.out.println("Insertion failed");
			List <Product> prodDetails = ProductDBUtil.viewproduct();

			request.setAttribute("prodDetails", prodDetails);

			RequestDispatcher dis = request.getRequestDispatcher("/backend/manager/manageprod.jsp");
			dis.forward(request, response);
		}
		
	}

}



