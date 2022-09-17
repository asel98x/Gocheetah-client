<%-- 
    Document   : a-p-login
    Created on : Sep 2, 2022, 2:36:36 PM
    Author     : asel
--%>

<%@page import="java.util.Base64.Encoder"%>
<%@page import="java.util.Base64"%>
<%@page import="service.Admin"%>
<%@page import="service.GocheetahWebService"%>
<%@page import="service.GocheetahWebService_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    GocheetahWebService_Service service = new GocheetahWebService_Service();
    GocheetahWebService proxy = service.getGocheetahWebServicePort();
    RequestDispatcher dispatcher = null;

    Admin ad = new Admin();
    String email = request.getParameter("adminEmail");
    String password = request.getParameter("password");

    Encoder encoder = Base64.getEncoder();
    String encryptedPword = encoder.encodeToString(password.getBytes());

    ad.setEmail(email);
    ad.setPassword(encryptedPword);

    if (true) {
        try {ad = proxy.adminLogin(ad);
            if (ad!=null) {
                session.setAttribute("email", email);
                session.setAttribute("id", ad.getAdminId());
                session.setAttribute("name", ad.getName());
                //response.sendRedirect("admin-panel.jsp");
                dispatcher = request.getRequestDispatcher("admin-panel.jsp");
                //request.setAttribute("status", "success");
            } else {
                System.out.println("error");
                dispatcher = request.getRequestDispatcher("admin-login.jsp");
                request.setAttribute("status", "failed");
            }
            dispatcher.forward(request, response);

        } catch (Exception e) {
            System.out.println(e);
        }

    }


%>
