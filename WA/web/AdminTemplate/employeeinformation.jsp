<%-- 
    Document   : index2
    Created on : Jul 13, 2020, 4:10:52 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="x-ua-compatible" content="ie=edge">

        <title>EMPLOYEE | </title>

        <!-- Font Awesome Icons -->
        <%@include file="css.jsp" %>
        <link href="https://fonts.googleapis.com/css2?family=Indie+Flower&display=swap" rel="stylesheet">
    </head>
    <body class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed" >
        <div class="wrapper">

            <%@include file="navbar2.jsp" %>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <div class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">

                            </div>
                        </div><!-- /.row -->
                    </div><!-- /.container-fluid -->
                </div>
                <!-- /.content-header -->

                <!-- Main content -->
                <section class="content" id="myCanvas">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header text-center" style="background-color: #ffeded">
                                        <h2>Employee Information</h1>
                                    </div>
                                    <div class="card-body" style="background-color: #f6e3e338">
                                        <div class="row">
                                            <div class="col-md-12" style="padding-top: 10px;border-color: #ffc107;border-style: solid;border-radius: 20px">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="row">  
                                                            <div class="col-md-6" style="padding: 20px;">
                                                                <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Name: Trinh Thiem Bao</div>
                                                            </div>
                                                            <div class="col-md-6" style="padding: 20px;">
                                                                <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Email: Trinh Thiem Bao</div>
                                                            </div>
                                                            <div class="col-md-6" style="padding: 20px;">
                                                                <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Phone: Trinh Thiem Bao</div>
                                                            </div>
                                                            <div class="col-md-6" style="padding: 20px;">
                                                                <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Birthday: Trinh Thiem Bao</div>
                                                            </div>
                                                            <div class="col-md-6" style="padding: 20px;">
                                                                <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Role: Trinh Thiem Bao</div>
                                                            </div>                                         
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6" style="padding: 20px;">
                                                        <div>Old password:<input type="password" class="form-control"/></div>
                                                        <div>New password:<input type="password" class="form-control"/></div>
                                                        <div>Confirm password:<input type="password" class="form-control"/></div>
                                                        
                                                        <button class="btn btn-success col-12">Submit</button>
                                                    </div>
                                                    <div class="col-md-6" style="padding: 20px;">
                                                        <img src="images/img/newlogo1.png" style="max-width: 100%" alt="newlogo1"/>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.col -->
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.container-fluid -->
                </section> 

                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->

            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark">
                <!-- Control sidebar content goes here -->
            </aside>
            <!-- /.control-sidebar -->

            <!-- Main Footer -->
            <%@include file="footer.jsp" %>
        </div>
        <!-- ./wrapper -->

        <!-- REQUIRED SCRIPTS -->
        <!-- jQuery -->
        <%@include file="jslink.jsp" %>

    </body>
</html>
