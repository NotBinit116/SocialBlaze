package com.SocialBlaze.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.SocialBlaze.model.UserModel;
import com.SocialBlaze.config.DbConfig;

public class RegisterService {
    private Connection dbConn;

    public RegisterService() {
        try {
            this.dbConn = DbConfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            System.err.println("Database connection error: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    /**
     * Registers a new user in the database.
     *
     * @param userModel the user details to be registered
     * @return Boolean indicating the success of the operation
     */
    public Boolean registerUser(UserModel userModel) {
        if (dbConn == null) {
            System.err.println("Database connection is not available.");
            return null;
        }

        String insertQuery = "INSERT INTO users (username, password, full_name, email, image, RegistrationDate, LastLoginDate, role_id) "
                           + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement insertStmt = dbConn.prepareStatement(insertQuery)) {
            insertStmt.setString(1, userModel.getUsername());
            insertStmt.setString(2, userModel.getPassword());
            insertStmt.setString(3, userModel.getFullName());
            insertStmt.setString(4, userModel.getEmail());
            insertStmt.setString(5, userModel.getImageUrl());

            // Directly use Timestamp if it's already in the correct type
            insertStmt.setTimestamp(6, userModel.getRegistrationDate());

            if (userModel.getLastLoginDate() != null) {
                insertStmt.setTimestamp(7, userModel.getLastLoginDate());
            } else {
                insertStmt.setNull(7, java.sql.Types.TIMESTAMP);
            }

            insertStmt.setInt(8, userModel.getRoleId());

            return insertStmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error during user registration: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
}
