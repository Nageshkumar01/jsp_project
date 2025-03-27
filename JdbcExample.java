//package org.nagesh.servlet;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//
//public class JdbcExample {
//
//    // JDBC URL, Username, and Password of MySQL
//    private static final String URL = "jdbc:mysql://localhost:3306/testdb";
//    private static final String USER = "root";  // Replace with your username
//    private static final String PASS = "12345";  // Replace with your password
//
//    public static void main(String[] args) {
//        // 1. Load MySQL JDBC Driver
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//        } catch (ClassNotFoundException e) {
//            System.out.println("MySQL Driver not found!");
//            e.printStackTrace();
//            return;
//        }
//
//        // 2. Establish Connection
//        try (Connection conn = DriverManager.getConnection(URL, USER, PASS)) {
//            System.out.println("✅ Connection established.");
//
//            // 3. Insert Data
//            String insertSQL = "INSERT INTO users (name, email) VALUES (?, ?)";
//            try (PreparedStatement pstmt = conn.prepareStatement(insertSQL)) {
//                pstmt.setString(1, "Nagesh");
//                pstmt.setString(2, "nagesh@gmail.com");
//                int rows = pstmt.executeUpdate();
//                System.out.println("✅ " + rows + " row(s) inserted.");
//            }
//
//            // 4. Retrieve and Display Data
//            String selectSQL = "SELECT * FROM users";
//            try (PreparedStatement pstmt = conn.prepareStatement(selectSQL);
//                 ResultSet rs = pstmt.executeQuery()) {
//
//                System.out.println("🔍 Retrieving data...");
//                while (rs.next()) {
//                    System.out.println("ID: " + rs.getInt("id"));
//                    System.out.println("Name: " + rs.getString("name"));
//                    System.out.println("Email: " + rs.getString("email"));
//                    System.out.println("------------------------");
//                }
//            }
//
//        } catch (SQLException e) {
//            System.out.println("❌ Database connection failed.");
//            e.printStackTrace();
//        }
//    }
//}
