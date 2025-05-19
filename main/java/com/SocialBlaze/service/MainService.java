package com.SocialBlaze.service;

import com.SocialBlaze.config.DbConfig;
import com.SocialBlaze.model.SocialAccount;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MainService {

    public List<SocialAccount> getSocialAccountsByUserId(int userId) {
        List<SocialAccount> accounts = new ArrayList<>();

        String sql = "SELECT AccountID, UserID, PlatformID, AccountName, ProfileURL, IsVerified FROM socialmediaaccounts WHERE UserID = ? ORDER BY AccountID DESC";

        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    SocialAccount account = new SocialAccount();
                    account.setAccountId(rs.getInt("AccountID"));
                    account.setUserId(rs.getInt("UserID"));
                    account.setPlatformId(rs.getInt("PlatformID"));
                    account.setAccountName(rs.getString("AccountName"));
                    account.setProfileURL(rs.getString("ProfileURL"));
                    account.setIsVerified(rs.getBoolean("IsVerified"));

                    accounts.add(account);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return accounts;
    }

    public boolean addSocialMediaAccount(int userId, int platformId, String accountName, String profileURL) {
        String sql = "INSERT INTO socialmediaaccounts (UserID, PlatformID, AccountName, ProfileURL, IsVerified) VALUES (?, ?, ?, ?, false)";

        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            stmt.setInt(2, platformId);
            stmt.setString(3, accountName);
            stmt.setString(4, profileURL);

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateSocialMediaAccount(int accountId, int userId, int platformId, String accountName, String profileURL) {
        String sql = "UPDATE socialmediaaccounts SET PlatformID = ?, AccountName = ?, ProfileURL = ? WHERE AccountID = ? AND UserID = ?";

        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, platformId);
            stmt.setString(2, accountName);
            stmt.setString(3, profileURL);
            stmt.setInt(4, accountId);
            stmt.setInt(5, userId);

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteSocialMediaAccount(int accountId, int userId) {
        String sql = "DELETE FROM socialmediaaccounts WHERE AccountID = ? AND UserID = ?";

        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, accountId);
            stmt.setInt(2, userId);

            int rowsDeleted = stmt.executeUpdate();
            return rowsDeleted > 0;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }
}
