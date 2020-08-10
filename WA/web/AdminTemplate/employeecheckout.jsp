<%-- 
    Document   : index2
    Created on : Jul 13, 2020, 4:10:52 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1; maximum-scale=1.0; user-scalable=0;">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Admin Haven</title>

        <!-- Font Awesome Icons -->
        <%@include file="css.jsp" %>
        <link href="https://fonts.googleapis.com/css2?family=Indie+Flower&display=swap" rel="stylesheet">
    </head>
    <body class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed" id="body" >
        <div class="wrapper">

            <%@include file="navbar2.jsp" %>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <div class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-12" style="margin-bottom: 20px">
                                <h1 class="m-0 text-dark text-center">Check out </h1>
                            </div>
                            <div class="col-sm-12">         
                                <div class="row">
                                    <div class="col-12">
                                        Qrcodeid:
                                        <input id="qr-reader-results" name="qrcodeid" type="search" class="form-control" placeholder="Enter qrcodeid"/>
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
                        <div class="row">
                            <div class="col-6">
                                <div id="qr-reader" style="width:100%"></div>
                            </div>
                            <span id="result" class="col-6">
                                <data>
                                    <c:if test="${qrcode!=null}">
                                        <div class="col-12"  style="border-style: solid;border-color: #dcdcdc;padding: 20px">
                                            <div class="row">
                                                <h2 style="padding-left: 30%;padding-right: 30%">Information</h2>
                                            </div>
                                            <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Customer Name: ${qrcode.getCustomerName()}</div>
                                            <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Email: ${qrcode.getEmailSendedTo()}</div>
                                            <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Check-in Date: <fmt:formatDate value="${qrcode.getCheckInDate()}" pattern="dd/MM/yyyy"/></div>
                                            <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Check-out Date: <fmt:formatDate value="${qrcode.getCheckOutDate()}" pattern="dd/MM/yyyy"/></div>
                                            <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Adults: ${qrcode.getAdultsNum()}</div>
                                            <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Children: ${qrcode.getChildrenNum()}</div>
                                            <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Room number: ${qrcode.getRoomId().getRoomId()}</div>
                                            <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Deposits: $${qrcode.getDeposits()}</div>
                                            <div style="padding: 20px">
                                                <a class="btn btn-warning" style="color: white" href="Employee_Checkout?qrcodeid=${qrcode.getQrCodeId()}&action=deactive">Checkout</a>
                                                <a class="btn btn-warning" style="color: white" href="Admin_ReceiptInfo?receiptid=${qrcode.receiptId.receiptId}">Payment</a>

                                            </div>
                                        </div>
                                    </c:if>
                                </data>
                            </span>    
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
        <script type="text/javascript">
            $(document).on("search", "#qr-reader-results", function () {             // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
                $.get('Employee_Checkout?qrcodeid=' + $('#qr-reader-results').val(), function (responseXml) {                // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response XML...
                    $("#result").html($(responseXml).find("data").html()); // Parse XML, find <data> element and append its HTML to HTML DOM element with ID "somediv".
                });
            });
            $(document).on("input", "#qr-reader-results", function () {             // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
                $.get('Employee_Checkout?qrcodeid=' + $('#qr-reader-results').val(), function (responseXml) {                // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response XML...
                    $("#result").html($(responseXml).find("data").html()); // Parse XML, find <data> element and append its HTML to HTML DOM element with ID "somediv".
                });
            });
            $(document).on("change", "#qr-reader-results", function () {             // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
                $.get('Employee_Checkout?qrcodeid=' + $('#qr-reader-results').val(), function (responseXml) {                // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response XML...
                    $("#result").html($(responseXml).find("data").html()); // Parse XML, find <data> element and append its HTML to HTML DOM element with ID "somediv".
                });
            });
        </script>
        ${msg}
    </body>
</html>
