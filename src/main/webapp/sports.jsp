<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*" 
         contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8"%>

<%
    // Session validation
    if (session == null || session.getAttribute("mobile") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Values coming from MySQL users table
    String userName = (String) session.getAttribute("name");
    String userMobile = (String) session.getAttribute("mobile");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>WEB SHOP | Sports</title>

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
  height: 400px;
  text-align: center;
  padding: 15px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  cursor: pointer;
}

.card img {
  width: 100%;
  height: 300px;
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
  <a href="webpage2.jsp">CATEGORIES - SPORTS</a>
</div>

<div class="categories">

  <form action="productHandler.jsp" method="post">
    <input type="hidden" name="name" value="Football">
    <input type="hidden" name="price" value="800">
    <input type="hidden" name="image" value="images/football.jpeg">
    <button type="submit" class="card">
      <img src="images/football.jpeg">
      <h3>Football<br>₹800</h3>
    </button>
  </form>

  <form action="productHandler.jsp" method="post">
    <input type="hidden" name="name" value="Cricket">
    <input type="hidden" name="price" value="700">
    <input type="hidden" name="image" value="images/cricket.jpeg">
    <button type="submit" class="card">
      <img src="images/cricket.jpeg">
      <h3>Cricket<br>₹700</h3>
    </button>
  </form>

</div>

</body>
</html>