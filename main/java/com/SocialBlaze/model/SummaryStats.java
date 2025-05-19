package com.SocialBlaze.model;

public class SummaryStats {
    private double totalRevenue;
    private int totalTransactions;
    private int paidTransactions;
    private int pendingTransactions;

    public double getTotalRevenue() {
        return totalRevenue;
    }

    public void setTotalRevenue(double totalRevenue) {
        this.totalRevenue = totalRevenue;
    }

    public int getTotalTransactions() {
        return totalTransactions;
    }

    public void setTotalTransactions(int totalTransactions) {
        this.totalTransactions = totalTransactions;
    }

    public int getPaidTransactions() {
        return paidTransactions;
    }

    public void setPaidTransactions(int paidTransactions) {
        this.paidTransactions = paidTransactions;
    }

    public int getPendingTransactions() {
        return pendingTransactions;
    }

    public void setPendingTransactions(int pendingTransactions) {
        this.pendingTransactions = pendingTransactions;
    }
}
