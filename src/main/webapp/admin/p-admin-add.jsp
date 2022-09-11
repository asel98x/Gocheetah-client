<%-- 
    Document   : p-admin-add
    Created on : Sep 7, 2022, 8:07:53 PM
    Author     : asel
--%>

<%@page import="java.util.Base64.Encoder"%>
<%@page import="java.util.Base64"%>
<%@page import="service.Admin"%>
<%@page import="service.GocheetahWebService_Service"%>
<%@page import="service.GocheetahWebService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    GocheetahWebService_Service service = new GocheetahWebService_Service();
    GocheetahWebService proxy = service.getGocheetahWebServicePort();
    RequestDispatcher dispatcher = null;

    Admin ad = new Admin();
    String name = request.getParameter("adminName");
    String address = request.getParameter("adminAddress");
    int mobile = Integer.parseInt(request.getParameter("adminMobile"));
    String nic = request.getParameter("adminNIC");
    String DOB = request.getParameter("adminDOB");
    int age = Integer.parseInt(request.getParameter("adminAge"));
    String email = request.getParameter("adminEmail");
    String password = request.getParameter("adminPassword");
    String branch = request.getParameter("AdminBranch");
    String type = request.getParameter("AdminType");

    Encoder encoder = Base64.getEncoder();
    String encryptedPword = encoder.encodeToString(password.getBytes());

    if (true) {
        try {

            ad.setName(name);
            ad.setAddress(address);
            ad.setMobile(mobile);
            ad.setNic(nic);
            ad.setDob(DOB);
            ad.setAge(age);
            ad.setEmail(email);
            ad.setPassword(encryptedPword);
            ad.setBranch(branch);
            ad.setType(type);
            proxy.addAdmin(ad);
            response.sendRedirect("../admin-users.jsp#tab-1");
        } catch (Exception e) {
        }
    } else {
    }
    
%>
