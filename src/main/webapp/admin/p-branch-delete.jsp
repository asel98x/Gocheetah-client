<%-- 
    Document   : p-branch-delete
    Created on : Sep 5, 2022, 8:04:16 PM
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
    int branchID = Integer.parseInt(request.getParameter("brnchIDDelete"));
    bc.setBranchId(branchID);
    
    if(true){
    try {
            System.out.println(branchID);
            proxy.deleteBranch(bc);
            response.sendRedirect("../admin-others2.jsp");
        } catch (Exception e) {
        System.out.println(e);
        }
    }
%>
