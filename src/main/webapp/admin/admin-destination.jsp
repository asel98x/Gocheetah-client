<%-- 
    Document   : admin-destination
    Created on : Sep 12, 2022, 7:34:59 PM
    Author     : asel
--%>

<%@page import="service.Destination"%>
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
        <title>admin Destination</title>
        <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap">
        <link rel="stylesheet" href="../assets/fonts/fontawesome-all.min.css">
        <link rel="stylesheet" href="../assets/css/AXY-Contact-Us-ContactUs.css">
        <link rel="stylesheet" href="../assets/css/AXY-Contact-Us.css">
        <link rel="stylesheet" href="../assets/css/Features-Large-Icons-icons.css">
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

            if (session.getAttribute("email") == null) {
                response.sendRedirect("admin-login.jsp");
            }

            String id = session.getAttribute("id").toString();
            String name = session.getAttribute("name").toString();
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
                        <li class="nav-item"><a class="nav-link" data-bss-hover-animate="pulse" href="admin-panel.jsp"><span><i class="fas fa-shuttle-van"></i>Panel</span></a></li>
                        <li class="nav-item"><a class="nav-link" data-bss-hover-animate="pulse" href="../admin-users.jsp"><i class="fas fa-user-friends"></i><span>Users</span></a></li>
                        <li class="nav-item"><a class="nav-link" data-bss-hover-animate="pulse" href="../admin-others2.jsp"><span><i class="fas fa-shuttle-van"></i>Others</span></a></li>
                        <li class="nav-item"><a class="nav-link" data-bss-hover-animate="pulse" href="admin-destination.jsp"><span><i class="fas fa-map-marked-alt"></i>Destinations</span></a></li>
                        <li class="nav-item"><a class="nav-link" data-bss-hover-animate="pulse" href="p-logout.jsp"><span><i class="fas fa-sign-in-alt"></i>Logout</span></a></li>
                    </ul>
                </div>
            </nav>
            <div class="d-flex flex-column" id="content-wrapper">
                <div id="content">
                    <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                        <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle me-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars" style="color: rgb(233,181,70);"></i></button>
                            <ul class="navbar-nav flex-nowrap ms-auto">
                                <li class="nav-item d-lg-flex justify-content-lg-center align-items-lg-center dropdown no-arrow mx-1"><span id="adminProfileName"><%out.print(name);%></span></li>
                                <li class="nav-item dropdown no-arrow mx-1"><span style="width: 32px;height: 32px;border-radius: 30px;"><img id="adminProfilePic" style="width: 32px;height: 32px;border-radius: 30px;" src="../assets/img/cheetah trans.png"></span></li>
                            </ul>
                        </div>
                    </nav>
                    <div class="container-fluid">
                        <div class="d-sm-flex justify-content-between align-items-center mb-4">
                            <h3 class="text-dark mb-0">Destination</h3>
                        </div>
                        <div class="card shadow">
                            <div class="card-header py-3">
                                <p class="m-0 fw-bold" style="color: rgb(233,181,70);width: auto;">Destination Info</p>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6 text-nowrap">
                                        <form action="admin-destination.jsp" method="post">
                                            <div id="dataTable_length-1" class="dataTables_length" aria-controls="dataTable"><label class="form-label d-flex d-sm-flex d-md-flex d-lg-flex d-xl-flex d-xxl-flex justify-content-center align-items-center justify-content-sm-center align-items-sm-center justify-content-md-center align-items-md-center justify-content-lg-start align-items-lg-center justify-content-xl-start align-items-xl-center justify-content-xxl-center align-items-xxl-center"><input type="search" id="DestinationSearch" class="form-control form-control-sm" aria-controls="dataTable" placeholder="Search" style="width: 200px;" name="DestinationSearch"><button class="btn btn-primary" data-bss-disabled-mobile="true" data-bss-hover-animate="pulse" id="DestinationSearchBtn" type="submit" style="background: rgba(78,115,223,0);border-color: rgba(255,255,255,0);"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-search" style="margin-top: 0px;margin-left: 0px;width: 16px;color: rgb(197,195,195);">
                                                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
                                                        </svg></button></label></div>
                                        </form>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="text-md-end dataTables_filter" id="dataTable_filter-1"><a class="btn btn-primary btn-lg" role="button" id="createDestinationBtn" href="#DestinationModal" data-bs-toggle="modal" style="padding: 7px 0px;padding-top: 0px;padding-bottom: 0px;background: rgba(13,110,253,0);color: rgb(197,195,195);border-color: rgba(197,195,195,0);"><i class="fas fa-map-marked-alt" data-bs-toggle="tooltip" data-bss-tooltip="" data-bs-placement="left" data-bss-disabled-mobile="true" data-bss-hover-animate="pulse" title="Create New Branch"></i></a>
                                            <div class="modal fade" role="dialog" tabindex="-1" id="DestinationModal">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h4 id="BranhHeading">Create New Destination</h4><button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body" style="text-align: left;">
                                                            <form action="p-destination-add.jsp" method="post">

                                                                <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-map-marker-alt" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><select class="form-select" id="branchList-4" name="branchList" required="" style="border-color: rgba(133,135,150,0);">
                                                                        <%          for (BranchCategory bn : proxy.viewBranches()) {
                                                                                out.print("<option name=\"branch\" selected=\"\">" + bn.getLocation() + "</option>");
                                                                            }
                                                                        %> 
                                                                    </select></div>
                                                                <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-map" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" style="border-color: rgba(133,135,150,0);" placeholder="Pick-up Location" name="pickup" required=""></div>
                                                                <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-map-marked-alt" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" style="border-color: rgba(133,135,150,0);" placeholder="Drop Location" name="drop" required=""></div>
                                                                <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-dollar-sign" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" style="border-color: rgba(133,135,150,0);" placeholder="Price" name="total" required=""></div>
                                                                <div><button class="btn btn-primary d-block w-100" id="DestinationCreateBtn" type="submit" style="background: #e9b546;border-color: #e9b546;">Create</button></div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="table-responsive" style="padding: 6px;margin-top: 5px;">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th style="color: rgb(152,152,152);">Id</th>
                                                <th style="color: rgb(152,152,152);">Branch</th>
                                                <th style="color: rgb(152,152,152);">Pickup</th>
                                                <th style="color: rgb(152,152,152);">Drop</th>
                                                <th style="color: rgb(152,152,152);">Distance</th>
                                                <th style="color: rgb(152,152,152);">Manage</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                if (request.getParameter("DestinationSearch") == null || request.getParameter("DestinationSearch").isEmpty()) {
                                                    for (Destination ds : proxy.dstinationList()) {
                                                        out.print("<tr class=\"table-warning\">");
                                                        out.print("<td>");
                                                        out.print("<div>");
                                                        out.print("<div class=\"d-lg-flex justify-content-lg-start align-items-lg-center\">");
                                                        out.print("<p id=\"destinationID\" style=\"margin-bottom: 0px;margin-left: 0px;\">" + ds.getDestinationID() + "</p>");
                                                        out.print("</div>");
                                                        out.print("</div>");
                                                        out.print("</td>");
                                                        out.print("<td>");
                                                        out.print("<div>");
                                                        out.print("<p id=\"branchT\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\" name=\"branchT\">" + ds.getDBranch() + "</p>");
                                                        out.print("</div>");
                                                        out.print("</td>");
                                                        out.print("<td>");
                                                        out.print("<div>");
                                                        out.print("<p id=\"pickupT\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\" name=\"pickupT\">" + ds.getDPickup() + "</p>");
                                                        out.print("</div>");
                                                        out.print("</td>");
                                                        out.print("<td>");
                                                        out.print("<div>");
                                                        out.print("<p id=\"dropT\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\" name=\"dropT\">" + ds.getDDrop() + "</p>");
                                                        out.print("</div>");
                                                        out.print("</td>");
                                                        out.print("<td>");
                                                        out.print("<div>");
                                                        out.print("<p id=\"totalT\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\" name=\"totalT\">" + ds.getDistance() + " Km</p>");
                                                        out.print("</div>");
                                                        out.print("</td>");
                                                        out.print("<td style=\"padding-right: 0px;padding-left: 0px;\"><a class=\"btn btnMaterial btn-flat success semicircle\" role=\"button\" data-bss-disabled-mobile=\"true\" data-bss-hover-animate=\"pulse\" id=\"DestinationUpdateBtn\" href=\"admin-destination-update.jsp?DestinationDataPass=" + ds.getDestinationID() + "\" style=\"color: rgb(0,197,179);\" name=\"DestinationUpdateBtn\"><i class=\"fas fa-pen\"></i></a><a class=\"btn btnMaterial btn-flat accent btnNoBorders checkboxHover\" role=\"button\" data-bss-disabled-mobile=\"true\" data-bss-hover-animate=\"pulse\" id=\"deleteDestinationBtn\" style=\"margin-left: 5px;\" href=\"admin-destination-delete.jsp?DestinationDataPass=" + ds.getDestinationID() + "\" name=\"deleteDestinationBtn\"><i class=\"fas fa-trash btnNoBorders\" style=\"color: #DC3545;\"></i></a></td>");
                                                        out.print("</tr>");
                                                    }
                                                } else {
                                                    Destination ds = proxy.getDstination(request.getParameter("DestinationSearch"));
                                                    out.print("<tr class=\"table-warning\">");
                                                    out.print("<td>");
                                                    out.print("<div>");
                                                    out.print("<div class=\"d-lg-flex justify-content-lg-start align-items-lg-center\">");
                                                    out.print("<p id=\"destinationID\" style=\"margin-bottom: 0px;margin-left: 0px;\">" + ds.getDestinationID() + "</p>");
                                                    out.print("</div>");
                                                    out.print("</div>");
                                                    out.print("</td>");
                                                    out.print("<td>");
                                                    out.print("<div>");
                                                    out.print("<p id=\"branchT\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\" name=\"branchT\">" + ds.getDBranch() + "</p>");
                                                    out.print("</div>");
                                                    out.print("</td>");
                                                    out.print("<td>");
                                                    out.print("<div>");
                                                    out.print("<p id=\"pickupT\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\" name=\"pickupT\">" + ds.getDPickup() + "</p>");
                                                    out.print("</div>");
                                                    out.print("</td>");
                                                    out.print("<td>");
                                                    out.print("<div>");
                                                    out.print("<p id=\"dropT\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\" name=\"dropT\">" + ds.getDDrop() + "</p>");
                                                    out.print("</div>");
                                                    out.print("</td>");
                                                    out.print("<td>");
                                                    out.print("<div>");
                                                    out.print("<p id=\"totalT\" style=\"color: rgb(164,164,164);margin-bottom: 0px;\" name=\"totalT\">" + ds.getDistance() + " Km</p>");
                                                    out.print("</div>");
                                                    out.print("</td>");
                                                    out.print("<td style=\"padding-right: 0px;padding-left: 0px;\"><a class=\"btn btnMaterial btn-flat success semicircle\" role=\"button\" data-bss-disabled-mobile=\"true\" data-bss-hover-animate=\"pulse\" id=\"DestinationUpdateBtn\" href=\"admin-destination-update.jsp?DestinationDataPass=" + ds.getDestinationID() + "\" style=\"color: rgb(0,197,179);\" name=\"DestinationUpdateBtn\"><i class=\"fas fa-pen\"></i></a><a class=\"btn btnMaterial btn-flat accent btnNoBorders checkboxHover\" role=\"button\" data-bss-disabled-mobile=\"true\" data-bss-hover-animate=\"pulse\" id=\"deleteDestinationBtn\" style=\"margin-left: 5px;\" href=\"admin-destination-delete.jsp?DestinationDataPass=" + ds.getDestinationID() + "\" name=\"deleteDestinationBtn\"><i class=\"fas fa-trash btnNoBorders\" style=\"color: #DC3545;\"></i></a></td>");
                                                    out.print("</tr>");
                                                }
                                            %>

                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <footer class="bg-white sticky-footer">
                    <div class="container my-auto">
                        <div class="d-flex justify-content-between align-items-center pt-3">
                            <p data-bss-hover-animate="tada" class="mb-0">Developed by Asel Algama&nbsp;</p>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="../assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="../assets/js/bs-init.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
        <script src="../assets/js/theme.js"></script>


        <script type="text/javascript">
            function DestinationDataPass(driver) {
                $("#destinationID").html(driver);
            }

            var url = window.location.href;
        </script>
    </body>

</html>
