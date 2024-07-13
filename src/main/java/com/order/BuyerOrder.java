package com.order;

public class BuyerOrder extends Order{
	private String paymethod;
	private String deliveryAddress;
	private int newQuantity;
	
	
	public BuyerOrder() {
		super();
	}
	
	public int getNewQuantity() {
		return newQuantity;
	}



	public void setNewQuantity(int newQuantity) {
		this.newQuantity = newQuantity;
	}



	public BuyerOrder(int id, String created_at, String prodId, int prodQty, String status) {
		super(id, prodId, prodQty, created_at, status);
	}

	
	
	public BuyerOrder(String prodId, int prodQty, double prodPrice, int user_id, String created_at,
			String status, String approved_by, String paymethod, String DeliveryAddress) {
		super(prodId, prodQty, prodPrice, user_id, created_at, status, approved_by);
		this.paymethod = paymethod;
		this.deliveryAddress = DeliveryAddress;
	}

	public BuyerOrder(int id, String date, String pname, int qty, Double cost, String username) {
		super(id, date, pname, qty, cost, username);
	}



	public String getPaymethod() {
		return paymethod;
	}

	public String getDeliveryAddress() {
		return deliveryAddress;
	}

	public void setPaymethod(String paymethod) {
		this.paymethod = paymethod;
	}

	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}



	@Override
	public String toString() {
		return "BuyerOrder [paymethod=" + paymethod + ", DeliveryAddress=" + deliveryAddress + ", getProdId()="
				+ getProdId() + ", getProdQty()=" + getProdQty() + ", getProdPrice()=" + getProdPrice()
				+ ", getUser_id()=" + getUser_id() + ", getCreated_at()=" + getCreated_at() + ", getStatus()="
				+ getStatus() + ", getApproved_by()=" + getApproved_by() + ", getId()=" + getId() + ", getPname()="
				+ getPname() + ", getTotal()=" + getTotal() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}



	
	
	
	
}
