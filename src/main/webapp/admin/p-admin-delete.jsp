<%-- 
    Document   : p-admin-delete
    Created on : Sep 9, 2022, 10:53:04 PM
    Author     : asel
--%>

<%@page import="service.Admin"%>
<%@page import="service.GocheetahWebService"%>
<%@page import="service.GocheetahWebService_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    GocheetahWebService_Service service = new GocheetahWebService_Service();
    GocheetahWebService proxy = service.getGocheetahWebServicePort();
    RequestDispatcher dispatcher = null;
    
    Admin ad = new Admin();
    int id = Integer.parseInt(request.getParameter("AdminID"));
    ad.setAdminId(id);
    
    if (true) {
        try {
            proxy.deleteAdmin(ad);
            response.sendRedirect("../admin-users.jsp#tab-1");
        } catch (Exception e) {
            System.out.println(e);
        }
    }
%>
