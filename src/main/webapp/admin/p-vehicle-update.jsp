<%-- 
    Document   : p-vehicle-update
    Created on : Sep 9, 2022, 8:43:24 PM
    Author     : asel
--%>

<%@page import="service.Vehicle"%>
<%@page import="service.GocheetahWebService"%>
<%@page import="service.GocheetahWebService_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    GocheetahWebService_Service service = new GocheetahWebService_Service();
    GocheetahWebService proxy = service.getGocheetahWebServicePort();
    RequestDispatcher dispatcher = null;
    
    Vehicle vh = new Vehicle();
    
    int vehiCatID = Integer.parseInt(request.getParameter("vehiIDTXT"));
    String chassi = request.getParameter("chasiTxt");
    String noPlate = request.getParameter("noPlateTxt");
    String vehivleCat = request.getParameter("VehicleCategortSelect");
    String vehiName = request.getParameter("VehicleName");
    String seat = request.getParameter("seat");
    String type = request.getParameter("type");
    String branch = request.getParameter("branch");
    String driverID = request.getParameter("driverIDTXT");
    String availability = request.getParameter("availability");
    
    vh.setVehicleId(vehiCatID);
    vh.setChasiNo(chassi);
    vh.setNoPlate(noPlate);
    vh.setCategory(vehivleCat);
    vh.setType(type);
    vh.setPassengers(seat);
    vh.setVehicleName(vehiName);
    vh.setBranch(branch);
    vh.setDriver(driverID);
    vh.setAvailability(availability);
    
    if (true) {
        try {
            System.out.println(chassi);
            System.out.println(noPlate);
            proxy.updateVehicle(vh);
            response.sendRedirect("../admin-others2.jsp#tab-3");
        } catch (Exception e) {
            System.out.println(e);
        }

    }
    
%>
