<%-- 
    Document   : driver-view-feedback
    Created on : Sep 18, 2022, 2:32:40 AM
    Author     : asel
--%>

<%@page import="service.Feedback"%>
<%@page import="service.GocheetahWebService"%>
<%@page import="service.GocheetahWebService_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        GocheetahWebService_Service service = new GocheetahWebService_Service();
        GocheetahWebService proxy = service.getGocheetahWebServicePort();
        RequestDispatcher dispatcher = null;
        
        Feedback fb = new Feedback();
        String search = request.getParameter("passOrderId");
        fb = proxy.getCustomerFeedback(search);
        
        int id = fb.getFeedbackId();
        String orderID = fb.getOrderId();
        String customerId = fb.getCustomerId();
        int driverId = fb.getDriverId();
        String title = fb.getTitle();
        String feedback = fb.getFeedback();
    %>
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

    <body>
        <div id="wrapper">
            <div class="d-flex flex-column" id="content-wrapper">
                <div id="content">
                    <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                        <div class="container-fluid">
                            <ul class="navbar-nav flex-nowrap ms-auto">
                                <li class="nav-item d-lg-flex justify-content-lg-center align-items-lg-center dropdown no-arrow mx-1"><span id="adminProfileName"><%//out.print(name);%></span></li>
                                <li class="nav-item dropdown no-arrow mx-1"><span style="width: 32px;height: 32px;border-radius: 30px;"><img id="adminProfilePic" style="width: 32px;height: 32px;border-radius: 30px;" src="../assets/img/avatars/avatar5.jpeg"></span></li>
                            </ul>
                        </div>
                    </nav>
        <section class="position-relative py-4 py-xl-5" style="background: #F8F9FB;">
            <div class="container position-relative">
                <div class="row d-flex justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5 col-xxl-4">
                        <div class="card mb-5">
                            <div class="card-body p-sm-5">
                                <h2 class="text-center mb-4" style="color: rgb(133,135,150);">Customer feedback</h2>
                                <form action="driver-panel.jsp" method="post">
                                    <div>
                                        <div class="row" style="height: 40px;margin-bottom: 10px;">
                                            <div class="col">
                                                <div>
                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143;"><i class="fas fa-id-card" style="border-left-color: rgb(133, 135, 150);margin-left: 8px;margin-right: 10px;"></i>Order ID</p>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div style="margin-top: 0px;"><input class="form-control" type="text" value="<%out.print(orderID);%>" placeholder="name" readonly=""></div>
                                            </div>
                                        </div>
                                        <div class="row" style="height: 40px;margin-bottom: 10px;">
                                            <div class="col">
                                                <div>
                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143;"><i class="fas fa-user text-start" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;margin-right: 10px;"></i>Customer ID&nbsp; </p>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div>
                                                    <div style="margin-top: 0px;"><input class="form-control" type="text" value="<%out.print(customerId);%>" placeholder="customer ID" readonly=""></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="height: 40px;margin-bottom: 10px;">
                                            <div class="col">
                                                <div>
                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143;"><i class="fas fa-user-tie text-start" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;margin-right: 10px;"></i>Driver ID</p>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div>
                                                    <div style="margin-top: 0px;"><input class="form-control" type="text" value="<%out.print(driverId);%>" placeholder="Driver ID" readonly=""></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div style="margin-bottom: 10px;"><input class="form-control" type="text" value="<%out.print(title);%>" readonly=""></div>
                                        <div><textarea class="form-control" style="margin-bottom: 10px;" readonly=""><%out.print(feedback);%></textarea></div>
                                        <div style="padding-bottom: 10px;"><button class="btn btn-primary d-block w-100" type="submit"  style="background: #e9b546;border-color: #e9b546;">ok</button></div>
                                    </div>

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
