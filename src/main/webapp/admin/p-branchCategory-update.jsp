<%-- 
    Document   : p-branchCategory-update
    Created on : Sep 5, 2022, 9:05:40 PM
    Author     : asel
--%>

<%@page import="service.GocheetahWebService_Service"%>
<%@page import="service.GocheetahWebService"%>
<%@page import="service.VehicleCat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    GocheetahWebService_Service service = new GocheetahWebService_Service();
    GocheetahWebService proxy = service.getGocheetahWebServicePort();
    RequestDispatcher dispatcher = null;

    VehicleCat vc = new VehicleCat();
    int vehiCatID = Integer.parseInt(request.getParameter("vehicleCategoryIDT"));
    String category = request.getParameter("vehicleCategoryT");

    vc.setVehicleCatId(vehiCatID);
    vc.setVehicleCategory(category);

    if (true) {
        try {
            System.out.println(vehiCatID);
            System.out.println(category);
            proxy.updatedVehicleCategory(vc);
            response.sendRedirect("../admin-others2.jsp");
        } catch (Exception e) {
            System.out.println(e);
        }

    }
%>
