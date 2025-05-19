package com.SocialBlaze.service;

import com.SocialBlaze.config.DbConfig;
import com.SocialBlaze.model.RevenueModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RevenueService {

    public List<RevenueModel> getAllRevenueForUser(int userId) {
        List<RevenueModel> revenueList = new ArrayList<>();

        String query = "SELECT * FROM revenue WHERE UserID = ?";

        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                RevenueModel revenue = new RevenueModel();
                revenue.setRevenueID(rs.getInt("RevenueID"));
                revenue.setAmount(rs.getDouble("Amount"));
                revenue.setCurrency(rs.getString("Currency"));
                revenue.setPaymentStatus(rs.getString("PaymentStatus"));
                revenue.setTransactionDate(rs.getTimestamp("TransactionDate"));
                revenue.setDescription(rs.getString("Description"));
                revenue.setUserID(rs.getInt("UserID"));
                revenue.setAccountID(rs.getInt("AccountID"));
                revenue.setPostID(rs.getInt("PostID"));
                revenue.setPaymentMethodID(rs.getInt("PaymentMethodID"));

                revenueList.add(revenue);
            }

        } catch (Exception e) {
            e.printStackTrace(); // use logging in production
        }

        return revenueList;
    }
}
