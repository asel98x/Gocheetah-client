<%-- 
    Document   : admin-vehicle update
    Created on : Sep 5, 2022, 12:36:00 PM
    Author     : asel
--%>

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
        int id = Integer.parseInt(request.getParameter("vehicleDataPass"));
        vh = proxy.getVehicle(id);
//
        String chasi = vh.getChasiNo();
        String noPlate = vh.getNoPlate();
        String category = vh.getCategory();
        String branch = vh.getBranch();
         String driverID = vh.getDriver();
//

        
    %>
    <body>
        <section class="position-relative py-4 py-xl-5" style="background: #F8F9FB;">
            <div class="container position-relative">
                <div class="row d-flex justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5 col-xxl-4">
                        <div class="card mb-5">
                            <div class="card-body p-sm-5">
                                <h2 class="text-center mb-4">Manage Vehicle</h2>
                                <form action="" method="post">
                                    <div class="mb-3"><input class="form-control" type="text" id="vehiIDTXT" name="vehiIDTXT" placeholder="" value="<%out.print(id);%>" readonly></div>
                                    <div class="mb-3"><input class="form-control" type="text" id="chasiTxt" name="chasiTxt" value="<%out.print(chasi);%>" placeholder="Chasi Number" required=""></div>
                                    <div class="mb-3"><input class="form-control" type="text" id="noPlateTxt" name="noPlateTxt" value="<%out.print(noPlate);%>" placeholder="Number Plate" required=""></div>
                                    <div class="mb-3"><select class="form-select" required="" name="VehicleCategortSelect">

                                            <%
                                                if(category.getselected){
                                                
                                                }
                                                for (Vehicle v : proxy.viewVehicles()) {
                                                    out.print("<option selected=\"\">" + v.getCategory() + "</option>");
                                                }
                                            %>
                                        </select></div>
                                    <div class="mb-3"><select class="form-select" required="">
                                                
                                            <%          for (BranchCategory bn : proxy.viewBranches()) {
                                                    out.print("<option name=\"branch\" selected=\"\">" + bn.getLocation() + "</option>");
                                                }
                                            %> 
                                        </select></div>
                                    <div class="mb-3"><input class="form-control" type="text" id="driverIDTXT" name="driverIDTXT" value="<%out.print(driverID);%>" placeholder="Driver ID" required=""></div>
                                    <div style="padding-bottom: 10px;"><button class="btn btn-primary d-block w-100" type="submit" style="background: #e9b546;border-color: #e9b546;">Update</button></div>
                                    
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