<%-- 
    Document   : admin-view-feedback
    Created on : Sep 17, 2022, 11:50:23 PM
    Author     : asel
--%>

<%@page import="service.Driver"%>
<%@page import="service.Customer"%>
<%@page import="service.Feedback"%>
<%@page import="service.Booking"%>
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
        
        Feedback fb = new Feedback();
        String search = request.getParameter("passOrderId");
        fb = proxy.getCustomerFeedback(search);
        
        int id = fb.getFeedbackId();
        String orderID = fb.getOrderId();
        String customerId = fb.getCustomerId();
        int driverId = fb.getDriverId();
        String title = fb.getTitle();
        String feedback = fb.getFeedback();
        
        System.out.println("passed order id "+search);
        System.out.println("order id "+id);
        System.out.println(driverId);
        System.out.println(title);
        System.out.println(feedback);
        
        
        Customer cs = new Customer();
        cs = proxy.getCustomer(customerId);
        int cId = cs.getCustomerId();
        String cName = cs.getName();
        String cAddress = cs.getAddress();
        int vMobile = cs.getMobile();
        String cNIC = cs.getNic();
        String cMail = cs.getEmail();
        
        Driver dr = new Driver();
    String dri=String.valueOf(driverId);
       
        dr = proxy.getDriver(dri);
        int driverID = dr.getDriverID();
        
   //     System.out.println("Driver id "+dri);
        String dName = dr.getName();
        String dAddress = dr.getAddress();
        int dMobile = dr.getMobile();
        String dNIC = dr.getNic();
        String dLicence = dr.getLicence();
        String dMail = dr.getEmail();
        String dBranch = dr.getBranch();

    %>
    <body>
        <section class="position-relative py-4 py-xl-5" style="background: #F8F9FB;">
            <div class="container position-relative">
                <div class="row d-flex justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5 col-xxl-4">
                        <div class="card mb-5">
                            <div class="card-body p-sm-5">
                                <h2 class="text-center mb-4" style="color: rgb(133,135,150);">Customer feedback</h2>
                                <form action="admin-panel.jsp" method="post">
                                    <div>
                                        <div class="row" style="height: 40px;margin-bottom: 10px;">
                                            <div class="col">
                                                <div>
                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143;"><i class="fas fa-id-card" style="border-left-color: rgb(133, 135, 150);margin-left: 8px;margin-right: 10px;"></i>Order ID</p>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div style="margin-top: 0px;"><input class="form-control" type="text" placeholder="name" value="<%out.print(orderID);%>" readonly=""></div>
                                            </div>
                                        </div>
                                        <div class="row" style="height: 40px;margin-bottom: 10px;">
                                            <div class="col">
                                                <div>
                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143;"><i class="fas fa-user text-start" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;margin-right: 10px;"></i>Customer ID</p>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div>
                                                    <div style="margin-top: 0px;"><a href="#customerDetailsModal" data-bs-toggle="modal" data-bs-target="#customerDetailsModal"><input class="form-control" type="text" placeholder="customer ID" value="<%out.print(customerId);%>" readonly=""></a></div>
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
                                                    <div style="margin-top: 0px;"><a href="#driverDetailsModal" data-bs-toggle="modal" data-bs-target="#driverDetailsModal"><input class="form-control" type="text" name="driID" placeholder="Driver ID" value="<%out.print(driverId);%>" readonly=""></a></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div style="margin-bottom: 10px;"><input class="form-control" type="text" value="<%out.print(title);%>" readonly=""></div>
                                        <div><textarea class="form-control" style="margin-bottom: 10px;" readonly=""><%out.print(feedback);%></textarea></div>
                                    <div style="padding-bottom: 10px;"><button class="btn btn-primary d-block w-100" type="submit"  style="background: #e9b546;border-color: #e9b546;">ok</button></div>
                                    </div>
                                </form>
                                    <div class="modal fade" role="dialog" tabindex="-1" id="customerDetailsModal">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Customer details</h4><button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <form method="post">
                                                    <div>
                                                        <div class="row" style="height: 40px;margin-bottom: 10px;">
                                                            <div class="col">
                                                                <div>
                                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143;"><i class="fas fa-id-card" style="border-left-color: rgb(133, 135, 150);margin-left: 8px;margin-right: 10px;"></i>&nbsp;Customer ID</p>
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <div style="margin-top: 10px;">
                                                                    <p name="vehiName"><%out.print(cId);%></p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row" style="height: 40px;margin-bottom: 10px;">
                                                            <div class="col">
                                                                <div>
                                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143;"><i class="fas fa-user-alt" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;margin-right: 10px;"></i>Full name</p>
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <div></div>
                                                                <div style="margin-top: 10px;">
                                                                    <p name="vehiType"><%out.print(cName);%></p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row" style="height: 40px;margin-bottom: 10px;">
                                                            <div class="col">
                                                                <div>
                                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143;"><i class="fas fa-map-marker-alt" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;margin-right: 10px;"></i>address</p>
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <div></div>
                                                                <div style="margin-top: 10px;">
                                                                    <p name="vehiCategory"><%out.print(cAddress);%></p>
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
                                                                <div></div>
                                                                <div style="margin-top: 10px;">
                                                                    <p name="vehiPassengers"><%out.print(vMobile);%></p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row" style="height: 40px;margin-bottom: 10px;">
                                                            <div class="col">
                                                                <div>
                                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143;"><i class="far fa-id-card text-start" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;margin-right: 10px;"></i>NIC</p>
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <div>
                                                                    <div style="margin-top: 10px;">
                                                                        <p name="driverName"><%out.print(cNIC);%></p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row" style="height: 40px;margin-bottom: 10px;">
                                                            <div class="col">
                                                                <div>
                                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143;"><i class="far fa-envelope text-start" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;margin-right: 10px;"></i>Email</p>
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <div>
                                                                    <div style="margin-top: 10px;">
                                                                        <p name="driverName"><%out.print(cMail);%></p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="modal-footer"><button class="btn btn-light" type="button" data-bs-dismiss="modal">Close</button></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal fade" role="dialog" tabindex="-1" id="driverDetailsModal">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Driver details</h4><button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <form method="post">
                                                    <div>
                                                        <div class="row" style="height: 40px;margin-bottom: 10px;">
                                                            <div class="col">
                                                                <div>
                                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143;"><i class="fas fa-id-card" style="border-left-color: rgb(133, 135, 150);margin-left: 8px;margin-right: 10px;"></i>&nbsp;Driver ID</p>
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <div style="margin-top: 10px;">
                                                                    <p name="vehiName"><%out.print(driverID);%></p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row" style="height: 40px;margin-bottom: 10px;">
                                                            <div class="col">
                                                                <div>
                                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143;"><i class="fas fa-user-alt" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;margin-right: 10px;"></i>Full name</p>
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <div></div>
                                                                <div style="margin-top: 10px;">
                                                                    <p name="vehiType"><%out.print(dName);%></p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row" style="height: 40px;margin-bottom: 10px;">
                                                            <div class="col">
                                                                <div>
                                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143;"><i class="fas fa-map-marker-alt" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;margin-right: 10px;"></i>address</p>
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <div></div>
                                                                <div style="margin-top: 10px;">
                                                                    <p name="vehiCategory"><%out.print(dAddress);%></p>
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
                                                                <div></div>
                                                                <div style="margin-top: 10px;">
                                                                    <p name="vehiPassengers"><%out.print(dMobile);%></p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row" style="height: 40px;margin-bottom: 10px;">
                                                            <div class="col">
                                                                <div>
                                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143;"><i class="far fa-id-card text-start" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;margin-right: 10px;"></i>NIC</p>
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <div>
                                                                    <div style="margin-top: 10px;">
                                                                        <p name="driverName"><%out.print(dNIC);%></p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row" style="height: 40px;margin-bottom: 10px;">
                                                            <div class="col">
                                                                <div>
                                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143;"><i class="far fa-id-card text-start" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;margin-right: 10px;"></i>Driving licence</p>
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <div>
                                                                    <div style="margin-top: 10px;">
                                                                        <p name="driverName"><%out.print(dLicence);%></p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row" style="height: 40px;margin-bottom: 10px;">
                                                            <div class="col">
                                                                <div>
                                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143;"><i class="far fa-envelope text-start" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;margin-right: 10px;"></i>Email</p>
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <div>
                                                                    <div style="margin-top: 10px;">
                                                                        <p name="driverName"><%out.print(dMail);%></p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row" style="height: 40px;margin-bottom: 10px;">
                                                            <div class="col">
                                                                <div>
                                                                    <p style="margin-top: 9px;font-weight: bold;color: #233143;"><i class="fas fa-map-marked-alt text-start" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;margin-right: 10px;"></i>Branch</p>
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <div>
                                                                    <div style="margin-top: 10px;">
                                                                        <p name="driverName"><%out.print(dBranch);%></p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="modal-footer"><button class="btn btn-light" type="button" data-bs-dismiss="modal">Close</button></div>
                                        </div>
                                    </div>
                                </div>
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
