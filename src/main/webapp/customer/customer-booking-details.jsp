<%-- 
    Document   : customer-booking-final
    Created on : Sep 16, 2022, 7:30:55 PM
    Author     : asel
--%>

<%@page import="service.VehicleCat"%>
<%@page import="service.Destination"%>
<%@page import="service.GocheetahWebService_Service"%>
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

        String vehiName = session.getAttribute("BvehiName").toString();
        String type = session.getAttribute("Btype").toString();
        String category = session.getAttribute("Bcategory").toString();
        String seat = session.getAttribute("Bseat").toString();
        String branch = session.getAttribute("Bbranch").toString();
        String driverID = session.getAttribute("BdriverID").toString();
        String driverName = session.getAttribute("BdriverName").toString();
        String availability = session.getAttribute("Bavailability").toString();
        //String pickup2 = session.getAttribute("Bpickup").toString();
        //String drop2 = session.getAttribute("Bdrop").toString();

        String pickup = request.getParameter("pickup");
        String drop = request.getParameter("drop");
        session.setAttribute("Bpickup", pickup);
        session.setAttribute("Bdrop", drop);
        session.getAttribute("vehiID");
        session.getAttribute("driverID");
        
        session.getAttribute(drop);
        VehicleCat vc = new VehicleCat();
        vc = proxy.getVehicleCategoryh(category);
        Float presentage = vc.getPresentage();

        int distance = 0;

        if (pickup != null && drop != null) {
            for (Destination ds : proxy.getDestiations(branch)) {
                if (ds.getDDrop().equals(drop) && ds.getDPickup().equals(pickup)) {
                    distance = ds.getDistance();
                }
            }
        }

        //price calculate
        int FiexedPrice = 100; //fixed price per 1Km
        int sum = 0;
        float typePrice = 0;
        float total = 0;

        sum = FiexedPrice * distance;
        typePrice = sum * presentage;
        total = sum + typePrice;
        session.setAttribute("Btotal", total);

//        if (availability.equals("Unavailable")) {
//            dispatcher = request.getRequestDispatcher("customer-booking-details.jsp");
//            request.setAttribute("status", "failed");
//        }
//        dispatcher.forward(request, response);
%>
    <body>
        <input type="hidden" id="status"  value="<%= request.getAttribute("status")%>">
        <%            response.setHeader("Cache-Control", "no-store, must-revalidate");
            response.setHeader("pragma", "no-cache");
            response.setHeader("Expires", "0");

            if (session.getAttribute("mobile") == null) {
                response.sendRedirect("customer-login.jsp");
            }
            String id = session.getAttribute("id").toString();
            String name = session.getAttribute("name").toString();
            String address = session.getAttribute("address").toString();
            String mobile = session.getAttribute("mobile").toString();
            String email = session.getAttribute("email").toString();
        %>
        <div id="wrapper">
            <div class="d-flex flex-column" id="content-wrapper">
                <div id="content">
                    <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                        <div class="container-fluid">
                            <ul class="navbar-nav flex-nowrap ms-auto">
                                <li class="nav-item d-lg-flex justify-content-lg-center align-items-lg-center dropdown no-arrow mx-1"><span id="adminProfileName"><%out.print(name);%></span></li>
                                <li class="nav-item dropdown no-arrow mx-1"><a href="p-logout.jsp"><span style="width: 32px;height: 32px;border-radius: 30px;"><img id="adminProfilePic" style="width: 32px;height: 32px;border-radius: 30px;" src="../assets/img/cheetah trans.png"></span></a></li>
                            </ul>
                        </div>
                    </nav>
        <section class="position-relative py-4 py-xl-5" style="background: #F8F9FB;">
            <div class="container position-relative">
                <div class="row d-flex justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5 col-xxl-4">
                        <div class="card mb-5">
                            <div class="card-body p-sm-5">
                                <h2 class="text-center mb-4" style="color: rgb(133,135,150);">Booking Details</h2>
                                <form action="p-booking.jsp" method="post">
                                    <div>
                                        <div class="row" style="height: 40px;margin-bottom: 10px;">
                                            <div class="col">
                                                <div>
                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143;"><i class="fas fa-car-side" style="border-left-color: rgb(133, 135, 150);margin-left: 8px;margin-right: 10px;"></i>Vehicle Name</p>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div style="margin-top: 10px;">
                                                    <p name="bkVehiName"><%out.print(vehiName);%></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="height: 40px;margin-bottom: 10px;">
                                            <div class="col">
                                                <div>
                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143;"><i class="fas fa-caravan" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;margin-right: 10px;"></i>Vehicle Type</p>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div></div>
                                                <div style="margin-top: 10px;">
                                                    <p name="vehiType"><%out.print(type);%></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="height: 40px;margin-bottom: 10px;">
                                            <div class="col">
                                                <div>
                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143;"><i class="fas fa-align-justify" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;margin-right: 10px;"></i>Vehicle Category</p>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div></div>
                                                <div style="margin-top: 10px;">
                                                    <p name="vehiCategory"><%out.print(category);%></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="height: 40px;margin-bottom: 10px;">
                                            <div class="col">
                                                <div>
                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143;"><i class="fas fa-users" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;margin-right: 10px;"></i>Passengers</p>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div></div>
                                                <div style="margin-top: 10px;">
                                                    <p name="vehiPassengers"><%out.print(seat);%></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="height: 40px;margin-bottom: 10px;">
                                            <div class="col">
                                                <div>
                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143;"><i class="fas fa-user text-start" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;margin-right: 10px;"></i>Driver</p>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div>
                                                    <div style="margin-top: 10px;">
                                                        <p name="driverName"><%out.print(driverName);%></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="height: 40px;margin-bottom: 10px;">
                                            <div class="col">
                                                <div>
                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143;"><i class="fas fa-map-marker-alt text-start" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;margin-right: 10px;"></i>Branch</p>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div>
                                                    <div style="margin-top: 10px;">
                                                        <p name="bkBranch"><%out.print(branch);%></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="height: 40px;margin-bottom: 30px;">
                                            <div class="col">
                                                <div>
                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143;"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="1em" height="1em" fill="currentColor" class="text-start" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;margin-right: 10px;">
                                                        <path d="M32 160h319.9l.0791 72c0 9.547 5.652 18.19 14.41 22c8.754 3.812 18.93 2.078 25.93-4.406l112-104c10.24-9.5 10.24-25.69 0-35.19l-112-104c-6.992-6.484-17.17-8.217-25.93-4.408c-8.758 3.816-14.41 12.46-14.41 22L351.9 96H32C14.31 96 0 110.3 0 127.1S14.31 160 32 160zM480 352H160.1L160 279.1c0-9.547-5.652-18.19-14.41-22C136.9 254.2 126.7 255.9 119.7 262.4l-112 104c-10.24 9.5-10.24 25.69 0 35.19l112 104c6.992 6.484 17.17 8.219 25.93 4.406C154.4 506.2 160 497.5 160 488L160.1 416H480c17.69 0 32-14.31 32-32S497.7 352 480 352z"></path>
                                                        </svg>Availability</p>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div>
                                                    <div style="margin-top: 10px;">
                                                        <p name="driverName"><%out.print(availability);%></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row" style="height: 40px;margin-bottom: 10px;">
                                            <div class="col">
                                                <div>
                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143;"><i class="fas fa-user-tie" style="border-left-color: rgb(133, 135, 150);margin-left: 8px;margin-right: 10px;"></i>Name</p>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div>
                                                    <p style="margin-top: 10px;"><%out.print(name);%></p>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row" style="height: 40px;margin-bottom: 10px;">
                                            <div class="col">
                                                <div>
                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143;"><i class="fas fa-phone-alt" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;margin-right: 10px;"></i>Mobile</p>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div>
                                                    <p style="margin-top: 10px;"><%out.print(mobile);%></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="height: 40px;margin-bottom: 10px;">
                                            <div class="col">
                                                <div>
                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143;"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-envelope-fill" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;margin-right: 10px;">
                                                        <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z"></path>
                                                        </svg>Email</p>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div>
                                                    <p style="margin-top: 10px;"><%out.print(email);%></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="height: 40px;margin-bottom: 10px;">
                                            <div class="col">
                                                <div>
                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143;"><i class="fas fa-map text-start" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;margin-right: 10px;"></i>Pick-up Location</p>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div>
                                                    <p name="bkPickup" style="margin-top: 10px;"><%out.print(pickup);%></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="height: 40px;margin-bottom: 10px;">
                                            <div class="col">
                                                <div>
                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143;"><i class="fas fa-map-marked-alt text-start" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;margin-right: 10px;"></i>Drop Location</p>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div>
                                                    <p name="bkDrop" style="margin-top: 10px;"><%out.print(drop);%></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="height: 40px;margin-bottom: 25px;">
                                            <div class="col">
                                                <div>
                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143;"><i class="fas fa-dollar-sign text-start" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;margin-right: 10px;"></i>&nbsp;Price&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Rs.</p>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div>
                                                    <p name="bkPrice" style="margin-top: 10px;"><%out.print(total);%></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div style="margin-top: 0px;"><button class="btn btn-primary d-block w-100" type="submit" style="border-color: #e9b546;background: #e9b546;">Process</button></div>

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
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="stylesheet" href="alert/dist/sweetalert.css"><!-- comment -->

        <script type="text/javascript">
            var status = document.getElementById("status").value;
            if (status == "success") {
                swal("", "success");
            } else if (status == "failed") {
                swal("Sorry!", "Vehicle is Unavailable at the moment", "error");
            }
        </script>
        <%
            String branch2 = request.getParameter("bkBranch");
            session.setAttribute("bkBranch2", branch2);
            session.setAttribute("bkPickup2", "bkPickup");
            session.setAttribute("bkDrop", "bkDrop");
            session.setAttribute("bkPrice", "bkPrice");
        %>
    </body>

</html>
