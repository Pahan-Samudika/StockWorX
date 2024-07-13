package com.order;

public class Order {
	private int id;
	private String prodId;
	private String pname;
	private int prodQty;
	private double prodPrice;
	private double total;
	private int user_id;
	private String username;
	private String created_at;
	private String status;
	private String approved_by;

	public Order() {
		
	}
	
	public Order(String prodId,String pname, int prodQty, double prodPrice, double total) {
		this.prodId = prodId;
		this.pname = pname;
		this.prodQty = prodQty;
		this.prodPrice = prodPrice;
		this.total = total;
	}

	public Order(String prodId, int prodQty, double prodPrice, int user_id, String created_at, String status, String approved_by) {
		this.prodId = prodId;
		this.prodQty = prodQty;
		this.prodPrice = prodPrice;
		this.user_id = user_id;
		this.created_at = created_at;
		this.status = status;
		this.approved_by = approved_by;
	}

	public Order(int id, String prodId, int prodQty, String created_at, String status) {
		this.id = id;
		this.prodId = prodId;
		this.prodQty = prodQty;
		this.created_at = created_at;
		this.status = status;
	}
	
	public Order(int id, String prodId, int prodQty, String created_at) {
		this.id = id;
		this.prodId = prodId;
		this.prodQty = prodQty;
		this.created_at = created_at;
	}

	public Order(int id, String date, String pname, int qty, Double cost, String username) {
		this.id = id;
		this.created_at = date;
		this.pname = pname;
		this.prodQty = qty;
		this.total = cost;
		this.username = username;
	}

	public Order(int id, String prodId, String pname, int qty, String date, String status) {
		this.id = id;
		this.prodId = prodId;
		this.pname = pname;
		this.prodQty = qty;
		this.created_at = date;
		this.status = status;
	}

	public String getProdId() {
		return prodId;
	}

	public int getProdQty() {
		return prodQty;
	}

	public double getProdPrice() {
		return prodPrice;
	}

	public int getUser_id() {
		return user_id;
	}

	public String getCreated_at() {
		return created_at;
	}

	public String getStatus() {
		return status;
	}

	public String getApproved_by() {
		return approved_by;
	}
	
	public void setId(int id) {
		this.id = id;
	}

	public void setProdId(String prodId) {
		this.prodId = prodId;
	}

	public void setProdQty(int prodQty) {
		this.prodQty = prodQty;
	}

	public void setProdPrice(double prodPrice) {
		this.prodPrice = prodPrice;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setApproved_by(String approved_by) {
		this.approved_by = approved_by;
	}

	public int getId() {
		return id;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}

}
