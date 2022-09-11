<%-- 
    Document   : p-branch-add
    Created on : Sep 2, 2022, 8:14:57 PM
    Author     : asel
--%>

<%@page import="service.BranchCategory"%>
<%@page import="service.GocheetahWebService"%>
<%@page import="service.GocheetahWebService_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    GocheetahWebService_Service service = new GocheetahWebService_Service();
    GocheetahWebService proxy = service.getGocheetahWebServicePort();
    RequestDispatcher dispatcher = null;

   
    BranchCategory bc = new BranchCategory();
    String location = request.getParameter("branchName");

    if (true) {
        try {
            System.out.println(location);
            bc.setLocation(location);
            proxy.addBranch(bc);
            response.sendRedirect("../admin-others2.jsp#tab-1");       
            System.out.println("work");
        } catch (Exception e) {
            System.out.println(e);
        }

    } else {
        System.out.println("else error");
    }
//    if (true) {
//        try {
//        System.out.println("work");
//            bc.setLocation(location);
//            proxy.addBranch(bc);
//            response.sendRedirect("../admin-others.jsp");
//            //dispatcher = request.getRequestDispatcher("../admin-others.jsp");
//            //request.setAttribute("status", "success");
//        } catch (Exception e) {
//            System.out.println(e);
//        }
//    } else {
//    System.out.println("error");
//        //dispatcher = request.getRequestDispatcher("../admin-others.jsp");
//        //request.setAttribute("status", "failed");
//    }
//    dispatcher.forward(request, response);
%>
