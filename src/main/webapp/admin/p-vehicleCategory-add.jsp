<%-- 
    Document   : p-vehicleCategory-add
    Created on : Sep 4, 2022, 10:49:16 PM
    Author     : asel
--%>

<%@page import="service.Person"%>
<%@page import="service.VehicleCat"%>
<%@page import="service.GocheetahWebService"%>
<%@page import="service.GocheetahWebService_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    GocheetahWebService_Service service = new GocheetahWebService_Service();
    GocheetahWebService proxy = service.getGocheetahWebServicePort();
    RequestDispatcher dispatcher = null;

    VehicleCat vc = new VehicleCat();
    String category = request.getParameter("vehiCat");

    if (true) {
        try {
            System.out.println(category);
            vc.setVehicleCategory(category);
            proxy.addVehicleCategory(vc);
            response.sendRedirect("../admin-others2.jsp"); 
        } catch (Exception e) {
            System.out.println(e);
        }

    } else {
        System.out.println("else error");
    }
%>
