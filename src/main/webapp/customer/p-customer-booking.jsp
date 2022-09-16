<%-- 
    Document   : p-customer-booking
    Created on : Sep 14, 2022, 11:48:36 PM
    Author     : asel
--%>

<%@page import="service.GocheetahWebService"%>
<%@page import="service.GocheetahWebService_Service"%>
<%@page import="service.Destination"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
//            GocheetahWebService_Service service = new GocheetahWebService_Service();
//            GocheetahWebService proxy = service.getGocheetahWebServicePort();
//            RequestDispatcher dispatcher = null;
//            
//            String branch = session.getAttribute("Bbranch").toString();
//            
//            String pickup = request.getParameter("pickup");
//            String drop = request.getParameter("drop");
//            int distance = 0;
//            
//            if (pickup != null && drop != null) {
//                for (Destination ds : proxy.getDestiations(branch)) {
//                    if (ds.getDDrop().equals(drop) && ds.getDPickup().equals(pickup)) {
//                        distance = ds.getDistance();
//                    }
//                }
//            }
String customerName = session.getAttribute("BcustomerName").toString();
            out.print(customerName);
        %>
    </body>
</html>
