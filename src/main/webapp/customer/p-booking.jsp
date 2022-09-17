<%-- 
    Document   : p-booking
    Created on : Sep 17, 2022, 2:42:01 AM
    Author     : asel
--%>

<%@page import="java.sql.Time"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="service.Booking"%>
<%@page import="service.GocheetahWebService_Service"%>
<%@page import="service.GocheetahWebService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("mobile") == null) {
        response.sendRedirect("customer-login.jsp");
    }
    String id = session.getAttribute("id").toString();
    String name = session.getAttribute("name").toString();
    String address = session.getAttribute("address").toString();
    String mobile = session.getAttribute("mobile").toString();
    String email = session.getAttribute("email").toString();

    GocheetahWebService_Service service = new GocheetahWebService_Service();
    GocheetahWebService proxy = service.getGocheetahWebServicePort();
    RequestDispatcher dispatcher = null;

    Booking bk = new Booking();
    String branch = session.getAttribute("Bbranch").toString();
    String pickup = session.getAttribute("Bpickup").toString();
    String drop = session.getAttribute("Bdrop").toString();
    float total = Float.parseFloat(session.getAttribute("Btotal").toString());
    int vehicleID = Integer.parseInt(session.getAttribute("vehiID").toString());
    int driverID = Integer.parseInt(session.getAttribute("driverID").toString());
    String availability = session.getAttribute("Bavailability").toString();

    String customerID = request.getParameter(id);

    Date today = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat timeFormat = new SimpleDateFormat("hh:mm:ss a");
    String date = dateFormat.format(today);
    String time = timeFormat.format(today);

    if (availability.equals("Available")) {
        try {
            bk.setCustomerId(id);
            bk.setBranch(branch);
            bk.setPickup(pickup);
            bk.setDrop(drop);
            bk.setPrice(total);
            bk.setVehicleId(vehicleID);
            bk.setDriverId(driverID);
            bk.setDate(date);
            bk.setTime(time);
            proxy.addBooking(bk);
            //response.sendRedirect("customer-panel_1.jsp");
            dispatcher = request.getRequestDispatcher("customer-panel_1.jsp");
            request.setAttribute("status", "success");

        } catch (Exception e) {

        }
    } else {
        dispatcher = request.getRequestDispatcher("customer-panel_1.jsp");
        request.setAttribute("status", "failed");
    }
    dispatcher.forward(request, response);
%>
