<%-- 
    Document   : p-vehicleCategory-delete
    Created on : Sep 5, 2022, 9:42:25 PM
    Author     : asel
--%>

<%@page import="service.VehicleCat"%>
<%@page import="service.GocheetahWebService"%>
<%@page import="service.GocheetahWebService_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    GocheetahWebService_Service service = new GocheetahWebService_Service();
    GocheetahWebService proxy = service.getGocheetahWebServicePort();
    RequestDispatcher dispatcher = null;

    VehicleCat vc = new VehicleCat();
    int VehicleCatID = Integer.parseInt(request.getParameter("vehicleCategoryIDT"));
    vc.setVehicleCatId(VehicleCatID);

    if (true) {
        try {
            System.out.println(VehicleCatID);
            proxy.deleteVehicleCategory(vc);
            response.sendRedirect("../admin-others2.jsp");
        } catch (Exception e) {
            System.out.println(e);
        }
    }


%>
