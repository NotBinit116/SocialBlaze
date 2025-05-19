package com.SocialBlaze.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.SocialBlaze.config.DbConfig;
import com.SocialBlaze.model.UserModel;
import com.SocialBlaze.util.PasswordUtil;

/**
 * Service class for handling user login operations.
 */
public class LoginService {

    private Connection dbConn;
    private boolean isConnectionError = false;

    /**
     * Constructor initializes the database connection. Sets a flag if the connection fails.
     */
    public LoginService() {
        try {
            dbConn = DbConfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            isConnectionError = true;
        }
    }

    /**
     * Validates the user credentials against the database records.
     *
     * @param userModel the UserModel object containing username and password
     * @return UserModel if valid login, null if invalid login or connection error
     */
    public UserModel loginUser(UserModel userModel) {
        if (isConnectionError) {
            System.out.println("Database connection error!");
            return null;
        }

        String query = "SELECT UserID, username, password, full_name, email, image, role_id FROM users WHERE username = ?";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setString(1, userModel.getUsername());
            ResultSet result = stmt.executeQuery();

            if (result.next()) {
                if (validatePassword(result, userModel)) {
                    UserModel authenticatedUser = new UserModel();
                    authenticatedUser.setUserId(result.getInt("UserID"));
                    authenticatedUser.setUsername(result.getString("username"));
                    authenticatedUser.setFullName(result.getString("full_name"));
                    authenticatedUser.setEmail(result.getString("email"));
                    authenticatedUser.setImageUrl(result.getString("image"));
                    authenticatedUser.setRoleId(result.getInt("role_id"));
                    return authenticatedUser;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Validates the password retrieved from the database.
     *
     * @param result    the ResultSet with user data
     * @param userModel the UserModel with input credentials
     * @return true if passwords match, false otherwise
     * @throws SQLException if database access error occurs
     */
    private boolean validatePassword(ResultSet result, UserModel userModel) throws SQLException {
        String dbUsername = result.getString("username");
        String dbPassword = result.getString("password");

        if (!dbUsername.equals(userModel.getUsername())) {
            return false;
        }

        String decryptedPassword = PasswordUtil.decrypt(dbPassword, dbUsername);

        // 🛠️ Debug output
        System.out.println("Decrypted password from DB: " + decryptedPassword);
        System.out.println("User-entered password: " + userModel.getPassword());

        if (decryptedPassword == null) {
            System.out.println("Decryption failed. Trying plain-text password match.");
            return dbPassword.equals(userModel.getPassword());
        } else {
            return decryptedPassword.equals(userModel.getPassword());
        }
    }
}
