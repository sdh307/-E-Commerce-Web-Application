<%@ page import="javax.servlet.http.*,javax.servlet.*" 
	language="java" 
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

    if (session == null || session.getAttribute("mobile") == null) {
        response.sendRedirect("login.jsp"); // redirect if not logged in
        return;
    }

    String userName = (String) session.getAttribute("name");
    String userMobile = (String) session.getAttribute("mobile");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>WEB SHOP</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background: #faf3e0; /* light cream background */
      color: #4e342e; /* deep brown */
    }

    /* Header */
    .header {
      background-color: #d2a679; /* light chocolate brown */
      border-bottom: 2px solid #8b4513; /* saddle brown */
      padding: 15px 30px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      position: relative;
    }

    /* Clickable logo */
    .logo {
      position: absolute;
      left: 50%;
      transform: translateX(-50%);
    }

    .logo a {
      text-decoration: none;
      font-size: 28px;
      font-weight: bold;
      color: #3e2723; /* very dark brown */
    }

    .logo a:hover {
      color: #5d4037;
    }

    /* Auth links */
    .auth-links {
      margin-left: auto;
    }

    .auth-links a {
      color: #3e2723;
      margin: 0 8px;
      text-decoration: none;
      font-size: 16px;
      font-weight: bold;
    }

    .auth-links a:hover {
      text-decoration: underline;
      color: #5d4037;
    }

    /* Categories */
    .categories {
      text-align: center;
      padding: 40px 20px;
    }

    .categories h2 a {
      text-decoration: none;
      font-size: 24px;
      font-weight: bold;
      color: #3e2723;
      padding: 8px 15px;
      border: 2px solid #8b4513;
      border-radius: 6px;
      background-color: #e6ccb2; /* lighter brown */
      transition: background 0.2s, color 0.2s;
    }

    .categories h2 a:hover {
      background-color: #d2b48c;
      color: #2c1810;
    }

    .category-list {
      display: flex;
      justify-content: center;
      gap: 30px;
      flex-wrap: wrap;
      margin-top: 25px;
    }

    .category {
      width: 180px;
      height: 300px;
      border: 2px solid #d2b48c;
      border-radius: 10px;
      padding: 15px;
      background: #fffdf8;
      transition: transform 0.2s, box-shadow 0.2s;
    }

    .category:hover {
      transform: translateY(-5px);
      box-shadow: 0 4px 12px rgba(0,0,0,0.15);
    }

    .category a {
      text-decoration: none;
      color: inherit;
      display: block;
    }

    .category img {
      width: 100%;
      height: 250px;
      border-radius: 6px;
    }

    .category p {
      margin-top: 20px;
      font-size: 16px;
      font-weight: bold;
      color: #3e2723;
    }

    .category p:hover {
      color: #5d4037;
    }
  </style>
</head>
<body>
  <!-- Header -->
  <div class="header">
    <div class="logo">
      <a href="webpage2.jsp">ONLINE MART</a>
    </div>
  <!-- Welcome -->
  <div class="welcome">
   Welcome, <%= userName %> 
  </div>
    <div class="auth-links">
      <a href="logout.jsp">LogOut</a>
    </div>
  </div>
  <!-- Categories Section -->
  <div class="categories">
    <h2><a href="webpage2.jsp">CATEGORIES</a></h2>
    <div class="category-list">
      
      <div class="category">
        <a href="sports.jsp">
          <img src="images/sports.jpeg" alt="Sports">
          <p>SPORTS</p>
        </a>
      </div>

      <div class="category">
        <a href="backpacks.jsp">
          <img src="images/backpacks2.jpeg" alt="Backpack">
          <p>BACKPACKS</p>
        </a>
      </div>

      <div class="category">
        <a href="watches.jsp">
          <img src="images/watches.jpeg" alt="Watches">
          <p>WATCHES</p>
        </a>
      </div>

      <div class="category">
        <a href="clothes.jsp">
          <img src="images/clothes.jpeg" alt="Clothes">
          <p>CLOTHES</p>
        </a>
      </div>

      <div class="category">
        <a href="electronics.jsp">
          <img src="images/electronics2.webp" alt="Electronics">
          <p>ELECTRONICS</p>
        </a>
      </div>

    </div>
  </div>

</body>
</html>