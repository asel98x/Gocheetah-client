<%-- 
    Document   : p-driver-delete
    Created on : Sep 10, 2022, 3:58:06 PM
    Author     : asel
--%>

<%@page import="service.Driver"%>
<%@page import="service.GocheetahWebService"%>
<%@page import="service.GocheetahWebService_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    GocheetahWebService_Service service = new GocheetahWebService_Service();
    GocheetahWebService proxy = service.getGocheetahWebServicePort();
    RequestDispatcher dispatcher = null;

    Driver dr = new Driver();
    int id = Integer.parseInt(request.getParameter("ID"));
    dr.setDriverID(id);

    if (true) {
        try {
            proxy.deleteDriver(dr);
            response.sendRedirect("../admin-users.jsp#tab-2");
        } catch (Exception e) {
            System.out.println(e);
        }
    }
%>
