<%-- 
    Document   : p-customer-update
    Created on : Sep 10, 2022, 7:48:13 PM
    Author     : asel
--%>

<%@page import="java.util.Base64.Encoder"%>
<%@page import="java.util.Base64"%>
<%@page import="service.Customer"%>
<%@page import="service.GocheetahWebService"%>
<%@page import="service.GocheetahWebService_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    GocheetahWebService_Service service = new GocheetahWebService_Service();
    GocheetahWebService proxy = service.getGocheetahWebServicePort();
    RequestDispatcher dispatcher = null;

    Customer cs = new Customer();
    int ID = Integer.parseInt(request.getParameter("ID"));
    String name = request.getParameter("custmerName");
    String address = request.getParameter("customerAddress");
    int mobile = Integer.parseInt(request.getParameter("custmerMobile"));
    String nic = request.getParameter("customerNic");
    String email = request.getParameter("customerEmail");
    String branch = request.getParameter("customerBranch");
    String password = request.getParameter("password");

    Encoder encoder = Base64.getEncoder();
    String encryptedPword = encoder.encodeToString(password.getBytes());

    cs.setCustomerId(ID);
    cs.setName(name);
    cs.setAddress(address);
    cs.setMobile(mobile);
    cs.setNic(nic);
    cs.setEmail(email);
    cs.setPassword(encryptedPword);
    cs.setBranch(branch);

    if (true) {
        try {
            proxy.updatedCustomer(cs);
            response.sendRedirect("../admin-users.jsp#tab-3");
        } catch (Exception e) {
            System.out.println(e);
        }

    }
%>
