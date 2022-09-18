<%-- 
    Document   : p-logout
    Created on : Sep 18, 2022, 8:17:03 AM
    Author     : asel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.invalidate();
    response.sendRedirect("driver-login.jsp");
%>
