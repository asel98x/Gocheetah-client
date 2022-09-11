<%-- 
    Document   : p-branch-update
    Created on : Sep 4, 2022, 9:04:13 PM
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
    int branchID = Integer.parseInt(request.getParameter("brnchID"));
    String location = request.getParameter("brnchLocation");
    
    bc.setBranchId(branchID);
    bc.setLocation(location);
    

    if (true) {
        try {
            System.out.println(branchID);
            System.out.println(location);
            proxy.updatedBranch(bc);
            response.sendRedirect("../admin-others2.jsp#tab-1");
            System.out.println("work");
        } catch (Exception e) {
            System.out.println(e);
        }
    }
%>
