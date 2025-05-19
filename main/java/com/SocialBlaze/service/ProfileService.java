package com.SocialBlaze.service;

import com.SocialBlaze.model.UserModel;
import com.SocialBlaze.config.DbConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ProfileService {

    public UserModel getUserByUsername(String username) {
        UserModel user = null;
        try (Connection conn = DbConfig.getDbConnection()) {
            String sql = "SELECT * FROM users WHERE username = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                user = new UserModel();
                user.setUserId(rs.getInt("UserID"));
                user.setUsername(rs.getString("username"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("Email"));
                user.setPassword(rs.getString("Password"));
                user.setImageUrl(rs.getString("image"));
                user.setRegistrationDate(rs.getTimestamp("RegistrationDate"));
                user.setLastLoginDate(rs.getTimestamp("LastLoginDate"));
                user.setRoleId(rs.getInt("role_id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean updateUserProfile(UserModel user) {
        try (Connection conn = DbConfig.getDbConnection()) {
            String sql;
            PreparedStatement stmt;

            // Check if a new password was set (optional)
            if (user.getPassword() != null && !user.getPassword().isEmpty()) {
                sql = "UPDATE users SET username = ?, full_name = ?, Email = ?, Password = ?, image = ? WHERE UserID = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(4, user.getPassword());
                stmt.setString(5, user.getImageUrl());
                stmt.setInt(6, user.getUserId());
            } else {
                sql = "UPDATE users SET username = ?, full_name = ?, Email = ?, image = ? WHERE UserID = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(4, user.getImageUrl());
                stmt.setInt(5, user.getUserId());
            }

            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getFullName());
            stmt.setString(3, user.getEmail());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
