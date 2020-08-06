<%-- 
    Document   : index2
    Created on : Jul 13, 2020, 4:10:52 PM
    Author     : ADMIN
--%>

<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="bean.common"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>
<html lang="en" >
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="x-ua-compatible" content="ie=edge">

        <title>Admin Haven</title>

        <!-- Font Awesome Icons -->
        <%@include file="css.jsp" %>
        <link href="https://fonts.googleapis.com/css2?family=Indie+Flower&display=swap" rel="stylesheet">

        <link href="<%=common.url%>/dist/css/datepicker-foundation.min.css" rel="stylesheet"/>

    </head>
    <body class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed" >
        <div class="wrapper">

            <%@include file="navbar.jsp" %>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <div class="content-header">
                    <div class="container-fluid">
                        <form action="Employee_Room" method="post">
                            <div class="row mb-2">
                                <div class="col-sm-12" style="margin-bottom: 20px">
                                    <h1 class="m-0 text-dark text-center">List Room </h1>
                                </div>
                                <div class="col-sm-6">
                                    <div class="row" id="range">
                                        <div class="col-4">
                                            Location:
                                            <select class="select form-control" data-placeholder="Select a State" id="locationid" name="locationid" >
                                                <option value="findall" selected>All</option>
                                                <c:forEach items="${listLocation}" var="l">
                                                    <option value="${l.getLocationId()}">${l.getLocationName()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>                               
                                        <div class="col-4">
                                            From:
                                            <input type="text" required id="datepicker1" name="start" class="form-control" />
                                        </div>
                                        <div class="col-4">
                                            To:
                                            <input type="text" required id="datepicker2" name="end" class="form-control" />
                                        </div>                            
                                    </div>
                                </div>
                                <div class="col-sm-6" >
                                    <div class="row">
                                        <div class="col-12" style="float: right">
                                            <div style="width: 20px;height: 20px;background-color: #28a745;float: right"></div>
                                            <div style="float: right;margin-right: 10px">In-use</div> 
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12" style="float: right">
                                            <div style="width: 20px;height: 20px;background-color: #dc3545;float: right"></div>
                                            <div style="float: right;margin-right: 10px">Clear</div> 
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12" style="float: right">
                                            <div style="width: 20px;height: 20px;background-color: #007bff;float: right"></div>
                                            <div style="float: right;margin-right: 10px">Reserved</div> 
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12" style="float: right">
                                            <div style="width: 20px;height: 20px;background-color: #6d1bf3;float: right"></div>
                                            <div style="float: right;margin-right: 10px">Prepare to checkout</div> 
                                        </div>
                                    </div>
                                </div>
                            </div><!-- /.row -->
                        </form>
                    </div><!-- /.container-fluid -->
                </div>
                <!-- /.content-header -->

                <!-- Main content -->
                <section class="content">
                    <div class="container-fluid" id="result">
                        <div class="row">
                            <data>
                                <div class="row">
                                    <c:forEach items="${listInUse}" var="lIU">
                                        <div class="col-lg-3 col-6">
                                            <!-- small box -->
                                            <div class="small-box bg-success">
                                                <div class="inner">
                                                    <h3 style="font-size: 20px">${lIU.roomId.roomId}</h3>

                                                    <p>${lIU.customerName}</p>
                                                </div>
                                                <div class="icon">
                                                    <i class="fa fa-hotel"></i>
                                                </div>
                                                <a data-toggle="modal" data-target="#R${lIU.getQrCodeId()}"  class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                                            </div>
                                        </div>
                                        <!--modal start-->
                                        <div class="modal" id="R${lIU.getQrCodeId()}">
                                            <div class="modal-dialog modal-dialog-scollable modal-xl" style="padding:10%" >
                                                <div class="modal-content"style="color: white; background-color: #6f6d6d;">
                                                    <!-- Modal Header -->
                                                    <div class="modal-header">
                                                        <h4 class="modal-title" style="padding:1% 11%">From: <fmt:formatDate value="${lIU.getCheckInDate()}" pattern="dd/MM/yyyy"/> to <fmt:formatDate value="${lIU.getCheckOutDate()}" pattern="dd/MM/yyyy"/></h4>
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    </div>

                                                    <!-- Modal body -->
                                                    <div class="modal-body">
                                                        <div class="row">
                                                            <div class="col-4" >
                                                                <div style="padding: 10%">
                                                                    <img src="./images/qrcode/${lIU.getUrl()}" style="max-width: 100%;padding: 10%" alt="Bungalow_room1_c"/>
                                                                </div>
                                                            </div>
                                                            <div class="col-8" style="border-left-style: solid">

                                                                <div style="padding: 10%">
                                                                    <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Customer Name: ${lIU.getCustomerName()}</div>
                                                                    <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Email: ${lIU.getEmailSendedTo()}</div>
                                                                    <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Room number: ${lIU.getRoomId().getRoomId()}</div>
                                                                    <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Book Date: <fmt:formatDate value="${lIU.getCreateDate()}" pattern="dd/MM/yyyy"/></div>
                                                                    <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Adults: ${lIU.getAdultsNum()}</div>
                                                                    <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Children: ${lIU.getChildrenNum()}</div>
                                                                    <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Deposits: $${lIU.getDeposits()}</div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--modal end-->
                                    </c:forEach>      

                                    <c:forEach items="${listReserved}" var="lR">
                                        <div class="col-lg-3 col-6">
                                            <!-- small box -->
                                            <div class="small-box bg-blue">
                                                <div class="inner">
                                                    <h3 style="font-size: 20px">${lR.roomId.roomId}</h3>

                                                    <p>${lR.customerName}</p>                                               
                                                </div>
                                                <div class="icon">
                                                    <i class="fa fa-hotel"></i>
                                                </div>
                                                <a data-toggle="modal" data-target="#R${lR.getQrCodeId()}"  class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                                            </div>
                                        </div>
                                        <!--modal start-->
                                        <div class="modal" id="R${lR.getQrCodeId()}">
                                            <div class="modal-dialog modal-dialog-scollable modal-xl" style="padding:10%" >
                                                <div class="modal-content"style="color: white; background-color: #6f6d6d;">
                                                    <!-- Modal Header -->
                                                    <div class="modal-header">
                                                        <h4 class="modal-title" style="padding:1% 11%">From: <fmt:formatDate value="${lR.getCheckInDate()}" pattern="dd/MM/yyyy"/> to <fmt:formatDate value="${lR.getCheckOutDate()}" pattern="dd/MM/yyyy"/></h4>
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    </div>

                                                    <!-- Modal body -->
                                                    <div class="modal-body">
                                                        <div class="row">
                                                            <div class="col-4" >
                                                                <div style="padding: 10%">
                                                                    <img src="./images/qrcode/${lR.getUrl()}" style="max-width: 100%;padding: 10%" alt="Bungalow_room1_c"/>
                                                                </div>
                                                            </div>
                                                            <div class="col-8" style="border-left-style: solid">

                                                                <div style="padding: 10%">
                                                                    <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Customer Name: ${lR.getCustomerName()}</div>
                                                                    <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Email: ${lR.getEmailSendedTo()}</div>
                                                                    <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Room number: ${lR.getRoomId().getRoomId()}</div>
                                                                    <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Book Date: <fmt:formatDate value="${lR.getCreateDate()}" pattern="dd/MM/yyyy"/></div>
                                                                    <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Adults: ${lR.getAdultsNum()}</div>
                                                                    <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Children: ${lR.getChildrenNum()}</div>
                                                                    <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Deposits: $${lR.getDeposits()}</div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--modal end-->
                                    </c:forEach>
                                    <c:forEach items="${listPrepareToCheckout}" var="lPTC">
                                        <div class="col-lg-3 col-6">
                                            <!-- small box -->
                                            <div class="small-box" style="background-color: #6d1bf3;color: white">
                                                <div class="inner">
                                                    <h3 style="font-size: 20px">${lPTC.roomId.roomId}</h3>

                                                    <p>${lPTC.customerName}</p>
                                                </div>
                                                <div class="icon">
                                                    <i class="fa fa-hotel"></i>
                                                </div>
                                                <a data-toggle="modal" data-target="#R${lPTC.getQrCodeId()}"  class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                                            </div>
                                        </div>
                                        <!--modal start-->
                                        <div class="modal" id="R${lPTC.getQrCodeId()}">
                                            <div class="modal-dialog modal-dialog-scollable modal-xl" style="padding:10%" >
                                                <div class="modal-content"style="color: white; background-color: #6f6d6d;">
                                                    <!-- Modal Header -->
                                                    <div class="modal-header">
                                                        <h4 class="modal-title" style="padding:1% 11%">From: <fmt:formatDate value="${lPTC.getCheckInDate()}" pattern="dd/MM/yyyy"/> to <fmt:formatDate value="${lPTC.getCheckOutDate()}" pattern="dd/MM/yyyy"/></h4>
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    </div>

                                                    <!-- Modal body -->
                                                    <div class="modal-body">
                                                        <div class="row">
                                                            <div class="col-4" >
                                                                <div style="padding: 10%">
                                                                    <img src="./images/qrcode/${lPTC.getUrl()}" style="max-width: 100%;padding: 10%" alt="Bungalow_room1_c"/>
                                                                </div>
                                                            </div>
                                                            <div class="col-8" style="border-left-style: solid">

                                                                <div style="padding: 10%">
                                                                    <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Customer Name: ${lPTC.getCustomerName()}</div>
                                                                    <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Email: ${lPTC.getEmailSendedTo()}</div>
                                                                    <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Room number: ${lPTC.getRoomId().getRoomId()}</div>
                                                                    <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Book Date: <fmt:formatDate value="${lPTC.getCreateDate()}" pattern="dd/MM/yyyy"/></div>
                                                                    <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Adults: ${lPTC.getAdultsNum()}</div>
                                                                    <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Children: ${lPTC.getChildrenNum()}</div>
                                                                    <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Deposits: $${lPTC.getDeposits()}</div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--modal end-->
                                    </c:forEach>
                                    <c:forEach items="${listClear}" var="lC">
                                        <div class="col-lg-3 col-6">
                                            <!-- small box -->
                                            <div class="small-box bg-danger">
                                                <div class="inner">
                                                    <h3 style="font-size: 20px">${lC.roomId}</h3>

                                                    <p>No customer yet</p>
                                                </div>
                                                <div class="icon">
                                                    <i class="fa fa-hotel"></i>
                                                </div>
                                                <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </data>
                            <!-- ./col -->
                        </div>

                    </div><!--/. container-fluid -->
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
        <script src="<%=common.url%>/dist/js/datepicker-full.js">
        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <script>
            const elem3 = document.getElementById('range');
                    const datepicker3 = new DateRangePicker(elem3, {
                    minDate: "2019-01-01",
                            buttonClass: 'btn btn-warning',
                            format: 'yyyy-mm-dd'
                    });</script>            
        <script type="text/javascript">
                    $(document).on("input", "#locationid", function() {             // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
                $.get('Admin_Room?locationid=' + $('#locationid').val() + '&start=' + $('#datepicker1').val() + '&end=' + $('#datepicker2').val(), function(responseXml) {                // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response XML...
                    $("#result").html($(responseXml).find("data").html()); // Parse XML, find <data> element and append its HTML to HTML DOM element with ID "somediv".
                });
            });
            $(document).on("focusout", "#datepicker1", function() {             // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
                $.get('Admin_Room?locationid=' + $('#locationid').val() + '&start=' + $('#datepicker1').val() + '&end=' + $('#datepicker2').val(), function(responseXml) {                // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response XML...
                    $("#result").html($(responseXml).find("data").html()); // Parse XML, find <data> element and append its HTML to HTML DOM element with ID "somediv".
                });
            });
            $(document).on("focusout", "#datepicker2", function() {             // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
                $.get('Admin_Room?locationid=' + $('#locationid').val() + '&start=' + $('#datepicker1').val() + '&end=' + $('#datepicker2').val(), function(responseXml) {                // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response XML...
                    $("#result").html($(responseXml).find("data").html()); // Parse XML, find <data> element and append its HTML to HTML DOM element with ID "somediv".
                });
            });
        </script>
    </body>
</html>
