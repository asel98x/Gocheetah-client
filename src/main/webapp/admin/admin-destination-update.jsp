<%-- 
    Document   : admin-destination-update
    Created on : Sep 12, 2022, 8:44:23 PM
    Author     : asel
--%>

<%@page import="service.Vehicle"%>
<%@page import="service.BranchCategory"%>
<%@page import="service.Destination"%>
<%@page import="service.GocheetahWebService"%>
<%@page import="service.GocheetahWebService_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        GocheetahWebService_Service service = new GocheetahWebService_Service();
        GocheetahWebService proxy = service.getGocheetahWebServicePort();
        RequestDispatcher dispatcher = null;

        Destination ds = new Destination();
        String search = request.getParameter("DestinationDataPass");
        ds = proxy.getDstination(search);

        int id = ds.getDestinationID();
        String branch = ds.getDBranch();
        String pickup = ds.getDPickup();
        String drop = ds.getDDrop();
        int price = ds.getDistance();
    %>
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

    <body>
        <section class="position-relative py-4 py-xl-5" style="background: #F8F9FB;">
            <div class="container position-relative">
                <div class="row d-flex justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5 col-xxl-4">
                        <div class="card mb-5">
                            <div class="card-body p-sm-5">
                                <h2 class="text-center mb-4" style="color: rgb(133,135,150);">Destination Update</h2>
                                <form action="p-destination-update.jsp" method="post">
                                    <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;background: #e9ecef;"><i class="far fa-id-card" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="ID" name="ID" value="<%out.print(search);%>" placeholder="ID" required="" style="border-color: rgba(133,135,150,0);" readonly=""></div>
                                    
                                    <div class="text-start d-md-flex justify-content-md-start align-items-md-center mb-3" id="adminBranch-1" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-map-marker-alt text-start" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><select class="form-select" id="branch" style="border-color: rgba(33,37,41,0);" required="" name="branch">
                                            <%          for (BranchCategory b : proxy.viewBranches()) {
                                                    if (branch.equals(b.getLocation())) {

                                                        out.print("<option selected=\"\">" + b.getLocation() + "</option>");

                                                    } else {
                                                        out.print("<option>" + b.getLocation() + "</option>");
                                                    }
                                                }
                                            %>
                                        </select></div>
                                    <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-map" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="adminName-2" name="pickup" value="<%out.print(pickup);%>" placeholder="Pick-up Location" required="" style="border-color: rgba(133,135,150,0);"></div>
                                    <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-map-marked-alt" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="adminName-4" name="drop" value="<%out.print(drop);%>" placeholder="Drop Location" required="" style="border-color: rgba(133,135,150,0);"></div>
                                    <div class="d-md-flex justify-content-md-center align-items-md-center mb-3" style="border: 1px outset rgb(209,211,226);border-radius: 5.6px;"><i class="fas fa-road" style="border-left-color: rgb(133, 135, 150);margin-left: 5px;"></i><input class="form-control" type="text" id="adminName-3" name="price" value="<%out.print(price);%>" placeholder="price" required="" style="border-color: rgba(133,135,150,0);"></div>
                                    <div><button class="btn btn-primary d-block w-100" id="destinationUpdateBtn" type="submit" style="background: #e9b546;border-color: #e9b546;">Update</button></div>
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
