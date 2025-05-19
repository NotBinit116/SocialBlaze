package com.SocialBlaze.model;

import java.sql.Timestamp;
import java.time.LocalDateTime;


public class UserModel {
    private int userId;
    private String username;
    private String fullName;
    private String email;
    private String password;
    private String imageUrl; // Renamed from imagePath for clarity
    private Timestamp registrationDate;
    private Timestamp lastLoginDate;

    private int roleId;

    // Default constructor
    public UserModel() {}

    // Constructor for registration (basic fields)
    public UserModel(String username, String fullName, String email, String password, String imageUrl) {
        this.username = username;
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.imageUrl = imageUrl;
        this.roleId = 2; // Default user role (assuming 2 = standard user)
        this.registrationDate = new Timestamp(System.currentTimeMillis());

             
        
   
    }

    // Full constructor
    public UserModel(int userId, String username, String fullName, String email, String password,
                     String imageUrl, Timestamp registrationDate, Timestamp lastLoginDate, int roleId) {
        this.userId = userId;
        this.username = username;
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.imageUrl = imageUrl;
        this.registrationDate = registrationDate;
        this.lastLoginDate = lastLoginDate;
        this.roleId = roleId;
    }

    // Getters and Setters
    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }

    public String getFullName() {
        return fullName;
    }
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    public String getImageUrl() {
        return imageUrl;
    }
    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public Timestamp getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(Timestamp registrationDate) {
        this.registrationDate = registrationDate;
    }

    public Timestamp getLastLoginDate() {
        return lastLoginDate;
    }

    public void setLastLoginDate(Timestamp lastLoginDate) {
        this.lastLoginDate = lastLoginDate;
    }

    public int getRoleId() {
        return roleId;
    }
    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }
}
