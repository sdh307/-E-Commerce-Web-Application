<%@ page language="java"
        contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.RequestDispatcher" %>

<%
    /* ================= PRODUCT DETAILS FROM REQUEST ================= */
    String productName  = request.getParameter("name");
    String productPrice = request.getParameter("price");
    String productImage = request.getParameter("image");

    /* ================= SESSION CHECK ================= */
    if (session == null || session.getAttribute("mobile") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    /* ================= USER DETAILS FROM SESSION ================= */
    String userName    = (String) session.getAttribute("name");
    String userMobile  = (String) session.getAttribute("mobile");
    String userEmail   = (String) session.getAttribute("email");
    String userAddress = (String) session.getAttribute("address");

    /* ================= STORE PRODUCT DATA IN SESSION =================
       (Needed because request attributes are lost on reload / POST)
    */
    session.setAttribute("productName", productName);
    session.setAttribute("productPrice", productPrice);
    session.setAttribute("productImage", productImage);

    /* ================= STORE USER DATA SAFELY IN SESSION ================= */
    session.setAttribute("userName", userName);
    session.setAttribute("userMobile", userMobile);
    session.setAttribute("userEmail", userEmail);
    session.setAttribute("userAddress", userAddress);

    /* ================= ALSO SET REQUEST ATTRIBUTES (FOR FORWARD) ================= */
    request.setAttribute("productName", productName);
    request.setAttribute("productPrice", productPrice);
    request.setAttribute("productImage", productImage);
    request.setAttribute("userName", userName);
    request.setAttribute("userMobile", userMobile);

    /* ================= ACTION HANDLING ================= */
    String action = request.getParameter("action");
	
    if ("confirmOrder".equals(action)) {
        RequestDispatcher rd = request.getRequestDispatcher("orderConfirm.jsp");
        rd.forward(request, response);
    } else {
        RequestDispatcher rd = request.getRequestDispatcher("Product.jsp");
        rd.forward(request, response);
    }
%>