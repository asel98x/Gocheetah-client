<%-- 
    Document   : admin-driver-update
    Created on : Sep 9, 2022, 1:13:27 AM
    Author     : asel
--%>

<%@page import="service.Vehicle"%>
<%@page import="service.BranchCategory"%>
<%@page import="service.Driver"%>
<%@page import="service.GocheetahWebService"%>
<%@page import="service.GocheetahWebService_Service"%>
<%@page import="service.GocheetahWebService_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>admin-panel</title>
        <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap">
        <link rel="stylesheet" href="../assets/fonts/fontawesome-all.min.css">
        <link rel="stylesheet" href="../assets/css/AXY-Contact-Us-ContactUs.css">
        <link rel="stylesheet" href="../assets/css/AXY-Contact-Us.css">
        <link rel="stylesheet" href="../assets/css/Features-Large-Icons-icons.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
    </head>
    <%
        GocheetahWebService_Service service = new GocheetahWebService_Service();
        GocheetahWebService proxy = service.getGocheetahWebServicePort();
        RequestDispatcher dispatcher = null;

        if (session.getAttribute("email") == null) {
            response.sendRedirect("admin-login.jsp");
        }

        String id2 = session.getAttribute("id").toString();
        String name2 = session.getAttribute("name").toString();

        Driver dr = new Driver();
        String search = request.getParameter("DriverDataPass");
        dr = proxy.getDriver(search);

        int id = dr.getDriverID();
        String name = dr.getName();
        String address = dr.getAddress();
        int mobile = dr.getMobile();
        String NIC = dr.getNic();
        String licence = dr.getLicence();
        String dob = dr.getDob();
        int age = dr.getAge();
        String email = dr.getEmail();
        String vehicle = dr.getVehicle();
        String branch = dr.getBranch();
        String password = dr.getPassword();
    %>
    <body>
        <div id="wrapper">
            <div class="d-flex flex-column" id="content-wrapper">
                <div id="content">
                    <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                        <div class="container-fluid">
                            <ul class="navbar-nav flex-nowrap ms-auto">
                                <li class="nav-item d-lg-flex justify-content-lg-center align-items-lg-center dropdown no-arrow mx-1"><span id="adminProfileName"><%out.print(name2);%></span></li>
                                <li class="nav-item dropdown no-arrow mx-1"><span style="width: 32px;height: 32px;border-radius: 30px;"><img id="adminProfilePic" style="width: 32px;height: 32px;border-radius: 30px;" src="../assets/img/cheetah trans.png"></span></li>
                            </ul>
                        </div>
                    </nav>
                    <section class="position-relative py-4 py-xl-5" style="background: #F8F9FB;">
                        <div class="container position-relative">
                            <div class="row d-flex justify-content-center">
                                <div class="col-md-8 col-lg-6 col-xl-5 col-xxl-4">
                                    <div class="card mb-5">
                                        <div class="card-body p-sm-5">
                                            <h2 class="text-center mb-4" style="color: rgb(133,135,150);">Driver Update</h2>
                                            <form action="p-driver-update.jsp" method="post">
                                                <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;background: #e9ecef;"><i class="far fa-id-card" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="d" name="ID" placeholder="ID" value="<%out.print(search);%>" required="" style="border-color: rgba(133,135,150,0);" readonly=""></div>
                                                <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-user-tie" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="Drivername" name="Drivername" value="<%out.print(name);%>" placeholder="Name" required="" style="border-color: rgba(133,135,150,0);"></div>
                                                <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-location-arrow" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="driverAddress" name="driverAddress" value="<%out.print(address);%>" placeholder="Address" required="" style="border-color: rgba(133,135,150,0);"></div>
                                                <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-phone-alt" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="placeholder form-control" type="tel" id="driberMobile" name="driberMobile" value="<%out.print(mobile);%>" style="border-color: rgba(133,135,150,0);background: rgba(133,135,150,0);" placeholder="Mobile" required="" minlength="10" maxlength="10"></div>
                                                <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="far fa-address-card" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="driverNIC" name="driverNIC" value="<%out.print(NIC);%>" placeholder="NIC" required="" style="border-color: rgba(133,135,150,0);" minlength="10" maxlength="10"></div>
                                                <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="far fa-address-card" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="Licence" name="Licence" value="<%out.print(licence);%>" placeholder="Licence" required="" style="border-color: rgba(133,135,150,0);" minlength="8" maxlength="8"></div>
                                                <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><input class="form-control" id="driverDOB" name="driverDOB" value="<%out.print(dob);%>"  type="date" required=""></div>
                                                <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-user-alt" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="driverAge" name="driverAge" value="<%out.print(age);%>" placeholder="Age" required="" style="border-color: rgba(133,135,150,0);"></div>
                                                <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-envelope-fill" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;">
                                                    <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z"></path>
                                                    </svg><input class="form-control" type="email" id="driverEmail" name ="driverEmail" value="<%out.print(email);%>" style="border-color: rgba(133,135,150,0);" placeholder="Email" required=""></div>
                                                <div class="text-start d-md-flex justify-content-md-start align-items-md-center mb-3" name="driverVehicle" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-car text-start" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><select class="form-select" style="border-color: rgba(33,37,41,0);">
                                                        <%
                                                            for (Vehicle ve : proxy.findDriverVehicleList(search)) {
                                                                out.print("<option name=\"\" selected=\"\">" + ve.getNoPlate() + "</option>");
                                                            }
                                                        %>
                                                    </select></div>
                                                <div class="text-start d-md-flex justify-content-md-start align-items-md-center mb-3" id="adminBranch" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-map-marker-alt text-start" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><select class="form-select" name="branch" style="border-color: rgba(33,37,41,0);" required="">
                                                        <%          for (BranchCategory b : proxy.viewBranches()) {
                                                                if (branch.equals(b.getLocation())) {

                                                                    out.print("<option selected=\"\">" + b.getLocation() + "</option>");

                                                                } else {
                                                                    out.print("<option>" + b.getLocation() + "</option>");
                                                                }
                                                            }
                                                        %> 
                                                    </select></div>
                                                <div class="text-start d-md-flex justify-content-md-start align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-lock text-start" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="password" name="password" value="<%out.print(password);%>" placeholder="Password" style="border-color: rgba(133,135,150,0);" required="" minlength="8"></div>
                                                <div><button class="btn btn-primary d-block w-100" id="driverAddBtn" type="submit" style="background: #e9b546;border-color: #e9b546;">Update</button></div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <script src="../assets/bootstrap/js/bootstrap.min.js"></script>
                    <script src="../assets/js/bs-init.js"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
                    <script src="../assets/js/theme.js"></script>
                    </body>

                    </html>
