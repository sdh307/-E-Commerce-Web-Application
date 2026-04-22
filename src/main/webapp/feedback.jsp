<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>

<%
    // ===== SESSION CHECK =====
    if (session == null || session.getAttribute("mobile") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String userName   = (String) session.getAttribute("name");
    String userMobile = (String) session.getAttribute("mobile");

    String productName  = (String) session.getAttribute("productName");
    String productPrice = (String) session.getAttribute("productPrice");

    boolean feedbackSubmitted = false;

    // ===== SAVE FEEDBACK ONLY IF SUBMIT BUTTON CLICKED =====
    if ("POST".equalsIgnoreCase(request.getMethod()) &&
        request.getParameter("submitFeedback") != null) {

        String ratingStr = request.getParameter("rating");
        String feedbackText = request.getParameter("feedback");

        // Feedback is OPTIONAL – save only if something is provided
        if ((ratingStr != null && !ratingStr.isEmpty()) ||
            (feedbackText != null && !feedbackText.trim().isEmpty())) {

            try {
                int rating = (ratingStr == null || ratingStr.isEmpty()) ? 0 : Integer.parseInt(ratingStr);

                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/ecommerce",
                    "root",
                    "#Soumya09"
                );

                PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO feedback(username, mobile, rating, feedback_text) VALUES (?,?,?,?)"
                );
                ps.setString(1, userName);
                ps.setString(2, userMobile);
                ps.setInt(3, rating);
                ps.setString(4, feedbackText);

                ps.executeUpdate();
                con.close();

                feedbackSubmitted = true;

            } catch (Exception e) {
                out.println("<h3 style='color:red;text-align:center'>" + e + "</h3>");
            }
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Feedback | WEB SHOP</title>

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
    text-decoration: none;
    color: #2d1d1d;
}

/* ===== CONTAINER ===== */
.container {
    max-width: 600px;
    margin: 50px auto;
    background: #fffdf8;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 3px 10px rgba(0,0,0,0.1);
}
h2 {
    text-align: center;
}

/* ===== STAR RATING ===== */
.stars {
    display: flex;
    justify-content: center;
    flex-direction: row-reverse;
    margin: 20px 0;
}
.stars input {
    display: none;
}
.stars label {
    font-size: 34px;
    color: #ccc;
    cursor: pointer;
}
.stars input:checked ~ label,
.stars label:hover,
.stars label:hover ~ label {
    color: gold;
}

/* ===== TEXTAREA & BUTTONS ===== */
textarea {
    width: 100%;
    height: 90px;
    padding: 10px;
}
button {
    width: 100%;
    padding: 10px;
    font-weight: bold;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    margin-top: 15px;
}
.submit-btn {
    background: #4caf50;
    color: white;
}
.continue-btn {
    background: #8b4513;
    color: white;
}
.thanks {
    color: green;
    font-weight: bold;
    text-align: center;
    margin: 15px 0;
}
.order-info {
    text-align: center;
    font-weight: bold;
}
</style>

<script>
function showThanks() {
    document.getElementById("thanksMsg").style.display = "block";
}
function goHome() {
    window.location.href = "webpage2.jsp";
}
</script>

</head>
<body>

<!-- ===== NAVBAR ===== -->
<div class="navbar">
    <div>Welcome, <b><%= userName %></b></div>

    <div class="navbar-center">
        <a href="webpage2.jsp">ONLINE MART</a>
    </div>

    <div class="logout">
        <a href="logout.jsp">Logout</a>
    </div>
</div>

<!-- ===== FEEDBACK ===== -->
<div class="container">

    <h2>Feedback</h2>

    <div class="order-info">
        Product: <%= productName != null ? productName : "N/A" %><br>
        Price: ₹ <%= productPrice != null ? productPrice : "N/A" %>
    </div>

    <% if (feedbackSubmitted) { %>
        <div id="thanksMsg" class="thanks">
            Thank you for your valuable feedback 🙏
        </div>
    <% } else { %>
        <div id="thanksMsg" class="thanks" style="display:none;">
            Thank you for your valuable feedback 🙏
        </div>
    <% } %>

    <form method="post">

        <!-- STAR RATING (OPTIONAL) -->
        <div class="stars">
            <input type="radio" id="s5" name="rating" value="5"><label for="s5">★</label>
            <input type="radio" id="s4" name="rating" value="4"><label for="s4">★</label>
            <input type="radio" id="s3" name="rating" value="3"><label for="s3">★</label>
            <input type="radio" id="s2" name="rating" value="2"><label for="s2">★</label>
            <input type="radio" id="s1" name="rating" value="1"><label for="s1">★</label>
        </div>

        <!-- REMARKS (OPTIONAL) -->
        <textarea name="feedback" placeholder="Write your remarks (optional)"></textarea>

        <!-- SUBMIT FEEDBACK -->
        <button type="submit" name="submitFeedback" class="submit-btn" onclick="showThanks()">
            Submit Feedback
        </button>

        <!-- CONTINUE SHOPPING (ALWAYS ENABLED) -->
        <button type="button" class="continue-btn" onclick="goHome()">
            Continue Shopping
        </button>

    </form>
</div>

</body>
</html>