<%-- 
    Document   : driver-login
    Created on : Sep 2, 2022, 4:54:32 PM
    Author     : asel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

 
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Driver Login</title>
    <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap">
    <link rel="stylesheet" href="../assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="../assets/css/AXY-Contact-Us-ContactUs.css">
    <link rel="stylesheet" href="../assets/css/AXY-Contact-Us.css">
    <link rel="stylesheet" href="../assets/css/Features-Large-Icons-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
</head>

<body style="background: rgb(248,249,251);">
    <input type="hidden" id="status2"  value="<%= request.getAttribute("status")%>">
    <nav class="navbar navbar-light navbar-expand-md fixed-top navbar-shrink py-3 scrolled" id="mainNav" style="color: rgb(45, 45, 45);padding-bottom: 16px;background: #ffffff;">
        <div class="container"><a class="navbar-brand d-flex align-items-center" href="../index.html"><img class="border rounded-circle img-profile" data-aos="fade-right" data-aos-once="true" src="../assets/img/cheetah%20trans.png" style="background: url(&quot;../assets/img/cheetah%20trans.png&quot;) center / contain no-repeat;width: 45px;height: 45px;margin-right: 5px;margin-left: -10px;"></a><a href="../index.html"><span data-aos="fade-right" data-aos-duration="300" data-aos-delay="600" data-aos-once="true" style="color: #545454;font-weight: bold;">Gocheetah</span></a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="navbar-nav mx-auto"></ul>
                <ul class="navbar-nav">
                    <li class="nav-item"></li>
                </ul>
            </div>
        </div>
    </nav>
    <header class="bg-primary-gradient pt-5" style="background: #F8F9FB;margin-top: 79px;">
        <div class="container text-start" style="padding: 20px;margin-top: 0px;background: #f8f9fb;">
            <div class="row">
                <div class="col-md-6" data-aos="fade" data-aos-duration="300" data-aos-delay="200" data-aos-once="true" style="background: url(&quot;../assets/img/driver.png&quot;) center / contain no-repeat;color: rgb(133, 135, 150);">
                    <div></div>
                </div>
                <div class="col-md-6" style="padding: 50px;">
                    <form class="text-center" action="d-p-login.jsp" method="post">
                        <p data-aos="fade" data-aos-delay="100" style="font-size: 25px;font-weight: bold;text-align: center;">Driver login</p>
                        <div class="mb-3"><input class="form-control" type="text" data-aos="zoom-out-right" data-aos-delay="200" id="driverNIC" name="driverNIC" placeholder="NIC" style="border-color: rgb(233,181,70);" required="" minlength="10" maxlength="10"></div>
                        <div class="mb-3"><input class="form-control" type="password" data-aos="zoom-out-right" data-aos-delay="300" id="driverPassword" name="password" placeholder="Password" required="" style="border-style: solid;border-color: rgb(233,181,70);" minlength="8"></div>
                        <div class="mb-3"><button class="btn btn-primary d-block w-100" data-aos="zoom-out-right" data-aos-delay="500" id="driverLoginBtn" type="submit" style="background: rgb(233,181,70);border-color: rgb(233,181,70);">Login</button></div>
                        <p class="text-muted" data-aos="zoom-out-right" data-aos-delay="600">Forgot your password?</p>
                    </form>
                </div>
            </div>
        </div>
    </header>
    <footer class="bg-primary-gradient">
        <div class="container py-4 py-lg-5" style="margin-top: 59px;">
            <hr>
            <div class="text-muted d-flex justify-content-between align-items-center pt-3">
                <p class="mb-0">Developed by Asel Algama</p>
                <ul class="list-inline mb-0">
                    <li class="list-inline-item"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-facebook" title="facebook">
                            <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z"></path>
                        </svg></li>
                    <li class="list-inline-item"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-twitter">
                            <path d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z"></path>
                        </svg></li>
                    <li class="list-inline-item"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-instagram">
                            <path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"></path>
                        </svg></li>
                </ul>
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
            var status = document.getElementById("status2").value;
            if(status=="success"){
                swal("congratulations!","You are successfully registered","success");
            }else if(status=="failed"){
                swal("OOps!","Username or Password is wrong","error");
            }
        </script>
</body>

</html>
