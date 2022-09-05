<%-- 
    Document   : admin-panel
    Created on : Sep 2, 2022, 2:38:29 PM
    Author     : asel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>admin Panel</title>
    <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap">
    <link rel="stylesheet" href="../assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="../assets/css/AXY-Contact-Us-ContactUs.css">
    <link rel="stylesheet" href="../assets/css/AXY-Contact-Us.css">
    <link rel="stylesheet" href="../assets/css/Features-Large-Icons-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
</head>

<body id="page-top">
    <%
            response.setHeader("Cache-Control", "no-store, must-revalidate");
            response.setHeader("pragma", "no-cache");
            response.setHeader("Expires", "0");
            
            if(session.getAttribute("email")==null){
                response.sendRedirect("admin-login.jsp");
            }
    %>
    <div id="wrapper">
        <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0" style="background: #e9b546;">
            <div class="container-fluid d-flex flex-column p-0"><a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                    <div class="sidebar-brand-text mx-3"><span>Gocheetah</span></div>
                </a>
                <hr class="sidebar-divider my-0">
                <ul class="navbar-nav text-light" id="accordionSidebar">
                    <li class="nav-item"><a class="nav-link" data-bss-hover-animate="pulse"><span><i class="fas fa-shuttle-van"></i>Panel</span></a></li>
                    <li class="nav-item"><a class="nav-link" data-bss-hover-animate="pulse" href="../admin-users.html"><i class="fas fa-user-friends"></i><span>Users</span></a></li>
                    <li class="nav-item"><a class="nav-link" data-bss-hover-animate="pulse" href="../admin-others.jsp"><span><i class="fas fa-shuttle-van"></i>Others</span></a></li>
                    <li class="nav-item"><a class="nav-link" data-bss-hover-animate="pulse" href="../admin-profile.html"><i class="fas fa-user"></i><span>Profile</span></a></li>
                </ul>
            </div>
        </nav>
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                    <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle me-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars" style="color: rgb(233,181,70);"></i></button>
                        <ul class="navbar-nav flex-nowrap ms-auto">
                            <li class="nav-item d-lg-flex justify-content-lg-center align-items-lg-center dropdown no-arrow mx-1"><span id="adminProfileName">Asel Vinjitha</span></li>
                            <li class="nav-item dropdown no-arrow mx-1"><span style="width: 32px;height: 32px;border-radius: 30px;"><img id="adminProfilePic" style="width: 32px;height: 32px;border-radius: 30px;" src="../assets/img/avatars/avatar5.jpeg"></span></li>
                        </ul>
                    </div>
                </nav>
                <div class="container-fluid">
                    <div class="d-sm-flex justify-content-between align-items-center mb-4">
                        <h3 class="text-dark mb-0">admin Dashboard</h3>
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
       
    </div>
    <script src="../assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="../assets/js/bs-init.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <script src="../assets/js/theme.js"></script>
</body>

</html>
