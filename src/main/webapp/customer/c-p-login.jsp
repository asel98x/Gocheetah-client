<%-- 
    Document   : c-p-login
    Created on : Sep 1, 2022, 5:14:38 PM
    Author     : asel
--%>

<%@page import="java.util.Base64.Decoder"%>
<%@page import="java.util.Base64.Encoder"%>
<%@page import="java.util.Base64"%>
<%@page import="service.Customer"%>
<%@page import="service.GocheetahWebService"%>
<%@page import="service.GocheetahWebService_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            GocheetahWebService_Service service =   new GocheetahWebService_Service();
            GocheetahWebService proxy = service.getGocheetahWebServicePort();
            RequestDispatcher dispatcher = null;
    
            Customer cs = new Customer();
            int mobile = Integer.parseInt(request.getParameter("customerMobile"));
            String password = request.getParameter("customerPword");
    
            Encoder encoder = Base64.getEncoder();
            String encryptedPword = encoder.encodeToString(password.getBytes());
//            Decoder decoder = Base64.getDecoder();
//            byte[] bytes = decoder.decode(encryptedPword);
            //sSystem.out.println("Decrpted code - " + new String(bytes));
            cs.setMobile(mobile);
            cs.setPassword(encryptedPword);
    
            if(true){
                try {
                        cs = proxy.customerLogin(cs);
                        if(cs != null){
                            System.out.println("work");
                            session.setAttribute("mobile", mobile);
                            session.setAttribute("id", cs.getCustomerId());
                            session.setAttribute("name", cs.getName());
                            session.setAttribute("address", cs.getAddress());
                            session.setAttribute("mobile", cs.getMobile());
                            session.setAttribute("email", cs.getEmail());
                            response.sendRedirect("customer-panel_1.jsp");
                            
                        }else{
                            System.out.println("error");
                            dispatcher = request.getRequestDispatcher("customer-login.jsp");
                            request.setAttribute("status", "failed");
                        }
                        dispatcher.forward(request, response);
                        
                    } catch (Exception e) {
                        System.out.println(e);
                    }
            }
            
        %>
        
    </body>
</html>
