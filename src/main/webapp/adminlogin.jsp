<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page import="jakarta.servlet.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Login</title>

  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; font-family: Arial, sans-serif; }
    body, html { height: 100%; }

    body {
      background: url("images/home.png") no-repeat center center/cover;
      position: relative;
    }

    body::before {
      content: "";
      position: absolute;
      inset: 0;
      background: inherit;
      filter: blur(8px);
      z-index: -1;
    }

    .login-container {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      background: rgba(255, 255, 255, 0.85);
      padding: 30px 40px;
      border-radius: 12px;
      box-shadow: 0 4px 15px rgba(0,0,0,0.2);
      width: 320px;
      text-align: center;
    }

    .login-container h2 { margin-bottom: 20px; color: #3e2723; }

    .login-container input {
      width: 100%;
      padding: 12px;
      margin: 10px 0;
      border: 1px solid #8b4513;
      border-radius: 8px;
      font-size: 16px;
    }

    .login-container button {
      width: 100%;
      padding: 12px;
      margin-top: 15px;
      border: none;
      border-radius: 8px;
      background-color: #d2b48c;
      color: #3e2723;
      font-size: 16px;
      font-weight: bold;
      cursor: pointer;
    }

    .error { color: red; margin-top: 10px; }
  </style>
</head>

<body>

<div class="login-container">
  <h2>Admin Login</h2>

  <form method="post">
    <input type="text" name="mobile" placeholder="Mobile Number" required>
    <input type="password" name="password" placeholder="Password" required>
    <button type="submit">Login</button>
  </form>

  <%
    if ("POST".equalsIgnoreCase(request.getMethod())) {

        String mobile = request.getParameter("mobile");
        String password = request.getParameter("password");

        String DB_URL = "jdbc:mysql://localhost:3306/ecommerce?useSSL=false&allowPublicKeyRetrieval=true";
        String DB_USER = "root";
        String DB_PASS = "#Soumya09";   // change password

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

            String sql = "SELECT name,mobile FROM admin_table WHERE mobile=? AND password=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, mobile);
            ps.setString(2, password);

            rs = ps.executeQuery();

            if (rs.next()) {
                session.setAttribute("mobile", rs.getString("mobile"));
                session.setAttribute("name", rs.getString("name"));

                response.sendRedirect("admin.jsp");
            } else {
                out.println("<div class='error'>Invalid Mobile or Password</div>");
            }

        } catch (Exception e) {
            out.println("<div class='error'>Database Error</div>");
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (Exception e) {}
            if (ps != null) try { ps.close(); } catch (Exception e) {}
            if (con != null) try { con.close(); } catch (Exception e) {}
        }
    }
  %>

</div>
</body>
</html>