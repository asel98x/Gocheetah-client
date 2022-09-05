<%-- 
    Document   : p-vehicle-delete
    Created on : Sep 6, 2022, 12:07:39 AM
    Author     : asel
--%>

<%@page import="service.Vehicle"%>
<%@page import="service.GocheetahWebService_Service"%>
<%@page import="service.GocheetahWebService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    GocheetahWebService_Service service = new GocheetahWebService_Service();
    GocheetahWebService proxy = service.getGocheetahWebServicePort();
    RequestDispatcher dispatcher = null;
    
    Vehicle vh = new Vehicle();
    int vehicleID = Integer.parseInt(request.getParameter("VehicleIdDeleteTxt"));
    vh.setVehicleId(vehicleID);
    
    if(true){
    try {
            System.out.println(vehicleID);
            proxy.deleteVehicle(vh);
            response.sendRedirect("../admin-others2.jsp");
        } catch (Exception e) {
        System.out.println(e);
        }
    }
%>
