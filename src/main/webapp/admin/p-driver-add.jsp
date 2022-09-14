<%-- 
    Document   : p-driver-add
    Created on : Sep 7, 2022, 9:27:41 PM
    Author     : asel
--%>

<%@page import="java.util.Base64.Encoder"%>
<%@page import="java.util.Base64"%>
<%@page import="java.util.Base64"%>
<%@page import="service.Driver"%>
<%@page import="service.GocheetahWebService"%>
<%@page import="service.GocheetahWebService_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    GocheetahWebService_Service service = new GocheetahWebService_Service();
    GocheetahWebService proxy = service.getGocheetahWebServicePort();
    RequestDispatcher dispatcher = null;

    Driver dr = new Driver();
    String name = request.getParameter("driverName");
    String address = request.getParameter("driverAddress");
    int mobile = Integer.parseInt(request.getParameter("driverMobile"));
    String nic = request.getParameter("driverNIC");
    String licence = request.getParameter("Licence");
    String DOB = request.getParameter("driverDOB");
    int age = Integer.parseInt(request.getParameter("driverAge"));
    String email = request.getParameter("driverEmail");
    String branch = request.getParameter("branch");
    String password = request.getParameter("password");

    Encoder encoder = Base64.getEncoder();
    String encryptedPword = encoder.encodeToString(password.getBytes());

    if (true) {
        try {
            dr.setName(name);
            dr.setAddress(address);
            dr.setMobile(mobile);
            dr.setNic(nic);
            dr.setLicence(licence);
            dr.setDob(DOB);
            dr.setAge(age);
            dr.setEmail(email);
            dr.setPassword(encryptedPword);
            dr.setBranch(branch);
            proxy.addDriver(dr);
            response.sendRedirect("../admin-users.jsp#tab-2");
            
        } catch (Exception e) {
        System.out.println(e);
        }
    }

%>
