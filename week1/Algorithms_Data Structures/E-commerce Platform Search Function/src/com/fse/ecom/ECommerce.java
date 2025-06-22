package com.fse.ecom;

/*
 * ecommerce exercise
 */
public class ECommerce {
	
 public static void main(String[] args) {
     Product[] products = {
         new Product(104, "Pen", "Education"),
         new Product(101, "Shirt", "Clothing"),
         new Product(108, "Book", "Education"),
         new Product(102, "Phone", "Electronics"),
         new Product(106, "Dress", "Clothing"),
         new Product(112, "TV", "Electronics")
     };

     int searchId = 106;

     // LINEAR SEARCH 
     Product result1 = Search.linearSearch(products, searchId);
     System.out.println("Linear Search Result:");
     if (result1 != null) {
         System.out.println(result1);
     } else {
         System.out.println("Product not found.");
     }

     // BINARY SEARCH 
     Search.sortProducts(products);
     Product result2 = Search.binarySearch(products, searchId);
     System.out.println("\nBinary Search Result:");
     if (result2 != null) {
         System.out.println(result2);
     } else {
         System.out.println("Product not found.");
     }
 }
}

