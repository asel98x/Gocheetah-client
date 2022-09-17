<%-- 
    Document   : customer-booking-details
    Created on : Sep 16, 2022, 7:21:07 PM
    Author     : asel
--%>

<%@page import="service.GocheetahWebService_Service"%>
<%@page import="service.GocheetahWebService"%>
<%@page import="service.Vehicle"%>
<%@page import="service.Vehicle"%>
<%@page import="service.Driver"%>
<%@page import="service.BranchCategory"%>
<%@page import="service.Destination"%>
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
        String availability = vh.getAvailability();

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

        session.setAttribute("BvehiName", vehiName);
        session.setAttribute("Btype", type);
        session.setAttribute("Bcategory", category);
        session.setAttribute("Bseat", seat);
        session.setAttribute("Bbranch", branch);
        session.setAttribute("BdriverID", driverID);
        session.setAttribute("BdriverName", driverName);
        session.setAttribute("Bavailability", availability);
        
        String customerName = request.getParameter("name");
        String customerAddress = request.getParameter("address");
        String customerMobile = request.getParameter("mobile");
        String customerEmail = request.getParameter("email");
        session.setAttribute("BcustomerName", customerName);
        session.setAttribute("BcustomerAddress", customerAddress);
        session.setAttribute("BcustomerMobile", customerMobile);
        session.setAttribute("BcustomerEmail", customerEmail);
        session.setAttribute("Bpickup", pickup);
        session.setAttribute("Bdrop", drop);
        session.setAttribute("vehiID", vh.getVehicleId());
        session.setAttribute("driverID", vh.getDriver());

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
                                <h2 class="text-center mb-4" style="color: rgb(133,135,150);">Booking Process</h2>
                                <form action="customer-booking-details.jsp" method="post">
                                    <div>
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
                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143;"><i class="fas fa-map-marker-alt text-start" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;margin-right: 10px;"></i>Branch</p>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div>
                                                    <p style="margin-top: 10px;"><%out.print(branch);%></p>
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
                                                    <div class="text-start d-md-flex justify-content-md-start align-items-md-center mb-3" id="adminBranch-4" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><select class="form-select" style="border-color: rgba(33,37,41,0);" required="" name="pickup">
                                                            <%
                                                                for (Destination ds : proxy.getDestiations(branch)) {
                                                                    out.print("<option name=\"pickup\" value=\"" + ds.getDPickup() + "\" selected=\"\">" + ds.getDPickup() + "</option>");
                                                                }
                                                            %>
                                                        </select></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="height: 40px;margin-bottom: 25px;">
                                            <div class="col">
                                                <div>
                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143;"><i class="fas fa-map-marked-alt text-start" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;margin-right: 10px;"></i>Drop Location</p>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div>
                                                    <div class="text-start d-md-flex justify-content-md-start align-items-md-center mb-3" id="adminBranch-5" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><select class="form-select" style="border-color: rgba(33,37,41,0);" required="" name="drop">
                                                            <%          for (Destination ds : proxy.getDestiations(branch)) {
                                                                    out.print("<option  name=\"drop\" value=\"" + ds.getDDrop() + "\"  selected=\"\">" + ds.getDDrop() + "</option>");
                                                                }
                                                            %>
                                                        </select></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div style="margin-top: 0px;"><button class="btn btn-primary d-block w-100" type="submit" style="border-color: #e9b546;background: #e9b546;">Get price</button></div>
                                    
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
