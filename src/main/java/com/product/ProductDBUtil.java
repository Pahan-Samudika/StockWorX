package com.product;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.user.DBConnect;

public class ProductDBUtil {
	//to insert products
	public static boolean insertproduct(String name, Double price,String quantity, String category, String description, String savePath, int maxunits) {

        boolean isSuccess = false;

        Connection con = null;
        Statement stmt = null;

        try{
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            String sql = "INSERT INTO product VALUES(0,'"+name+"','"+price+"','"+quantity+"','"+category+"','"+description+"','"+savePath+"','"+maxunits+"')";

            int Rs = stmt.executeUpdate(sql);

            if(Rs > 0) {
            	isSuccess = true;
                System.out.println("Successfully Inserted");
            }else {
                isSuccess = false;
                System.out.println("Insertion Failed");
            }
        }catch(Exception e){
            e.printStackTrace();
        }

        return isSuccess;
    }

	
	//to view products
    public static List<Product> viewproduct(){

        List<Product> prod = new ArrayList<>();

        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

        try{
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            String sql = "SELECT * FROM product";

            rs = stmt.executeQuery(sql);

            while(rs.next()){
            	int id = rs.getInt(1);
            	String name = rs.getString(2);
            	String price = rs.getString(3);
            	int quantity = rs.getInt(4);
            	String category = rs.getString(5);
            	String description = rs.getString(6);
            	String savePath = rs.getString(7);
            	int max = rs.getInt(8);

            	Product p = new Product(id, name, price, quantity, category, description, savePath,max);
                prod.add(p);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return prod;
    }
    
    
    public static List<Product> viewproduct(String pid){

        List<Product> prod = new ArrayList<>();

        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

        try{
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            String sql = "SELECT * FROM product WHERE id='"+pid+"'";

            rs = stmt.executeQuery(sql);

            while(rs.next()){
            	int id = rs.getInt(1);
            	String name = rs.getString(2);
            	String price = rs.getString(3);
            	int quantity = rs.getInt(4);
            	String category = rs.getString(5);
            	String description = rs.getString(6);
            	String savePath = rs.getString(7);
            	int max = rs.getInt(8);

            	Product p = new Product(id, name, price, quantity, category, description, savePath, max);
                prod.add(p);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return prod;
    }


    public static boolean deleteProduct(String productID) {
    	
    	boolean isSuccess = false;
    	
    	Connection con = null;
		Statement stmt = null;
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();

			String sql = "DELETE FROM product WHERE id = '"+productID+"'";
			
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


	public static boolean updateProduct(String name, String price, String quantity, String category, String description,
			String maxunits, String prodId) {
		
		Double price1 = Double.parseDouble(price);
		int max1 = Integer.parseInt(maxunits);
		
		boolean isSuccess = false;

        Connection con = null;
        Statement stmt = null;

        try{
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            String sql = "UPDATE product SET name = '" + name + "', price = '" + price1 + "', quantity = '" + quantity + "', category = '" + category + "', description = '" + description + "', maxunits = '" + max1 + "' WHERE id = '"+prodId+"'";

            int Rs = stmt.executeUpdate(sql);

            if(Rs > 0) {
            	isSuccess = true;
            }else {
                isSuccess = false;
            }
        }catch(Exception e){
            e.printStackTrace();
        }

        return isSuccess;
	}
}
