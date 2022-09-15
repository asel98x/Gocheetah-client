<%-- 
    Document   : p-destination-update
    Created on : Sep 12, 2022, 9:31:47 PM
    Author     : asel
--%>

<%@page import="service.GocheetahWebService"%>
<%@page import="service.GocheetahWebService_Service"%>
<%@page import="service.Destination"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    GocheetahWebService_Service service = new GocheetahWebService_Service();
    GocheetahWebService proxy = service.getGocheetahWebServicePort();
    RequestDispatcher dispatcher = null;

    Destination ds = new Destination();
    int ID = Integer.parseInt(request.getParameter("ID"));
    String branch = request.getParameter("branch");
    String pickup = request.getParameter("pickup");
    String drop = request.getParameter("drop");
    int price = Integer.parseInt(request.getParameter("price"));

    ds.setDestinationID(ID);
    ds.setDBranch(branch);
    ds.setDPickup(pickup);
    ds.setDDrop(drop);
    ds.setDistance(price);

    if (true) {
        try {
            proxy.updateDstination(ds);
            response.sendRedirect("admin-destination.jsp");
        } catch (Exception e) {
            System.out.println(e);
        }

    }

%>
