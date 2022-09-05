<%-- 
    Document   : p-vehicle-add
    Created on : Sep 5, 2022, 5:19:06 PM
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
    String chassi = request.getParameter("chassisNo");
    String noPlate = request.getParameter("numberPlate");
    String category = request.getParameter("category");
    String branch = request.getParameter("branchlist");
    String driverID = request.getParameter("driverID");

    if (true) {
        try {
            
            vh.setChasiNo(chassi);
            vh.setNoPlate(noPlate);
            vh.setCategory(category);
            vh.setBranch(branch);
            vh.setDriver(driverID);
            proxy.addVehicle(vh);
            response.sendRedirect("../admin-others2.jsp");
        } catch (Exception e) {
        }
    }

%>
