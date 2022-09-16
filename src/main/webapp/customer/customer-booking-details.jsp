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
            
            String pickup = request.getParameter("pickup");
            String drop = request.getParameter("drop");
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
            typePrice = sum *presentage;
            total = sum + typePrice;
        %>
<body>
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
    <section class="position-relative py-4 py-xl-5" style="background: #F8F9FB;">
        <div class="container position-relative">
            <div class="row d-flex justify-content-center">
                <div class="col-md-8 col-lg-6 col-xl-5 col-xxl-4">
                    <div class="card mb-5">
                        <div class="card-body p-sm-5">
                            <h2 class="text-center mb-4" style="color: rgb(133,135,150);">Booking Details</h2>
                            <form method="post">
                                <div>
                                    <div class="row" style="height: 40px;margin-bottom: 10px;">
                                        <div class="col">
                                            <div>
                                                <p style="margin-top: 9px;font-weight: bold;color: #233143;"><i class="fas fa-car-side" style="border-left-color: rgb(133, 135, 150);margin-left: 8px;margin-right: 10px;"></i>Vehicle Name</p>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div style="margin-top: 10px;">
                                                <p name="vehiName"><%out.print(vehiName);%></p>
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
                                    <div class="row" style="height: 40px;margin-bottom: 30px;">
                                        <div class="col">
                                            <div>
                                                <p style="margin-top: 9px;font-weight: bold;color: #233143;"><i class="fas fa-map-marker-alt text-start" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;margin-right: 10px;"></i>Branch</p>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div>
                                                <div style="margin-top: 10px;">
                                                    <p name="driverName"><%out.print(branch);%></p>
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
                                                <p style="margin-top: 10px;"><%out.print(pickup);%></p>
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
                                                <p style="margin-top: 10px;"><%out.print(drop);%></p>
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
                                                <p style="margin-top: 10px;"><%out.print(total);%></p>
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
</body>

</html>
