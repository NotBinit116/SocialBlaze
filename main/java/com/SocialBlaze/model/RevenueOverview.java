package com.SocialBlaze.model;

import java.util.Date;

public class RevenueOverview {
    private String username;
    private String platformName;
    private String accountName;
    private String profileURL;
    private double amount;
    private String paymentStatus;
    private Date transactionDate;

    // Getters and Setters
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPlatformName() { return platformName; }
    public void setPlatformName(String platformName) { this.platformName = platformName; }

    public String getAccountName() { return accountName; }
    public void setAccountName(String accountName) { this.accountName = accountName; }

    public String getProfileURL() { return profileURL; }
    public void setProfileURL(String profileURL) { this.profileURL = profileURL; }

    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }

    public String getPaymentStatus() { return paymentStatus; }
    public void setPaymentStatus(String paymentStatus) { this.paymentStatus = paymentStatus; }

    public Date getTransactionDate() { return transactionDate; }
    public void setTransactionDate(Date transactionDate) { this.transactionDate = transactionDate; }
}
