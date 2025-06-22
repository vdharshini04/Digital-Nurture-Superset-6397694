package com.fse.ecom;
import java.util.Arrays;

public class Search {

 // Linear Search 
 public static Product linearSearch(Product[] products, int targetId) {
     for (Product product : products) {
         if (product.productId == targetId) {
             return product;
         }
     }
     return null;
 }

 // Binary Search
 public static Product binarySearch(Product[] products, int targetId) {
     int left = 0, right = products.length - 1;
     while (left <= right) {
         int mid = (left + right) / 2;
         if (products[mid].productId == targetId) {
             return products[mid];
         } else if (products[mid].productId < targetId) {
             left = mid + 1;
         } else {
             right = mid - 1;
         }
     }
     return null;
 }

 // sort products
 public static void sortProducts(Product[] products) {
     Arrays.sort(products);
 }
}

