package com.SocialBlaze.service;

import com.SocialBlaze.config.DbConfig;
import com.SocialBlaze.model.DashboardModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.Month;
import java.time.format.TextStyle;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

public class DashboardService {

    public DashboardModel getDashboardData(int userId) {
        DashboardModel model = new DashboardModel();

        try (Connection conn = DbConfig.getDbConnection()) {
            // 1. Total Accounts
            String accQuery = "SELECT COUNT(*) FROM socialmediaaccounts WHERE UserID = ?";
            try (PreparedStatement stmt = conn.prepareStatement(accQuery)) {
                stmt.setInt(1, userId);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) model.setTotalAccounts(rs.getInt(1));
            }

            // 2. Total Post Count
            String postQuery = "SELECT COUNT(*) FROM posts WHERE UserID = ?";
            try (PreparedStatement stmt = conn.prepareStatement(postQuery)) {
                stmt.setInt(1, userId);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) model.setTotalPostCount(rs.getInt(1));
            }

            // 3. Total Follower Count (latest snapshot per account)
            String followerQuery = """
                SELECT SUM(s.FollowerCount) FROM snapshots s
                JOIN (
                    SELECT AccountID, MAX(SnapshotDate) AS LatestDate
                    FROM snapshots
                    GROUP BY AccountID
                ) latest ON s.AccountID = latest.AccountID AND s.SnapshotDate = latest.LatestDate
                JOIN socialmediaaccounts a ON a.AccountID = s.AccountID
                WHERE a.UserID = ?
            """;
            try (PreparedStatement stmt = conn.prepareStatement(followerQuery)) {
                stmt.setInt(1, userId);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) model.setTotalFollowerCount(rs.getInt(1));
            }

            // 4. Monthly Follower Growth (last 6 months)
            String monthGrowthQuery = """
                SELECT MONTH(SnapshotDate) AS month, SUM(FollowerCount) AS followers
                FROM snapshots s
                JOIN socialmediaaccounts a ON s.AccountID = a.AccountID
                WHERE a.UserID = ? AND SnapshotDate >= DATE_SUB(NOW(), INTERVAL 6 MONTH)
                GROUP BY MONTH(SnapshotDate)
            """;
            Map<String, Integer> followerGrowth = new HashMap<>();
            try (PreparedStatement stmt = conn.prepareStatement(monthGrowthQuery)) {
                stmt.setInt(1, userId);
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    String month = Month.of(rs.getInt("month")).getDisplayName(TextStyle.SHORT, Locale.ENGLISH);
                    followerGrowth.put(month, rs.getInt("followers"));
                }
                model.setMonthlyFollowerGrowth(followerGrowth);
            }

            // 5. Engagement (Likes & Comments)
            String engagementQuery = "SELECT SUM(Likes), SUM(Comments) FROM posts WHERE UserID = ?";
            try (PreparedStatement stmt = conn.prepareStatement(engagementQuery)) {
                stmt.setInt(1, userId);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    model.setTotalLikes(rs.getInt(1));
                    model.setTotalComments(rs.getInt(2));
                }
            }

        } catch (Exception e) {
            e.printStackTrace(); // use logging in prod
        }

        return model;
    }
}
