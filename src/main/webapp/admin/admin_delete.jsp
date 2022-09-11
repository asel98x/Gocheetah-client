<%-- 
    Document   : admin_delete
    Created on : Sep 9, 2022, 1:10:26 AM
    Author     : asel
--%>

<%@page import="service.Admin"%>
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
        
        Admin ad = new Admin();
        String search = request.getParameter("adminDataPass");
        ad = proxy.getAdmin(search);

        int id = ad.getAdminId();
        String name = ad.getName();
        String address = ad.getAddress();
        int mobile = ad.getMobile();
        String NIC = ad.getNic();
        String dob = ad.getDob();
        int age = ad.getAge();
        String email = ad.getEmail();
        String password = ad.getPassword();
        String branch = ad.getBranch();
        String type = ad.getType();
       
    %>
    <body>
        <section class="position-relative py-4 py-xl-5" style="background: #F8F9FB;">
            <div class="container position-relative">
                <div class="row d-flex justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5 col-xxl-4">
                        <div class="card mb-5">
                            <div class="card-body p-sm-5">
                                <h2 class="text-center mb-4" style="color: rgb(133,135,150);">Admin Delete</h2>
                                <form action="p-admin-delete.jsp" method="post">
                                    <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;background: #eaecf4;"><i class="far fa-id-card" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="adminName" name="AdminID" placeholder="ID" value="<%out.print(search);%>" style="border-color: rgba(133,135,150,0);" readonly=""></div>
                                    <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;background: #eaecf4;"><i class="fas fa-user-tie" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="adminName" name="Adminname" value="<%out.print(name);%>" placeholder="Name" required="" style="border-color: rgba(133,135,150,0);" readonly=""></div>
                                    <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;background: #eaecf4;"><i class="fas fa-location-arrow" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="adminAddress" name="AdminAddress" value="<%out.print(address);%>" placeholder="Address" required="" style="border-color: rgba(133,135,150,0);" readonly=""></div>
                                    <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;background: #eaecf4;"><i class="fas fa-phone-alt" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="placeholder form-control" type="tel" id="adminMobile" name="adminMobile" value="<%out.print(mobile);%>" style="border-color: rgba(133,135,150,0);background: rgba(133,135,150,0);" placeholder="Mobile" required="" name="AdminMobile" readonly=""></div>
                                    <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;background: #eaecf4;"><i class="far fa-address-card" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="adminNIC" name="adminNic" value="<%out.print(NIC);%>" placeholder="NIC" required="" style="border-color: rgba(133,135,150,0);" readonly=""></div>
                                    <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;padding-top: 0px;margin-top: 10px;"><input class="form-control" id="adminDOB" name="adminDOB" value="<%out.print(dob);%>" type="date" required="" name="adminDOB" readonly=""></div>
                                    <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;padding-top: 0px;margin-top: 10px;background: #eaecf4;"><i class="fas fa-user-alt" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="adminAge-1" name="adminAge" value="<%out.print(age);%>" placeholder="Age" required="" style="border-color: rgba(133,135,150,0);" readonly=""></div>
                                    <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;background: #eaecf4;"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-envelope-fill" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;">
                                        <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z"></path>
                                        </svg><input class="form-control" type="email" id="adminEmail" style="border-color: rgba(133,135,150,0);" placeholder="Email" required="" name="adminEmail" value="<%out.print(email);%>" readonly=""></div>
                                    <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;background: #eaecf4;"><i class="far fa-address-card" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="branch" name="adminNic" value="<%out.print(branch);%>" placeholder="NIC" required="" style="border-color: rgba(133,135,150,0);" readonly=""></div>
                                    <div><button class="btn btn-primary d-block w-100" type="submit" style="background: #DC3545;border-color: #DC3545;">Delete</button></div>
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