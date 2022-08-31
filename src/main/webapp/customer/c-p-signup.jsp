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
            
        
        GocheetahWebService_Service service = new GocheetahWebService_Service();
            GocheetahWebService proxy = service.getGocheetahWebServicePort();
            RequestDispatcher dispatcher = null;
            
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
            
        if(name.equals("") || !address.equals("") || !email.equals("") || !nic.equals("") || !password.equals("")){
            
            //System.out.println("good");
            try {
                    cs.setName(name);
                    cs.setAddress(address);
                    cs.setEmail(email);
                    cs.setMobile(mobile);
                    cs.setNic(nic);
                    cs.setPassword(encryptedPword);
            
                    
                    
                    proxy.customerSignup(cs);
                    dispatcher = request.getRequestDispatcher("customer-login.jsp");
                    request.setAttribute("status","success");
                    
                } catch (Exception e) {
                System.out.println(e);
                }
            
        }else{
            dispatcher = request.getRequestDispatcher("customer-signup.jsp");
            
            request.setAttribute("status", "failed");
        }
            dispatcher.forward(request, response);
    
        
//        try {
//            
//            
//            cs.setName(name);
//            cs.setAddress(address);
//            cs.setEmail(email);
//            cs.setMobile(mobile);
//            cs.setNic(nic);
//            cs.setPassword(encryptedPword);
//            
//           dispatcher = request.getRequestDispatcher("../customer/customer-signup.jsp");
//        if(name.equals("asel")){
//        
//           request.setAttribute("status","success");
//           proxy.customerSignup(cs);
//           
//           //response.sendRedirect("../customer/customer-signup.jsp");
//        }else{
//            request.setAttribute("status", "failed");
//        }
//    dispatcher.forward(request, response);
//            
//           
//            
//            
//            
//        } catch (Exception e) {
//            System.out.println("Error - " + e);
//        }
//    

%>
</body>

</html>
    

