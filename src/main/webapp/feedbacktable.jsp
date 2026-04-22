<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>

<%
    // ===== SESSION CHECK =====
    if (session == null || session.getAttribute("mobile") == null) {
        response.sendRedirect("adminlogin.jsp");
        return;
    }

    String userName = (String) session.getAttribute("name");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Feedback | E-SHOP</title>

<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #f9f3e6;
    color: #4b2e2e;
}

/* ===== NAVBAR ===== */
.navbar {
    background-color: #d2a679;
    border-bottom: 2px solid #8b4513;
    padding: 15px 30px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    position: relative;
}

.navbar-center {
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
}

.navbar-center a {
    font-size: 28px;
    font-weight: bold;
    color: #2d1d1d;
    text-decoration: none;
}

.logout a {
    font-weight: bold;
    color: #2d1d1d;
    text-decoration: none;
}

.logout a:hover {
    text-decoration: underline;
}

/* ===== CONTAINER ===== */
.container {
    max-width: 900px;
    margin: 40px auto;
    background: #fffdf8;
    padding: 25px;
    border-radius: 10px;
    box-shadow: 0 3px 10px rgba(0,0,0,0.1);
}

h2 {
    text-align: center;
}

/* ===== TABLE ===== */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

th, td {
    border: 1px solid #d2b48c;
    padding: 10px;
    text-align: center;
}

th {
    background-color: #d2a679;
    color: #2d1d1d;
}

tr:nth-child(even) {
    background-color: #f6efe6;
}
</style>
</head>

<body>

<!-- ===== NAVBAR ===== -->
<div class="navbar">
    <div>Welcome, <b><%= userName %></b></div>

    <div class="navbar-center">
        <a href="webpage2.jsp">E-SHOP</a>
    </div>

    <div class="logout">
        <a href="logout.jsp">Logout</a>
    </div>
</div>

<!-- ===== FEEDBACK TABLE ===== -->
<div class="container">
    <h2>Customer Feedback</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>User Name</th>
            <th>Mobile</th>
            <th>Rating</th>
            <th>Feedback</th>
            <th>Date</th>
        </tr>

        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/ecommerce",
                    "root",
                    "#Soumya09"
                );

                st = con.createStatement();
                rs = st.executeQuery("SELECT * FROM feedback ORDER BY created_at DESC");

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("username") %></td>
            <td><%= rs.getString("mobile") %></td>
            <td><%= rs.getInt("rating") %> ★</td>
            <td><%= rs.getString("feedback_text") %></td>
            <td><%= rs.getTimestamp("created_at") %></td>
        </tr>
        <%
                }
            } catch (Exception e) {
        %>
        <tr>
            <td colspan="6" style="color:red;">
                Error loading feedback: <%= e.getMessage() %>
            </td>
        </tr>
        <%
            } finally {
                if (rs != null) rs.close();
                if (st != null) st.close();
                if (con != null) con.close();
            }
        %>
    </table>
</div>

</body>
</html>