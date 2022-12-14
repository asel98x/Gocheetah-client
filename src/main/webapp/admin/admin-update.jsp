<%-- 
    Document   : admin-update
    Created on : Sep 9, 2022, 1:13:56 AM
    Author     : asel
--%>

<%@page import="service.BranchCategory"%>
<%@page import="service.Admin"%>
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

        response.setHeader("Cache-Control", "no-store, must-revalidate");
        response.setHeader("pragma", "no-cache");
        response.setHeader("Expires", "0");

        if (session.getAttribute("email") == null) {
            response.sendRedirect("admin-login.jsp");
        }
        String id2 = session.getAttribute("id").toString();
        String name2 = session.getAttribute("name").toString();
        
        Admin ad = new Admin();
        String search = request.getParameter("adminDataPass");
        ad = proxy.getAdmin(search);

        String name = ad.getName();
        String address = ad.getAddress();
        int mobile = ad.getMobile();
        String NIC = ad.getNic();
        String dob = ad.getDob();
        int age = ad.getAge();
        String email = ad.getEmail();
        String password = ad.getPassword();
        String branch = ad.getBranch();
        String type = ad.getType();
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
                                <h2 class="text-center mb-4" style="color: rgb(133,135,150);">Admin Update</h2>
                                <form action="p-admin-update.jsp" method="post">
                                    <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;background: #eaecf4;"><i class="far fa-id-card" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="adminName" name="adminID" placeholder="ID" style="border-color: rgba(133,135,150,0);" value="<%out.print(search);%>" readonly=""></div>
                                    <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-user-tie" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="adminName" name="adminName" value="<%out.print(name);%>" placeholder="Name" required="" style="border-color: rgba(133,135,150,0);"></div>
                                    <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-location-arrow" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="adminAddress" name="adminAddress" value="<%out.print(address);%>"  placeholder="Address" required="" style="border-color: rgba(133,135,150,0);"></div>
                                    <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-phone-alt" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="placeholder form-control" type="tel" id="adminMobile" name="adminMobile" value="<%out.print(mobile);%>" style="border-color: rgba(133,135,150,0);background: rgba(133,135,150,0);" placeholder="Mobile" required="" minlength="10" maxlength="10"></div>
                                    <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="far fa-address-card" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="adminNIC" name="adminNIC" value="<%out.print(NIC);%>" placeholder="NIC" required="" style="border-color: rgba(133,135,150,0);" minlength="10" maxlength="10"></div>
                                    <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><input class="form-control" id="adminDOB" name="adminDOB" type="date" value="<%out.print(dob);%>" required=""></div>
                                    <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-user-alt" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="adminAge" name="adminAge" value="<%out.print(age);%>" placeholder="Age" required="" style="border-color: rgba(133,135,150,0);"></div>
                                    <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-envelope-fill" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;">
                                        <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z"></path>
                                        </svg><input class="form-control" type="email" id="adminEmail" name="adminEmail" value="<%out.print(email);%>" style="border-color: rgba(133,135,150,0);" placeholder="Email" required=""></div>
                                    <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-lock-fill" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;">
                                        <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2z"></path>
                                        </svg><input class="form-control" type="password" value="<%out.print(password);%>" required="" minlength="8" name="password" placeholder="Password" style="border-color: rgba(133,135,150,0);"></div>
                                    <div class="text-start d-md-flex justify-content-md-start align-items-md-center mb-3" id="adminBranch"  style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-map-marker-alt text-start" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><select class="form-select" style="border-color: rgba(33,37,41,0);" name="adminBranch" required="">
                                            <%
                                                   for (BranchCategory b : proxy.viewBranches()) {
                                                        if (branch.equals(b.getLocation())) {
                                                        
                                                        out.print("<option selected=\"\">" + b.getLocation() + "</option>");
                                                        
                                                    } else {
                                                        out.print("<option>" + b.getLocation() + "</option>");
                                                    }
                                                }
                                            %> 
                                        </select></div>
                                    <div class="text-start d-md-flex justify-content-md-start align-items-md-center mb-3" id="adminBranch-1" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-user text-start" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><select class="form-select" name="type" style="border-color: rgba(33,37,41,0);" required="">
                                            <option value="Main"<%if(ad.getType().equals("Main"))out.print("selected");%>>Main</option>
                                            <option value="Normal"<%if(ad.getType().equals("Normal"))out.print("selected");%>>Normal</option>
                                        </select></div>
                                    <div><button class="btn btn-primary d-block w-100" type="submit" style="border-color: #e9b546;background: #e9b546;">Update</button></div>
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
