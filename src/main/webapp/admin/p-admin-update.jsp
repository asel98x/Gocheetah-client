<%-- 
    Document   : p-admin-update
    Created on : Sep 9, 2022, 9:30:32 PM
    Author     : asel
--%>

<%@page import="java.util.Base64.Encoder"%>
<%@page import="java.util.Base64"%>
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
    int adminID = Integer.parseInt(request.getParameter("adminID"));
    String name = request.getParameter("adminName");
    String address = request.getParameter("adminAddress");
    int mobile = Integer.parseInt(request.getParameter("adminMobile"));
    String nic = request.getParameter("adminNIC");
    String dob = request.getParameter("adminDOB");
    int age = Integer.parseInt(request.getParameter("adminAge"));
    String email = request.getParameter("adminEmail");
    String password = request.getParameter("password");
    String branch = request.getParameter("adminBranch");
    String type = request.getParameter("type");

    Encoder encoder = Base64.getEncoder();
    String encryptedPword = encoder.encodeToString(password.getBytes());

    ad.setAdminId(adminID);
    ad.setName(name);
    ad.setAddress(address);
    ad.setMobile(mobile);
    ad.setNic(nic);
    ad.setDob(dob);
    ad.setAge(age);
    ad.setEmail(email);
    ad.setPassword(encryptedPword);
    ad.setBranch(branch);
    ad.setType(type);

    if (true) {
        try {
            proxy.updateAdmin(ad);
            response.sendRedirect("../admin-users.jsp#tab-1");
        } catch (Exception e) {
            System.out.println(e);
        }

    }
%>
