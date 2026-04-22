<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String message = "";
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String name = request.getParameter("name");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirm = request.getParameter("confirm");
        String security = request.getParameter("security");
        String answer = request.getParameter("answer");
        String address = request.getParameter("address");
        if (password == null || !password.equals(confirm)) {
            message = "Passwords do not match!";
        } else {
            String URL = "jdbc:mysql://localhost:3306/ecommerce?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
            String USER = "root";
            String PASS = "#Soumya09";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                try (Connection con = DriverManager.getConnection(URL, USER, PASS);
                     PreparedStatement ps = con.prepareStatement(
                         "INSERT INTO users (name, mobile, email, password, security_question, answer, address) VALUES (?, ?, ?, ?, ?, ?, ?)")) {

                    ps.setString(1, name);
                    ps.setString(2, mobile);
                    ps.setString(3, email);
                    ps.setString(4, password);
                    ps.setString(5, security);
                    ps.setString(6, answer);
                    ps.setString(7, address);

                    ps.executeUpdate();
                    response.sendRedirect("login.jsp"); // redirect on success
                    return;
                }
            } catch (Exception e) {
                message = "Database Error: " + e.getMessage();
            }
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>WEB SHOP Sign Up</title>
  <style>
    /* same CSS as before */
    * { box-sizing: border-box; margin: 0; padding: 0; font-family: Arial, sans-serif; }
    .bg { position: fixed; inset: 0; background: url("images/home.png") center/cover no-repeat; filter: blur(10px); transform: scale(1.06); z-index: -1; }
    .page { min-height: 100dvh; display: grid; place-items: center; padding: 32px 16px; }
    .signup-card { width: min(560px, 100%); background: rgba(255,255,255,0.9); border-radius: 12px; box-shadow: 0 6px 18px rgba(0,0,0,0.25); padding: 28px 32px; border: 1px solid #d2b48c; color: #3e2723; }
    .signup-card h2 { text-align: center; margin-bottom: 18px; }
    .field { margin-top: 12px; }
    label { font-weight: bold; display: block; margin-bottom: 6px; }
    input, select, textarea, button { width: 100%; font-size: 15px; border-radius: 8px; border: 1px solid #8b4513; outline: none; }
    input, select, textarea { padding: 10px; }
    textarea { resize: vertical; min-height: 70px; }
    input:focus, select:focus, textarea:focus { border-color: #5d4037; box-shadow: 0 0 6px rgba(93,64,55,0.35); }
    button { margin-top: 18px; padding: 12px; border: none; background: #d2b48c; color: #3e2723; font-weight: bold; cursor: pointer; transition: filter .2s; }
    button:hover { filter: brightness(0.95); }
    .links { text-align: center; margin-top: 12px; }
    .links a { color: #5d4037; text-decoration: none; font-size: 14px; }
    .links a:hover { text-decoration: underline; }
    .error { color: red; text-align: center; margin-bottom: 12px; }
  </style>
</head>
<body>
  <div class="bg" aria-hidden="true"></div>
  <main class="page">
    <form class="signup-card" action="" method="post">
      <h2>Create Account</h2>
      <% if(!message.isEmpty()){ %>
          <div class="error"><%= message %></div>
      <% } %>
      <div class="field">
        <label for="name">Full Name</label>
        <input id="name" name="name" type="text" required>
      </div>
      <div class="field">
        <label for="mobile">Mobile No</label>
        <input id="mobile" name="mobile" type="tel" pattern="[0-9]{10}" placeholder="10-digit number" required>
      </div>
      <div class="field">
        <label for="email">Email</label>
        <input id="email" name="email" type="email" required>
      </div>
      <div class="field">
        <label for="password">Password</label>
        <input id="password" name="password" type="password" required>
      </div>
      <div class="field">
        <label for="confirm">Confirm Password</label>
        <input id="confirm" name="confirm" type="password" required>
      </div>
      <div class="field">
        <label for="security">Security Question</label>
        <select id="security" name="security" required>
          <option value="" disabled selected>Select a question</option>
          <option value="pet">What is your pet's name?</option>
          <option value="color">What is your favourite color?</option>
        </select>
      </div>
      <div class="field">
        <label for="answer">Your Answer</label>
        <input id="answer" name="answer" type="text" required>
      </div>
      <div class="field">
        <label for="address">Address</label>
        <textarea id="address" name="address" required></textarea>
      </div>
      <button type="submit">Sign Up</button>
    </form>
  </main>
</body>
</html>