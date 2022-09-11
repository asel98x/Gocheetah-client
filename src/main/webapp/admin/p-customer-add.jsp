<%-- 
    Document   : p-customer-add
    Created on : Sep 7, 2022, 10:25:01 PM
    Author     : asel
--%>

<%@page import="java.util.Base64.Encoder"%>
<%@page import="java.util.Base64"%>
<%@page import="java.util.Base64"%>
<%@page import="service.Customer"%>
<%@page import="service.GocheetahWebService_Service"%>
<%@page import="service.GocheetahWebService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    GocheetahWebService_Service service = new GocheetahWebService_Service();
    GocheetahWebService proxy = service.getGocheetahWebServicePort();
    RequestDispatcher dispatcher = null;
    
    Customer cs = new Customer();
    String name = request.getParameter("customerName");
    String address = request.getParameter("customerAddress");
    int mobile = Integer.parseInt(request.getParameter("customerMobile"));
    String nic = request.getParameter("customerNIC");
    String email = request.getParameter("customerEmail");
    String branch = request.getParameter("branch");
    String password = request.getParameter("password");
    
    
    Encoder encoder = Base64.getEncoder();
    String encryptedPword = encoder.encodeToString(password.getBytes());
    
    System.out.println(name);
    System.out.println(address);
    System.out.println(mobile);
    System.out.println(nic);
    System.out.println(email);
    System.out.println(branch);
    System.out.println(password);
    
    if (true) {
        try {
            cs.setName(name);
            cs.setAddress(address);
            cs.setMobile(mobile);
            cs.setNic(nic);
            cs.setEmail(email);
            cs.setBranch(branch);
            cs.setPassword(encryptedPword);
            
            proxy.customerSignup(cs);
            response.sendRedirect("../admin-users.jsp#tab-3");
            
        } catch (Exception e) {
        System.out.println(e);
        }
    }
%>