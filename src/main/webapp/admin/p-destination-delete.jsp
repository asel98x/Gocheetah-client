<%-- 
    Document   : p-destination-delete
    Created on : Sep 12, 2022, 9:32:00 PM
    Author     : asel
--%>

<%@page import="service.Destination"%>
<%@page import="service.GocheetahWebService"%>
<%@page import="service.GocheetahWebService_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    GocheetahWebService_Service service = new GocheetahWebService_Service();
    GocheetahWebService proxy = service.getGocheetahWebServicePort();
    RequestDispatcher dispatcher = null;

    Destination ds = new Destination();
    int id = Integer.parseInt(request.getParameter("ID"));
    ds.setDestinationID(id);

    if (true) {
        try {
            proxy.deleteDstination(ds);
            response.sendRedirect("admin-destination.jsp");
        } catch (Exception e) {
            System.out.println(e);
        }
    }
%>
