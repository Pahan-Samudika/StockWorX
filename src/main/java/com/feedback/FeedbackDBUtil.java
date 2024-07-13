package com.feedback;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.user.DBConnect;

public class FeedbackDBUtil {
	public static List<Feedback> viewfeedback(String uid) {
		
		int convID = Integer.parseInt(uid);

		ArrayList<Feedback> feed = new ArrayList<>();

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from feedback where user_id = '" +convID+ "'ORDER BY created_at DESC";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int fid = rs.getInt(1);
				String feedbacks = rs.getString(2);
				int uids = rs.getInt(3);
				Timestamp timestamp = rs.getTimestamp(4);
				String date = new SimpleDateFormat("yyyy-MM-dd").format(timestamp);

				Feedback f = new Feedback(fid, feedbacks, uids, date);
				feed.add(f);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return feed;
	}
	
	
	public static boolean insertfeedback(String userid,String feedback) {

		int uid = Integer.parseInt(userid);
		boolean isSuccess = false;

        Connection con = null;
        Statement stmt = null;
        
        try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();

			String sql = "INSERT INTO feedback VALUES (0,'"+feedback+"','"+uid+"',CURRENT_TIMESTAMP)";

			int rs = stmt.executeUpdate(sql);

			if(rs > 0) {
				isSuccess = true;
			}else {
				isSuccess = false;
			}
        	
        }catch(Exception e) {
        	e.printStackTrace();
        }
		
        return isSuccess;
	}
	
	public static boolean deleteFeedback(String feedbackId) {
		boolean isSuccess = false;

		Connection con = null;
		Statement stmt = null;

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();

			String sql = "DELETE FROM feedback WHERE id = '"+feedbackId+"'";

			int rs = stmt.executeUpdate(sql);

			if(rs > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
		
	}
	
}
