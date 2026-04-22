<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    // Get existing session (do not create new)
    if (session != null) {
        session.invalidate(); // destroy session
    }

    // Redirect after logout
    response.sendRedirect("webpage.jsp");
%>