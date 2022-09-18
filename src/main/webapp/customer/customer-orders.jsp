<%-- 
    Document   : customer-orders
    Created on : Sep 17, 2022, 8:01:32 PM
    Author     : asel
--%>

<%@page import="service.Booking"%>
<%@page import="service.GocheetahWebService"%>
<%@page import="service.GocheetahWebService_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Profile - Brand</title>
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
    <%
        GocheetahWebService_Service service = new GocheetahWebService_Service();
        GocheetahWebService proxy = service.getGocheetahWebServicePort();

    %>
    <body id="page-top">
        <%        response.setHeader("Cache-Control", "no-store, must-revalidate");
            response.setHeader("pragma", "no-cache");
            response.setHeader("Expires", "0");

            if (session.getAttribute("mobile") == null) {
                response.sendRedirect("customer-login.jsp");
            }
            String id = session.getAttribute("id").toString();
            String name = session.getAttribute("name").toString();

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
                    <div class="container-fluid">
                        <div>
                            <div class="row" style="background: rgba(233,181,70,0.18); border-radius: 5px;">
                                <div class="col">
                                    <div>
                                        <h3 class="text-dark" style="color: #233143;width: 500px;">Your Orders</h3>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <table class="table">
                            <tbody>
                                <tr class="">
                                    <td>
                                        <%
                                            for (Booking bk : proxy.getBookingList2(id)) {
                                                out.print("<div style=\"padding: 0px;padding-top: 0px;padding-bottom: 20px;\">");
                                                out.print("<h5 class=\"text-uppercase fw-bold\" style=\"margin-top: 0px;\">Order ID : " + bk.getId() + "</h5    >");
                                                out.print("<p style=\"margin-top: -6px;\">Customer ID: " + bk.getCustomerId() + "</p>");
                                                out.print("<div>");
                                                out.print("<div class=\"row\" style=\"height: 40px;\">");
                                                out.print("<div class=\"col\">");
                                                out.print("<div>");
                                                out.print("<p style=\"margin-top: 9px;font-weight: bold;color: #233143;text-align: center;\">Pickup Location</p>");
                                                out.print("</div>");
                                                out.print("</div>");
                                                out.print("<div class=\"col\">");
                                                out.print("<div>");
                                                out.print("<p style=\"margin-top: 9px;\">" + bk.getPickup() + "</p>");
                                                out.print("</div>");
                                                out.print("</div>");
                                                out.print("</div>");
                                                out.print("<div class=\"row\" style=\"height: 40px;\">");
                                                out.print("<div class=\"col\">");
                                                out.print("<div>");
                                                out.print("<p style=\"margin-top: 9px;font-weight: bold;color: #233143;text-align: center;\">Drop Location<br></p>");
                                                out.print("</div>");
                                                out.print("</div>");
                                                out.print("<div class=\"col\">");
                                                out.print("<div>");
                                                out.print("<p style=\"margin-top: 9px;\">" + bk.getDrop() + "</p>");
                                                out.print("</div>");
                                                out.print("</div>");
                                                out.print("</div>");
                                                out.print("<div class=\"row\" style=\"height: 40px;\">");
                                                out.print("<div class=\"col\">");
                                                out.print("<div>");
                                                out.print("<p style=\"margin-top: 9px;font-weight: bold;color: #233143;text-align: center;\">Price</p>");
                                                out.print("</div>");
                                                out.print("</div>");
                                                out.print("<div class=\"col\">");
                                                out.print("<div>");
                                                out.print("<p style=\"margin-top: 9px;\">Rs. " + bk.getPrice() + "</p>");
                                                out.print("</div>");
                                                out.print("</div>");
                                                out.print("</div>");
                                                out.print("<div class=\"row\" style=\"height: 40px;\">");
                                                out.print("<div class=\"col\">");
                                                out.print("<div>");
                                                out.print("<p style=\"margin-top: 9px;font-weight: bold;color: #233143;text-align: center;\">Vehicle ID</p>");
                                                out.print("</div>");
                                                out.print("</div>");
                                                out.print("<div class=\"col\">");
                                                out.print("<div>");
                                                out.print("<p style=\"margin-top: 9px;\">" + bk.getVehicleId() + "</p>");
                                                out.print("</div>");
                                                out.print("</div>");
                                                out.print("</div>");
                                                out.print("<div class=\"row\" style=\"height: 40px;\">");
                                                out.print("<div class=\"col\">");
                                                out.print("<div>");
                                                out.print("<p style=\"margin-top: 9px;font-weight: bold;color: #233143;text-align: center;\">Date</p>");
                                                out.print("</div>");
                                                out.print("</div>");
                                                out.print("<div class=\"col\">");
                                                out.print("<div>");
                                                out.print("<p style=\"margin-top: 9px;\">" + bk.getDate() + "</p>");
                                                out.print("</div>");
                                                out.print("</div>");
                                                out.print("</div>");
                                                out.print("<div class=\"row\" style=\"height: 40px;\">");
                                                out.print("<div class=\"col\">");
                                                out.print("<div>");
                                                out.print("<p style=\"margin-top: 9px;font-weight: bold;color: #233143;text-align: center;\">Time</p>");
                                                out.print("</div>");
                                                out.print("</div>");
                                                out.print("<div class=\"col\">");
                                                out.print("<div>");
                                                out.print("<p style=\"margin-top: 9px;\">" + bk.getTime() + "</p>");
                                                out.print("</div>");
                                                out.print("</div>");
                                                out.print("</div>");
                                                out.print("</div>");
                                                out.print("<div style=\"margin-top: 20px;\"><a class=\"btn btn-primary\" role=\"button\" id=\"BookNowBtn\" href=\"#customerFeedback"+bk.getId()+"\" style=\"background: #e9b546;border-color: #e9b546;width: 550px;margin-left: 250px;\" data-bs-toggle=\"modal\">Send Feedback</a>");
                                                

                                                out.print("<div class=\"modal fade\" role=\"dialog\" tabindex=\"-1\" id=\"customerFeedback"+bk.getId()+"\">");
                                                out.print("<div class=\"modal-dialog\" role=\"document\">");
                                                out.print("<div class=\"modal-content\">");
                                                out.print("<div class=\"modal-header\">");
                                                out.print("<h4 class=\"modal-title\">Feedback</h4><button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>");
                                                out.print("</div>");
                                                out.print("<div class=\"modal-body\">");
                                                out.print("<form action=\"p-feedback-send.jsp\" method=\"post\">");
                                                out.print("<div class=\"d-md-flex justify-content-md-center align-items-md-center mb-3\" style=\"border: 1px outset rgb(209,211,226);border-radius: 5.6px;\"><input class=\"form-control\" type=\"text\" id=\"orderID\" value=\"" + bk.getId()+ "\" name=\"orderID\" placeholder=\"\" required=\"\" style=\"border-color: rgba(133,135,150,0);\" readonly=\"\"></div>");
                                                out.print("<div class=\"d-md-flex justify-content-md-center align-items-md-center mb-3\" style=\"border: 1px outset rgb(209,211,226);border-radius: 5.6px;\"><input class=\"form-control\" type=\"text\" id=\"title\" name=\"title\" placeholder=\"Title\" required=\"\" style=\"border-color: rgba(133,135,150,0);\"></div>");
                                                out.print("<div class=\"d-md-flex justify-content-md-center align-items-md-center mb-3\" style=\"border: 1px outset rgb(209,211,226);border-radius: 5.6px;\"><textarea class=\"form-control\" name=\"feedback\"></textarea></div>");
                                                out.print("<div><button class=\"btn btn-primary d-block w-100\" id=\"sendFeedback-3\" type=\"submit\" style=\"background: #e9b546;border-color: #e9b546;margin-top: 5px;\">Send</button></div>");
                                                out.print("</form>");
                                                out.print("</div>");
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
            function passOrderId(order) {
                $("#orderID").val(order);
            }

        </script>
    </body>

</html>