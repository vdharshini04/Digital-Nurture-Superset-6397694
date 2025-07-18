package com.cognizant.account.controller;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/accounts")
public class AccountController {
    @GetMapping("/{number}")
    public Account getAccount(@PathVariable String number) {
        return new Account(number, "savings", 234343);
    }
}

class Account {
    private String number;
    private String type;
    private int balance;

    // constructor, getters, setters
    public Account(String number, String type, int balance) {
        this.number = number;
        this.type = type;
        this.balance = balance;
    }

    public String getNumber() { return number; }
    public String getType() { return type; }
    public int getBalance() { return balance; }
}
