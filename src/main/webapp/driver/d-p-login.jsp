<%-- 
    Document   : d-p-login
    Created on : Sep 2, 2022, 4:57:20 PM
    Author     : asel
--%>

<%@page import="service.Driver"%>
<%@page import="java.util.Base64.Encoder"%>
<%@page import="java.util.Base64"%>
<%@page import="service.GocheetahWebService"%>
<%@page import="service.GocheetahWebService_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    GocheetahWebService_Service service = new GocheetahWebService_Service();
    GocheetahWebService proxy = service.getGocheetahWebServicePort();
    RequestDispatcher dispatcher = null;

    Driver dr = new Driver();
    String NIC = request.getParameter("driverNIC");
    String password = request.getParameter("password");

    Encoder encoder = Base64.getEncoder();
    String encryptedPword = encoder.encodeToString(password.getBytes());

    dr.setNic(NIC);
    dr.setPassword(encryptedPword);

    if (true) {
        try {
            if (proxy.driverLogin(dr)) {
                session.setAttribute("NIC", NIC);
                response.sendRedirect("driver-panel.jsp");
            } else {
                System.out.println("error");
                dispatcher = request.getRequestDispatcher("driver-login.jsp");
                request.setAttribute("status", "failed");
            }
            dispatcher.forward(request, response);

        } catch (Exception e) {
            System.out.println(e);
        }

    }
%>

