<%-- 
    Document   : customerRegister
    Created on : Aug 25, 2022, 12:59:02 AM
    Author     : asel
--%>

<%@page import="service.Customer"%>
<%@page import="service.GocheetahWebService"%>
<%@page import="service.GocheetahWebService_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    GocheetahWebService_Service service = new GocheetahWebService_Service();
    GocheetahWebService proxy = service.getGocheetahWebServicePort();
    
    Customer cs = new Customer();
    
    cs.setName(request.getParameter("customerNAme"));
    cs.setAddress(request.getParameter("customerAddress"));
    cs.setEmail(request.getParameter("customerEmail"));
    cs.setMobile(Integer.parseInt(request.getParameter("customerMobile")));
    cs.setNic(request.getParameter("customerNIC"));
    cs.setPassword(request.getParameter("customerPassword"));
    
    proxy.customerSignup(cs);
    response.sendRedirect("customer-signup.jsp");
%>
