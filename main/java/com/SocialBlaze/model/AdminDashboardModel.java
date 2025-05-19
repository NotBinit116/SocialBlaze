package com.SocialBlaze.model;

import java.util.List;
import java.util.Map;

public class AdminDashboardModel {
    private int totalUsers;
    private int totalAccounts;
    private int activePlatforms;
    private double totalRevenue;
    private List<String> revenueMonths;
    private List<Double> revenueAmounts;
    private List<Map<String, Object>> recentPosts;

    public int getTotalUsers() {
        return totalUsers;
    }

    public void setTotalUsers(int totalUsers) {
        this.totalUsers = totalUsers;
    }

    public int getTotalAccounts() {
        return totalAccounts;
    }

    public void setTotalAccounts(int totalAccounts) {
        this.totalAccounts = totalAccounts;
    }

    public int getActivePlatforms() {
        return activePlatforms;
    }

    public void setActivePlatforms(int activePlatforms) {
        this.activePlatforms = activePlatforms;
    }

    public double getTotalRevenue() {
        return totalRevenue;
    }

    public void setTotalRevenue(double totalRevenue) {
        this.totalRevenue = totalRevenue;
    }

    public List<String> getRevenueMonths() {
        return revenueMonths;
    }

    public void setRevenueMonths(List<String> revenueMonths) {
        this.revenueMonths = revenueMonths;
    }

    public List<Double> getRevenueAmounts() {
        return revenueAmounts;
    }

    public void setRevenueAmounts(List<Double> revenueAmounts) {
        this.revenueAmounts = revenueAmounts;
    }

    public List<Map<String, Object>> getRecentPosts() {
        return recentPosts;
    }

    public void setRecentPosts(List<Map<String, Object>> recentPosts) {
        this.recentPosts = recentPosts;
    }
}
