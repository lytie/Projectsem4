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
        <meta name="viewport" content="width=device-width, initial-scale=1; maximum-scale=1.0; user-scalable=0;">
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
                            <div class="col-sm-12" style="margin-bottom: 20px">
                                <h1 class="m-0 text-dark text-center">List Room <button class="btn btn-warning" style="float: left"><i class="fa fa-search"></i>Filter</button></h1>
                            </div>
                            <div class="col-sm-6">         
                                <div class="row">
                                    <div class="col-12">
                                        Qrcodeid:
                                        <input id="qr-reader-results" type="text" class="form-control" placeholder="Enter qrcodeid"/>
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
                                        <div style="width: 20px;height: 20px;background-color: #474d52;float: right"></div>
                                        <div style="float: right;margin-right: 10px">Prepare to checkout</div> 
                                    </div>
                                </div>
                            </div>
                        </div><!-- /.row -->
                    </div><!-- /.container-fluid -->
                </div>
                <!-- /.content-header -->

                <!-- Main content -->
                <section class="content">
                    <div class="container-fluid">
                        <div id="qr-reader" style="width:500px"></div>


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
        <script src="AdminTemplate/dist/js/html5-qrcode.min.js"></script>
        <script>
            var resultContainer = document.getElementById('qr-reader-results');
            var lastResult, countResults = 0;

            function onScanSuccess(qrCodeMessage) {
                console.log(qrCodeMessage);
                resultContainer.value = qrCodeMessage;

                if (qrCodeMessage !== lastResult) {
                    ++countResults;
                    lastResult = qrCodeMessage;
                    resultContainer.innerHTML
                    += ` < div > [${countResults}] - ${qrCodeMessage} < /div>`;
                }
            }

            var html5QrcodeScanner = new Html5QrcodeScanner(
                    "qr-reader", {fps: 10, qrbox: 250});
            html5QrcodeScanner.render(onScanSuccess);
        </script>
    </body>
</html>
