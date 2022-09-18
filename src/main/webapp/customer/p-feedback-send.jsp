<%-- 
    Document   : p-feedback-send
    Created on : Sep 17, 2022, 9:58:34 PM
    Author     : asel
--%>

<%@page import="service.Booking"%>
<%@page import="service.Feedback"%>
<%@page import="service.GocheetahWebService"%>
<%@page import="service.GocheetahWebService_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    GocheetahWebService_Service service = new GocheetahWebService_Service();
    GocheetahWebService proxy = service.getGocheetahWebServicePort();
    RequestDispatcher dispatcher = null;

    Feedback fd = new Feedback();
    Booking bk = new Booking();
    String id = request.getParameter("orderID");
    String customerId = session.getAttribute("id").toString();
    //String driverID = session.getAttribute("BdriverID").toString();
    String title = request.getParameter("title");
    String feedback = request.getParameter("feedback");
    
    bk = proxy.getBookingDriver(id);
    int driverID = bk.getDriverId();
    //String s=String.valueOf(driverID);
    System.out.println(id);
    System.out.println(customerId);
    System.out.println(driverID);
    System.out.println(title);
    System.out.println(feedback);
    
    if (true) {
        try {

            fd.setOrderId(id);
            fd.setCustomerId(customerId);
            fd.setDriverId(driverID);
            fd.setTitle(title);
            fd.setFeedback(feedback);
            
            proxy.customerFeedback(fd);
            response.sendRedirect("customer-orders.jsp");
//            dispatcher = request.getRequestDispatcher("../admin-users.jsp");
//                request.setAttribute("status", "success");
//                dispatcher.forward(request, response);
        } catch (Exception e) {
        }
    } else {
    }


%>
