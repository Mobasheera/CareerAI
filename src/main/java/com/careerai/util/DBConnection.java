package com.careerai.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnection {

    // Database connection details for Career AI
    private static final String JDBC_URL = "jdbc:mysql://127.0.0.1:3306/career_ai";
    private static final String DB_USER = "root";            // Change if needed
    private static final String DB_PASSWORD = "Sahil@123#";  // Set "" if you have no password

    // Load the JDBC driver when the class is loaded
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC Driver not found: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Failed to load JDBC driver.", e);
        }
    }

    /**
     * Establishes and returns a database connection.
     * @return A Connection object, or null if connection fails.
     */
    public static Connection getConnection() {
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
            System.out.println("Database connection established successfully.");
        } catch (SQLException e) {
            System.err.println("Error connecting to the database: " + e.getMessage());
            e.printStackTrace();
        }
        return connection;
    }

    /**
     * Closes JDBC resources (Connection, PreparedStatement, ResultSet).
     * @param conn The Connection object to close.
     * @param ps The PreparedStatement object to close.
     * @param rs The ResultSet object to close.
     */
    public static void close(Connection conn, PreparedStatement ps, ResultSet rs) {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
            System.out.println("JDBC resources closed.");
        } catch (SQLException e) {
            System.err.println("Error closing JDBC resources: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
