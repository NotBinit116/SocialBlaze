package com.SocialBlaze.service;

import com.SocialBlaze.model.AdminDashboardModel;
import com.SocialBlaze.config.DbConfig;

import java.sql.*;
import java.util.*;

public class AdminDashboardService {

    public AdminDashboardModel getDashboardData() {
        AdminDashboardModel model = new AdminDashboardModel();

        try (Connection conn = DbConfig.getDbConnection()) {

            // Total Users
            PreparedStatement ps1 = conn.prepareStatement("SELECT COUNT(*) FROM users");
            ResultSet rs1 = ps1.executeQuery();
            if (rs1.next()) {
                model.setTotalUsers(rs1.getInt(1));
            }

            // Total Accounts
            PreparedStatement ps2 = conn.prepareStatement("SELECT COUNT(*) FROM socialmediaaccounts");
            ResultSet rs2 = ps2.executeQuery();
            if (rs2.next()) {
                model.setTotalAccounts(rs2.getInt(1));
            }

            // Active Platforms
            PreparedStatement ps3 = conn.prepareStatement("SELECT COUNT(*) FROM platforms WHERE IsActive = 1");
            ResultSet rs3 = ps3.executeQuery();
            if (rs3.next()) {
                model.setActivePlatforms(rs3.getInt(1));
            }

            // Total Revenue
            PreparedStatement ps4 = conn.prepareStatement("SELECT SUM(Amount) FROM revenue WHERE PaymentStatus = 'paid'");
            ResultSet rs4 = ps4.executeQuery();
            if (rs4.next()) {
                model.setTotalRevenue(rs4.getDouble(1));
            }

            // Revenue Chart (last 5 months)
            PreparedStatement ps5 = conn.prepareStatement(
                "SELECT DATE_FORMAT(TransactionDate, '%M') AS Month, SUM(Amount) AS Total " +
                "FROM revenue WHERE PaymentStatus = 'paid' " +
                "GROUP BY MONTH(TransactionDate) ORDER BY MONTH(TransactionDate) DESC LIMIT 5"
            );
            ResultSet rs5 = ps5.executeQuery();
            List<String> months = new ArrayList<>();
            List<Double> totals = new ArrayList<>();
            while (rs5.next()) {
                months.add(rs5.getString("Month"));
                totals.add(rs5.getDouble("Total"));
            }
            Collections.reverse(months);
            Collections.reverse(totals);
            model.setRevenueMonths(months);
            model.setRevenueAmounts(totals);

            // Recent Posts
            PreparedStatement ps6 = conn.prepareStatement(
                "SELECT PostURL, Date, Likes, Comments, Views, Impressions FROM posts ORDER BY Date DESC LIMIT 5"
            );
            ResultSet rs6 = ps6.executeQuery();
            List<Map<String, Object>> recentPosts = new ArrayList<>();
            while (rs6.next()) {
                Map<String, Object> row = new HashMap<>();
                row.put("PostURL", rs6.getString("PostURL"));
                row.put("Date", rs6.getDate("Date"));
                row.put("Likes", rs6.getInt("Likes"));
                row.put("Comments", rs6.getInt("Comments"));
                row.put("Views", rs6.getInt("Views"));
                row.put("Impressions", rs6.getInt("Impressions"));
                recentPosts.add(row);
            }
            model.setRecentPosts(recentPosts);

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return model;
    }
}
