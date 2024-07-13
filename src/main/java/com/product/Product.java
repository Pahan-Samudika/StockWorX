package com.product;

public class Product {
    private int id;
    private String name;
    private String price;
    private int quantity;
    private String category;
    private String description;
    private String image;
    private int maxunits;
    
    public Product() {
    	
    }

    public Product(int id, String name, String price, int quantity, String category, String description, String image,int maxunits) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.category = category;
        this.description = description;
        this.image = image;
        this.maxunits = maxunits;
    }

    public Product(int id, String name, String price) {
        this.id = id;
        this.name = name;
        this.price = price;
    }
    
    

	public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }

    public String getCategory() {
        return category;
    }

    public String getDescription() {
        return description;
    }

    public String getImage() {
        return image;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name){
        this.name = name;
    }

    public void setPrice(String price){
        this.price = price;
    }

    public void setQuantity(int newQuantity){
        this.quantity = newQuantity;
    }

    public void setCategory(String category){
        this.category = category;
    }

    public void setDescription(String description){
        this.description = description;
    }

    public void setImage(String image){
        this.image = image;
    }

	public int getMaxunits() {
		return maxunits;
	}
}
