package com.order;

public class StockOrder extends Order{
	
	String recieved_at;
	int newQuantity;
	
	public StockOrder() {
		super();
	}
	
	public StockOrder(int id, String prodId, int prodQty, String created_at) {
		super(id, prodId, prodQty, created_at);
	}

	public StockOrder(int id, String pname, int qty, String date, String status) {
		super(id, pname, qty, date, status);
	}

	public StockOrder(int id,String prodId, String pname, int qty, String date ) {
		super(id, pname, qty, date, prodId);
	}

	public String getRecieved_at() {
		return recieved_at;
	}

	public int getNewQuantity() {
		return newQuantity;
	}

	public void setNewQuantity(int newQuantity) {
		this.newQuantity = newQuantity;
	}
	
	
}
