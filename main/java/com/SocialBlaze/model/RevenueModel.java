package com.SocialBlaze.model;

import java.util.Date;

public class RevenueModel {
    private int revenueID;
    private double amount;
    private String currency;
    private String paymentStatus;
    private Date transactionDate;
    private String description;
    private int userID;
    private int accountID;
    private int postID;
    private int paymentMethodID;

    // Getters and Setters
    public int getRevenueID() { return revenueID; }
    public void setRevenueID(int revenueID) { this.revenueID = revenueID; }

    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }

    public String getCurrency() { return currency; }
    public void setCurrency(String currency) { this.currency = currency; }

    public String getPaymentStatus() { return paymentStatus; }
    public void setPaymentStatus(String paymentStatus) { this.paymentStatus = paymentStatus; }

    public Date getTransactionDate() { return transactionDate; }
    public void setTransactionDate(Date transactionDate) { this.transactionDate = transactionDate; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public int getUserID() { return userID; }
    public void setUserID(int userID) { this.userID = userID; }

    public int getAccountID() { return accountID; }
    public void setAccountID(int accountID) { this.accountID = accountID; }

    public int getPostID() { return postID; }
    public void setPostID(int postID) { this.postID = postID; }

    public int getPaymentMethodID() { return paymentMethodID; }
    public void setPaymentMethodID(int paymentMethodID) { this.paymentMethodID = paymentMethodID; }
}
