<%-- 
    Document   : p-customer-delete
    Created on : Sep 10, 2022, 8:17:08 PM
    Author     : asel
--%>

<%@page import="service.Customer"%>
<%@page import="service.GocheetahWebService"%>
<%@page import="service.GocheetahWebService_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    GocheetahWebService_Service service = new GocheetahWebService_Service();
    GocheetahWebService proxy = service.getGocheetahWebServicePort();
    RequestDispatcher dispatcher = null;

    Customer cs = new Customer();
    int id = Integer.parseInt(request.getParameter("ID"));
    cs.setCustomerId(id);

    if (true) {
        try {
            proxy.deleteCustomer(cs);
            response.sendRedirect("../admin-users.jsp#tab-3");
        } catch (Exception e) {
            System.out.println(e);
        }
    }
%>
