<%-- 
    Document   : admin-users
    Created on : Sep 7, 2022, 7:48:19 PM
    Author     : asel
--%>

<%@page import="service.Customer"%>
<%@page import="service.Driver"%>
<%@page import="service.Admin"%>
<%@page import="service.BranchCategory"%>
<%@page import="service.GocheetahWebService"%>
<%@page import="service.GocheetahWebService_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>admin users</title>
       
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
            response.setHeader("Cache-Control", "no-store, must-revalidate");
            response.setHeader("pragma", "no-cache");
            response.setHeader("Expires", "0");
            
            if(session.getAttribute("email")==null){
                response.sendRedirect("admin-login.jsp");
            }
            String id = session.getAttribute("id").toString();
            String name = session.getAttribute("name").toString();
        %>
<input type="hidden" id="status2"  value="<%= request.getAttribute("status")%>">
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
                        <li class="nav-item"><a class="nav-link" data-bss-hover-animate="pulse" href="admin/p-logout.jsp"><span><i class="fas fa-sign-in-alt"></i>Logout</span></a></li>
                    </ul>
                </div>
            </nav>
            <div class="d-flex flex-column" id="content-wrapper">
                <div id="content">
                    <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                        <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle me-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars" style="color: rgb(233,181,70);"></i></button>
                            <ul class="navbar-nav flex-nowrap ms-auto">
                                <li class="nav-item d-lg-flex justify-content-lg-center align-items-lg-center dropdown no-arrow mx-1"><span id="adminProfileName"><%out.print(name);%></span></li>
                                <li class="nav-item dropdown no-arrow mx-1"><span style="width: 32px;height: 32px;border-radius: 30px;"><img id="adminProfilePic" style="width: 32px;height: 32px;border-radius: 30px;" src="assets/img/cheetah trans.png"></span></li>
                            </ul>
                        </div>
                    </nav>
                    <div class="container-fluid">
                        <div class="d-sm-flex justify-content-between align-items-center mb-4" style="padding-left: 0px;">
                            <h3 class="text-dark mb-0">Users</h3>
                        </div>
                        <div>
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item" role="presentation"><a class="nav-link active" role="tab" data-bs-toggle="tab" data-bss-hover-animate="pulse" href="#tab-1" style="color: #233143;">Admin Info</a></li>
                                <li class="nav-item" role="presentation"><a class="nav-link" role="tab" data-bs-toggle="tab" data-bss-hover-animate="pulse" href="#tab-2" style="color: #233143;">Driver Info</a></li>
                                <li class="nav-item" role="presentation"><a class="nav-link" role="tab" data-bs-toggle="tab" data-bss-hover-animate="pulse" href="#tab-3" style="color: #233143;">Customer info</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" role="tabpanel" id="tab-1">
                                    <div class="card shadow">
                                        <div class="card-header py-3">
                                            <p class="m-0 fw-bold" style="color: rgb(233,181,70);width: 82px;">Admin Info</p>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-6 text-nowrap">
                                                    <form action="admin-users.jsp" method="post">
                                                        <div id="dataTable_length-1" class="dataTables_length" aria-controls="dataTable"><label class="form-label d-flex d-sm-flex d-md-flex d-lg-flex d-xl-flex d-xxl-flex justify-content-center align-items-center justify-content-sm-center align-items-sm-center justify-content-md-center align-items-md-center justify-content-lg-start align-items-lg-center justify-content-xl-start align-items-xl-center justify-content-xxl-center align-items-xxl-center"><input type="search" id="adminSearch" name="adminSearch" class="form-control form-control-sm" aria-controls="dataTable" placeholder="Search" style="width: 200px;"><button class="btn btn-primary" data-bss-disabled-mobile="true" data-bss-hover-animate="pulse" id="adminSearchBtn" type="submit" style="background: rgba(78,115,223,0);border-color: rgba(255,255,255,0);"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-search" style="margin-top: 0px;margin-left: 0px;width: 16px;color: rgb(197,195,195);">
                                                                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
                                                                    </svg></button></label></div>
                                                    </form>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="text-md-end dataTables_filter" id="dataTable_filter-1"><a class="btn btn-primary btn-lg" role="button" id="createAdminBtn" href="#myModal" data-bs-toggle="modal" style="padding: 7px 0px;padding-top: 0px;padding-bottom: 0px;background: rgba(13,110,253,0);color: rgb(197,195,195);border-color: rgba(197,195,195,0);"><i class="fas fa-user-plus" data-bs-toggle="tooltip" data-bss-tooltip="" data-bs-placement="left" data-bss-disabled-mobile="true" data-bss-hover-animate="pulse" title="Create New Admin"></i></a>
                                                        <div class="modal fade" role="dialog" tabindex="-1" id="myModal">
                                                            <div class="modal-dialog" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h4 id="adminHeading">Create New Admin</h4><button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                    </div>
                                                                    <div class="modal-body" style="text-align: left;">
                                                                        <form action="admin/p-admin-add.jsp" method="post">
                                                                            
                                                                            <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-user-tie" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="adminName" name="adminName" placeholder="Name" required="" style="border-color: rgba(133,135,150,0);"></div>
                                                                            <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-location-arrow" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="adminAddress" name="adminAddress" placeholder="Address" required="" style="border-color: rgba(133,135,150,0);"></div>
                                                                            <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-phone-alt" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="placeholder form-control" type="tel" id="adminMobile" name="adminMobile" style="border-color: rgba(133,135,150,0);background: rgba(133,135,150,0);" placeholder="Mobile" required="" minlength="10" maxlength="10"></div>
                                                                            <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="far fa-address-card" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="adminNIC" name="adminNIC" placeholder="NIC" required="" style="border-color: rgba(133,135,150,0);" minlength="10" maxlength="10"></div>
                                                                            <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><input class="form-control" id="adminDOB" name="adminDOB" type="date" required=""></div>
                                                                            <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-user-alt" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="adminAge" name="adminAge" placeholder="Age" required="" style="border-color: rgba(133,135,150,0);"></div>
                                                                            <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-envelope-fill" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;">
                                                                                <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z"></path>
                                                                                </svg><input class="form-control" type="email" id="adminEmail" name="adminEmail" style="border-color: rgba(133,135,150,0);" placeholder="Email" required=""></div>
                                                                            <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-lock-fill" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;">
                                                                                <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2z"></path>
                                                                                </svg><input class="form-control" type="password" name="adminPassword" placeholder="Password" required="" style="background: rgba(255,255,255,0);border-color: rgba(133,135,150,0);" minlength="8"></div>
                                                                            <div class="text-start d-md-flex justify-content-md-start align-items-md-center mb-3" id="adminBranch" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-map-marker-alt text-start" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><select class="form-select" name="AdminBranch" style="border-color: rgba(133,135,150,0);" required="">

                                                                                    <%          for (BranchCategory bn : proxy.viewBranches()) {
                                                                                            out.print("<option name=\"branch\" selected=\"\">" + bn.getLocation() + "</option>");
                                                                                        }
                                                                                    %> 
                                                                                </select></div>
                                                                            <div class="text-start d-md-flex justify-content-md-start align-items-md-center mb-3" id=""  style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-user-tag text-start" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><select class="form-select" name="AdminType" style="border-color: rgba(133,135,150,0);" required="">
                                                                                    <option value="12" selected="">Main</option>
                                                                                    <option value="12" selected="">Normal</option>
                                                                                </select></div>
                                                                            <div><button class="btn btn-primary d-block w-100" id="adminAddBtn" type="submit" style="background: #e9b546;border-color: #e9b546;">Create</button></div>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <%-- ADMIN INFO TABLE --%>                                                  
                                            <div class="table-responsive" style="padding: 6px;margin-top: 5px;">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th style="color: rgb(152,152,152);">ID</th>
                                                            <th style="color: rgb(152,152,152);">Admin</th>
                                                            <th style="color: rgb(152,152,152);">NIC</th>
                                                            <th style="color: rgb(152,152,152);">Mobile</th>
                                                            <th style="color: rgb(152,152,152);">Email</th>
                                                            <th style="color: rgb(152,152,152);">Branch</th>
                                                            <th style="color: rgb(152,152,152);">Type</th>
                                                            <th style="color: rgb(152,152,152);">Manage</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                                            if (request.getParameter("adminSearch") == null || request.getParameter("adminSearch").isEmpty()) {
                                                                for (Admin ad : proxy.adminList()) {

                                                                    out.print("<tr class=\"table-warning\">");
                                                                    out.print("<td>");
                                                                    out.print("<div>");
                                                                    out.print("<div class=\"d-lg-flex justify-content-lg-start align-items-lg-center\">");
                                                                    out.print("<p id=\"adminID\" style=\"margin-bottom: 0px;margin-left: 0px;\">" + ad.getAdminId() + "</p>");
                                                                    out.print("</div>");
                                                                    out.print("</div>");
                                                                    out.print("</td>");
                                                                    out.print("<td>");
                                                                    out.print("<div>");
                                                                    out.print("<div class=\"d-lg-flex justify-content-lg-start align-items-lg-center\">");
                                                                    out.print("<p id=\"adminName\" style=\"margin-bottom: 0px;margin-left: 10px;\">" + ad.getName() + "</p>");
                                                                    out.print("</div>");
                                                                    out.print("</div>");
                                                                    out.print("</td>");
                                                                    out.print("<td>");
                                                                    out.print("<div>");
                                                                    out.print("<div class=\"d-lg-flex justify-content-lg-start\"></div>");
                                                                    out.print("<p id=\"adminNIC\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + ad.getNic() + "</p>");
                                                                    out.print("</div>");
                                                                    out.print("</td>");
                                                                    out.print("<td>");
                                                                    out.print("<div>");
                                                                    out.print("<div class=\"d-lg-flex justify-content-lg-start\"></div>");
                                                                    out.print("<p id=\"adminMobile\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + ad.getMobile() + "</p>");
                                                                    out.print("<div>");
                                                                    out.print("</td>");
                                                                    out.print("<td>");
                                                                    out.print("<div>");
                                                                    out.print("<div class=\"d-lg-flex justify-content-lg-start\"></div>");
                                                                    out.print("<p id=\"adminEmail\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + ad.getEmail() + "</p>");
                                                                    out.print("</div>");
                                                                    out.print("</td>");
                                                                    out.print("<td>");
                                                                    out.print("<div>");
                                                                    out.print("<div class=\"d-lg-flex justify-content-lg-start\">");
                                                                    out.print("</div>");
                                                                    out.print("<p id=\"adminBranch\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + ad.getBranch() + "</p>");
                                                                    out.print("</div>");
                                                                    out.print("</td>");
                                                                    out.print("<td>");
                                                                    out.print("<div>");
                                                                    out.print("<div class=\"d-lg-flex justify-content-lg-start\">");
                                                                    out.print("</div>");
                                                                    out.print("<p id=\"adminType\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + ad.getType() + "</p>");
                                                                    out.print("</div>");
                                                                    out.print("</td>");
                                                                    out.print("<td style=\"padding-right: 0px;padding-left: 0px;\"><a class=\"btn btnMaterial btn-flat success semicircle\" role=\"button\" data-bss-disabled-mobile=\"true\" data-bss-hover-animate=\"pulse\" id=\"adminModalUpdateBtn\" href=\"admin/admin-update.jsp?adminDataPass=" + ad.getAdminId() + "\" style=\"color: rgb(0,197,179);\"><i class=\"fas fa-pen\"></i></a><a class=\"btn btnMaterial btn-flat accent btnNoBorders checkboxHover\" role=\"button\" data-bss-disabled-mobile=\"true\" data-bss-hover-animate=\"pulse\" id=\"adminModalDeleteBtn\" style=\"margin-left: 5px;\" href=\"admin/admin_delete.jsp?adminDataPass=" + ad.getAdminId() + "\"><i class=\"fas fa-trash btnNoBorders\" style=\"color: #DC3545;\"></i></a></td>");
                                                                    out.print("</tr>");
                                                                }
                                                            } else {
                                                                Admin ad = proxy.getAdmin(request.getParameter("adminSearch"));
                                                                out.print("<tr class=\"table-warning\">");
                                                                out.print("<td>");
                                                                out.print("<div>");
                                                                out.print("<div class=\"d-lg-flex justify-content-lg-start align-items-lg-center\">");
                                                                out.print("<p id=\"adminID\" style=\"margin-bottom: 0px;margin-left: 0px;\">" + ad.getAdminId() + "</p>");
                                                                out.print("</div>");
                                                                out.print("</div>");
                                                                out.print("</td>");
                                                                out.print("<td>");
                                                                out.print("<div>");
                                                                out.print("<div class=\"d-lg-flex justify-content-lg-start align-items-lg-center\">");
                                                                out.print("<p id=\"adminName\" style=\"margin-bottom: 0px;margin-left: 10px;\">" + ad.getName() + "</p>");
                                                                out.print("</div>");
                                                                out.print("</div>");
                                                                out.print("</td>");
                                                                out.print("<td>");
                                                                out.print("<div>");
                                                                out.print("<div class=\"d-lg-flex justify-content-lg-start\"></div>");
                                                                out.print("<p id=\"adminNIC\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + ad.getNic() + "</p>");
                                                                out.print("</div>");
                                                                out.print("</td>");
                                                                out.print("<td>");
                                                                out.print("<div>");
                                                                out.print("<div class=\"d-lg-flex justify-content-lg-start\"></div>");
                                                                out.print("<p id=\"adminMobile\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + ad.getMobile() + "</p>");
                                                                out.print("<div>");
                                                                out.print("</td>");
                                                                out.print("<td>");
                                                                out.print("<div>");
                                                                out.print("<div class=\"d-lg-flex justify-content-lg-start\"></div>");
                                                                out.print("<p id=\"adminEmail\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + ad.getEmail() + "</p>");
                                                                out.print("</div>");
                                                                out.print("</td>");
                                                                out.print("<td>");
                                                                out.print("<div>");
                                                                out.print("<div class=\"d-lg-flex justify-content-lg-start\">");
                                                                out.print("</div>");
                                                                out.print("<p id=\"adminBranch\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + ad.getBranch() + "</p>");
                                                                out.print("</div>");
                                                                out.print("</td>");
                                                                out.print("<td>");
                                                                out.print("<div>");
                                                                out.print("<div class=\"d-lg-flex justify-content-lg-start\">");
                                                                out.print("</div>");
                                                                out.print("<p id=\"adminType\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + ad.getType() + "</p>");
                                                                out.print("</div>");
                                                                out.print("</td>");
                                                                out.print("<td style=\"padding-right: 0px;padding-left: 0px;\"><a class=\"btn btnMaterial btn-flat success semicircle\" role=\"button\" data-bss-disabled-mobile=\"true\" data-bss-hover-animate=\"pulse\" id=\"adminModalUpdateBtn\" href=\"admin/admin-update.jsp?adminDataPass=" + ad.getAdminId() + "\" style=\"color: rgb(0,197,179);\"><i class=\"fas fa-pen\"></i></a><a class=\"btn btnMaterial btn-flat accent btnNoBorders checkboxHover\" role=\"button\" data-bss-disabled-mobile=\"true\" data-bss-hover-animate=\"pulse\" id=\"adminModalDeleteBtn\" style=\"margin-left: 5px;\" href=\"admin/admin_delete.jsp?adminDataPass=" + ad.getAdminId() + "\"><i class=\"fas fa-trash btnNoBorders\" style=\"color: #DC3545;\"></i></a></td>");
                                                                out.print("</tr>");
                                                            }
                                                        %>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" role="tabpanel" id="tab-2">
                                    <div class="card shadow">
                                        <div class="card-header py-3">
                                            <p class="m-0 fw-bold" style="color: rgb(233,181,70);width: 82px;">Driver Info</p>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-6 text-nowrap">
                                                    <form action="admin-users.jsp#tab-2" method="post">
                                                        <div id="dataTable_length-2" class="dataTables_length" aria-controls="dataTable"><label class="form-label d-flex d-sm-flex d-md-flex d-lg-flex d-xl-flex d-xxl-flex justify-content-center align-items-center justify-content-sm-center align-items-sm-center justify-content-md-center align-items-md-center justify-content-lg-start align-items-lg-center justify-content-xl-start align-items-xl-center justify-content-xxl-center align-items-xxl-center"><input type="search" id="driverSearch" name="driverSearch" class="form-control form-control-sm" aria-controls="dataTable" placeholder="Search" style="width: 200px;"><button class="btn btn-primary" data-bss-disabled-mobile="true" data-bss-hover-animate="pulse" id="driverSearchBtn" type="submit" style="background: rgba(78,115,223,0);border-color: rgba(255,255,255,0);"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-search" style="margin-top: 0px;margin-left: 0px;width: 16px;color: rgb(197,195,195);">
                                                                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
                                                                    </svg></button></label></div>
                                                    </form>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="text-md-end dataTables_filter" id="dataTable_filter-2"><a class="btn btn-primary btn-lg" role="button" data-bs-toggle="modal" data-bss-tooltip="" data-bss-disabled-mobile="true" data-bss-hover-animate="pulse" id="createDriverBtn" style="padding: 7px 0px;padding-top: 0px;padding-bottom: 0px;background: rgba(13,110,253,0);color: rgb(197,195,195);border-color: rgba(197,195,195,0);" href="#createDriverModal"><i class="fas fa-user-plus" data-bs-toggle="tooltip" data-bss-tooltip="" data-bs-placement="left" data-bss-disabled-mobile="true" data-bss-hover-animate="pulse" title="Create New Driver"></i></a>
                                                        <div class="modal fade" role="dialog" tabindex="-1" id="createDriverModal">
                                                            <div class="modal-dialog" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h4 id="driverHeading">Create New Driver</h4><button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                    </div>
                                                                    <div class="modal-body" style="text-align: left;">
                                                                        <form action="admin/p-driver-add.jsp" method="post">
                                                                            <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-user-tie" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="driverName" name="driverName" placeholder="Name" required="" style="border-color: rgba(133,135,150,0);"></div>
                                                                            <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-location-arrow" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="driverAddress" name="driverAddress" placeholder="Address" required="" style="border-color: rgba(133,135,150,0);"></div>
                                                                            <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-phone-alt" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="placeholder form-control" type="tel" id="driverMobile" name="driverMobile" style="border-color: rgba(133,135,150,0);background: rgba(133,135,150,0);" placeholder="Mobile" required="" minlength="10" maxlength="10"></div>
                                                                            <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="far fa-address-card" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="driverNIC" name="driverNIC" placeholder="NIC" required="" style="border-color: rgba(133,135,150,0);" minlength="10" maxlength="10"></div>
                                                                            <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="far fa-address-card" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="driverNIC-1" name="Licence" placeholder="Licence" required="" style="border-color: rgba(133,135,150,0);" minlength="10" maxlength="10"></div>
                                                                            <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><input class="form-control" id="driverDOB" name="driverDOB" type="date" required=""></div>
                                                                            <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-user-alt" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="driverAge" name="driverAge" placeholder="Age" required="" style="border-color: rgba(133,135,150,0);"></div>
                                                                            <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-envelope-fill" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;">
                                                                                <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z"></path>
                                                                                </svg><input class="form-control" type="email" id="driverEmail" name="driverEmail" style="border-color: rgba(133,135,150,0);" placeholder="Email" required=""></div>
                                                                            <div class="text-start d-md-flex justify-content-md-start align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-map-marker-alt text-start" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><select class="form-select" required="" name="branch" style="border-color: rgba(133,135,150,0);">

                                                                                    <%          for (BranchCategory bn : proxy.viewBranches()) {
                                                                                            out.print("<option name=\"branch\" selected=\"\">" + bn.getLocation() + "</option>");
                                                                                        }
                                                                                    %> 
                                                                                </select></div>
                                                                            <div class="text-start d-md-flex justify-content-md-start align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-lock text-start" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="password" placeholder="Password" name="password" style="border-color: rgba(133,135,150,0);" minlength="8" required=""></div>
                                                                            <div><button class="btn btn-primary d-block w-100" id="driverAddBtn" type="submit" style="background: #e9b546;border-color: #e9b546;">Create</button></div>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <%-- Driver INFO TABLE --%>                                                                  
                                            <div class="table-responsive" style="padding: 6px;margin-top: 5px;">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th style="color: rgb(152,152,152);">ID</th>
                                                            <th style="color: rgb(152,152,152);">Driver</th>
                                                            <th style="color: rgb(152,152,152);">NIC</th>
                                                            <th style="color: rgb(152,152,152);">Mobile</th>
                                                            <th style="color: rgb(152,152,152);">Email</th>
                                                            <th style="color: rgb(152,152,152);">Branch</th>
                                                            <th style="color: rgb(152,152,152);">Manage</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                                            if (request.getParameter("driverSearch") == null || request.getParameter("driverSearch").isEmpty()) {
                                                                for (Driver dr : proxy.driverList()) {
                                                                    out.print("<tr class=\"table-warning\">");
                                                                    out.print("<td>");
                                                                    out.print("<div>");
                                                                    out.print("<div class=\"d-lg-flex justify-content-lg-start align-items-lg-center\">");
                                                                    out.print("<p id=\"driverID\" style=\"margin-bottom: 0px;margin-left: 0px;\">" + dr.getDriverID() + "</p>");
                                                                    out.print("</div>");
                                                                    out.print("</div>");
                                                                    out.print("</td>");
                                                                    out.print("<td>");
                                                                    out.print("<div>");
                                                                    out.print("<div class=\"d-lg-flex justify-content-lg-start align-items-lg-center\">");
                                                                    out.print("<p id=\"driverName\" style=\"margin-bottom: 0px;margin-left: 10px;\">" + dr.getName() + "</p>");
                                                                    out.print("</div>");
                                                                    out.print("</div>");
                                                                    out.print("</td>");
                                                                    out.print("<td>");
                                                                    out.print("<div>");
                                                                    out.print("<div class=\"d-lg-flex justify-content-lg-start\"></div>");
                                                                    out.print("<p id=\"driverNIC\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + dr.getMobile() + "</p>");
                                                                    out.print("</div>");
                                                                    out.print("</td>");
                                                                    out.print("<td>");
                                                                    out.print("<div>");
                                                                    out.print("<div class=\"d-lg-flex justify-content-lg-start\"></div>");
                                                                    out.print("<p id=\"driverMobile\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + dr.getMobile() + "</p>");
                                                                    out.print("</div>");
                                                                    out.print("</td>");
                                                                    out.print("<td>");
                                                                    out.print("<div>");
                                                                    out.print("<div class=\"d-lg-flex justify-content-lg-start\"></div>");
                                                                    out.print("<p id=\"driverEmail\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + dr.getEmail() + "</p>");
                                                                    out.print("</div>");
                                                                    out.print("</td>");
                                                                    out.print("<td>");
                                                                    out.print("<div>");
                                                                    out.print("<div class=\"d-lg-flex justify-content-lg-start\">");

                                                                    out.print("</div>");
                                                                    out.print("<p id=\"driverBranch\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + dr.getBranch() + "</p>");
                                                                    out.print("</div>");
                                                                    out.print("</td>");
                                                                    out.print("<td style=\"padding-right: 0px;padding-left: 0px;\"><a class=\"btn btnMaterial btn-flat success semicircle\" role=\"button\" data-bss-disabled-mobile=\"true\" data-bss-hover-animate=\"pulse\" id=\"driverModalUpdateBtn\" href=\"admin/admin-driver-update.jsp?DriverDataPass=" + dr.getDriverID() + "\" style=\"color: rgb(0,197,179);\"><i class=\"fas fa-pen\"></i></a><a class=\"btn btnMaterial btn-flat accent btnNoBorders checkboxHover\" role=\"button\" data-bss-disabled-mobile=\"true\" data-bss-hover-animate=\"pulse\" id=\"driverModalDeleteBtn\" style=\"margin-left: 5px;\" href=\"admin/admin-driver-delete.jsp?DriverDataPass=" + dr.getDriverID() + "\"><i class=\"fas fa-trash btnNoBorders\" style=\"color: #DC3545;\"></i></a></td>");
                                                                    out.print("</tr>");
                                                                }
                                                            } else {
                                                                Driver dr = proxy.getDriver(request.getParameter("driverSearch"));
                                                                out.print("<tr class=\"table-warning\">");
                                                                out.print("<td>");
                                                                out.print("<div>");
                                                                out.print("<div class=\"d-lg-flex justify-content-lg-start align-items-lg-center\">");
                                                                out.print("<p id=\"driverID\" style=\"margin-bottom: 0px;margin-left: 0px;\">" + dr.getDriverID() + "</p>");
                                                                out.print("</div>");
                                                                out.print("</div>");
                                                                out.print("</td>");
                                                                out.print("<td>");
                                                                out.print("<div>");
                                                                out.print("<div class=\"d-lg-flex justify-content-lg-start align-items-lg-center\">");
                                                                out.print("<p id=\"driverName\" style=\"margin-bottom: 0px;margin-left: 10px;\">" + dr.getName() + "</p>");
                                                                out.print("</div>");
                                                                out.print("</div>");
                                                                out.print("</td>");
                                                                out.print("<td>");
                                                                out.print("<div>");
                                                                out.print("<div class=\"d-lg-flex justify-content-lg-start\"></div>");
                                                                out.print("<p id=\"driverNIC\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + dr.getMobile() + "</p>");
                                                                out.print("</div>");
                                                                out.print("</td>");
                                                                out.print("<td>");
                                                                out.print("<div>");
                                                                out.print("<div class=\"d-lg-flex justify-content-lg-start\"></div>");
                                                                out.print("<p id=\"driverMobile\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + dr.getMobile() + "</p>");
                                                                out.print("</div>");
                                                                out.print("</td>");
                                                                out.print("<td>");
                                                                out.print("<div>");
                                                                out.print("<div class=\"d-lg-flex justify-content-lg-start\"></div>");
                                                                out.print("<p id=\"driverEmail\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + dr.getEmail() + "</p>");
                                                                out.print("</div>");
                                                                out.print("</td>");
                                                                out.print("<td>");
                                                                out.print("<div>");
                                                                out.print("<div class=\"d-lg-flex justify-content-lg-start\">");

                                                                out.print("</div>");
                                                                out.print("<p id=\"driverBranch\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + dr.getBranch() + "</p>");
                                                                out.print("</div>");
                                                                out.print("</td>");
                                                                out.print("<td style=\"padding-right: 0px;padding-left: 0px;\"><a class=\"btn btnMaterial btn-flat success semicircle\" role=\"button\" data-bss-disabled-mobile=\"true\" data-bss-hover-animate=\"pulse\" id=\"driverModalUpdateBtn\" href=\"admin/admin-driver-update.jsp?DriverDataPass=" + dr.getDriverID() + "\" style=\"color: rgb(0,197,179);\"><i class=\"fas fa-pen\"></i></a><a class=\"btn btnMaterial btn-flat accent btnNoBorders checkboxHover\" role=\"button\" data-bss-disabled-mobile=\"true\" data-bss-hover-animate=\"pulse\" id=\"driverModalDeleteBtn\" style=\"margin-left: 5px;\" href=\"admin/admin-driver-delete.jsp?DriverDataPass=" + dr.getDriverID() + "\"><i class=\"fas fa-trash btnNoBorders\" style=\"color: #DC3545;\"></i></a></td>");
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
                                            <p class="m-0 fw-bold" style="color: rgb(233,181,70);width: auto;">Customer Info</p>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-6 text-nowrap">
                                                    <form action="admin-users.jsp#tab-3" method="post">
                                                        <div id="dataTable_length-3" class="dataTables_length" aria-controls="dataTable"><label class="form-label d-flex d-sm-flex d-md-flex d-lg-flex d-xl-flex d-xxl-flex justify-content-center align-items-center justify-content-sm-center align-items-sm-center justify-content-md-center align-items-md-center justify-content-lg-start align-items-lg-center justify-content-xl-start align-items-xl-center justify-content-xxl-center align-items-xxl-center"><input type="search" id="customerSearch" name="customerSearch" class="form-control form-control-sm" aria-controls="dataTable" placeholder="Search" style="width: 200px;"><button class="btn btn-primary" data-bss-disabled-mobile="true" data-bss-hover-animate="pulse" id="customerSearchBtn" type="submit" style="background: rgba(78,115,223,0);border-color: rgba(255,255,255,0);"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-search" style="margin-top: 0px;margin-left: 0px;width: 16px;color: rgb(197,195,195);">
                                                                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
                                                                    </svg></button></label></div>
                                                    </form>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="text-md-end dataTables_filter" id="dataTable_filter-3"><a class="btn btn-primary btn-lg" role="button" id="createCustomerBtn" href="#customerCreateModal" data-bs-toggle="modal" style="padding: 7px 0px;padding-top: 0px;padding-bottom: 0px;background: rgba(13,110,253,0);color: rgb(197,195,195);border-color: rgba(197,195,195,0);"><i class="fas fa-user-plus" data-bs-toggle="tooltip" data-bss-tooltip="" data-bs-placement="left" data-bss-disabled-mobile="true" data-bss-hover-animate="pulse" title="Create New Customer"></i></a>
                                                        <div class="modal fade" role="dialog" tabindex="-1" id="customerCreateModal">
                                                            <div class="modal-dialog" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h4 id="customerHeading">Create New Customer</h4><button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                    </div>
                                                                    <div class="modal-body" style="text-align: left;">
                                                                        <form action="admin/p-customer-add.jsp" method="post">
                                                                            <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-user-tie" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="customerName" name="customerName" placeholder="Name" required="" style="border-color: rgba(133,135,150,0);"></div>
                                                                            <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-location-arrow" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="customerAddress" name="customerAddress" placeholder="Address" required="" style="border-color: rgba(133,135,150,0);"></div>
                                                                            <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-phone-alt" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="placeholder form-control" type="tel" id="customerMobile" name="customerMobile" style="border-color: rgba(133,135,150,0);background: rgba(133,135,150,0);" placeholder="Mobile" required="" minlength="10" maxlength="10"></div>
                                                                            <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="far fa-address-card" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="customerNIC" name="customerNIC" placeholder="NIC" required="" style="border-color: rgba(133,135,150,0);" minlength="10" maxlength="10"></div>
                                                                            <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-envelope-fill" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;">
                                                                                <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z"></path>
                                                                                </svg><input class="form-control" type="email" id="customerEmail" name="customerEmail" style="border-color: rgba(133,135,150,0);" placeholder="Email" required=""></div>
                                                                            <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-lock-fill" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;">
                                                                                <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2z"></path>
                                                                                </svg><input class="form-control" type="password" name="password" style="border-color: rgba(133,135,150,0);" placeholder="Password" required="" minlength="8"></div>
                                                                            <div class="text-start d-md-flex justify-content-md-start align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-map-marker-alt text-start" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><select class="form-select" name="branch" style="border-color: rgba(133,135,150,0);">

                                                                                    <%          for (BranchCategory bn : proxy.viewBranches()) {
                                                                                            out.print("<option name=\"branch\" selected=\"\">" + bn.getLocation() + "</option>");
                                                                                        }
                                                                                    %>
                                                                                </select></div>
                                                                            <div><button class="btn btn-primary d-block w-100" id="customerAddBtn" type="submit" style="background: #e9b546;border-color: #e9b546;">Create</button></div>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <%-- customer INFO TABLE --%>                                                                  
                                            <div class="table-responsive" style="padding: 6px;margin-top: 5px;">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th style="color: rgb(152,152,152);">ID</th>
                                                            <th style="color: rgb(152,152,152);">Name</th>
                                                            <th style="color: rgb(152,152,152);">Mobile</th>
                                                            <th style="color: rgb(152,152,152);">Email</th>
                                                            <th style="color: rgb(152,152,152);">NIC</th>
                                                            <th style="color: rgb(152,152,152);">Branch</th>
                                                            <th style="color: rgb(152,152,152);">Manage</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                                            if (request.getParameter("customerSearch") == null || request.getParameter("customerSearch").isEmpty()) {
                                                                for (Customer cs : proxy.customerList()) {
                                                                    out.print("<tr class=\"table-warning\">");
                                                                    out.print("<td>");
                                                                    out.print("<div>");
                                                                    out.print("<div class=\"d-lg-flex justify-content-lg-start align-items-lg-center\">");
                                                                    out.print("<p id=\"customerID\" style=\"margin-bottom: 0px;margin-left: 0px;\">" + cs.getCustomerId() + "</p>");
                                                                    out.print("</div>");
                                                                    out.print("</div>");
                                                                    out.print("</td>");
                                                                    out.print("<td>");
                                                                    out.print("<div>");
                                                                    out.print("<div class=\"d-lg-flex justify-content-lg-start align-items-lg-center\">");
                                                                    out.print("<p id=\"customerName\" style=\"margin-bottom: 0px;margin-left: 10px;\">" + cs.getName() + "</p>");
                                                                    out.print("</div>");
                                                                    out.print("</div>");
                                                                    out.print("</td>");
                                                                    out.print("<td>");
                                                                    out.print("<div>");
                                                                    out.print("<div class=\"d-lg-flex justify-content-lg-start\"></div>");
                                                                    out.print("<p id=\"customerMobile\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + cs.getMobile() + "</p>");
                                                                    out.print("</div>");
                                                                    out.print("</td>");
                                                                    out.print("<td>");
                                                                    out.print("<div>");
                                                                    out.print("<div class=\"d-lg-flex justify-content-lg-start\"></div>");
                                                                    out.print("<p id=\"customerEmail\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + cs.getEmail() + "</p>");
                                                                    out.print("</div>");
                                                                    out.print("</td>");
                                                                    out.print("<td>");
                                                                    out.print("<div>");
                                                                    out.print("<div class=\"d-lg-flex justify-content-lg-start\"></div>");
                                                                    out.print("<p id=\"customerNIC\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + cs.getNic() + "</p>");
                                                                    out.print("</div>");
                                                                    out.print("</td>");
                                                                    out.print("<td>");
                                                                    out.print("<div>");
                                                                    out.print("<div class=\"d-lg-flex justify-content-lg-start\">");

                                                                    out.print("</div>");
                                                                    out.print("<p id=\"customerBranch\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + cs.getBranch() + "</p>");
                                                                    out.print("</div>");
                                                                    out.print("</td>");
                                                                    out.print("<td style=\"padding-right: 0px;padding-left: 0px;\"><a class=\"btn btnMaterial btn-flat success semicircle\" role=\"button\" data-bss-hover-animate=\"pulse\" id=\"customerModalUpdateBtn\" href=\"admin/admin-customer-update.jsp?customerDataPass=" + cs.getCustomerId() + "\" style=\"color: rgb(0,197,179);\"><i class=\"fas fa-pen\"></i></a><a class=\"btn btnMaterial btn-flat accent btnNoBorders checkboxHover\" role=\"button\" data-bss-hover-animate=\"pulse\" id=\"customerModalDeleteBtn\" style=\"margin-left: 5px;\" href=\"admin/admin-customer-delete.jsp?customerDataPass=" + cs.getCustomerId() + "\"><i class=\"fas fa-trash btnNoBorders\" style=\"color: #DC3545;\"></i></a>");

                                                                    out.print("</td>");
                                                                    out.print("</tr>");
                                                                }
                                                            } else {
                                                                Customer cs = proxy.getCustomer(request.getParameter("customerSearch"));
                                                                out.print("<tr class=\"table-warning\">");
                                                                out.print("<td>");
                                                                out.print("<div>");
                                                                out.print("<div class=\"d-lg-flex justify-content-lg-start align-items-lg-center\">");
                                                                out.print("<p id=\"customerID\" style=\"margin-bottom: 0px;margin-left: 0px;\">" + cs.getCustomerId() + "</p>");
                                                                out.print("</div>");
                                                                out.print("</div>");
                                                                out.print("</td>");
                                                                out.print("<td>");
                                                                out.print("<div>");
                                                                out.print("<div class=\"d-lg-flex justify-content-lg-start align-items-lg-center\">");
                                                                out.print("<p id=\"customerName\" style=\"margin-bottom: 0px;margin-left: 10px;\">" + cs.getName() + "</p>");
                                                                out.print("</div>");
                                                                out.print("</div>");
                                                                out.print("</td>");
                                                                out.print("<td>");
                                                                out.print("<div>");
                                                                out.print("<div class=\"d-lg-flex justify-content-lg-start\"></div>");
                                                                out.print("<p id=\"customerMobile\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + cs.getMobile() + "</p>");
                                                                out.print("</div>");
                                                                out.print("</td>");
                                                                out.print("<td>");
                                                                out.print("<div>");
                                                                out.print("<div class=\"d-lg-flex justify-content-lg-start\"></div>");
                                                                out.print("<p id=\"customerEmail\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + cs.getEmail() + "</p>");
                                                                out.print("</div>");
                                                                out.print("</td>");
                                                                out.print("<td>");
                                                                out.print("<div>");
                                                                out.print("<div class=\"d-lg-flex justify-content-lg-start\"></div>");
                                                                out.print("<p id=\"customerNIC\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + cs.getNic() + "</p>");
                                                                out.print("</div>");
                                                                out.print("</td>");
                                                                out.print("<td>");
                                                                out.print("<div>");
                                                                out.print("<div class=\"d-lg-flex justify-content-lg-start\">");

                                                                out.print("</div>");
                                                                out.print("<p id=\"customerBranch\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\">" + cs.getBranch() + "</p>");
                                                                out.print("</div>");
                                                                out.print("</td>");
                                                                out.print("<td style=\"padding-right: 0px;padding-left: 0px;\"><a class=\"btn btnMaterial btn-flat success semicircle\" role=\"button\" data-bss-hover-animate=\"pulse\" id=\"customerModalUpdateBtn\" href=\"admin/admin-customer-update.jsp?customerDataPass=" + cs.getCustomerId() + "\" style=\"color: rgb(0,197,179);\"><i class=\"fas fa-pen\"></i></a><a class=\"btn btnMaterial btn-flat accent btnNoBorders checkboxHover\" role=\"button\" data-bss-hover-animate=\"pulse\" id=\"customerModalDeleteBtn\" style=\"margin-left: 5px;\" href=\"admin/admin-customer-delete.jsp?customerDataPass=" + cs.getCustomerId() + "\"><i class=\"fas fa-trash btnNoBorders\" style=\"color: #DC3545;\"></i></a>");

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
            var status = document.getElementById("status2").value;
            if (status == "success") {
                swal("congratulations", "successfully registered", "success");
            } else if (status == "failed") {
                swal("OOps", "Unsuccessfully registered", "error");
            }
        </script>

        <script type="text/javascript">
            function adminDataPass(admin) {
                $("#adminID").html(admin);
            }

        </script>
        <script type="text/javascript">
            function DriverDataPass(driver) {
                $("#driverID").html(driver);
            }

            function customerDataPass(driver) {
                $("#customerID").html(driver);
            }

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