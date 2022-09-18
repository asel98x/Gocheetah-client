<%-- 
    Document   : admin-destination-delete
    Created on : Sep 12, 2022, 8:44:59 PM
    Author     : asel
--%>

<%@page import="service.Destination"%>
<%@page import="service.GocheetahWebService"%>
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
        
        Destination ds = new Destination();
        String search = request.getParameter("DestinationDataPass");
        ds = proxy.getDstination(search);

        int id = ds.getDestinationID();
        String branch = ds.getDBranch();
        String pickup = ds.getDPickup();
        String drop = ds.getDDrop();
        int price = ds.getDistance();
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
                                <h2 class="text-center mb-4" style="color: rgb(133,135,150);">Destination Delete</h2>
                                <form action="p-destination-delete.jsp" method="post">
                                    <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;background: #e9ecef;"><i class="far fa-id-card" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="ID" name="ID" value="<%out.print(search);%>" placeholder="ID" required="" style="border-color: rgba(133,135,150,0);" readonly=""></div>
                                    <div class="text-start d-md-flex justify-content-md-start align-items-md-center mb-3" id="adminBranch-1" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;background: #eaecf4;"><i class="fas fa-map-marker-alt text-start" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="adminName-5" name="branch" value="<%out.print(branch);%>" placeholder="Branch" required="" style="border-color: rgba(133,135,150,0);" readonly=""></div>
                                    <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;background: #eaecf4;"><i class="fas fa-map" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="adminName-2" name="pickup" value="<%out.print(pickup);%>" placeholder="Pick-up Location" required="" style="border-color: rgba(133,135,150,0);" readonly=""></div>
                                    <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;background: #eaecf4;"><i class="fas fa-map-marked-alt" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="adminName-4" name="drop" value="<%out.print(drop);%>" placeholder="Drop Location" required="" style="border-color: rgba(133,135,150,0);" readonly=""></div>
                                    <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;background: #eaecf4;"><i class="fas fa-road" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="adminName-3" name="price" value="<%out.print(price);%>" placeholder="price" required="" style="border-color: rgba(133,135,150,0);" readonly=""></div>
                                    <div><button class="btn btn-primary d-block w-100" id="destinationDeleteBtn" type="submit" style="background: var(--bs-red);border-color: var(--bs-red);">Delete</button></div>
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
