<%-- 
    Document   : admin-others
    Created on : Sep 1, 2022, 11:35:26 PM
    Author     : asel
--%>

<%@page import="service.Vehicle"%>
<%@page import="service.VehicleCat"%>
<%@page import="service.BranchCategory"%>
<%@page import="service.GocheetahWebService"%>
<%@page import="service.GocheetahWebService_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>admin others</title>
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap">
        <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
        <link rel="stylesheet" href="assets/css/AXY-Contact-Us-ContactUs.css">
        <link rel="stylesheet" href="assets/css/AXY-Contact-Us.css">
        <link rel="stylesheet" href="assets/css/Features-Large-Icons-icons.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity= "sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity= "sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    </head>

    <body id="page-top">
        <%
//            response.setHeader("Cache-Control", "no-store, must-revalidate");
//            response.setHeader("pragma", "no-cache");
//            response.setHeader("Expires", "0");
//            
//            if(session.getAttribute("email")==null){
//                response.sendRedirect("admin-login.jsp");
//            }
%>

        <input type="hidden" id="status"  value="<%= request.getAttribute("status")%>">
        <%
            GocheetahWebService_Service service = new GocheetahWebService_Service();
            GocheetahWebService proxy = service.getGocheetahWebServicePort();
        %>
        <div id="wrapper">
            <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0" style="background: #e9b546;">
                <div class="container-fluid d-flex flex-column p-0"><a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                        <div class="sidebar-brand-text mx-3"><span>Gocheetah</span></div>
                    </a>
                    <hr class="sidebar-divider my-0">
                    <ul class="navbar-nav text-light" id="accordionSidebar">
                        <li class="nav-item"><a class="nav-link" data-bss-hover-animate="pulse" href="admin/admin-panel.jsp"><span><i class="fas fa-shuttle-van"></i>Panel</span></a></li>
                        <li class="nav-item"><a class="nav-link" data-bss-hover-animate="pulse" href="admin-users.jsp"><i class="fas fa-user-friends"></i><span>Users</span></a></li>
                        <li class="nav-item"><a class="nav-link" data-bss-hover-animate="pulse" href="admin-others2.jsp"><span><i class="fas fa-shuttle-van"></i>Others</span></a></li>
                        <li class="nav-item"><a class="nav-link" data-bss-hover-animate="pulse" href="admin/admin-destination.jsp"><span><i class="fas fa-map-marked-alt"></i>Destinations</span></a></li>
                        <li class="nav-item"><a class="nav-link" data-bss-hover-animate="pulse" href="../admin-profile.html"><i class="fas fa-user"></i><span>Profile</span></a></li>
                    </ul>
                </div>
            </nav>
            <div class="d-flex flex-column" id="content-wrapper">
                <div id="content">
                    <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                        <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle me-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars" style="color: rgb(233,181,70);"></i></button>
                            <ul class="navbar-nav flex-nowrap ms-auto">
                                <li class="nav-item d-lg-flex justify-content-lg-center align-items-lg-center dropdown no-arrow mx-1"><span id="adminProfileName">Asel Vinjitha</span></li>
                                <li class="nav-item dropdown no-arrow mx-1"><span style="width: 32px;height: 32px;border-radius: 30px;"><img id="adminProfilePic" style="width: 32px;height: 32px;border-radius: 30px;" src="assets/img/avatars/avatar5.jpeg"></span></li>
                            </ul>
                        </div>
                    </nav>
                    <div class="d-sm-flex justify-content-between align-items-center mb-4" style="padding-left: 24px;">
                        <h3 class="text-dark mb-0">Others</h3>
                    </div>
                    <div class="container-fluid">
                        <div>
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item" role="presentation"><a class="nav-link active" role="tab" data-bs-toggle="tab" data-bss-hover-animate="pulse" href="#tab-1" style="color: #233143;">Branch info</a></li>
                                <li class="nav-item" role="presentation"><a class="nav-link" role="tab" data-bs-toggle="tab" data-bss-hover-animate="pulse" href="#tab-2" style="color: #233143;">Vehicle Category Info</a></li>
                                <li class="nav-item" role="presentation"><a class="nav-link" role="tab" data-bs-toggle="tab" data-bss-hover-animate="pulse" href="#tab-3" style="color: #233143;">Vehicle info</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" role="tabpanel" id="tab-1">
                                    <div class="card shadow">
                                        <div class="card-header py-3">
                                            <p class="m-0 fw-bold" style="color: rgb(233,181,70);width: auto;">Branch Info</p>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-6 text-nowrap">
                                                    <form action="admin-others2.jsp" method="post">
                                                        <div id="dataTable_length-1" class="dataTables_length" aria-controls="dataTable"><label class="form-label d-flex d-sm-flex d-md-flex d-lg-flex d-xl-flex d-xxl-flex justify-content-center align-items-center justify-content-sm-center align-items-sm-center justify-content-md-center align-items-md-center justify-content-lg-start align-items-lg-center justify-content-xl-start align-items-xl-center justify-content-xxl-center align-items-xxl-center"><input type="search" id="branchSearch" class="form-control form-control-sm" aria-controls="dataTable" placeholder="Search" style="width: 200px;" name="branchSearch"><button class="btn btn-primary" data-bss-disabled-mobile="true" data-bss-hover-animate="pulse" id="branchSearchBtn" type="submit" style="background: rgba(78,115,223,0);border-color: rgba(255,255,255,0);"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-search" style="margin-top: 0px;margin-left: 0px;width: 16px;color: rgb(197,195,195);">
                                                                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
                                                                    </svg></button></label></div>
                                                    </form>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="text-md-end dataTables_filter" id="dataTable_filter-1"><a class="btn btn-primary btn-lg" role="button" id="createBranchBtn" href="#BranchModal" data-bs-toggle="modal" data-bs-target="#BranchModal" style="padding: 7px 0px;padding-top: 0px;padding-bottom: 0px;background: rgba(13,110,253,0);color: rgb(197,195,195);border-color: rgba(197,195,195,0);"><i class="fas fa-map-marked-alt" data-bs-toggle="tooltip" data-bss-tooltip="" data-bs-placement="left" data-bss-disabled-mobile="true" data-bss-hover-animate="pulse" title="Create New Branch"></i></a>
                                                        <div class="modal fade" role="dialog" tabindex="-1" id="BranchModal">
                                                            <div class="modal-dialog" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h4 id="BranhHeading">Create New Branch</h4><button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                    </div>
                                                                    <div class="modal-body" style="text-align: left;">
                                                                        <form action="admin/p-branch-add.jsp" method="post">
                                                                            <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-map-marker-alt" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="branchName" name="branchName" placeholder="Branch" required="" style="border-color: rgba(133,135,150,0);"></div>
                                                                            <div><button class="btn btn-primary d-block w-100" id="branchCreateBtn" type="submit" style="background: #e9b546;border-color: #e9b546;">Create</button></div>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>

                                            <%-- bRANCH INFO --%> 

                                            <div class="table-responsive" style="padding: 6px;margin-top: 5px;">
                                                <table class="table" id=" branchList">
                                                    <thead>
                                                        <tr>
                                                            <th style="color: rgb(152,152,152);">Id</th>
                                                            <th style="color: rgb(152,152,152);">Branch</th>
                                                            <th style="color: rgb(152,152,152);">Manage</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                                            if (request.getParameter("branchSearch") == null || request.getParameter("branchSearch").isEmpty()) {
                                                                for (BranchCategory bn : proxy.branchesList()) {
                                                                    //UiUtill.printBranchesRows(bn, out);

                                                                    out.print("<tr class=\"table-warning\">");
                                                                    out.print("<td>");
                                                                    out.print("<div>");
                                                                    out.print("<div class=\"d-lg-flex justify-content-lg-start align-items-lg-center\">");
                                                                    out.print("<form action=\"admin/branch-update-modal.jsp\" method=\"post\">");
                                                                    out.print("<p id=\"branchId" + bn.getBranchId() + "\" name=\"branchId\" style=\"margin-bottom: 0px;margin-left: 0px;\">" + bn.getBranchId() + "</p>");
                                                                    out.print("</div>");
                                                                    out.print("</div>");
                                                                    out.print("</td>");
                                                                    out.print("<td>");
                                                                    out.print("<div>");
                                                                    out.print("<p id=\"branchName" + bn.getLocation() + "\" name=\"branchName\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + bn.getLocation() + "</p>");
                                                                    out.print("</div>");
                                                                    out.print("</td>");
                                                                    //out.print("<td style=\"padding-right: 0px;padding-left: 0px;\"><a class=\"btn btnMaterial btn-flat success semicircle\" role=\"button\" data-bss-disabled-mobile=\"true\" data-bss-hover-animate=\"pulse\" id=\"adminUpdate\" href=\"#BranchModal\" onclick="" data-bs-target=\"#BranchModal\" style=\"color: rgb(0,197,179);\" data-bs-toggle=\"modal\"><i class=\"fas fa-pen\"></i></a><a class=\"btn btnMaterial btn-flat accent btnNoBorders checkboxHover\" role=\"button\" data-bss-disabled-mobile=\"true\" data-bss-hover-animate=\"pulse\" id=\"adminDelete\" style=\"margin-left: 5px;\" data-bs-toggle=\"modal\" data-bs-target=\"#branchModalView\" href=\"admin/branch-view-modal.jsp\"><i class=\"fas fa-trash btnNoBorders\" style=\"color: #DC3545;\"></i></a>");
                                                                    out.print("<td style=\"padding-right: 0px;padding-left: 0px;\"><a class=\"btn btnMaterial btn-flat success semicircle\" role=\"button\" data-bss-disabled-mobile=\"true\" data-bss-hover-animate=\"pulse\" id=\"adminUpdate\" href=\"#branchModalUpdate" + bn.getBranchId() + "\" data-bs-target=\"#branchModalUpdate" + bn.getBranchId() + "\" style=\"color: rgb(0,197,179);\" data-bs-toggle=\"modal\"><i class=\"fas fa-pen\"></i></a><a class=\"btn btnMaterial btn-flat accent btnNoBorders checkboxHover\" role=\"button\" data-bss-disabled-mobile=\"true\" data-bss-hover-animate=\"pulse\" id=\"adminDelete\" style=\"margin-left: 5px;\" data-bs-toggle=\"modal\" href=\"#branchModalView" + bn.getBranchId() + "\"><i class=\"fas fa-trash btnNoBorders\" style=\"color: #DC3545;\"></i></a>");
                                                                    out.print("</form>");

                                                                    out.print("<div class=\"modal fade\" role=\"dialog\" tabindex=\"-1\" id=\"branchModalUpdate" + bn.getBranchId() + "\">");
                                                                    out.print("<div class=\"modal-dialog\" role=\"document\">");
                                                                    out.print("<div class=\"modal-content\">");
                                                                    out.print("<div class=\"modal-header\">");
                                                                    out.print("<h4 name=\"BranhHeading\" id=\"BranhHeading-1\">Update Branch</h4><button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>");
                                                                    out.print("</div>");
                                                                    out.print("<div class=\"modal-body\" style=\"text-align: left;\">");
                                                                    out.print("<form action=\"admin/p-branch-update.jsp\" method=\"post\">");
                                                                    out.print("<div class=\"d-md-flex justify-content-md-center align-items-md-center mb-3\" style=\"border: 1px outset rgb(209,211,226);border-radius: 5.6px;\"><i class=\"far fa-id-card  \" style=\"border-left-color: rgb(133, 135, 150);margin-left: 5px;\"></i><input class=\"form-control\" type=\"text\" id=\"brnchID2\" name=\"brnchID\" value=\"" + bn.getBranchId() + "\" placeholder=\"ID\" style=\"border-color: rgba(133,135,150,0);\" readonly></div>");
                                                                    out.print("<div class=\"d-md-flex justify-content-md-center align-items-md-center mb-3\" style=\"border: 1px outset rgb(209,211,226);border-radius: 5.6px;\"><i class=\"fas fa-map-marker-alt\" style=\"border-left-color: rgb(133, 135, 150);margin-left: 5px;\"></i><input class=\"form-control\" type=\"text\" id=\"brnchLocation\" name=\"brnchLocation\" value=\"" + bn.getLocation() + "\" placeholder=\"Location\" required=\"\" style=\"border-color: rgba(133,135,150,0);\"></div>");
                                                                    out.print("<div><button class=\"btn btn-primary d-block w-100\" id=\"branchCreateBtn-3\" type=\"submit\" style=\"background: #e9b546;border-color: #e9b546;margin-top: 5px;\">Update</button></div>");
                                                                    out.print("</form>");
                                                                    out.print("</div>");
                                                                    out.print("</div>");
                                                                    out.print("</div>");
                                                                    out.print("</div>");

                                                                    out.print("<div class=\"modal fade\" role=\"dialog\" tabindex=\"-1\" id=\"branchModalView" + bn.getBranchId() + "\">");
                                                                    out.print("<div class=\"modal-dialog\" role=\"document\">");
                                                                    out.print("<div class=\"modal-content\">");
                                                                    out.print("<div class=\"modal-header\">");
                                                                    out.print("<h4 id=\"BranhHeading-2\">Branch info</h4><button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>");
                                                                    out.print("</div>");
                                                                    out.print("<div class=\"modal-body\" style=\"text-align: left;\">");
                                                                    out.print("<form action=\"admin/p-branch-delete.jsp\" method=\"post\">");
                                                                    out.print("<div class=\"d-md-flex justify-content-md-center align-items-md-center mb-3\" style=\"border: 1px outset rgb(209,211,226);border-radius: 5.6px;\"><i class=\"far fa-id-card\" style=\"border-left-color: rgb(133, 135, 150);margin-left: 5px;\"></i><input class=\"form-control\" type=\"text\" id=\"brnchIDDelete\" name=\"brnchIDDelete\" placeholder=\"ID\" value=\"" + bn.getBranchId() + "\" style=\"border-color: rgba(133,135,150,0);\" readonly=\"\"></div>");
                                                                    out.print("<div class=\"d-md-flex justify-content-md-center align-items-md-center mb-3\" style=\"border: 1px outset rgb(209,211,226);border-radius: 5.6px;\"><i class=\"fas fa-map-marker-alt\" style=\"border-left-color: rgb(133, 135, 150);margin-left: 5px;\"></i><input class=\"form-control\" type=\"text\" id=\"brnchLocationDelete\" name=\"brnchLocation2\" value=\"" + bn.getLocation() + "\" placeholder=\"Location\" required=\"\" readonly=\"\" style=\"border-color: rgba(133,135,150,0);\"></div>");
                                                                    out.print("<div><button class=\"btn btn-primary d-block w-100\" id=\"branchDeleteBtn\" type=\"submit\" style=\"background: var(--bs-red);margin-top: 5px;border-color: var(--bs-red);\">Delete</button></div>");
                                                                    out.print("</form>");
                                                                    out.print("</div>");
                                                                    out.print("</div>");
                                                                    out.print("</div>");
                                                                    out.print("</div>");

                                                                    out.print("</td>");
                                                                    out.print("</tr>");
                                                                }
                                                            } else {
                                                                BranchCategory bn = proxy.getBranch((request.getParameter("branchSearch")));
                                                                out.print("<tr class=\"table-warning\">");
                                                                out.print("<td>");
                                                                out.print("<div>");
                                                                out.print("<div class=\"d-lg-flex justify-content-lg-start align-items-lg-center\">");
                                                                out.print("<form action=\"admin/branch-update-modal.jsp\" method=\"post\">");
                                                                out.print("<p id=\"branchId" + bn.getBranchId() + "\" name=\"branchId\" style=\"margin-bottom: 0px;margin-left: 0px;\">" + bn.getBranchId() + "</p>");
                                                                out.print("</div>");
                                                                out.print("</div>");
                                                                out.print("</td>");
                                                                out.print("<td>");
                                                                out.print("<div>");
                                                                out.print("<p id=\"branchName" + bn.getLocation() + "\" name=\"branchName\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + bn.getLocation() + "</p>");
                                                                out.print("</div>");
                                                                out.print("</td>");
                                                                //out.print("<td style=\"padding-right: 0px;padding-left: 0px;\"><a class=\"btn btnMaterial btn-flat success semicircle\" role=\"button\" data-bss-disabled-mobile=\"true\" data-bss-hover-animate=\"pulse\" id=\"adminUpdate\" href=\"#BranchModal\" onclick="" data-bs-target=\"#BranchModal\" style=\"color: rgb(0,197,179);\" data-bs-toggle=\"modal\"><i class=\"fas fa-pen\"></i></a><a class=\"btn btnMaterial btn-flat accent btnNoBorders checkboxHover\" role=\"button\" data-bss-disabled-mobile=\"true\" data-bss-hover-animate=\"pulse\" id=\"adminDelete\" style=\"margin-left: 5px;\" data-bs-toggle=\"modal\" data-bs-target=\"#branchModalView\" href=\"admin/branch-view-modal.jsp\"><i class=\"fas fa-trash btnNoBorders\" style=\"color: #DC3545;\"></i></a>");
                                                                out.print("<td style=\"padding-right: 0px;padding-left: 0px;\"><a class=\"btn btnMaterial btn-flat success semicircle\" role=\"button\" data-bss-disabled-mobile=\"true\" data-bss-hover-animate=\"pulse\" id=\"adminUpdate\" href=\"#branchModalUpdate" + bn.getBranchId() + "\" data-bs-target=\"#branchModalUpdate" + bn.getBranchId() + "\" style=\"color: rgb(0,197,179);\" data-bs-toggle=\"modal\"><i class=\"fas fa-pen\"></i></a><a class=\"btn btnMaterial btn-flat accent btnNoBorders checkboxHover\" role=\"button\" data-bss-disabled-mobile=\"true\" data-bss-hover-animate=\"pulse\" id=\"adminDelete\" style=\"margin-left: 5px;\" data-bs-toggle=\"modal\" href=\"#branchModalView" + bn.getBranchId() + "\"><i class=\"fas fa-trash btnNoBorders\" style=\"color: #DC3545;\"></i></a>");
                                                                out.print("</form>");

                                                                out.print("<div class=\"modal fade\" role=\"dialog\" tabindex=\"-1\" id=\"branchModalUpdate" + bn.getBranchId() + "\">");
                                                                out.print("<div class=\"modal-dialog\" role=\"document\">");
                                                                out.print("<div class=\"modal-content\">");
                                                                out.print("<div class=\"modal-header\">");
                                                                out.print("<h4 name=\"BranhHeading\" id=\"BranhHeading-1\">Update Branch</h4><button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>");
                                                                out.print("</div>");
                                                                out.print("<div class=\"modal-body\" style=\"text-align: left;\">");
                                                                out.print("<form action=\"admin/p-branch-update.jsp\" method=\"post\">");
                                                                out.print("<div class=\"d-md-flex justify-content-md-center align-items-md-center mb-3\" style=\"border: 1px outset rgb(209,211,226);border-radius: 5.6px;\"><i class=\"far fa-id-card  \" style=\"border-left-color: rgb(133, 135, 150);margin-left: 5px;\"></i><input class=\"form-control\" type=\"text\" id=\"brnchID2\" name=\"brnchID\" value=\"" + bn.getBranchId() + "\" placeholder=\"ID\" style=\"border-color: rgba(133,135,150,0);\" readonly></div>");
                                                                out.print("<div class=\"d-md-flex justify-content-md-center align-items-md-center mb-3\" style=\"border: 1px outset rgb(209,211,226);border-radius: 5.6px;\"><i class=\"fas fa-map-marker-alt\" style=\"border-left-color: rgb(133, 135, 150);margin-left: 5px;\"></i><input class=\"form-control\" type=\"text\" id=\"brnchLocation\" name=\"brnchLocation\" value=\"" + bn.getLocation() + "\" placeholder=\"Location\" required=\"\" style=\"border-color: rgba(133,135,150,0);\"></div>");
                                                                out.print("<div><button class=\"btn btn-primary d-block w-100\" id=\"branchCreateBtn-3\" type=\"submit\" style=\"background: #e9b546;border-color: #e9b546;margin-top: 5px;\">Update</button></div>");
                                                                out.print("</form>");
                                                                out.print("</div>");
                                                                out.print("</div>");
                                                                out.print("</div>");
                                                                out.print("</div>");

                                                                out.print("<div class=\"modal fade\" role=\"dialog\" tabindex=\"-1\" id=\"branchModalView" + bn.getBranchId() + "\">");
                                                                out.print("<div class=\"modal-dialog\" role=\"document\">");
                                                                out.print("<div class=\"modal-content\">");
                                                                out.print("<div class=\"modal-header\">");
                                                                out.print("<h4 id=\"BranhHeading-2\">Branch info</h4><button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>");
                                                                out.print("</div>");
                                                                out.print("<div class=\"modal-body\" style=\"text-align: left;\">");
                                                                out.print("<form action=\"admin/p-branch-delete.jsp\" method=\"post\">");
                                                                out.print("<div class=\"d-md-flex justify-content-md-center align-items-md-center mb-3\" style=\"border: 1px outset rgb(209,211,226);border-radius: 5.6px;\"><i class=\"far fa-id-card\" style=\"border-left-color: rgb(133, 135, 150);margin-left: 5px;\"></i><input class=\"form-control\" type=\"text\" id=\"brnchIDDelete\" name=\"brnchIDDelete\" placeholder=\"ID\" value=\"" + bn.getBranchId() + "\" style=\"border-color: rgba(133,135,150,0);\" readonly=\"\"></div>");
                                                                out.print("<div class=\"d-md-flex justify-content-md-center align-items-md-center mb-3\" style=\"border: 1px outset rgb(209,211,226);border-radius: 5.6px;\"><i class=\"fas fa-map-marker-alt\" style=\"border-left-color: rgb(133, 135, 150);margin-left: 5px;\"></i><input class=\"form-control\" type=\"text\" id=\"brnchLocationDelete\" name=\"brnchLocation2\" value=\"" + bn.getLocation() + "\" placeholder=\"Location\" required=\"\" readonly=\"\" style=\"border-color: rgba(133,135,150,0);\"></div>");
                                                                out.print("<div><button class=\"btn btn-primary d-block w-100\" id=\"branchDeleteBtn\" type=\"submit\" style=\"background: var(--bs-red);margin-top: 5px;border-color: var(--bs-red);\">Delete</button></div>");
                                                                out.print("</form>");
                                                                out.print("</div>");
                                                                out.print("</div>");
                                                                out.print("</div>");
                                                                out.print("</div>");

                                                                out.print("</td>");
                                                                out.print("</tr>");
                                                            }

                                                        %>


                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" role="tabpanel" id="tab-2">
                                    <div class="card shadow">
                                        <div class="card-header py-3">
                                            <p class="m-0 fw-bold" style="color: rgb(233,181,70);width: auto;">Vehicle Category Info</p>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-6 text-nowrap">
                                                    <form action="admin-others2.jsp#tab-2" method="post">
                                                        <div id="dataTable_length-2" class="dataTables_length" aria-controls="dataTable"><label class="form-label d-flex d-sm-flex d-md-flex d-lg-flex d-xl-flex d-xxl-flex justify-content-center align-items-center justify-content-sm-center align-items-sm-center justify-content-md-center align-items-md-center justify-content-lg-start align-items-lg-center justify-content-xl-start align-items-xl-center justify-content-xxl-center align-items-xxl-center"><input type="search" id="vehicleSearch" name="vehicleCategorySearch" class="form-control form-control-sm" aria-controls="dataTable" placeholder="Search" style="width: 200px;"><button class="btn btn-primary" data-bss-disabled-mobile="true" data-bss-hover-animate="pulse" id="vehicleCategorySearchBtn" type="submit" style="background: rgba(78,115,223,0);border-color: rgba(255,255,255,0);"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-search" style="margin-top: 0px;margin-left: 0px;width: 16px;color: rgb(197,195,195);">
                                                                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
                                                                    </svg></button></label></div>
                                                    </form>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="text-md-end dataTables_filter" id="dataTable_filter-2"><a class="btn btn-primary btn-lg" role="button" id="createVehicleCatBtn" href="#vehicleCategoryModal" data-bs-target="#vehicleCategoryModal" data-bs-toggle="modal" style="padding: 7px 0px;padding-top: 0px;padding-bottom: 0px;background: rgba(13,110,253,0);color: rgb(197,195,195);border-color: rgba(197,195,195,0);"><i class="fas fa-car-alt" data-bs-toggle="tooltip" data-bss-tooltip="" data-bs-placement="left" data-bss-disabled-mobile="true" data-bss-hover-animate="pulse" title="Create New Vehicle Category"></i></a>
                                                        <div class="modal fade" role="dialog" tabindex="-1" id="vehicleCategoryModal">
                                                            <div class="modal-dialog" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h4 id="vehivleCategoryHeading">Create New Vehicle Category</h4><button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                    </div>
                                                                    <div class="modal-body" style="text-align: left;">
                                                                        <form action="admin/p-vehicleCategory-add.jsp" method="post">
                                                                            <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border-radius: 5.6px;border: 1px outset rgba(209,211,226,0) ;"><img id="vehicleCategoryPic" style="background: url(&quot;assets/img/dogs/image2.jpeg&quot;);width: 130px;border-radius: 65px;" src="assets/img/threewheel.png"><button class="btn" id="vehiclePicAddBtn" type="button" style="margin-left: 12px;"><i class="far fa-image"></i></button></div>
                                                                            <div class="d-md-flex justify-content-md-start align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-car-alt" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="vehiCat" name="vehiCat" placeholder="Vehicle Category" required="" style="border-color: rgba(133,135,150,0);" autofocus=""></div>
                                                                            <div><button class="btn btn-primary d-block w-100" id="createVehicleCategoryBtn" type="submit" style="background: #e9b546;border-color: #e9b546;">Create</button></div>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <%-- VEHICLE CATEGORY INFO --%>  

                                            <div class="table-responsive" style="padding: 6px;margin-top: 5px;">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th style="color: rgb(152,152,152);">ID</th>
                                                            <th style="color: rgb(152,152,152);">Picture</th>
                                                            <th style="color: rgb(152,152,152);">Category</th>
                                                            <th style="color: rgb(152,152,152);">Manage</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%      if (request.getParameter("vehicleCategorySearch") == null || request.getParameter("vehicleCategorySearch").isEmpty()) {
                                                                for (VehicleCat vc : proxy.vehicleCategoryList()) {
                                                                    out.print("<tr class=\"table-warning\">");
                                                                    out.print("<td>");
                                                                    out.print("<div>");
                                                                    out.print("<div class=\"d-lg-flex justify-content-lg-start align-items-lg-center\">");
                                                                    out.print("<p id=\"vehicleCatID\" style=\"margin-bottom: 0px;margin-left: 10px;\">" + vc.getVehicleCatId() + "</p>");
                                                                    out.print("</div>");
                                                                    out.print("</div>");
                                                                    out.print("</td>");
                                                                    out.print("<td>");
                                                                    out.print("<div>");
                                                                    out.print("<div class=\"d-lg-flex justify-content-lg-start\"><img id=\"vehicleCatPic\" src=\"assets/img/yello%20car.jpg\" style=\"border-radius: 30pc;width: 40px;\"></div>");
                                                                    out.print("</div>");
                                                                    out.print("</td>");
                                                                    out.print("<td>");
                                                                    out.print("<div>");
                                                                    out.print("<div class=\"d-lg-flex justify-content-lg-start\"></div>");
                                                                    out.print("<p id=\"VehivleCategory\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + vc.getVehicleCategory() + "</p>");
                                                                    out.print("</div>");
                                                                    out.print("</td>");
                                                                    out.print("<td style=\"padding-right: 0px;padding-left: 0px;\"><a class=\"btn btnMaterial btn-flat success semicircle\" role=\"button\" data-bss-hover-animate=\"pulse\" id=\"VehicleCatUpdateBtn\" href=\"#vehicleCategoryUpdate" + vc.getVehicleCatId() + "\" style=\"color: rgb(0,197,179);\" data-bs-toggle=\"modal\"><i class=\"fas fa-pen\"></i></a><a class=\"btn btnMaterial btn-flat accent btnNoBorders checkboxHover\" role=\"button\" data-bss-hover-animate=\"pulse\" id=\"VehicleCatDeleteBtn\" style=\"margin-left: 5px;\" data-bs-toggle=\"modal\" href=\"#VehicleCategoryModalView" + vc.getVehicleCatId() + "\"><i class=\"fas fa-trash btnNoBorders\" style=\"color: #DC3545;\"></i></a>");

                                                                    out.print("<div class=\"modal fade\" role=\"dialog\" tabindex=\"-1\" id=\"vehicleCategoryUpdate" + vc.getVehicleCatId() + "\">");
                                                                    out.print("<div class=\"modal-dialog\" role=\"document\">");
                                                                    out.print("<div class=\"modal-content\">");
                                                                    out.print("<div class=\"modal-header\">");
                                                                    out.print("<h4 id=\"vehivleCategoryHeading-1\">Update Vehicle Category</h4><button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>");
                                                                    out.print("</div>");
                                                                    out.print("<div class=\"modal-body\" style=\"text-align: left;\">");
                                                                    out.print("<form action=\"admin/p-vehicalCategory-update.jsp\" method=\"post\">");
                                                                    out.print("<div class=\"d-md-flex justify-content-md-center align-items-md-center mb-3\" style=\"border-radius: 5.6px;border: 1px outset rgba(209,211,226,0) ;\"><img id=\"vehicleCategoryPic-1\" style=\"background: url(&quot;assets/img/dogs/image2.jpeg&quot;);width: 130px;border-radius: 65px;\" src=\"assets/img/threewheel.png\"><button class=\"btn\" id=\"vehiclePicAddBtn-1\" type=\"button\" style=\"margin-left: 12px;\"><i class=\"far fa-image\"></i></button></div>");
                                                                    out.print("<div class=\"d-md-flex justify-content-md-start align-items-md-center mb-3\" style=\"border: 1px outset rgb(209,211,226);border-radius: 5.6px;\"><i class=\"far fa-id-card\" style=\"border-left-color: rgb(133, 135, 150);margin-left: 5px;\"></i><input class=\"form-control\" type=\"text\" id=\"vehicleCategoryIDT\" name=\"vehicleCategoryIDT\" value=\"" + vc.getVehicleCatId() + "\" placeholder=\"ID\" readonly style=\"border-color: rgba(133,135,150,0);\"></div>");
                                                                    out.print("<div class=\"d-md-flex justify-content-md-start align-items-md-center mb-3\" style=\"border: 1px outset rgb(209,211,226);border-radius: 5.6px;\"><i class=\"fas fa-car-alt\" style=\"border-left-color: rgb(133, 135, 150);margin-left: 5px;\"></i><input class=\"form-control\" type=\"text\" id=\"vehicleCategoryT\" name=\"vehicleCategoryT\" value=\"" + vc.getVehicleCategory() + "\" placeholder=\"Vihicale Category\" required=\"\" style=\"border-color: rgba(133,135,150,0);\"></div>");
                                                                    out.print("<div><button class=\"btn btn-primary d-block w-100\" id=\"updateVehicleCategoryBtn-3\" type=\"submit\" style=\"background: #e9b546;border-color: #e9b546;margin-top: 5px;\">Update</button></div>");
                                                                    out.print("</form>");
                                                                    out.print("</div>");
                                                                    out.print("</div>");
                                                                    out.print("</div>");
                                                                    out.print("</div>");

                                                                    out.print("<div class=\"modal fade\" role=\"dialog\" tabindex=\"-1\" id=\"VehicleCategoryModalView" + vc.getVehicleCatId() + "\">");
                                                                    out.print("<div class=\"modal-dialog\" role=\"document\">");
                                                                    out.print("<div class=\"modal-content\">");
                                                                    out.print("<div class=\"modal-header\">");
                                                                    out.print("<h4 id=\"vehivleCategoryHeading-2\">Vehicle Category info</h4><button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>");
                                                                    out.print("</div>");
                                                                    out.print("<div class=\"modal-body\" style=\"text-align: left;\">");
                                                                    out.print("<form action=\"admin/p-vehicleCategory-delete.jsp\" method=\"post\">");
                                                                    out.print("<div class=\"d-md-flex justify-content-md-center align-items-md-center mb-3\" style=\"border-radius: 5.6px;border: 1px outset rgba(209,211,226,0) ;\"><img id=\"vehicleCategoryPic-2\" style=\"background: url(&quot;assets/img/dogs/image2.jpeg&quot;);width: 130px;border-radius: 65px;\" src=\"assets/img/threewheel.png\"><button class=\"btn\" id=\"vehiclePicAddBtn-2\" type=\"button\" style=\"margin-left: 12px;\"><i class=\"far fa-image\"></i></button></div>");
                                                                    out.print("<div class=\"d-md-flex justify-content-md-start align-items-md-center mb-3\" style=\"border: 1px outset rgb(209,211,226);border-radius: 5.6px;\"><i class=\"far fa-id-card\" style=\"border-left-color: rgb(133, 135, 150);margin-left: 5px;\"></i><input class=\"form-control\" type=\"text\" id=\"vehicleListIDDelete\" name=\"vehicleListIDDelete\" value=\"" + vc.getVehicleCatId() + "\" placeholder=\"Vihicale Category ID\" readonly style=\"border-color: rgba(133,135,150,0);\"></div>");
                                                                    out.print("<div class=\"d-md-flex justify-content-md-start align-items-md-center mb-3\" style=\"border: 1px outset rgb(209,211,226);border-radius: 5.6px;\"><i class=\"fas fa-car-alt\" style=\"border-left-color: rgb(133, 135, 150);margin-left: 5px;\"></i><input class=\"form-control\" type=\"text\" id=\"vehicleListDelete\" name=\"vehicleList\" value=\"" + vc.getVehicleCategory() + "\" placeholder=\"Vihicale Category\" required=\"\" style=\"border-color: rgba(133,135,150,0);\"></div>");
                                                                    out.print("<div><button class=\"btn btn-primary d-block w-100\" id=\"DeleteVehicleCategoryBtn\" type=\"submit\" style=\"background: var(--bs-red);margin-top: 5px;border-color: var(--bs-red);\">Delete</button></div>");
                                                                    out.print("</form>");
                                                                    out.print("</div>");
                                                                    out.print("</div>");
                                                                    out.print("</div>");
                                                                    out.print("</div>");
                                                                    out.print("</td>");
                                                                    out.print("</tr>");
                                                                }
                                                            } else {
                                                                VehicleCat vc = proxy.getVehicleCategoryh(request.getParameter("vehicleCategorySearch"));
                                                                out.print("<tr class=\"table-warning\">");
                                                                out.print("<td>");
                                                                out.print("<div>");
                                                                out.print("<div class=\"d-lg-flex justify-content-lg-start align-items-lg-center\">");
                                                                out.print("<p id=\"vehicleCatID\" style=\"margin-bottom: 0px;margin-left: 10px;\">" + vc.getVehicleCatId() + "</p>");
                                                                out.print("</div>");
                                                                out.print("</div>");
                                                                out.print("</td>");
                                                                out.print("<td>");
                                                                out.print("<div>");
                                                                out.print("<div class=\"d-lg-flex justify-content-lg-start\"><img id=\"vehicleCatPic\" src=\"assets/img/yello%20car.jpg\" style=\"border-radius: 30pc;width: 40px;\"></div>");
                                                                out.print("</div>");
                                                                out.print("</td>");
                                                                out.print("<td>");
                                                                out.print("<div>");
                                                                out.print("<div class=\"d-lg-flex justify-content-lg-start\"></div>");
                                                                out.print("<p id=\"VehivleCategory\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + vc.getVehicleCategory() + "</p>");
                                                                out.print("</div>");
                                                                out.print("</td>");
                                                                out.print("<td style=\"padding-right: 0px;padding-left: 0px;\"><a class=\"btn btnMaterial btn-flat success semicircle\" role=\"button\" data-bss-hover-animate=\"pulse\" id=\"VehicleCatUpdateBtn\" href=\"#vehicleCategoryUpdate" + vc.getVehicleCatId() + "\" style=\"color: rgb(0,197,179);\" data-bs-toggle=\"modal\"><i class=\"fas fa-pen\"></i></a><a class=\"btn btnMaterial btn-flat accent btnNoBorders checkboxHover\" role=\"button\" data-bss-hover-animate=\"pulse\" id=\"VehicleCatDeleteBtn\" style=\"margin-left: 5px;\" data-bs-toggle=\"modal\" href=\"#VehicleCategoryModalView" + vc.getVehicleCatId() + "\"><i class=\"fas fa-trash btnNoBorders\" style=\"color: #DC3545;\"></i></a>");

                                                                out.print("<div class=\"modal fade\" role=\"dialog\" tabindex=\"-1\" id=\"vehicleCategoryUpdate" + vc.getVehicleCatId() + "\">");
                                                                out.print("<div class=\"modal-dialog\" role=\"document\">");
                                                                out.print("<div class=\"modal-content\">");
                                                                out.print("<div class=\"modal-header\">");
                                                                out.print("<h4 id=\"vehivleCategoryHeading-1\">Update Vehicle Category</h4><button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>");
                                                                out.print("</div>");
                                                                out.print("<div class=\"modal-body\" style=\"text-align: left;\">");
                                                                out.print("<form action=\"admin/p-vehicalCategory-update.jsp\" method=\"post\">");
                                                                out.print("<div class=\"d-md-flex justify-content-md-center align-items-md-center mb-3\" style=\"border-radius: 5.6px;border: 1px outset rgba(209,211,226,0) ;\"><img id=\"vehicleCategoryPic-1\" style=\"background: url(&quot;assets/img/dogs/image2.jpeg&quot;);width: 130px;border-radius: 65px;\" src=\"assets/img/threewheel.png\"><button class=\"btn\" id=\"vehiclePicAddBtn-1\" type=\"button\" style=\"margin-left: 12px;\"><i class=\"far fa-image\"></i></button></div>");
                                                                out.print("<div class=\"d-md-flex justify-content-md-start align-items-md-center mb-3\" style=\"border: 1px outset rgb(209,211,226);border-radius: 5.6px;\"><i class=\"far fa-id-card\" style=\"border-left-color: rgb(133, 135, 150);margin-left: 5px;\"></i><input class=\"form-control\" type=\"text\" id=\"vehicleCategoryIDT\" name=\"vehicleCategoryIDT\" value=\"" + vc.getVehicleCatId() + "\" placeholder=\"ID\" readonly style=\"border-color: rgba(133,135,150,0);\"></div>");
                                                                out.print("<div class=\"d-md-flex justify-content-md-start align-items-md-center mb-3\" style=\"border: 1px outset rgb(209,211,226);border-radius: 5.6px;\"><i class=\"fas fa-car-alt\" style=\"border-left-color: rgb(133, 135, 150);margin-left: 5px;\"></i><input class=\"form-control\" type=\"text\" id=\"vehicleCategoryT\" name=\"vehicleCategoryT\" value=\"" + vc.getVehicleCategory() + "\" placeholder=\"Vihicale Category\" required=\"\" style=\"border-color: rgba(133,135,150,0);\"></div>");
                                                                out.print("<div><button class=\"btn btn-primary d-block w-100\" id=\"updateVehicleCategoryBtn-3\" type=\"submit\" style=\"background: #e9b546;border-color: #e9b546;margin-top: 5px;\">Update</button></div>");
                                                                out.print("</form>");
                                                                out.print("</div>");
                                                                out.print("</div>");
                                                                out.print("</div>");
                                                                out.print("</div>");

                                                                out.print("<div class=\"modal fade\" role=\"dialog\" tabindex=\"-1\" id=\"VehicleCategoryModalView" + vc.getVehicleCatId() + "\">");
                                                                out.print("<div class=\"modal-dialog\" role=\"document\">");
                                                                out.print("<div class=\"modal-content\">");
                                                                out.print("<div class=\"modal-header\">");
                                                                out.print("<h4 id=\"vehivleCategoryHeading-2\">Vehicle Category info</h4><button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>");
                                                                out.print("</div>");
                                                                out.print("<div class=\"modal-body\" style=\"text-align: left;\">");
                                                                out.print("<form action=\"admin/p-vehicleCategory-delete.jsp\" method=\"post\">");
                                                                out.print("<div class=\"d-md-flex justify-content-md-center align-items-md-center mb-3\" style=\"border-radius: 5.6px;border: 1px outset rgba(209,211,226,0) ;\"><img id=\"vehicleCategoryPic-2\" style=\"background: url(&quot;assets/img/dogs/image2.jpeg&quot;);width: 130px;border-radius: 65px;\" src=\"assets/img/threewheel.png\"><button class=\"btn\" id=\"vehiclePicAddBtn-2\" type=\"button\" style=\"margin-left: 12px;\"><i class=\"far fa-image\"></i></button></div>");
                                                                out.print("<div class=\"d-md-flex justify-content-md-start align-items-md-center mb-3\" style=\"border: 1px outset rgb(209,211,226);border-radius: 5.6px;\"><i class=\"far fa-id-card\" style=\"border-left-color: rgb(133, 135, 150);margin-left: 5px;\"></i><input class=\"form-control\" type=\"text\" id=\"vehicleListIDDelete\" name=\"vehicleListIDDelete\" value=\"" + vc.getVehicleCatId() + "\" placeholder=\"Vihicale Category ID\" readonly style=\"border-color: rgba(133,135,150,0);\"></div>");
                                                                out.print("<div class=\"d-md-flex justify-content-md-start align-items-md-center mb-3\" style=\"border: 1px outset rgb(209,211,226);border-radius: 5.6px;\"><i class=\"fas fa-car-alt\" style=\"border-left-color: rgb(133, 135, 150);margin-left: 5px;\"></i><input class=\"form-control\" type=\"text\" id=\"vehicleListDelete\" name=\"vehicleList\" value=\"" + vc.getVehicleCategory() + "\" placeholder=\"Vihicale Category\" required=\"\" style=\"border-color: rgba(133,135,150,0);\"></div>");
                                                                out.print("<div><button class=\"btn btn-primary d-block w-100\" id=\"DeleteVehicleCategoryBtn\" type=\"submit\" style=\"background: var(--bs-red);margin-top: 5px;border-color: var(--bs-red);\">Delete</button></div>");
                                                                out.print("</form>");
                                                                out.print("</div>");
                                                                out.print("</div>");
                                                                out.print("</div>");
                                                                out.print("</div>");
                                                                out.print("</td>");
                                                                out.print("</tr>");
                                                            }


                                                        %>




                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" role="tabpanel" id="tab-3">
                                    <div class="card shadow">
                                        <div class="card-header d-lg-flex justify-content-lg-start py-3">
                                            <p class="m-0 fw-bold" style="color: rgb(233,181,70);width: auto;">Vehicle Info</p>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-6 text-nowrap">
                                                    <form action="admin-others2.jsp#tab-3" method="POST">

                                                        <div id="dataTable_length-3" class="dataTables_length" aria-controls="dataTable"><label class="form-label d-flex d-sm-flex d-md-flex d-lg-flex d-xl-flex d-xxl-flex justify-content-center align-items-center justify-content-sm-center align-items-sm-center justify-content-md-center align-items-md-center justify-content-lg-start align-items-lg-center justify-content-xl-start align-items-xl-center justify-content-xxl-center align-items-xxl-center"><input type="search" id="vehicleSearch" name="vehicleSearch" class="form-control form-control-sm" aria-controls="dataTable" placeholder="Search" style="width: 200px;"><button class="btn btn-primary" data-bss-disabled-mobile="true" data-bss-hover-animate="pulse" id="vehicleSearchBtn-1" type="submit" style="background: rgba(78,115,223,0);border-color: rgba(255,255,255,0);"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-search" style="margin-top: 0px;margin-left: 0px;width: 16px;color: rgb(197,195,195);">
                                                                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
                                                                    </svg></button></label></div>
                                                    </form>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="text-md-end dataTables_filter" id="dataTable_filter-3"><a class="btn btn-primary btn-lg" role="button" id="btnCreateVehivle" href="#VehicleModal" data-bs-target="#VehicleModal" data-bs-toggle="modal" style="padding: 7px 0px;padding-top: 0px;padding-bottom: 0px;background: rgba(13,110,253,0);color: rgb(197,195,195);border-color: rgba(197,195,195,0);"><i class="fas fa-car-side" data-bs-toggle="tooltip" data-bss-tooltip="" data-bs-placement="left" data-bss-disabled-mobile="true" data-bss-hover-animate="pulse" title="Create New Vehicle"></i></a>
                                                        <div class="modal fade" role="dialog" tabindex="-1" id="VehicleModal">
                                                            <div class="modal-dialog" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h4 id="vehicleHeading">Create New Vehicle</h4><button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                    </div>
                                                                    <div class="modal-body" style="text-align: left;">
                                                                        <form action="admin/p-vehicle-add.jsp" method="post">
                                                                            <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" id="picaddDiv" style="border-radius: 5.6px;border: 1px outset rgba(209,211,226,0) ;"><img id="vehicleCategoryPic-3" style="background: url(&quot;assets/img/dogs/image2.jpeg&quot;);width: 130px;border-radius: 65px;" src="assets/img/threewheel.png"><button class="btn" id="vehiclePicAddBtn-3" type="button" style="margin-left: 12px;"><i class="far fa-image"></i></button></div>
                                                                            <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="far fa-newspaper" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="chassisNo" name="chassisNo" placeholder="Chassis Number" required="" style="border-color: rgba(133,135,150,0);"></div>
                                                                            <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-window-maximize" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="numberPlate" name="numberPlate" placeholder="Number Plate" required="" style="border-color: rgba(133,135,150,0);"></div>
                                                                            <div class="text-start d-md-flex justify-content-md-start align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-car text-start" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><select class="form-select" name="category" style="border-color: rgba(133,135,150,0);">

                                                                                    <%          for (VehicleCat vc : proxy.viewVehicleCateories()) {
                                                                                            out.print("<option selected=\"\">" + vc.getVehicleCategory() + "</option>");
                                                                                        }
                                                                                    %>
                                                                                </select></div>
                                                                            <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-caravan" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="numberPlate-4" name="VehicleName" placeholder="Vehicle name" required="" style="border-color: rgba(133,135,150,0);"></div>
                                                                            <div class="text-start d-md-flex justify-content-md-start align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-map-marker-alt text-start" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><select class="form-select" name="branchlist" style="border-color: rgba(133,135,150,0);">
                                                                                    <option value="12" selected="">Colombo</option>
                                                                                    <%          for (BranchCategory bn : proxy.viewBranches()) {
                                                                                            out.print("<option name=\"branch\" selected=\"\">" + bn.getLocation() + "</option>");
                                                                                        }
                                                                                    %> 
                                                                                </select></div>
                                                                            <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="far fa-address-card" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="driverID" name="driverID" placeholder="Driver ID" required="" style="border-color: rgba(133,135,150,0);"></div>
                                                                            <div class="text-start d-md-flex justify-content-md-start align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="far fa-eye text-start" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><select class="form-select" name="availability" style="border-color: rgba(133,135,150,0);">
                                                                                    <option value="Available" selected="">Available</option>
                                                                                    <option value="">Unavailable</option>
                                                                                </select></div>
                                                                            <div><button class="btn btn-primary d-block w-100" id="CreateVehicleBtn" type="submit" style="background: #e9b546;border-color: #e9b546;">Create</button></div>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <%-- VEHICLE INFO --%>                                                                          

                                            <div class="table-responsive" style="padding: 6px;margin-top: 5px;">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th style="color: rgb(152,152,152);">ID</th>
                                                            <th style="color: rgb(152,152,152);">Chass no.</th>
                                                            <th style="color: rgb(152,152,152);">No plate</th>
                                                            <th style="color: rgb(152,152,152);">category</th>
                                                            <th style="color: rgb(152,152,152);">Branch</th>
                                                            <th style="color: rgb(152,152,152);">Driver ID</th>
                                                            <th style="color: rgb(152,152,152);">Availability</th>
                                                            <th style="color: rgb(152,152,152);">Manage</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                                            if (request.getParameter("vehicleSearch") == null || request.getParameter("vehicleSearch").isEmpty()) {
                                                                for (Vehicle vh : proxy.vehicleList()) {

                                                                    out.print("<tr class=\"table-warning\">");
                                                                    out.print("<td>");
                                                                    out.print("<div>");
                                                                    out.print("<div class=\"d-lg-flex justify-content-lg-start align-items-lg-center\">");
                                                                    out.print("<p id=\"vehicleId\" style=\"margin-bottom: 0px;margin-left: 0px;\">" + vh.getVehicleId() + "</p>");
                                                                    out.print("</div>");
                                                                    out.print("</div>");
                                                                    out.print("</td>");
                                                                    out.print("<td>");
                                                                    out.print("<div>");
                                                                    out.print("<div class=\"d-lg-flex justify-content-lg-start\"></div>");
                                                                    out.print("<p id=\"vehicleChass\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + vh.getChasiNo() + "</p>");
                                                                    out.print("</div>");
                                                                    out.print("</td>");
                                                                    out.print("<td>");
                                                                    out.print("<div>");
                                                                    out.print("<div class=\"d-lg-flex justify-content-lg-start\"></div>");
                                                                    out.print("<p id=\"vehicleNoPlate\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + vh.getNoPlate() + "</p>");
                                                                    out.print("</div>");
                                                                    out.print("</td>");
                                                                    out.print("<td>");
                                                                    out.print("<div>");
                                                                    out.print("<p id=\"vehicleCategory\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + vh.getCategory() + "</p>");
                                                                    out.print("</div>");
                                                                    out.print("</td>");
                                                                    out.print("<td>");
                                                                    out.print("<div>");
                                                                    out.print("<p id=\"vehivleBranch\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + vh.getBranch() + "</p>");
                                                                    out.print("</div>");
                                                                    out.print("</td>");
                                                                    out.print("<td>");
                                                                    out.print("<div>");
                                                                    out.print("<p id=\"vehivleBranch\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + vh.getDriver() + "</p>");
                                                                    out.print("</div>");
                                                                    out.print("</td>");
                                                                    out.print("<td>");
                                                                    out.print("<div>");
                                                                    out.print("<p id=\"availabilityT\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\" name=\"availabilityT\">" + vh.getAvailability() + "</p>");
                                                                    out.print("</div>");
                                                                    out.print("</td>");
                                                                    //out.print("</form method=\"post\" action=\"admin/admin-vehicle-update.jsp\">");
                                                                    out.print("<td style=\"padding-right: 0px;padding-left: 0px;\"><a class=\"btn btnMaterial btn-flat success semicircle\" role=\"button\" data-bss-hover-animate=\"pulse\" id=\"VehicleUpdateBtn\" href=\"admin/admin-vehicle-update.jsp?vehicleDataPass=" + vh.getVehicleId() + "\" style=\"color: rgb(0,197,179);\"><i class=\"fas fa-pen\"></i></a><a class=\"btn btnMaterial btn-flat accent btnNoBorders checkboxHover\" role=\"button\" data-bss-hover-animate=\"pulse\" id=\"VehicleDeleteBtn\" style=\"margin-left: 5px;\" data-bs-toggle=\"modal\" data-bs-target=\"#VehicleDeleteModal" + vh.getVehicleId() + "\" href=\"#VehicleDeleteModal\"><i class=\"fas fa-trash btnNoBorders\" style=\"color: #DC3545;\"></i></a>");
                                                                    //out.print("<td style=\"padding-right: 0px;padding-left: 0px;\"><a class=\"btn btnMaterial btn-flat primary semicircle\" role=\"button\" data-bss-hover-animate=\"pulse\" id=\"VehicleViewBtn\" href=\"#admin-VehicleModalView\" style=\"color: #00bdff;\" data-bs-toggle=\"modal\"><i class=\"far fa-eye\"></i></a><a class=\"btn btnMaterial btn-flat success semicircle\" role=\"button\" data-bss-hover-animate=\"pulse\" id=\"VehicleUpdateBtn\" href=\"Admin/admin-vehicle-update.jsp?vehicleDataPass=" + vh.getVehicleId() + "\" style=\"color: rgb(0,197,179);\"><i class=\"fas fa-pen\"></i></a><a class=\"btn btnMaterial btn-flat accent btnNoBorders checkboxHover\" role=\"button\" data-bss-hover-animate=\"pulse\" id=\"VehicleDeleteBtn\" style=\"margin-left: 5px;\" data-bs-toggle=\"modal\" data-bs-target=\"#VehicleDeleteModal" + vh.getVehicleId()+ "\" href=\"#VehicleDeleteModal\"><i class=\"fas fa-trash btnNoBorders\" style=\"color: #DC3545;\"></i></a>");
//out.print("</form>");

                                                                    out.print("<div class=\"modal fade\" role=\"dialog\" tabindex=\"-1\" id=\"VehicleDeleteModal" + vh.getVehicleId() + "\">");
                                                                    out.print("<div class=\"modal-dialog\" role=\"document\">");
                                                                    out.print("<div class=\"modal-content\">");
                                                                    out.print("<div class=\"modal-header\">");
                                                                    out.print("<h4 id=\"vehicleHeading-1\">Vehicle info</h4><button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>");
                                                                    out.print("</div>");
                                                                    out.print("<div class=\"modal-body\" style=\"text-align: left;\">");
                                                                    out.print("<form action=\"admin/p-vehicle-delete.jsp\" method=\"post\">");
                                                                    out.print("<div class=\"d-md-flex justify-content-md-center align-items-md-center mb-3\" style=\"border: 1px outset rgb(209,211,226);border-radius: 5.6px;background: #eaecf4;\"><i class=\"far fa-newspaper\" style=\"border-left-color: rgb(133, 135, 150);margin-left: 5px;\"></i><input class=\"form-control\" type=\"text\" id=\"VehicleIdDeleteTxt\" name=\"VehicleIdDeleteTxt\" value=\"" + vh.getVehicleId() + "\" placeholder=\"Chassis Number\" style=\"border-color: rgba(133,135,150,0);\" readonly=\"\"></div>");
                                                                    out.print("<div class=\"d-md-flex justify-content-md-center align-items-md-center mb-3\" style=\"border: 1px outset rgb(209,211,226);border-radius: 5.6px;background: #eaecf4;\"><i class=\"far fa-newspaper\" style=\"border-left-color: rgb(133, 135, 150);margin-left: 5px;\"></i><input class=\"form-control\" type=\"text\" id=\"chassisNo-1\" name=\"chasiNoDeleteTxt\" value=\"" + vh.getChasiNo() + "\" placeholder=\"Chassis Number\" style=\"border-color: rgba(133,135,150,0);\" readonly=\"\"></div>");
                                                                    out.print("<div class=\"d-md-flex justify-content-md-center align-items-md-center mb-3\" style=\"border: 1px outset rgb(209,211,226);border-radius: 5.6px;background: #eaecf4;\"><i class=\"fas fa-window-maximize\" style=\"border-left-color: rgb(133, 135, 150);margin-left: 5px;\"></i><input class=\"form-control\" type=\"text\" id=\"numberPlate-1\" name=\"numberPlateDeleteTxt\" value=\"" + vh.getNoPlate() + "\" placeholder=\"Number Plate\" style=\"border-color: rgba(133,135,150,0);\" readonly=\"\"></div>");
                                                                    out.print("<div class=\"text-start d-md-flex justify-content-md-start align-items-md-center mb-3\" style=\"border: 1px outset rgb(209,211,226);border-radius: 5.6px;background: #eaecf4;\"><i class=\"fas fa-car text-start\" style=\"border-left-color: rgb(133, 135, 150);margin-left: 5px;\"></i><input class=\"form-control\" type=\"text\" id=\"numberPlate-2\" name=\"vehicleCategoryDeleteTxt\" value=\"" + vh.getCategory() + "\" placeholder=\"Vehicle Category\" style=\"border-color: rgba(133,135,150,0);\" readonly=\"\"></div>");
                                                                    out.print("<div class=\"text-start d-md-flex justify-content-md-start align-items-md-center mb-3\" style=\"border: 1px outset rgb(209,211,226);border-radius: 5.6px;background: #eaecf4;\"><i class=\"fas fa-map-marker-alt text-start\" style=\"border-left-color: rgb(133, 135, 150);margin-left: 5px;\"></i><input class=\"form-control\" type=\"text\" id=\"numberPlate-3\" name=\"branchDeleteTxt\" value=\"" + vh.getBranch() + "\" placeholder=\"Branch\" style=\"border-color: rgba(133,135,150,0);\" readonly=\"\"></div>");
                                                                    out.print("<div class=\"d-md-flex justify-content-md-center align-items-md-center mb-3\" style=\"border: 1px outset rgb(209,211,226);border-radius: 5.6px;background: #eaecf4;\"><i class=\"far fa-address-card\" style=\"border-left-color: rgb(133, 135, 150);margin-left: 5px;\"></i><input class=\"form-control\" type=\"text\" id=\"driverID-1\" name=\"driverIDDeleteTxt\" placeholder=\"Driver ID\" value=\"" + vh.getDriver() + "\" style=\"border-color: rgba(133,135,150,0);\" readonly=\"\"></div>");
                                                                    //out.print("<div><a class=\"btn btn-primary d-block w-100\" role=\"button\" id=\"DeleteVehicleBtn\" href=\"\" style=\"background: var(--bs-red);border-color: var(--bs-red);\" data-bs-toggle=\"modal\">Delete</a></div>");

                                                                    out.print("<div><button class=\"btn btn-primary d-block w-100\" id=\"DeleteVehicleCategoryBtn\" type=\"submit\" style=\"background: var(--bs-red);margin-top: 5px;border-color: var(--bs-red);\">Delete</button></div>");

                                                                    out.print("</form>");
                                                                    out.print("</div>");
                                                                    out.print("</div>");
                                                                    out.print("</div>");
                                                                    out.print("</div>");
                                                                    out.print("</td>");
                                                                    out.print("</tr>");
                                                                }
                                                            } else {
                                                                Vehicle vh = proxy.getVehicle(request.getParameter("vehicleSearch"));
                                                                out.print("<tr class=\"table-warning\">");
                                                                out.print("<td>");
                                                                out.print("<div>");
                                                                out.print("<div class=\"d-lg-flex justify-content-lg-start align-items-lg-center\">");
                                                                out.print("<p id=\"vehicleId\" style=\"margin-bottom: 0px;margin-left: 0px;\">" + vh.getVehicleId() + "</p>");
                                                                out.print("</div>");
                                                                out.print("</div>");
                                                                out.print("</td>");
                                                                out.print("<td>");
                                                                out.print("<div>");
                                                                out.print("<div class=\"d-lg-flex justify-content-lg-start\"></div>");
                                                                out.print("<p id=\"vehicleChass\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + vh.getChasiNo() + "</p>");
                                                                out.print("</div>");
                                                                out.print("</td>");
                                                                out.print("<td>");
                                                                out.print("<div>");
                                                                out.print("<div class=\"d-lg-flex justify-content-lg-start\"></div>");
                                                                out.print("<p id=\"vehicleNoPlate\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + vh.getNoPlate() + "</p>");
                                                                out.print("</div>");
                                                                out.print("</td>");
                                                                out.print("<td>");
                                                                out.print("<div>");
                                                                out.print("<p id=\"vehicleCategory\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + vh.getCategory() + "</p>");
                                                                out.print("</div>");
                                                                out.print("</td>");
                                                                out.print("<td>");
                                                                out.print("<div>");
                                                                out.print("<p id=\"vehivleBranch\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + vh.getBranch() + "</p>");
                                                                out.print("</div>");
                                                                out.print("</td>");
                                                                out.print("<td>");
                                                                out.print("<div>");
                                                                out.print("<p id=\"vehivleBranch\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + vh.getDriver() + "</p>");
                                                                out.print("</div>");
                                                                out.print("</td>");
                                                                out.print("<td>");
                                                                out.print("<div>");
                                                                out.print("<p id=\"availabilityT\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\" name=\"availabilityT\">" + vh.getAvailability() + "</p>");
                                                                out.print("</div>");
                                                                out.print("</td>");
                                                                //out.print("</form method=\"post\" action=\"admin/admin-vehicle-update.jsp\">");
                                                                out.print("<td style=\"padding-right: 0px;padding-left: 0px;\"><a class=\"btn btnMaterial btn-flat success semicircle\" role=\"button\" data-bss-hover-animate=\"pulse\" id=\"VehicleUpdateBtn\" href=\"admin/admin-vehicle-update.jsp?vehicleDataPass=" + vh.getVehicleId() + "\" style=\"color: rgb(0,197,179);\"><i class=\"fas fa-pen\"></i></a><a class=\"btn btnMaterial btn-flat accent btnNoBorders checkboxHover\" role=\"button\" data-bss-hover-animate=\"pulse\" id=\"VehicleDeleteBtn\" style=\"margin-left: 5px;\" data-bs-toggle=\"modal\" data-bs-target=\"#VehicleDeleteModal" + vh.getVehicleId() + "\" href=\"#VehicleDeleteModal\"><i class=\"fas fa-trash btnNoBorders\" style=\"color: #DC3545;\"></i></a>");
                                                                //out.print("<td style=\"padding-right: 0px;padding-left: 0px;\"><a class=\"btn btnMaterial btn-flat primary semicircle\" role=\"button\" data-bss-hover-animate=\"pulse\" id=\"VehicleViewBtn\" href=\"#admin-VehicleModalView\" style=\"color: #00bdff;\" data-bs-toggle=\"modal\"><i class=\"far fa-eye\"></i></a><a class=\"btn btnMaterial btn-flat success semicircle\" role=\"button\" data-bss-hover-animate=\"pulse\" id=\"VehicleUpdateBtn\" href=\"Admin/admin-vehicle-update.jsp?vehicleDataPass=" + vh.getVehicleId() + "\" style=\"color: rgb(0,197,179);\"><i class=\"fas fa-pen\"></i></a><a class=\"btn btnMaterial btn-flat accent btnNoBorders checkboxHover\" role=\"button\" data-bss-hover-animate=\"pulse\" id=\"VehicleDeleteBtn\" style=\"margin-left: 5px;\" data-bs-toggle=\"modal\" data-bs-target=\"#VehicleDeleteModal" + vh.getVehicleId()+ "\" href=\"#VehicleDeleteModal\"><i class=\"fas fa-trash btnNoBorders\" style=\"color: #DC3545;\"></i></a>");
//out.print("</form>");

                                                                out.print("<div class=\"modal fade\" role=\"dialog\" tabindex=\"-1\" id=\"VehicleDeleteModal" + vh.getVehicleId() + "\">");
                                                                out.print("<div class=\"modal-dialog\" role=\"document\">");
                                                                out.print("<div class=\"modal-content\">");
                                                                out.print("<div class=\"modal-header\">");
                                                                out.print("<h4 id=\"vehicleHeading-1\">Vehicle info</h4><button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>");
                                                                out.print("</div>");
                                                                out.print("<div class=\"modal-body\" style=\"text-align: left;\">");
                                                                out.print("<form action=\"admin/p-vehicle-delete.jsp\" method=\"post\">");
                                                                out.print("<div class=\"d-md-flex justify-content-md-center align-items-md-center mb-3\" style=\"border: 1px outset rgb(209,211,226);border-radius: 5.6px;background: #eaecf4;\"><i class=\"far fa-newspaper\" style=\"border-left-color: rgb(133, 135, 150);margin-left: 5px;\"></i><input class=\"form-control\" type=\"text\" id=\"VehicleIdDeleteTxt\" name=\"VehicleIdDeleteTxt\" value=\"" + vh.getVehicleId() + "\" placeholder=\"Chassis Number\" style=\"border-color: rgba(133,135,150,0);\" readonly=\"\"></div>");
                                                                out.print("<div class=\"d-md-flex justify-content-md-center align-items-md-center mb-3\" style=\"border: 1px outset rgb(209,211,226);border-radius: 5.6px;background: #eaecf4;\"><i class=\"far fa-newspaper\" style=\"border-left-color: rgb(133, 135, 150);margin-left: 5px;\"></i><input class=\"form-control\" type=\"text\" id=\"chassisNo-1\" name=\"chasiNoDeleteTxt\" value=\"" + vh.getChasiNo() + "\" placeholder=\"Chassis Number\" style=\"border-color: rgba(133,135,150,0);\" readonly=\"\"></div>");
                                                                out.print("<div class=\"d-md-flex justify-content-md-center align-items-md-center mb-3\" style=\"border: 1px outset rgb(209,211,226);border-radius: 5.6px;background: #eaecf4;\"><i class=\"fas fa-window-maximize\" style=\"border-left-color: rgb(133, 135, 150);margin-left: 5px;\"></i><input class=\"form-control\" type=\"text\" id=\"numberPlate-1\" name=\"numberPlateDeleteTxt\" value=\"" + vh.getNoPlate() + "\" placeholder=\"Number Plate\" style=\"border-color: rgba(133,135,150,0);\" readonly=\"\"></div>");
                                                                out.print("<div class=\"text-start d-md-flex justify-content-md-start align-items-md-center mb-3\" style=\"border: 1px outset rgb(209,211,226);border-radius: 5.6px;background: #eaecf4;\"><i class=\"fas fa-car text-start\" style=\"border-left-color: rgb(133, 135, 150);margin-left: 5px;\"></i><input class=\"form-control\" type=\"text\" id=\"numberPlate-2\" name=\"vehicleCategoryDeleteTxt\" value=\"" + vh.getCategory() + "\" placeholder=\"Vehicle Category\" style=\"border-color: rgba(133,135,150,0);\" readonly=\"\"></div>");
                                                                out.print("<div class=\"text-start d-md-flex justify-content-md-start align-items-md-center mb-3\" style=\"border: 1px outset rgb(209,211,226);border-radius: 5.6px;background: #eaecf4;\"><i class=\"fas fa-map-marker-alt text-start\" style=\"border-left-color: rgb(133, 135, 150);margin-left: 5px;\"></i><input class=\"form-control\" type=\"text\" id=\"numberPlate-3\" name=\"branchDeleteTxt\" value=\"" + vh.getBranch() + "\" placeholder=\"Branch\" style=\"border-color: rgba(133,135,150,0);\" readonly=\"\"></div>");
                                                                out.print("<div class=\"d-md-flex justify-content-md-center align-items-md-center mb-3\" style=\"border: 1px outset rgb(209,211,226);border-radius: 5.6px;background: #eaecf4;\"><i class=\"far fa-address-card\" style=\"border-left-color: rgb(133, 135, 150);margin-left: 5px;\"></i><input class=\"form-control\" type=\"text\" id=\"driverID-1\" name=\"driverIDDeleteTxt\" placeholder=\"Driver ID\" value=\"" + vh.getDriver() + "\" style=\"border-color: rgba(133,135,150,0);\" readonly=\"\"></div>");
                                                                //out.print("<div><a class=\"btn btn-primary d-block w-100\" role=\"button\" id=\"DeleteVehicleBtn\" href=\"\" style=\"background: var(--bs-red);border-color: var(--bs-red);\" data-bs-toggle=\"modal\">Delete</a></div>");

                                                                out.print("<div><button class=\"btn btn-primary d-block w-100\" id=\"DeleteVehicleCategoryBtn\" type=\"submit\" style=\"background: var(--bs-red);margin-top: 5px;border-color: var(--bs-red);\">Delete</button></div>");

                                                                out.print("</form>");
                                                                out.print("</div>");
                                                                out.print("</div>");
                                                                out.print("</div>");
                                                                out.print("</div>");
                                                                out.print("</td>");
                                                                out.print("</tr>");
                                                            }
                                                        %>
                                                    <form action=""


                                                          </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <footer class="bg-white sticky-footer">
                    <div class="container my-auto">
                        <div class="text-center my-auto copyright"><span>Developed by asel</span></div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/bs-init.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
        <script src="assets/js/theme.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="stylesheet" href="alert/dist/sweetalert.css"><!-- comment -->

        <script type="text/javascript">
            var status = document.getElementById("status").value;
            if (status == "success") {
                swal("congratulations", "successfully registered", "success");
            } else if (status == "failed") {
                swal("OOps", "Unsuccessfully registered", "error");
            }
        </script>


        <script type="text/javascript">
            function passBranchId(branch) {
//            var id = $("#branchId").html();
//            var name = $("#branchName").html();
//            var str = "asel algama";
                $("#brnchID2").html(branch);
                $("#brnchLocation").val(branch);
//            $("#BranhHeading-1").html(str);
            }

        </script>

        <script type="text/javascript">
            function deleteBranchId(branch) {
//            var id = $("#branchId").html();
//            var name = $("#branchName").html();
//            var str = "asel algama";
                $("#brnchIDDelete").html(branch);
//            $("#BranhHeading-1").html(str);
            }

        </script>

        <script type="text/javascript">
            function passVehicleCategoryId(branch) {
//            var id = $("#branchId").html();
//            var name = $("#branchName").html();
//            var str = "asel algama";
                $("#vehicleCategoryIDT").html(branch);
                $("#vehicleCategoryT").val(branch);
//            $("#BranhHeading-1").html(str);
            }

        </script>

        <script type="text/javascript">
            function DeleteCategoryId(branch) {
//            var id = $("#branchId").html();
//            var name = $("#branchName").html();
//            var str = "asel algama";
                $("#vehicleListIDDelete").html(branch);
                $("#vehicleListDelete").val(branch);
//            $("#BranhHeading-1").html(str);
            }

        </script>

        <script type="text/javascript">
            function Deletevehicle(branch) {
//            var id = $("#branchId").html();
//            var name = $("#branchName").html();
//            var str = "asel algama";
                $("#VehicleIdDeleteTxt").html(branch);
//            $("#BranhHeading-1").html(str);
            }

        </script>

        <script type="text/javascript">
            var url = window.location.href;
            function tabPass() {

                var activeTab = url.substring(url.indexOf("#") + 1);
                $('a[href="#' + activeTab + '"]').tab('show');
            }
            if (url.includes("#")) {
                tabPass();
            }

        </script>



    </body>




</html>
