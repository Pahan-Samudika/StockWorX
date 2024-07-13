package com.feedback;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class FeedbackServlet
 */

public class FeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Load existing feedbacks when the page is initially accessed (GET request)

        HttpSession session = request.getSession();
        String uid = (String) session.getAttribute("userid");

        // Load existing feedbacks
        List<Feedback> feedbackDetails = FeedbackDBUtil.viewfeedback(uid);
        request.setAttribute("feedbackDetails", feedbackDetails);

        // Forward the request to feedback.jsp
        RequestDispatcher dis = request.getRequestDispatcher("/backend/buyer/feedback.jsp");
        dis.forward(request, response);
    }
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();

		String uid = (String)session.getAttribute("userid");
	
		String feedback = request.getParameter("feedback");

		boolean isTrue;

		isTrue = FeedbackDBUtil.insertfeedback(uid,feedback);

		
		if(isTrue == true) {
			List<Feedback>feedbackDetails = FeedbackDBUtil.viewfeedback(uid);
			request.setAttribute("feedbackDetails", feedbackDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("/backend/buyer/feedback.jsp");
			dis.forward(request, response);
		}else {
			List<Feedback>feedbackDetails = FeedbackDBUtil.viewfeedback(uid);
			request.setAttribute("feedbackDetails", feedbackDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("/backend/buyer/feedback.jsp");
			dis.forward(request, response);
		}


	}



}
