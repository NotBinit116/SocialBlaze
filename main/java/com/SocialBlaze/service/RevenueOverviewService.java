package com.SocialBlaze.service;

import com.SocialBlaze.config.DbConfig;
import com.SocialBlaze.model.RevenueOverview;
import java.sql.*;
import java.util.*;

public class RevenueOverviewService {

    public List<RevenueOverview> getAllRevenueData() {
        List<RevenueOverview> revenueList = new ArrayList<>();

        try (Connection conn = DbConfig.getDbConnection()) {
            String query = """
                SELECT u.username, p.PlatformName, a.AccountName, a.ProfileURL,
                       r.Amount, r.PaymentStatus, r.TransactionDate
                FROM revenue r
                JOIN users u ON r.UserID = u.UserID
                JOIN socialmediaaccounts a ON r.AccountID = a.AccountID
                JOIN platforms p ON a.PlatformID = p.PlatformID
            """;

            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                RevenueOverview rev = new RevenueOverview();
                rev.setUsername(rs.getString("username"));
                rev.setPlatformName(rs.getString("PlatformName"));
                rev.setAccountName(rs.getString("AccountName"));
                rev.setProfileURL(rs.getString("ProfileURL"));
                rev.setAmount(rs.getDouble("Amount"));
                rev.setPaymentStatus(rs.getString("PaymentStatus"));
                rev.setTransactionDate(rs.getTimestamp("TransactionDate"));

                revenueList.add(rev);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return revenueList;
    }

    public double getTotalRevenue() {
        try (Connection conn = DbConfig.getDbConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT SUM(Amount) FROM revenue WHERE PaymentStatus = 'paid'")) {

            if (rs.next()) {
                return rs.getDouble(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    public int getTotalTransactions() {
        return getCount("SELECT COUNT(*) FROM revenue");
    }

    public int getPaidTransactions() {
        return getCount("SELECT COUNT(*) FROM revenue WHERE PaymentStatus = 'paid'");
    }

    public int getPendingTransactions() {
        return getCount("SELECT COUNT(*) FROM revenue WHERE PaymentStatus = 'pending'");
    }

    private int getCount(String query) {
        try (Connection conn = DbConfig.getDbConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
}
