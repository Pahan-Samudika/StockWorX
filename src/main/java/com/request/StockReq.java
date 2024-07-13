package com.request;

public class StockReq {
	private int id;
	private int prodId;
	private String created_at;
	private String note;
	private String requested_by;
	
	
	public StockReq(int id, int prodId, String created_at, String note, String requested_by) {
		super();
		this.id = id;
		this.prodId = prodId;
		this.created_at = created_at;
		this.note = note;
		this.requested_by = requested_by;
	}


	public int getId() {
		return id;
	}


	public int getProdId() {
		return prodId;
	}


	public String getCreated_at() {
		return created_at;
	}

	public String getNote() {
		return note;
	}


	public String getRequested_by() {
		return requested_by;
	}
	
	
}
