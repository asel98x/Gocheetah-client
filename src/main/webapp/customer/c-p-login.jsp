<%-- 
    Document   : customerLogin
    Created on : Aug 31, 2022, 6:34:25 PM
    Author     : asel
--%>


<%@page import="java.util.Base64.Encoder"%>
<%@page import="java.util.Base64.Encoder"%>
<%@page import="java.util.Base64.Decoder"%>
<%@page import="java.util.Base64"%>
<%@page import="service.Customer"%>
<%@page import="service.GocheetahWebService"%>
<%@page import="service.GocheetahWebService_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    GocheetahWebService_Service service =   new GocheetahWebService_Service();
    GocheetahWebService proxy = service.getGocheetahWebServicePort();
    RequestDispatcher dispatcher = null;
    
    Customer cs = new Customer();
    String mobile = request.getParameter("customerMobile");
    String password = request.getParameter("customerPword");
    
//    Encoder encoder = Base64.getEncoder();
//    String encryptedPword = encoder.encodeToString(password.getBytes());
//    Decoder decoder = Base64.getDecoder();
//    byte[] bytes = decoder.decode(encryptedPword);
//    System.out.println("Decrpted code - " + new String(bytes));

    
    
    if(password.equals("1234")){
    response.sendRedirect("customer-login.jsp");
    System.out.println("work");
        //proxy.customerLogin(cs);
//        dispatcher = request.getRequestDispatcher("../customer/customer-login.jsp");
//        request.setAttribute("status2","success");    
        
        
    }else{
        System.out.println("eror");
//        request.setAttribute("status","success");    
//        dispatcher = request.getRequestDispatcher("../customer/customer-login.jsp");
//        proxy.customerLogin(cs);
    }
    
        //dispatcher.forward(request, response);
%>
