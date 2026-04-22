<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
      background: #faf3e0;
      color: #4e342e;
    }

    .header {
      background-color: #d2a679;
      border-bottom: 2px solid #8b4513;
      padding: 15px 30px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      position: relative;
    }

    .admin-login {
      position: absolute;
      left: 20px;
    }

    .admin-login a {
      text-decoration: none;
      font-size: 16px;
      font-weight: bold;
      color: #3e2723;
    }

    .logo {
      position: absolute;
      left: 50%;
      transform: translateX(-50%);
    }

    .logo a {
      text-decoration: none;
      font-size: 28px;
      font-weight: bold;
      color: #3e2723;
      letter-spacing: 2px;
    }

    .auth-links {
      margin-left: auto;
      display: flex;
      gap: 10px;
      align-items: center;
    }

    .auth-links form {
      display: inline;
    }

    .auth-links button {
      background: none;
      border: none;
      cursor: pointer;
      font-size: 16px;
      font-weight: bold;
      color: #3e2723;
    }

    /* ===== WARNING MESSAGE ===== */
    .signin-warning {
      display: none;
      text-align: center;
      color: red;
      font-weight: bold;
      margin: 15px 0;
      font-size: 16px;
    }

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
      width: 170px;
      border: 2px solid #d2b48c;
      border-radius: 10px;
      padding: 15px;
      background: #fffdf8;
    }

    .category img {
      width: 100%;
      border-radius: 6px;
    }

    .category p {
      margin-top: 10px;
      font-size: 16px;
      font-weight: bold;
      color: #3e2723;
    }
  </style>

  <script>
    function showWarning() {
      document.getElementById("signinMsg").style.display = "block";
    }
  </script>
</head>

<!-- CLICK ANYWHERE IN BODY -->
<body onclick="showWarning()">
  <!-- Header -->
  <div class="header">

    <div class="admin-login">
      <a href="adminlogin.jsp">Admin Login</a>
    </div>

    <div class="logo">
      <a href="webpage.jsp">ONLINE MART</a>
    </div>

    <div class="auth-links">
      <form action="login.jsp" method="get">
        <button type="submit">Sign In</button>
      </form>
      |
      <form action="signUp.jsp" method="get">
        <button type="submit">Sign Up</button>
      </form>
    </div>
  </div>

  <!-- HIDDEN WARNING -->
  <div id="signinMsg" class="signin-warning">
    Please sign in first!!
  </div>

   <!-- Categories Section -->
  <div class="categories">
    <h2><a href="webpage.jsp">CATEGORIES</a></h2>
    <div class="category-list">

      <div class="category">
        <img src="images/sports1.jpeg">
        <p>SPORTS</p>
      </div>

      <div class="category">
        <img src="images/backpacks1.jpeg">
        <p>BACKPACKS</p>
      </div>

      <div class="category">
        <img src="images/watches.jpeg">
        <p>WATCHES</p>
      </div>

      <div class="category">
        <img src="images/clothes.jpeg">
        <p>CLOTHES</p>
      </div>

      <div class="category">
        <img src="images/electronics.jpeg">
        <p>ELECTRONICS</p>
      </div>

    </div>
  </div>

</body>
</html>
