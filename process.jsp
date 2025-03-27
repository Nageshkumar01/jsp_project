<%@ page import="java.sql.*" %>

<%@ page import="java.sql.*" %>
<%
    String name = request.getParameter("name");
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    String url = "jdbc:mysql://localhost:3306/yourDatabase";  // Change yourDatabase to actual DB
    String user = "root";
    String pass = "12345";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");  // Load MySQL driver
        try (Connection conn = DriverManager.getConnection(url, user, pass)) {
            if (conn != null) {
                if (name != null && !name.trim().isEmpty() && email != null && !email.trim().isEmpty() && username != null && !username.trim().isEmpty() && password != null && !password.trim().isEmpty()) {  
                    // ✅ Registration Logic
                    String checkUser = "SELECT * FROM users WHERE username = ?";
                    try (PreparedStatement stmt = conn.prepareStatement(checkUser)) {
                        stmt.setString(1, username);
                        try (ResultSet rs = stmt.executeQuery()) {
                            if (rs.next()) {
                                response.sendRedirect("login.jsp?message=User already exists. Please log in.");
                            } else {
                                String insertUser = "INSERT INTO users (name, username, email, password) VALUES (?, ?, ?, ?)";
                                try (PreparedStatement insertStmt = conn.prepareStatement(insertUser)) {
                                    insertStmt.setString(1, name);
                                    insertStmt.setString(2, username);
                                    insertStmt.setString(3, email);
                                    insertStmt.setString(4, password);
                                    int rows = insertStmt.executeUpdate();

                                    if (rows > 0) {
                                        response.sendRedirect("login.jsp?message=Registration successful. Please log in.");
                                    } else {
                                        response.sendRedirect("register.jsp?error=Failed to register. Please try again.");
                                    }
                                }
                            }
                        }
                    }
                } else if (username != null && !username.trim().isEmpty() && password != null && !password.trim().isEmpty()) {
                    // ✅ Login Logic
                    String loginQuery = "SELECT * FROM users WHERE username = ? AND password = ?";
                    try (PreparedStatement stmt = conn.prepareStatement(loginQuery)) {
                        stmt.setString(1, username);
                        stmt.setString(2, password);
                        try (ResultSet rs = stmt.executeQuery()) {
                            if (rs.next()) {
                                session.setAttribute("username", rs.getString("username"));
                                out.println("<script>alert('Login successful. Welcome, " + rs.getString("name") + "!'); window.location='indec.html';</script>");
                            } else {
                                out.println("<script>alert('Invalid credentials. Please try again.'); window.location='login.jsp';</script>");
                            }
                        }
                    }
                } else {
                    response.sendRedirect("error.jsp?error=Missing required parameters.");
                }
            } else {
                response.sendRedirect("error.jsp?error=Connection failed.");
            }
        }
    } catch (ClassNotFoundException e) {
        response.sendRedirect("error.jsp?error=MySQL Driver not found.");
    } catch (SQLException e) {
        response.sendRedirect("error.jsp?error=Database error: " + e.getMessage());
    }
%>
<%-- 
<%
    String name = request.getParameter("name");
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    String url = "jdbc:mysql://localhost:3306/yourDatabase";  // Change yourDatabase to actual DB
    String user = "root";
    String pass = "12345";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");  // Load MySQL driver
        try (Connection conn = DriverManager.getConnection(url, user, pass)) {
            if (conn != null) {
                if (name != null && !name.trim().isEmpty() && email != null && !email.trim().isEmpty() && username != null && !username.trim().isEmpty() && password != null && !password.trim().isEmpty()) {  
                    // ✅ Registration Logic
                    String checkUser = "SELECT * FROM users WHERE username = ?";
                    try (PreparedStatement stmt = conn.prepareStatement(checkUser)) {
                        stmt.setString(1, username);
                        try (ResultSet rs = stmt.executeQuery()) {
                            if (rs.next()) {
                                response.sendRedirect("login.jsp?message=User already exists. Please log in.");
                            } else {
                                String insertUser = "INSERT INTO users (name, username, email, password) VALUES (?, ?, ?, ?)";
                                try (PreparedStatement insertStmt = conn.prepareStatement(insertUser)) {
                                    insertStmt.setString(1, name);
                                    insertStmt.setString(2, username);
                                    insertStmt.setString(3, email);
                                    insertStmt.setString(4, password);
                                    int rows = insertStmt.executeUpdate();

                                    if (rows > 0) {
                                        response.sendRedirect("login.jsp?message=Registration successful. Please log in.");
                                    } else {
                                        response.sendRedirect("register.jsp?error=Failed to register. Please try again.");
                                    }
                                }
                            }
                        }
                    }
                } else if (username != null && !username.trim().isEmpty() && password != null && !password.trim().isEmpty()) {
                    // ✅ Login Logic
                    String loginQuery = "SELECT * FROM users WHERE username = ? AND password = ?";
                    try (PreparedStatement stmt = conn.prepareStatement(loginQuery)) {
                        stmt.setString(1, username);
                        stmt.setString(2, password);
                        try (ResultSet rs = stmt.executeQuery()) {
                            if (rs.next()) {
                                out.println("<script>alert('Login successful. Welcome, " + rs.getString("name") + "!'); window.location='indec.html';</script>");
                            } else {
                                out.println("<script>alert('Invalid credentials. Please try again.'); window.location='login.jsp';</script>");
                            }
                        }
                    }
                } else {
                    response.sendRedirect("error.jsp?error=Missing required parameters.");
                }
            } else {
                response.sendRedirect("error.jsp?error=Connection failed.");
            }
        }
    } catch (ClassNotFoundException e) {
        response.sendRedirect("error.jsp?error=MySQL Driver not found.");
    } catch (SQLException e) {
        response.sendRedirect("error.jsp?error=Database error: " + e.getMessage());
    }
%>







































































































<%-- 

<%@ page import="java.sql.*" %>
<%
    String name = request.getParameter("name");
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    String url = "jdbc:mysql://localhost:3306/yourDatabase";  // Change yourDatabase to actual DB
    String user = "root";
    String pass = "12345";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");  // Load MySQL driver
        try (Connection conn = DriverManager.getConnection(url, user, pass)) {
            if (conn != null) {
                if (name != null && !name.trim().isEmpty() && email != null && !email.trim().isEmpty() && username != null && !username.trim().isEmpty() && password != null && !password.trim().isEmpty()) {  
                    // ✅ Registration Logic
                    String checkUser = "SELECT * FROM users WHERE username = ?";
                    try (PreparedStatement stmt = conn.prepareStatement(checkUser)) {
                        stmt.setString(1, username);
                        try (ResultSet rs = stmt.executeQuery()) {
                            if (rs.next()) {
                                out.println("<h3>User already exists. Please log in.</h3>");
                            } else {
                                String insertUser = "INSERT INTO users (name, username, email, password) VALUES (?, ?, ?, ?)";
                                try (PreparedStatement insertStmt = conn.prepareStatement(insertUser)) {
                                    insertStmt.setString(1, name);
                                    insertStmt.setString(2, username);
                                    insertStmt.setString(3, email);
                                    insertStmt.setString(4, password);
                                    int rows = insertStmt.executeUpdate();

                                    if (rows > 0) {
                                        out.println("<h3>✅ Registration successful. Please log in.</h3>");
                                    } else {
                                        out.println("<h3>❌ Failed to register. Please try again.</h3>");
                                    }
                                }
                            }
                        }
                    }
                } else if (username != null && !username.trim().isEmpty() && password != null && !password.trim().isEmpty()) {
                    // ✅ Login Logic
                    String loginQuery = "SELECT * FROM users WHERE username = ? AND password = ?";
                    try (PreparedStatement stmt = conn.prepareStatement(loginQuery)) {
                        stmt.setString(1, username);
                        stmt.setString(2, password);
                        try (ResultSet rs = stmt.executeQuery()) {
                            if (rs.next()) {
                                out.println("<h3>✅ Login successful. Welcome, " + rs.getString("name") + "!</h3>");
                            } else {
                                out.println("<h3>❌ Invalid credentials. Please try again.</h3>");
                            }
                        }
                    }
                } else {
                    out.println("<h3>❌ Missing required parameters.</h3>");
                }
            } else {
                out.println("<h3>❌ Connection failed.</h3>");
            }
        }
    } catch (ClassNotFoundException e) {
        out.println("<h3>❌ MySQL Driver not found.</h3>");
        e.printStackTrace(new java.io.PrintWriter(out));
    } catch (SQLException e) {
        out.println("<h3>❌ Database error: " + e.getMessage() + "</h3>");
        e.printStackTrace(new java.io.PrintWriter(out));
    }
%>

--%>