<%-- 
    Document   : p-driver-update
    Created on : Sep 10, 2022, 3:25:03 PM
    Author     : asel
--%>

<%@page import="java.util.Base64.Decoder"%>
<%@page import="java.util.Base64.Encoder"%>
<%@page import="java.util.Base64"%>
<%@page import="java.util.Base64"%>
<%@page import="service.Driver"%>
<%@page import="service.GocheetahWebService_Service"%>
<%@page import="service.GocheetahWebService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    GocheetahWebService_Service service = new GocheetahWebService_Service();
    GocheetahWebService proxy = service.getGocheetahWebServicePort();
    RequestDispatcher dispatcher = null;
    
    Driver dr = new Driver();
    int ID = Integer.parseInt(request.getParameter("ID"));
    String name = request.getParameter("Drivername");
    String address = request.getParameter("driverAddress");
    int mobile = Integer.parseInt(request.getParameter("driberMobile"));
    String nic = request.getParameter("driverNIC");
    String Licence = request.getParameter("Licence");
    String dob = request.getParameter("driverDOB");
    int age = Integer.parseInt(request.getParameter("driverAge"));
    String email = request.getParameter("driverEmail");
    String vehicle = request.getParameter("driverVehicle");
    String branch = request.getParameter("branch");
    String password = request.getParameter("password");
    
    Encoder encoder = Base64.getEncoder();
    String encryptedPword = encoder.encodeToString(password.getBytes());
    Decoder decorder = Base64.getDecoder();
    byte[] bytes = decorder.decode(encryptedPword);
    
    System.out.println("driver password"+new String (bytes));
    dr.setDriverID(ID);
    dr.setName(name);
    dr.setAddress(address);
    dr.setMobile(mobile);
    dr.setNic(nic);
    dr.setLicence(Licence);
    dr.setDob(dob);
    dr.setAge(age);
    dr.setEmail(email);
    dr.setVehicle(vehicle);
    dr.setBranch(branch);
    dr.setPassword(new String (bytes));
    
    if (true) {
        try {
            proxy.updateDriver(dr);
            response.sendRedirect("../admin-users.jsp#tab-2");
        } catch (Exception e) {
            System.out.println(e);
        }

    }
    
    
%>

