<%-- 
    Document   : customer-signup
    Created on : Aug 25, 2022, 6:51:15 PM
    Author     : asel
--%>

<%@page import="service.BranchCategory"%>
<%@page import="java.util.Base64.Decoder"%>
<%@page import="java.util.Base64.Encoder"%>
<%@page import="java.util.Base64"%>
<%@page import="java.util.Base64"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="service.Customer"%>
<%@page import="service.GocheetahWebService"%>
<%@page import="service.GocheetahWebService_Service"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Customer Signup</title>
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
    %>
    <body style="background: rgb(248,249,251);">
        <input type="hidden" id="status"  value="<%= request.getAttribute("status")%>">
        <nav class="navbar navbar-light navbar-expand-md fixed-top navbar-shrink py-3 scrolled" id="mainNav" style="color: rgb(45, 45, 45);padding-bottom: 16px;background: #ffffff;">
            <div class="container"><a class="navbar-brand d-flex align-items-center" href="../index.html"><img class="border rounded-circle img-profile" data-aos="fade-right" data-aos-once="true" src="../assets/img/cheetah%20trans.png" style="background: url(&quot;../assets/img/cheetah%20trans.png&quot;) center / contain no-repeat;width: 45px;height: 45px;margin-right: 5px;margin-left: -10px;"></a><a><span data-aos="fade-right" data-aos-duration="300" data-aos-delay="600" data-aos-once="true" style="color: #545454;font-weight: bold;">Gocheetah</span></a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navcol-1">
                    <ul class="navbar-nav mx-auto"></ul>
                    <ul class="navbar-nav">
                        <li class="nav-item"></li>
                    </ul><a class="btn btn-primary" role="button" data-bss-disabled-mobile="true" data-aos="fade-right" data-aos-duration="900" data-aos-delay="300" data-aos-once="true" style="color: #e9b546;background: transparent; border-color: #e9b546;margin-left: 0px;margin-right: 10px;" href="customer-login.jsp">Login</a><a class="btn btn-primary shadow" role="button" data-bss-disabled-mobile="true" data-aos="fade-right" data-aos-duration="1000" data-aos-delay="500" data-aos-once="true" href="customer-signup.html" style="background: #e9b546;border-color: rgb(233,181,70);">Sign up</a>
                </div>
            </div>
        </nav>
        <header class="bg-primary-gradient pt-5" style="background: #F8F9FB;margin-top: 79px;">
            <div class="container text-start" style="padding: 20px;margin-top: 0px;background: #f8f9fb;">
                <div class="row">
                    <div class="col-md-6" data-aos="fade" data-aos-duration="300" data-aos-delay="200" data-aos-once="true" style="background: url(&quot;../assets/img/signup.png&quot;) center / contain no-repeat;">
                        <div></div>
                    </div>
                    <div class="col-md-6" style="padding: 50px;text-shadow: 0px 0px;box-shadow: 0px 0px 20px 1px rgb(219,219,219);background: white;border-radius: 15px;">
                        <form class="text-center" method="post" action="c-p-signup.jsp">

                            <p  style="font-size: 25px;font-weight: bold;text-align: center;">Customer signup</p><img style="height: 80px;padding-bottom: 0px;margin-bottom: 10px;border-radius: 40px;width: 80px;" src="../assets/img/cheetah.png">
                            <div><input class="form-control" type="text"  name="customerNAme" id="customerNAme" style="padding: 8.6px 24px;margin-top: 0px;margin-bottom: 10px;border-color: rgb(233,181,70);border-radius: 10px;padding-left: 12px;" placeholder="Name" required=""></div>
                            <div><input class="form-control" type="text"  name="customerAddress" id="customerAddress" style="padding: 8.6px 24px;margin-top: 0px;margin-bottom: 10px;border-color: rgb(233,181,70);border-radius: 10px;padding-left: 12px;" placeholder="Address" required=""></div>
                            <div class="mb-3"><input class="form-control" type="email"  name="customerEmail" id="customerEmail" placeholder="Email" style="border-color: rgb(233,181,70);border-radius: 10px;" required=""></div>
                            <div class="mb-3"><input class="form-control" type="tel"  name="customerMobile" id="customerMobile" required="" style="border-color: rgb(233,181,70);border-radius: 10px;" placeholder="Mobile" maxlength="10" minlength="10"></div>
                            <div class="mb-3"><input class="form-control" type="text"  name="customerNIC" id="customerNIC" placeholder="NIC" style="border-color: rgb(233,181,70);border-radius: 10px;" required="" maxlength="10" minlength="10"></div>
                            <div class="mb-3">
                                <div class="mb-3"><input class="form-control" type="password" name="customerPassword" id="customerPassword" name="password" placeholder="Password" required="" style="border-style: solid;border-color: rgb(233,181,70);border-radius: 10px;" minlength="8"></div>                        
                            </div>
                            <div class="mb-3"><select name="customrbranchC" class="form-select" style="border-color: rgb(233,181,70);border-radius: 10px;">
                                    <%          for (BranchCategory bn : proxy.viewBranches()) {
                                            out.print("<option name=\"branch\">" + bn.getLocation() + "</option>");
                                        }
                                    %> 
                                </select></div>
                            <div class="mb-3"><button class="btn btn-primary d-block w-100"  name="customerSignupBtn" id="customerSignupBtn" type="submit" value="Add" style="background: rgb(233,181,70);border-color: rgb(233,181,70);">Signup</button></div>
                        </form>
                    </div>
                </div
            </div>
        </header>
        <footer class="bg-primary-gradient">
            <div class="container py-4 py-lg-5" style="margin-top: 59px;">
                <hr>
                <div class="text-muted d-flex justify-content-between align-items-center pt-3">
                    <p class="mb-0">Developed by Asel Algama</p>

                </div>
            </div>
        </footer>
        <script src="../assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="../assets/js/bs-init.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
        <script src="../assets/js/theme.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="stylesheet" href="alert/dist/sweetalert.css"><!-- comment -->

        <script type="text/javascript">
            var status = document.getElementById("status").value;
            if (status == "success") {
                swal("congratulations", "successfully registered", "success");
            } else if (status == "failed") {
                swal("OOps", "Unsuccessfully registered", "error");
            }
        </script>

    </body>

</html>
