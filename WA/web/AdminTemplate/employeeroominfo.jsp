<%-- 
    Document   : convenient
    Created on : Jul 13, 2020, 4:09:39 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>AdminLTE 3 | Convenient</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Font Awesome -->
        <%@include file="css.jsp" %>
    </head>

    <body class="hold-transition sidebar-mini">
        <div class="wrapper">
            <%@include file="navbar2.jsp" %>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                            </div>

                        </div>
                    </div>
                    <!-- /.container-fluid -->
                </section>
                <!-- Main content -->
                <section class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header text-center" style="background-color: #ffeded">
                                        <h2>Room Information</h1>
                                    </div>
                                    <div class="card-body" style="background-color: #f6e3e338">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div id="demo" class="carousel slide" data-ride="carousel">

                                                    <!-- Indicators -->
                                                    <ul class="carousel-indicators">
                                                        <li data-target="#demo" data-slide-to="0" class="active"></li>
                                                        <li data-target="#demo" data-slide-to="1"></li>
                                                        <li data-target="#demo" data-slide-to="2"></li>
                                                    </ul>

                                                    <!-- The slideshow -->
                                                    <div class="carousel-inner">
                                                        <div class="carousel-item active">
                                                            <img src="images/images/Deluxe_room1_a.jpg" style="width: 100%"alt="Los Angeles" >
                                                        </div>
                                                        <div class="carousel-item">
                                                            <img src="images/images/Deluxe_room1_b.jpg" style="width: 100%"alt="Chicago" >
                                                        </div>
                                                        <div class="carousel-item">
                                                            <img src="images/images/Deluxe_room1_c.jpg" style="width: 100%"alt="New York" >
                                                        </div>
                                                    </div>

                                                    <!-- Left and right controls -->
                                                    <a class="carousel-control-prev" href="#demo" data-slide="prev">
                                                        <span class="carousel-control-prev-icon"></span>
                                                    </a>
                                                    <a class="carousel-control-next" href="#demo" data-slide="next">
                                                        <span class="carousel-control-next-icon"></span>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col-md-8" style="border-color: #ffc107;border-style: solid;border-radius: 20px">
                                                <div class="row">
                                                    <div class="col-md-6" style="padding: 20px;">
                                                        <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Current CustomerId: 38FN8490FNU82RRwWcF</div>
                                                    </div>
                                                    <div class="col-md-6" style="padding: 20px;">
                                                        <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Customer Name: Bảo Trịnh Thiêm</div>
                                                    </div>
                                                    <div class="col-md-6" style="padding: 20px;">
                                                        <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Room type: Deluxe</div>
                                                    </div>
                                                    <div class="col-md-6" style="padding: 20px;">
                                                        <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Check In Date: 2020-07-15 </div>
                                                    </div>
                                                    <div class="col-md-6" style="padding: 20px;">
                                                        <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Check Out Date: 2020-07-17 00:00:00</div>
                                                    </div>
                                                    <div class="col-md-6" style="padding: 20px;">
                                                        <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Location: Đà Nẵng</div>
                                                    </div>
                                                    <div class="col-md-6" style="padding: 20px;">
                                                        <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Room Number: 1</div>
                                                    </div>
                                                    <div class="col-md-6" style="padding: 20px;">
                                                        <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Adults Number: 2</div>
                                                    </div>
                                                    <div class="col-md-6" style="padding: 20px;">
                                                        <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Children Number: 0</div>
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
            <%@include file="footer.jsp" %>

            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark">
                <!-- Control sidebar content goes here -->
            </aside>
            <!-- /.control-sidebar -->
        </div>
        <!-- ./wrapper -->

        <!-- jQuery -->
        <%@include file="jslink.jsp" %>
    </body>

</html>
