<%-- 
    Document   : p-logout
    Created on : Sep 18, 2022, 7:07:04 AM
    Author     : asel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.invalidate();
    response.sendRedirect("admin-login.jsp");
%>
