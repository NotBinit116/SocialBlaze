package com.SocialBlaze.model;

import java.util.List;
import java.util.Map;

public class DashboardModel {
    private int totalAccounts;
    private int totalPostCount;
    private int totalFollowerCount;
    private Map<String, Integer> monthlyFollowerGrowth; // e.g., Jan -> 100, Feb -> 120
    private int totalLikes;
    private int totalComments;

    // Getters and Setters
    public int getTotalAccounts() { return totalAccounts; }
    public void setTotalAccounts(int totalAccounts) { this.totalAccounts = totalAccounts; }

    public int getTotalPostCount() { return totalPostCount; }
    public void setTotalPostCount(int totalPostCount) { this.totalPostCount = totalPostCount; }

    public int getTotalFollowerCount() { return totalFollowerCount; }
    public void setTotalFollowerCount(int totalFollowerCount) { this.totalFollowerCount = totalFollowerCount; }

    public Map<String, Integer> getMonthlyFollowerGrowth() { return monthlyFollowerGrowth; }
    public void setMonthlyFollowerGrowth(Map<String, Integer> monthlyFollowerGrowth) { this.monthlyFollowerGrowth = monthlyFollowerGrowth; }

    public int getTotalLikes() { return totalLikes; }
    public void setTotalLikes(int totalLikes) { this.totalLikes = totalLikes; }

    public int getTotalComments() { return totalComments; }
    public void setTotalComments(int totalComments) { this.totalComments = totalComments; }
}
