package com.feedback;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class FeedbackDelete
 */
@WebServlet("/FeedbackDelete")
public class FeedbackDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
        String uid = (String) session.getAttribute("userid");
		
		String feedbackId = request.getParameter("id");
		
		boolean isTrue;
		
		isTrue = FeedbackDBUtil.deleteFeedback(feedbackId);
		
		if(isTrue==true) {
			// Load existing feedbacks
	        List<Feedback> feedbackDetails = FeedbackDBUtil.viewfeedback(uid);
	        request.setAttribute("feedbackDetails", feedbackDetails);

	        // Forward the request to feedback.jsp
	        RequestDispatcher dis = request.getRequestDispatcher("/backend/buyer/feedback.jsp");
	        dis.forward(request, response);
		}else {
			// Load existing feedbacks
	        List<Feedback> feedbackDetails = FeedbackDBUtil.viewfeedback(uid);
	        request.setAttribute("feedbackDetails", feedbackDetails);

	        // Forward the request to feedback.jsp
	        RequestDispatcher dis = request.getRequestDispatcher("/backend/buyer/feedback.jsp");
	        dis.forward(request, response);
		}
	}

}
