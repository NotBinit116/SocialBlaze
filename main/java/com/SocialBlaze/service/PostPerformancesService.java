package com.SocialBlaze.service;

import com.SocialBlaze.config.DbConfig;
import com.SocialBlaze.model.PostPerformances;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostPerformancesService {

    public boolean addPost(int userId, String postURL, String date, int likes, int comments, int views, int impressions) {
        String sql = "INSERT INTO posts (UserID, PostURL, Date, Likes, Comments, Views, Impressions) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            stmt.setString(2, postURL);
            stmt.setString(3, date);
            stmt.setInt(4, likes);
            stmt.setInt(5, comments);
            stmt.setInt(6, views);
            stmt.setInt(7, impressions);

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<PostPerformances> getPostsByUserId(int userId) {
        List<PostPerformances> list = new ArrayList<>();
        String sql = "SELECT * FROM posts WHERE UserID = ?";

        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                PostPerformances post = new PostPerformances();
                post.setPostId(rs.getInt("PostID"));
                post.setPostURL(rs.getString("PostURL"));
                post.setDate(rs.getDate("Date").toString());
                post.setLikes(rs.getInt("Likes"));
                post.setComments(rs.getInt("Comments"));
                post.setViews(rs.getInt("Views"));
                post.setImpressions(rs.getInt("Impressions"));
                list.add(post);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }



    public boolean deletePost(int postId, int userId) {
        String sql = "DELETE FROM posts WHERE PostID = ? AND UserID = ?";

        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, postId);
            stmt.setInt(2, userId);

            int rowsDeleted = stmt.executeUpdate();
            return rowsDeleted > 0;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }
}
