package com.SocialBlaze.service;

import com.SocialBlaze.config.DbConfig;
import com.SocialBlaze.model.ManageUsers;
import com.SocialBlaze.model.RevenueOverview;
import com.SocialBlaze.model.SummaryStats;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminService {

    public List<ManageUsers> getAllUsers() {
        List<ManageUsers> users = new ArrayList<>();

        String query = "SELECT u.UserID, u.full_name, u.Email, u.RegistrationDate, r.role_name, " +
                       "(SELECT COUNT(*) FROM socialmediaaccounts s WHERE s.UserID = u.UserID) AS accountCount " +
                       "FROM users u " +
                       "JOIN role r ON u.role_id = r.role_id";

        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                ManageUsers user = new ManageUsers();
                user.setUserID(rs.getInt("UserID"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("Email"));
                user.setRegistrationDate(rs.getDate("RegistrationDate").toString());
                user.setRole(rs.getString("role_name"));
                user.setAccountCount(rs.getInt("accountCount"));
                users.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return users;
    }

    public void deleteUser(int userID) {
        String deleteAccounts = "DELETE FROM socialmediaaccounts WHERE UserID = ?";
        String deleteUser = "DELETE FROM users WHERE UserID = ?";

        try (Connection conn = DbConfig.getDbConnection()) {
            conn.setAutoCommit(false);

            try (PreparedStatement stmt1 = conn.prepareStatement(deleteAccounts);
                 PreparedStatement stmt2 = conn.prepareStatement(deleteUser)) {

                stmt1.setInt(1, userID);
                stmt1.executeUpdate();

                stmt2.setInt(1, userID);
                stmt2.executeUpdate();

                conn.commit();
            } catch (SQLException e) {
                conn.rollback();
                e.printStackTrace();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<ManageUsers> searchUsers(String query) {
        List<ManageUsers> users = new ArrayList<>();

        String sql = "SELECT u.UserID, u.full_name, u.Email, u.RegistrationDate, r.role_name, " +
                     "(SELECT COUNT(*) FROM socialmediaaccounts s WHERE s.UserID = u.UserID) AS accountCount " +
                     "FROM users u JOIN role r ON u.role_id = r.role_id " +
                     "WHERE u.full_name LIKE ? OR u.Email LIKE ?";

        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            String searchPattern = "%" + query + "%";
            stmt.setString(1, searchPattern);
            stmt.setString(2, searchPattern);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ManageUsers user = new ManageUsers();
                user.setUserID(rs.getInt("UserID"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("Email"));
                user.setRegistrationDate(rs.getDate("RegistrationDate").toString());
                user.setRole(rs.getString("role_name"));
                user.setAccountCount(rs.getInt("accountCount"));
                users.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return users;
    }

    // ------------------------ New Revenue Overview Features ------------------------

}

