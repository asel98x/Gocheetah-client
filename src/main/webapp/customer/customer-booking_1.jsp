<%-- 
    Document   : customer-booking
    Created on : Sep 14, 2022, 10:57:30 PM
    Author     : asel
--%>

<%@page import="service.Destination"%>
<%@page import="service.Driver"%>
<%@page import="service.BranchCategory"%>
<%@page import="service.Vehicle"%>
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

        Vehicle vh = new Vehicle();
        Driver dr = new Driver();
        BranchCategory bc = new BranchCategory();
        String search = request.getParameter("vehicleDataPass");

        vh = proxy.getVehicle(search);

        String vehiName = vh.getVehicleName();
        String type = vh.getType();
        String category = vh.getCategory();
        String seat = vh.getPassengers();
        String branch = vh.getBranch();

        String driverID = vh.getDriver();
        dr = proxy.getDriver(driverID);
        String driverName = dr.getName();

        String pickup = request.getParameter("pickup");
        String drop = request.getParameter("drop");
        int distance = 0;

        if (pickup != null && drop != null) {
            for (Destination ds : proxy.getDestiations(branch)) {
                if (ds.getDDrop().equals(drop) && ds.getDPickup().equals(pickup)) {
                    distance = ds.getDistance();
                }
            }
        }

        session.setAttribute("Bbranch", branch);

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
                                <h2 class="text-center mb-4" style="color: rgb(133,135,150);">Vehicle details</h2>
                                <form action="" method="post">
                                    <div>
                                        <div class="row" style="height: 40px;margin-bottom: 10px;">
                                            <div class="col">
                                                <div>
                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143; "><i class="fas fa-car-side" style="border-left-color: rgb(133, 135, 150);margin-left: 8px;margin-right: 10px;"></i>Vehicle Name</p>
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
                                                    <p name="vehiType"><%out.print(category);%></p>
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
                                                    <p name="vehiCategory"><%out.print(type);%></p>
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
                                                        <p name="driverName"><%out.print(branch);%></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8 col-lg-6 col-xl-5 col-xxl-4">
                        <div class="card mb-5">
                            <div class="card-body p-sm-5">
                                <h2 class="text-center mb-4" style="color: rgb(133,135,150);">Booking Process</h2>
                                <form action="p-customer-booking.jsp" method="post">
                                    <div>
                                        <div class="row" style="height: 40px;margin-bottom: 10px;">
                                            <div class="col">
                                                <div>
                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143;"><i class="fas fa-user-tie" style="border-left-color: rgb(133, 135, 150);margin-left: 8px;margin-right: 10px;"></i>Name</p>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div>
                                                    <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><input class="form-control" type="text" id="customerName" name="name" value="<%out.print(name);%>" placeholder="Name" required="" style="border-color: rgba(133,135,150,0);"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="height: 40px;margin-bottom: 10px;">
                                            <div class="col">
                                                <div>
                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143;"><i class="fas fa-location-arrow" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;margin-right: 10px;"></i>Address</p>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div>
                                                    <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><input class="form-control" type="text" id="address" name="address" value="<%out.print(address);%>" placeholder="Address" required="" style="border-color: rgba(133,135,150,0);"></div>
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
                                                    <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><input class="placeholder form-control" type="tel" id="mobile" value="<%out.print(mobile);%>" style="border-color: rgba(133,135,150,0);background: rgba(133,135,150,0);" placeholder="Mobile" required="" minlength="10" maxlength="10" name="mobile"></div>
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
                                                    <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><input class="form-control" type="email" id="email" value="<%out.print(email);%>" style="border-color: rgba(133,135,150,0);" placeholder="Email" required="" name="email"></div>
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
                                                    <div class="text-start d-md-flex justify-content-md-start align-items-md-center mb-3" id="adminBranch-4" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><select class="form-select" style="border-color: rgba(33,37,41,0);" required="" id="pickupID" name="pickup">
                                                            <%
                                                                for (Destination ds : proxy.getDestiations(branch)) {
                                                                    out.print("<option name=\"pickup\" value=\"" + ds.getDPickup() + "\" selected=\"\">" + ds.getDPickup() + "</option>");
                                                                }
                                                            %> 
                                                        </select></div>
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
                                                    <div class="text-start d-md-flex justify-content-md-start align-items-md-center mb-3" id="adminBranch-5" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><select class="form-select" style="border-color: rgba(33,37,41,0);" required="" id="dropID" name="drop">
                                                            <%          for (Destination ds : proxy.getDestiations(branch)) {
                                                                    out.print("<option  name=\"drop\" value=\"" + ds.getDDrop() + "\"  selected=\"\">" + ds.getDDrop() + "</option>");
                                                                }
                                                            %>
                                                        </select></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div style="margin-top: 0px;"><button class="btn btn-primary d-block w-100"  type="submit" style="border-color: #e9b546;background: #e9b546;">Get the price</button></div>
                                        <div class="row" style="height: 40px;margin-bottom: 35px;">
                                            <div class="col">
                                                <div>
                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143;"><i class="fas fa-dollar-sign text-start" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;margin-right: 10px;"></i>&nbsp;Price&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Rs.</p>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div>
                                                    <p style="margin-top: 10px;" name="price"><%out.print(distance);%></p>
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