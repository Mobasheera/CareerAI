package com.careerai.dao;

import com.careerai.model.User;
import com.careerai.util.DBConnection;

import java.sql.*;

public class UserDao {

    public boolean registerUser(User user) {
        String sql = "INSERT INTO users (full_name, email, password_hash) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getFullName());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword()); // Password should be hashed in real apps
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public User authenticateUser(String email, String password) {
        String sql = "SELECT * FROM users WHERE email = ? AND password_hash = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password_hash"));
                user.setCreatedAt(rs.getTimestamp("created_at"));
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // ✅ Updates the full name of a user based on email
    public void updateUsername(String email, String username) {
        String sql = "UPDATE users SET full_name = ? WHERE email = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);
            stmt.setString(2, email);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ✅ Fetches user by email
    public User getUserByEmail(String email) {
        String sql = "SELECT * FROM users WHERE email = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password_hash"));
                user.setCreatedAt(rs.getTimestamp("created_at"));
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // ✅ Change password method implemented correctly
    public boolean changePassword(String email, String currentPassword, String newPassword) {
        String checkSql = "SELECT * FROM users WHERE email = ? AND password_hash = ?";
        String updateSql = "UPDATE users SET password_hash = ? WHERE email = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement checkStmt = conn.prepareStatement(checkSql)) {

            checkStmt.setString(1, email);
            checkStmt.setString(2, currentPassword);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                try (PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {
                    updateStmt.setString(1, newPassword); // Should hash in real apps
                    updateStmt.setString(2, email);
                    return updateStmt.executeUpdate() > 0;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
