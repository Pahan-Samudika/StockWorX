package com.order;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.product.Product;
import com.user.DBConnect;

public class OrderDBUtil {
	
	public static List<BuyerOrder> viewBuyerOrders(String user_id){
		List <BuyerOrder> orderlist = new ArrayList<>();
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			con = DBConnect.getConnection();
            stmt = con.createStatement();
            
            String sql = "SELECT o.order_id,o.created_at,p.name,o.qty,o.status FROM buyerorder o, product p WHERE o.productID = p.id AND o.userID = '"+user_id+"' ORDER BY o.created_at DESC";
            
            rs = stmt.executeQuery(sql);
            
            while(rs.next()) {
            	int id = rs.getInt(1);
            	Timestamp timestamp = rs.getTimestamp(2);
            	String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(timestamp);
            	String pname = rs.getString(3);
            	int qty = rs.getInt(4);
            	String status = rs.getString(5);
            	System.out.println("Retrieved");
            	
            	BuyerOrder o = new BuyerOrder(id,date,pname,qty,status);
            	
            	orderlist.add(o);
            }
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return orderlist;
		
	}
	
	
	public static List<BuyerOrder> viewBuyerOrderList(String status){
		List <BuyerOrder> BuyerOrderlist = new ArrayList<>();
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			con = DBConnect.getConnection();
            stmt = con.createStatement();
            
            String sql = "SELECT o.order_id,o.created_at,p.name,o.qty,o.cost,u.username FROM buyerorder o, product p, user u WHERE o.productID = p.id AND u.id = o.userID AND status = '"+status+"' ORDER BY o.created_at DESC";
            
            rs = stmt.executeQuery(sql);
            
            while(rs.next()) {
            	int id = rs.getInt(1);
            	Timestamp timestamp = rs.getTimestamp(2);
            	String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(timestamp);
            	String pname = rs.getString(3);
            	int qty = rs.getInt(4);
            	Double cost = rs.getDouble(5);
            	String username = rs.getString(6);
            	System.out.println("Retrieved");
            	
            	BuyerOrder o = new BuyerOrder(id,date,pname,qty,cost,username);
            	
            	BuyerOrderlist.add(o);
            }
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return BuyerOrderlist;
		
	}
	
	
	
	public static List<Product> getProductName(String productID) {
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		List <Product> product = new ArrayList<>();
        
        try {
        	con = DBConnect.getConnection();
            stmt = con.createStatement();
            
        	String sql = "SELECT name FROM product WHERE id = '"+productID+"'";
            
            rs = stmt.executeQuery(sql);
            
            if(rs.next()) {
				String name = rs.getString(1);
				
				Product p = new Product();
				p.setName(name);
				
				product.add(p);
			}
        	
        }catch(Exception e) {
        	e.printStackTrace();
        }
        return product;
	}
	
	public static boolean insertbuyerorder(String productID,String productname,int qty,double cost,String userID,String address,String paymethod) {
		boolean isSuccess = false;
		
		Connection con = null;
        Statement stmt = null;
        
        try {
        	con = DBConnect.getConnection();
            stmt = con.createStatement();
            
        	String sql = "INSERT INTO buyerorder VALUES(0,'"+productID+"','"+productname+"','"+qty+"','"+cost+"','"+userID+"','"+address+"',CURRENT_TIMESTAMP,'"+paymethod+"','Pending',null)";
            
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
	
	public static boolean UpdateBuyerOrderStatus(String orderid,String status, String uid) {
		boolean isSuccess = false;
		
		Connection con = null;
        Statement stmt = null;
        
        
        try {
        	con = DBConnect.getConnection();
            stmt = con.createStatement();
            
        	String sql = "UPDATE buyerorder SET status = '"+status+"' , approved_by='"+uid+"' WHERE order_id = '"+orderid+"'";
            
            int Rs = stmt.executeUpdate(sql);

            if(Rs > 0) {
            	isSuccess = true;
                System.out.println("Modified Inserted");
            }else {
                isSuccess = false;
                System.out.println("Modification Failed");
            }
        }catch(Exception e) {
        	e.printStackTrace();
        }
        
        
        
		return isSuccess;
	}


	public static boolean insertStockOrder(int productID, int qty) {
		
		boolean isSuccess = false;
		
		Connection con = null;
        Statement stmt = null;
        
        try {
        	con = DBConnect.getConnection();
            stmt = con.createStatement();
            
        	String sql = "INSERT INTO stockorder VALUES(0,'"+productID+"','"+qty+"',CURRENT_TIMESTAMP,'Pending',null)";
            
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


	public static List<StockOrder> viewStockOrderList(String status) {
		List <StockOrder> StockOrderlist = new ArrayList<>();
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			con = DBConnect.getConnection();
            stmt = con.createStatement();
            
            String sql = "SELECT s.id, p.name, s.quantity, s.created_at FROM stockorder s, product p WHERE s.productId = p.id AND s.status = '"+status+"' ORDER BY s.created_at DESC";
            
            rs = stmt.executeQuery(sql);
            
            while(rs.next()) {
            	int id = rs.getInt(1);
            	String pname = rs.getString(2);
            	int qty = rs.getInt(3);
            	Timestamp timestamp = rs.getTimestamp(4);
            	String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(timestamp);
            	System.out.println("Retrieved");
            	
            	StockOrder s = new StockOrder(id,pname,qty,date);
            	
            	StockOrderlist.add(s);
            }
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return StockOrderlist;
		
	}
	
	public static List<StockOrder> viewStockOrders() {
		List <StockOrder> StockOrderlist = new ArrayList<>();
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			con = DBConnect.getConnection();
            stmt = con.createStatement();
            
            String sql = "SELECT s.id, p.name, s.quantity, s.created_at,s.status FROM stockorder s, product p WHERE s.productId = p.id ORDER BY s.created_at DESC";
            
            rs = stmt.executeQuery(sql);
            
            while(rs.next()) {
            	int id = rs.getInt(1);
            	String pname = rs.getString(2);
            	int qty = rs.getInt(3);
            	Timestamp timestamp = rs.getTimestamp(4);
            	String status = rs.getString(5);
            	String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(timestamp);
            	System.out.println("Retrieved");
            	
            	StockOrder s = new StockOrder(id,pname,qty,date,status);
            	
            	StockOrderlist.add(s);
            }
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return StockOrderlist;
		
	}
	
	public static boolean UpdateStockOrderStatus(String orderid,String status, String uid) {
		boolean isSuccess = false;
		
		Connection con = null;
        Statement stmt = null;
        
        
        try {
        	con = DBConnect.getConnection();
            stmt = con.createStatement();
            
        	String sql = "UPDATE stockorder SET status = '"+status+"' , approved_by='"+uid+"' WHERE id = '"+orderid+"'";
            
            int Rs = stmt.executeUpdate(sql);

            if(Rs > 0) {
            	isSuccess = true;
                System.out.println("Modified Inserted");
            }else {
                isSuccess = false;
                System.out.println("Modification Failed");
            }
        }catch(Exception e) {
        	e.printStackTrace();
        }
        
        
        
		return isSuccess;
	}


	public static boolean deleteStockOrder(String orderID) {
		
		boolean isSuccess = false;
    	
    	Connection con = null;
		Statement stmt = null;
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();

			String sql = "DELETE FROM stockorder WHERE id = '"+orderID+"'";
			
			int rs = stmt.executeUpdate(sql);

			if(rs > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
    }


	

	public static List<StockOrder> ReadyStockOrderList(String status) {
		List <StockOrder> StockOrderlist = new ArrayList<>();
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			con = DBConnect.getConnection();
            stmt = con.createStatement();
            
            String sql = "SELECT s.id, p.name, s.quantity, s.created_at,s.productId,p.quantity FROM stockorder s, product p WHERE s.productId = p.id AND s.status = '"+status+"' ORDER BY s.created_at DESC";
            
            rs = stmt.executeQuery(sql);
            
            while(rs.next()) {
            	int id = rs.getInt(1);
            	String pname = rs.getString(2);
            	int qty = rs.getInt(3);
            	Timestamp timestamp = rs.getTimestamp(4);
            	String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(timestamp);
            	int pId = rs.getInt(5);
            	String aQty = rs.getString(6);
            	int AvailableQty = Integer.parseInt(aQty);
            	
            	int newQuantity = AvailableQty + qty;
            			
            	String prodId = String.valueOf(pId);
            	System.out.println("Retrieved");
            	
            	StockOrder s = new StockOrder();
            	
            	s.setId(id);
            	s.setPname(pname);
            	s.setProdQty(qty);
            	s.setCreated_at(date);
            	s.setProdId(prodId);
            	s.setNewQuantity(newQuantity);
            	
            	StockOrderlist.add(s);
            }
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return StockOrderlist;
		
	}
	
	
	
	public static List<BuyerOrder> ReadyBuyerOrderList(String status){
		List <BuyerOrder> BuyerOrderlist = new ArrayList<>();
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			con = DBConnect.getConnection();
            stmt = con.createStatement();
            
            String sql = "SELECT o.order_id,o.created_at,p.name,o.qty,o.cost,u.username,o.address,o.productId,p.quantity FROM buyerorder o, product p, user u WHERE o.productID = p.id AND u.id = o.userID AND status = '"+status+"' ORDER BY o.created_at DESC";
            
            rs = stmt.executeQuery(sql);
            
            while(rs.next()) {
            	int id = rs.getInt(1);
            	Timestamp timestamp = rs.getTimestamp(2);
            	String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(timestamp);
            	String pname = rs.getString(3);
            	int qty = rs.getInt(4);
            	Double cost = rs.getDouble(5);
            	String username = rs.getString(6);
            	String address = rs.getString(7);
            	String prodId = rs.getString(8);
            	String aQty = rs.getString(9);
            	int AvailableQty = Integer.parseInt(aQty);
            	System.out.println("Retrieved");
            	
            	int newQuantity = AvailableQty - qty;
            	
            	BuyerOrder b = new BuyerOrder();
            	
            	b.setId(id);
            	b.setPname(pname);
            	b.setProdQty(qty);
            	b.setTotal(cost);
            	b.setUsername(username);
            	b.setDeliveryAddress(address);
            	b.setCreated_at(date);
            	b.setProdId(prodId);
            	b.setNewQuantity(newQuantity);
            	
            	BuyerOrderlist.add(b);
            }
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return BuyerOrderlist;
		
	}
	
	
	public static boolean updateStockPlus(String orderID, String prodId, int plusQty) {
	    boolean isSuccess = false;
	    
	    Connection con = null;
	    Statement stmt = null;
	    
	    try {
	        con = DBConnect.getConnection();
	        stmt = con.createStatement();

	        String sql1 = "UPDATE product SET quantity = '"+plusQty+"' WHERE id = '" +prodId+ "'";
	        int rs1 = stmt.executeUpdate(sql1);
	        
	        String sql2 = "UPDATE stockorder SET status = 'Recieved' WHERE id = '" +orderID+ "'";
	        int rs2 = stmt.executeUpdate(sql2);

			if(rs1 > 0 && rs2 > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}


	public static boolean updateStockMinus(String orderID, String prodId, int minusQty) {
		boolean isSuccess = false;
	    
	    Connection con = null;
	    Statement stmt = null;
	    
	    try {
	        con = DBConnect.getConnection();
	        stmt = con.createStatement();

	        String sql1 = "UPDATE product SET quantity = '"+minusQty+"' WHERE id = '" +prodId+ "'";
	        int rs1 = stmt.executeUpdate(sql1);
	        
	        String sql2 = "UPDATE buyerorder SET status = 'In Delivery' WHERE order_id = '" +orderID+ "'";
	        int rs2 = stmt.executeUpdate(sql2);

			if(rs1 > 0 && rs2 > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	
	
	
}
