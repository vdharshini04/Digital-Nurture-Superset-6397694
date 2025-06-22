package com.fse.finance;

public class Finance {
	
    // Recursive method
    public static double futureValueRecursive(double principal, double rate, int years) {
        if (years == 0) {
            return principal;
        }
        return futureValueRecursive(principal, rate, years - 1) * (1 + rate);
    }
    // Iterative method
    public static double futureValueIterative(double principal, double rate, int years) {
        double result = principal;
        for (int i = 1; i <= years; i++) {
            result *= (1 + rate);
        }
        return result;
    }
    
    public static void main(String[] args) {
        
        double principal = 10000.0;  // ₹10,000 initial investment
        double rate = 0.10;          // 10% annual growth
        int years = 5;               

        double recursiveResult = futureValueRecursive(principal, rate, years);
        double iterativeResult = futureValueIterative(principal, rate, years);

        System.out.println("Principal = ₹" + principal);
        System.out.println("Rate = 10% per year");
        System.out.println("Years = " + years);
        System.out.printf("Recursive Result: ₹%.2f\n", recursiveResult);
        System.out.printf("Iterative Result: ₹%.2f\n", iterativeResult);
    }
}
