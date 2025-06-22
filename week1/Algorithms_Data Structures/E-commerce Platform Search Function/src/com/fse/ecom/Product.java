package com.fse.ecom;

public class Product implements Comparable<Product> {
	int productId;
	String productName;
	String category;
	
	Product(int productId, String productName, String category) {
		this.productId = productId;
		this.productName = productName;
		this.category = category;
	}
	
	public String toString() {
		return productId + " - " + productName + " - " + category ;
	}
	@Override
	public int compareTo(Product other) {
        return Integer.compare(this.productId, other.productId); // for binary search
    }
}
