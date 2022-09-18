<%-- 
    Document   : p-logout
    Created on : Sep 18, 2022, 8:18:47 AM
    Author     : asel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    session.invalidate();
    response.sendRedirect("customer-login.jsp");
%>
