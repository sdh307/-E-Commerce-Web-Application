<%@ page import="javax.servlet.http.*,javax.servlet.*,java.sql.*" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Check login session
        if (session == null || session.getAttribute("mobile") == null) {
        response.sendRedirect("login.jsp"); // redirect if not logged in
        return;
    }

    String userName = (String) session.getAttribute("name");
    String userMobile = (String) session.getAttribute("mobile");
    String userEmail = (String) session.getAttribute("email");
    String userAddress = (String) session.getAttribute("address");

    // Product details passed via request attributes (from servlet)
    String productName = (String) request.getAttribute("productName");
    String productPrice = (String) request.getAttribute("productPrice");
    if(productName!=null)
    	session.setAttribute("productName",productName);
    if(productPrice!=null)
    	session.setAttribute("productPrice",productPrice);
    String url  = "jdbc:mysql://localhost:3306/ecommerce";
    String dbUser = "root";
    String dbPass = "#Soumya09"; // change if needed
    Connection con = null;
    PreparedStatement ps = null;
    try {
        /* ================= LOAD DRIVER ================= */
        Class.forName("com.mysql.cj.jdbc.Driver");

        /* ================= CONNECTION ================= */
        con = DriverManager.getConnection(url, dbUser, dbPass);

        /* ================= INSERT QUERY ================= */
        String sql = "INSERT INTO orders " +
                     "(username, mobile, email, address, product, price) " +
                     "VALUES (?, ?, ?, ?, ?, ?)";

        ps = con.prepareStatement(sql);

        ps.setString(1, userName);
        ps.setString(2, userMobile);
        ps.setString(3, userEmail);
        ps.setString(4, userAddress);
        ps.setString(5, productName);
        ps.setBigDecimal(6, new java.math.BigDecimal(productPrice));

        int result = ps.executeUpdate();
    } catch (Exception e) {
        out.println("<h3>Error :</h3>");
        e.printStackTrace();
    } finally {
        if (ps != null) ps.close();
        if (con != null) con.close();
    }	
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Order Confirmation - WEB SHOP</title>
  <style>
    body {
      margin: 0;
      font-family: Arial, sans-serif;
      background-color: #f9f3e6; /* light cream */
      color: #4b2e2e;
    }

    /* Top Navbar */
    .navbar {
      background-color: #d2a679; /* light brown */
      border-bottom: 2px solid #8b4513;
      padding: 15px 30px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      position: relative;
    }

    /* E-SHOP Logo Center */
    .navbar-center {
      position: absolute;
      left: 50%;
      transform: translateX(-50%);
    }

    .navbar-center a {
      color: #2d1d1d;
      text-decoration: none;
      font-weight: bold;
      font-size: 28px;
    }

    .welcome {
      font-size: 14px;
      font-weight: normal;
      color: #2d1d1d;
    }

    .logout a {
      font-size: 18px;
      font-weight: bold;
      color: #2d1d1d;
      text-decoration: none;
    }

    .logout a:hover {
      text-decoration: underline;
    }
    .auth-links a {
      font-weight: bold;
      color: #3e2723;
      text-decoration: none;
    }

    .auth-links a:hover {
      text-decoration: underline;
    }

    .container {
      max-width: 700px;
      margin: 50px auto;
      background: #fffdf8;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 3px 10px rgba(0,0,0,0.1);
    }

    h1 {
      text-align: center;
      color: #4e342e;
    }

    .order-summary {
      margin-top: 25px;
      border: 2px solid #d2b48c;
      border-radius: 8px;
      padding: 20px;
      background: #fdfaf6;
    }

    .order-summary table {
      width: 100%;
      border-collapse: collapse;
    }

    .order-summary th, .order-summary td {
      border-bottom: 1px solid #ddd;
      padding: 10px;
      text-align: left;
    }

    .success {
      color: green;
      font-weight: bold;
      margin: 15px 0;
    }

    .btn {
      display: inline-block;
      margin-top: 20px;
      padding: 10px 18px;
      background: #8b4513;
      color: white;
      text-decoration: none;
      border-radius: 6px;
      font-weight: bold;
    }

    .btn:hover {
      background: #5d4037;
    }

    .welcome {
      margin-top: 15px;
      font-weight: bold;
      color: #4e342e;
      text-align: center;
    }
  </style>
</head>
<body>

  <div class="navbar">
    <div class="welcome">
      Welcome, <%= userName %>
    </div>

    <div class="navbar-center">
      <a href="webpage2.jsp">ONLINE MART</a>
    </div>

    <div class="logout">
      <a href="logout.jsp">Logout</a>
    </div>
</div>
  <!-- Order Confirmation -->
  <div class="container">
    <h1>Order Confirmed ✅</h1>
    <div class="welcome">
      Thank you, <%= userName %> (Mobile: <%= userMobile %>)
      <div class="success">Your order has been placed successfully!</div>
    </div>
    

    <div class="order-summary">
      <h2>Order Summary</h2>
      <table>
        <tr>
          <th>Product</th>
          <td><%= (productName != null) ? productName : "N/A" %></td>
        </tr>
        <tr>
          <th>Total Price</th>
          <td><%= (productPrice != null) ? productPrice : "N/A" %></td>
        </tr>
      </table>
    </div>

    <div style="text-align:center;">
      <a class="btn" href="feedback.jsp">Continue</a>
    </div>
  </div>

</body>
</html>