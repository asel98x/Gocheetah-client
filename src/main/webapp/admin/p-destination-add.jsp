<%-- 
    Document   : p-destination-add
    Created on : Sep 12, 2022, 7:49:30 PM
    Author     : asel
--%>

<%@page import="service.Destination"%>
<%@page import="service.GocheetahWebService_Service"%>
<%@page import="service.GocheetahWebService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    GocheetahWebService_Service service = new GocheetahWebService_Service();
    GocheetahWebService proxy = service.getGocheetahWebServicePort();
    RequestDispatcher dispatcher = null;

    Destination ds = new Destination();
    String vehicle = request.getParameter("VehicleList");
    String branch = request.getParameter("branchList");
    String pickup = request.getParameter("pickup");
    String drop = request.getParameter("drop");
    Float price = Float.parseFloat(request.getParameter("total"));

    if (true) {
        try {
            ds.setDVehicle(vehicle);
            ds.setDBranch(branch);
            ds.setDPickup(pickup);
            ds.setDDrop(drop);
            ds.setDPrice(price);

            proxy.addDstination(ds);
            response.sendRedirect("admin-destination.jsp");

        } catch (Exception e) {
            System.out.println(e);
        }
    }
%>
