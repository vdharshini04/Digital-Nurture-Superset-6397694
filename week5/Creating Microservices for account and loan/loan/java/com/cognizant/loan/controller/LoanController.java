package com.cognizant.loan.controller;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/loans")
public class LoanController {
    @GetMapping("/{number}")
    public Loan getLoan(@PathVariable String number) {
        return new Loan(number, "car", 400000, 3258, 18);
    }
}

class Loan {
    private String number;
    private String type;
    private int loan;
    private int emi;
    private int tenure;

    // constructor, getters
    public Loan(String number, String type, int loan, int emi, int tenure) {
        this.number = number;
        this.type = type;
        this.loan = loan;
        this.emi = emi;
        this.tenure = tenure;
    }

    public String getNumber() { return number; }
    public String getType() { return type; }
    public int getLoan() { return loan; }
    public int getEmi() { return emi; }
    public int getTenure() { return tenure; }
}
