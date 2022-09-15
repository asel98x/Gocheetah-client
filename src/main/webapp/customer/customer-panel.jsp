<%-- 
    Document   : customer-panel
    Created on : Sep 2, 2022, 1:45:56 AM
    Author     : asel
--%>

<%@page import="service.Vehicle"%>
<%@page import="service.GocheetahWebService"%>
<%@page import="service.GocheetahWebService_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>CUstomer Panel</title>
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
            //            response.setHeader("Cache-Control", "no-store, must-revalidate");
            //            response.setHeader("pragma", "no-cache");
            //            response.setHeader("Expires", "0");
            //            
            //            if(session.getAttribute("mobile")==null){
            //                response.sendRedirect("customer-login.jsp");
            //            }
        %>
        <input type="hidden" id="status"  value="<%= request.getAttribute("status")%>">
        <%
            GocheetahWebService_Service service = new GocheetahWebService_Service();
            GocheetahWebService proxy = service.getGocheetahWebServicePort();
        %>

        <div id="wrapper">
            <div class="d-flex flex-column" id="content-wrapper">
                <div id="content">
                    <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                        <div class="container-fluid">
                            <ul class="navbar-nav flex-nowrap ms-auto">
                                <li class="nav-item d-lg-flex justify-content-lg-center align-items-lg-center dropdown no-arrow mx-1"><span id="adminProfileName">Asel Vinjitha</span></li>
                                <li class="nav-item dropdown no-arrow mx-1"><span style="width: 32px;height: 32px;border-radius: 30px;"><img id="adminProfilePic" style="width: 32px;height: 32px;border-radius: 30px;" src="../assets/img/avatars/avatar5.jpeg"></span></li>
                            </ul>
                        </div>
                    </nav>
                    <div class="container-fluid">
                        <div>
                            <h3 class="text-dark" style="color: #233143;">Transports</h3>
                        </div>

                        <%-- VEHICLE LIST--%>      


                        <div style="padding: 0px;padding-top: 0px;padding-bottom: 20px;">
                            <table class="table">
                                <tbody>
                                    <tr class="">
                                        <td>
                                            <%
                                                for (Vehicle vh : proxy.vehicleList()) {

                                                    out.print("<div class=\"row gy-4 gy-md-0\">");
                                                    out.print("<div class=\"col-md-6\" style=\"padding-right: 0px;padding-left: 0px;\">");
                                                    out.print("<div style=\"padding: 10px;padding-right: 10px;\"><img class=\"rounded img-fluid w-100 fit-cover\" style=\"min-height: 300px;\" src=\"../assets/img/van.png\"></div>");
                                                    out.print("</div>");
                                                    out.print("<div class=\"col-md-6 d-md-flex align-items-md-center\">");
                                                    out.print("<div style=\"max-width: 350px;padding-left: 50px;\">");
                                                    out.print("<h2 class=\"text-uppercase fw-bold\" style=\"margin-top: 0px;\">" + vh.getVehicleName() + "</h2>");
                                                    out.print("<p style=\"margin-top: -6px;\">" + vh.getType() + "</p>");
                                                    out.print("<p id =\"vehicleID\" style=\"color:rgba(133,135,150,0);\">" + vh.getVehicleId()+ "</p>");
                                                    out.print("<div>");
                                                    out.print("<div class=\"row\" style=\"height: 40px;\">");
                                                    out.print("<div class=\"col\">");
                                                    out.print("<div>");
                                                    out.print("<p style=\"margin-top: 9px;font-weight: bold;color: #233143;\">Type : </p>");
                                                    out.print("</div>");
                                                    out.print("</div>");
                                                    out.print("<div class=\"col\">");
                                                    out.print("<div>");
                                                    out.print("<p style=\"margin-top: 9px;\">" + vh.getCategory() + "</p>");
                                                    out.print("</div>");
                                                    out.print("</div>");
                                                    out.print("</div>");
                                                    out.print("<div class=\"row\" style=\"height: 40px;\">");
                                                    out.print("<div class=\"col\">");
                                                    out.print("<div>");
                                                    out.print("<p style=\"margin-top: 9px;font-weight: bold;color: #233143;\">Passengers<br></p>");
                                                    out.print("</div>");
                                                    out.print("</div>");
                                                    out.print("<div class=\"col\">");
                                                    out.print("<div>");
                                                    out.print("<p style=\"margin-top: 9px;\">" + vh.getPassengers() + "</p>");
                                                    out.print("</div>");
                                                    out.print("</div>");
                                                    out.print("</div>");
                                                    out.print("<div class=\"row\" style=\"height: 40px;\">");
                                                    out.print("<div class=\"col\">");
                                                    out.print("<div>");
                                                    out.print("<p style=\"margin-top: 9px;font-weight: bold;color: #233143;\">Status : </p>");
                                                    out.print("</div>");
                                                    out.print("</div>");
                                                    out.print("<div class=\"col\">");
                                                    out.print("<div>");
                                                    out.print("<p style=\"margin-top: 9px;\">" + vh.getAvailability() + "</p>");
                                                    out.print("</div>");
                                                    out.print("</div>");
                                                    out.print("</div>");
                                                    out.print("</div>");
                                                    out.print("<div style=\"margin-top: 20px;\"><a class=\"btn btn-primary d-block w-100\" role=\"button\" id=\"BookNowBtn\" href=\"customer-booking.jsp?vehicleDataPass=" + vh.getVehicleId() + "\" style=\"background: #e9b546;border-color: #e9b546;\">Book Now</a></div>");
                                                    out.print("</div>");
                                                    out.print("</div>");
                                                    out.print("</div>");
                                                    out.print("</div>");
                                                }
                                            %>
                                        </td>
                                    </tr>
                                </tbody>
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
        <script src="../assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="../assets/js/bs-init.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
        <script src="../assets/js/theme.js"></script>

        <script type="text/javascript">
            function vehicleDataPass(vehicle) {

                $("#vehicleID").html(vehicle);

            }

        </script>
    </body>

</html>
