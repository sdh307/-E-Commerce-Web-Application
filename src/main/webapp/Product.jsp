<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    if (session == null || session.getAttribute("mobile") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String userName   = (String) session.getAttribute("name");
    String userMobile = (String) session.getAttribute("mobile");
    String userEmail  = (String) session.getAttribute("email");
    String userAddress= (String) session.getAttribute("address");

    String productName  = (String) request.getAttribute("productName");
    String productPrice = (String) request.getAttribute("productPrice");
    String productImage = (String) request.getAttribute("productImage");

    if (productName == null) {
        response.sendRedirect("webpage2.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>WEB SHOP | Product Details</title>

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

.logout a {
  font-size: 18px;
  font-weight: bold;
  color: #2d1d1d;
  text-decoration: none;
}

.heading {
  text-align: center;
  margin: 20px 0;
  font-size: 26px;
  font-weight: bold;
}

.container {
  display: flex;
  justify-content: space-around;
  padding: 30px;
}

.left, .right {
  background: #fff;
  border: 2px solid #a0522d;
  border-radius: 12px;
  padding: 20px;
  width: 35%;
}

.left img {
  width: 100%;
  height: 300px;
  object-fit: contain;
}

.confirm-btn {
  margin-top: 20px;
  padding: 10px 20px;
  background-color: #d2a679;
  border: none;
  border-radius: 8px;
  cursor: pointer;
  font-weight: bold;
}
.confirm-btn:hover {
  background-color: #a0522d;
  color: #fff;
}
</style>
</head>

<body>

<div class="navbar">
  <div>Welcome, <b><%= userName %></b></div>

  <div class="navbar-center">
    <a href="webpage2.jsp">WEB SHOP</a>
  </div>

  <div class="logout">
    <a href="logout.jsp">Logout</a>
  </div>
</div>

<div class="heading">PRODUCT DETAILS</div>

<div class="container">

  <!-- Product -->
  <div class="left">
    <img src="<%= productImage %>" alt="<%= productName %>">
    <h2><%= productName %></h2>
    <h3>Price: ₹<%= productPrice %></h3>
  </div>

  <!-- User + Payment -->
  <div class="right">
    <h3>User Details</h3>
    <p><b>Name:</b> <%= userName %></p>
    <p><b>Mobile:</b> <%= userMobile %></p>
    <p><b>Email:</b> <%= userEmail %></p>
    <p><b>Address:</b> <%= userAddress %></p>

    <h3>Total Amount: ₹<%= productPrice %></h3>

    <form action="productHandler.jsp" method="post">
      <h3>Payment Mode</h3>
      <label>
        <input type="radio" name="payment" value="COD" checked> Cash on Delivery
      </label>
      <label>
        <input type="radio" name="payment" value="UPI"> UPI
      </label>

      <input type="hidden" name="name" value="<%= productName %>">
      <input type="hidden" name="price" value="<%= productPrice %>">
      <input type="hidden" name="image" value="<%= productImage %>">
      <input type="hidden" name="action" value="confirmOrder">

      <br>
      <input type="submit" value="confirm Order" class="confirm-btn">
    </form>
  </div>

</div>

</body>
</html>