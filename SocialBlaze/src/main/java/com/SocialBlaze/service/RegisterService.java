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

        // Adjusted SQL query with the correct column names
        String insertQuery = "INSERT INTO users (username, password, full_name, email, image, RegistrationDate, LastLoginDate, role_id) "
                           + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement insertStmt = dbConn.prepareStatement(insertQuery)) {
            insertStmt.setString(1, userModel.getUsername());
            insertStmt.setString(2, userModel.getPassword());
            insertStmt.setString(3, userModel.getFullName());
            insertStmt.setString(4, userModel.getEmail());
            insertStmt.setString(5, userModel.getImageUrl());

            // Set registration_date (Ensure userModel.getRegistrationDate() returns a valid timestamp string)
            insertStmt.setTimestamp(6, Timestamp.valueOf(userModel.getRegistrationDate())); // Assumes registrationDate is in String format like "YYYY-MM-DD HH:MM:SS"

            // Set LastLoginDate (can be null if the user hasn't logged in yet)
            if (userModel.getLastLoginDate() != null) {
                insertStmt.setTimestamp(7, Timestamp.valueOf(userModel.getLastLoginDate()));
            } else {
                insertStmt.setNull(7, java.sql.Types.TIMESTAMP); // Insert NULL if no login date
            }

            insertStmt.setInt(8, userModel.getRoleId()); // Default: 2

            return insertStmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error during user registration: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
}
