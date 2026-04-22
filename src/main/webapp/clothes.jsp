<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    // Session validation (MySQL users.mobile)
    if (session == null || session.getAttribute("mobile") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String userName = (String) session.getAttribute("name");
    String userMobile = (String) session.getAttribute("mobile");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>WEB SHOP | Clothes</title>

<style>
body {
  margin: 0;
  font-family: Arial, sans-serif;
  background-color: #f9f3e6;
  color: #4b2e2e;
}

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
  color: #2d1d1d;
  text-decoration: none;
  font-weight: bold;
  font-size: 28px;
}

.welcome {
  font-size: 14px;
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

.category-heading {
  text-align: center;
  margin: 30px 0;
}

.category-heading a {
  text-decoration: none;
  background-color: #e6d3c2;
  border: 2px solid #a0522d;
  padding: 10px 25px;
  border-radius: 8px;
  font-size: 22px;
  font-weight: bold;
  color: #2d1d1d;
}

.categories {
  display: flex;
  justify-content: center;
  gap: 30px;
  flex-wrap: wrap;
}

.card {
  background-color: #fff;
  border: 2px solid #e6d3c2;
  border-radius: 12px;
  width: 300px;
  height: 450px;
  text-align: center;
  padding: 15px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  cursor: pointer;
}

.card img {
  width: 100%;
  height: 350px;
  object-fit: cover;
  border-radius: 8px;
}
</style>
</head>

<body>

<div class="navbar">
  <div class="welcome">
    Welcome, <b><%= userName %></b>
  </div>

  <div class="navbar-center">
    <a href="webpage2.jsp">ONLINE MART</a>
  </div>

  <div class="logout">
    <a href="logout.jsp">Logout</a>
  </div>
</div>

<div class="category-heading">
  <a href="webpage2.jsp">CATEGORIES - CLOTHES</a>
</div>

<div class="categories">

  <form action="productHandler.jsp" method="post">
    <input type="hidden" name="name" value="Men Clothes">
    <input type="hidden" name="price" value="1100">
    <input type="hidden" name="image" value="images/men_cloth.jpeg">
    <button type="submit" class="card">
      <img src="images/men_cloth.jpeg" alt="Men Clothes">
      <h3>MEN<br>₹1100</h3>
    </button>
  </form>

  <form action="productHandler.jsp" method="post">
    <input type="hidden" name="name" value="Women Clothes">
    <input type="hidden" name="price" value="800">
    <input type="hidden" name="image" value="images/women_cloth.jpeg">
    <button type="submit" class="card">
      <img src="images/women_cloth.jpeg" alt="Women Clothes">
      <h3>WOMEN<br>₹800</h3>
    </button>
  </form>

</div>

</body>
</html>