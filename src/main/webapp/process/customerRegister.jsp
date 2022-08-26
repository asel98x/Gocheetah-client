<%-- 
    Document   : customerRegister
    Created on : Aug 25, 2022, 12:59:02 AM
    Author     : asel
--%>

<%@page import="java.util.Base64.Decoder"%>
<%@page import="java.util.Base64"%>
<%@page import="java.util.Base64.Encoder"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="service.Customer"%>
<%@page import="service.GocheetahWebService"%>
<%@page import="service.GocheetahWebService_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>customer Registor</title><!-- comment -->
</head>
<body>
    <%
    
    try {
            GocheetahWebService_Service service = new GocheetahWebService_Service();
            GocheetahWebService proxy = service.getGocheetahWebServicePort();

            Customer cs = new Customer();
            String name = request.getParameter("customerNAme");
            String address = request.getParameter("customerAddress");
            String email = request.getParameter("customerEmail");
            int mobile = Integer.parseInt(request.getParameter("customerMobile"));
            String nic = request.getParameter("customerNIC");
            String password = request.getParameter("customerPassword");
          
            Encoder encoder = Base64.getEncoder();
            String encryptedPword = encoder.encodeToString(password.getBytes());
            Decoder decoder = Base64.getDecoder();
            byte[] bytes = decoder.decode(encryptedPword);
            
            cs.setName(name);
            cs.setAddress(address);
            cs.setEmail(email);
            cs.setMobile(mobile);
            cs.setNic(nic);
            cs.setPassword(encryptedPword);
            
           
        

            proxy.customerSignup(cs);
            response.sendRedirect("../customer/customer-signup.jsp");
            System.out.println("customer signup is working");
            
            
           
            System.out.println("encrpted code - " + encryptedPword);
            System.out.println("Decrpted code - " + new String(bytes));
            
            
            
        } catch (Exception e) {
            System.out.println("Error - " + e);
        }
    

%>
</body>
</html>
    

