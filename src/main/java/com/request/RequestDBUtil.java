package com.request;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.user.DBConnect;

public class RequestDBUtil {
	
	public static boolean insertReq(int prodId,String note,String requestby) {
		boolean isSuccess = false;
		
		Connection con = null;
        Statement stmt = null;
        
        try {
        	con = DBConnect.getConnection();
        	stmt = con.createStatement();
        	
        	String sql = "INSERT INTO stockrequest VALUES(0, '" + prodId + "', '" + note + "', CURRENT_TIMESTAMP, '" + requestby + "')";
        	
        	int Rs = stmt.executeUpdate(sql);

            if(Rs > 0) {
            	isSuccess = true;
                System.out.println("Successfully Inserted");
            }else {
                isSuccess = false;
                System.out.println("Insertion Failed");
            }
        }catch(Exception e) {
        	e.printStackTrace();
        }
		
		return isSuccess;
	}
	
	public static List<StockReq> viewStockReqList(){
		List<StockReq> StockReqList = new ArrayList<>();
		
		Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        
        try {
        	con = DBConnect.getConnection();
        	stmt = con.createStatement();
        	
        	String sql = "select * from stockrequest ORDER BY created_at DESC";
        	
        	rs = stmt.executeQuery(sql);
        	
        	while (rs.next()) {
				int id = rs.getInt(1);
				int prodId = rs.getInt(2);
				Timestamp timestamp = rs.getTimestamp(4);
				String note = rs.getString(3);
				String req_by = rs.getString(5);
				
				String created_at = new SimpleDateFormat("yyyy-MM-dd").format(timestamp);
				
				StockReq s = new StockReq(id,prodId,created_at,note,req_by);
				
				StockReqList.add(s);
			}
        	
        }catch(Exception e) {
        	e.printStackTrace();
        }
        
        return StockReqList;
		
	}

}
