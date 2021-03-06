<%-- 
    Document   : readmail
    Created on : Jul 13, 2020, 4:11:51 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="entities.Feedback"%>
<%@page import="java.util.List"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Admin Haven</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Font Awesome -->
        <%@include file="css.jsp" %>
    </head>

    <body class="hold-transition sidebar-mini">
        <div class="wrapper">

            <%@include file="navbar.jsp" %>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1>Feedback</h1>
                            </div>

                        </div>
                    </div>
                    <!-- /.container-fluid -->
                </section>

                <!-- Main content -->
                <section class="content">

                    <!-- /.col -->
                    <div class="col-md-12" id="myCanvas">
                        <div class="card card-primary card-outline">
                            <div class="card-header">
                                <h3 class="card-title">Read Feedback</h3>

                            </div>
                            <!-- /.card-header -->
                            <div class="card-body p-0">
                                <div class="mailbox-read-info">

                                    <h6>From: <c:out value="${feedbacklist.getQrCodeId().getEmailSendedTo()}"/>
                                        <span class="mailbox-read-time float-right"> <fmt:formatDate value="${feedbacklist.getFeedBackTime()}" pattern="dd/MM/yyyy"/></span></h6>
                                </div>

                                <div class="mailbox-read-message">
                                    <c:out value="${feedbacklist.getFeedBackMessage()}" />
                                </div>
                                <!-- /.mailbox-read-message -->
                            </div>
                            <!-- /.card-body -->

                            <!-- /.card-footer -->
                            <div class="card-footer">
                                <!-- /.mailbox-read-info -->
                                <div class="mailbox-controls with-border text-center">

                                    <!-- /.btn-group -->
                                    <button type="button" onclick="ExportPdf()" class="btn btn-default btn-sm" data-toggle="tooltip" title="Print">
                                        <i class="fas fa-print"></i></button>
                                </div>
                                <!-- /.mailbox-controls -->


                            </div>
                            <!-- /.card-footer -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->

                    <!-- /.row -->
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
        <script src="https://kendo.cdn.telerik.com/2017.2.621/js/jszip.min.js"></script>
        <script src="https://kendo.cdn.telerik.com/2017.2.621/js/kendo.all.min.js"></script>

        <script>
            function ExportPdf() {
                kendo.drawing
                        .drawDOM("#myCanvas",
                                {
                                    paperSize: "A4",
                                    margin: {top: "1cm", bottom: "1cm"},
                                    scale: 0.8,
                                    height: 500
                                })
                        .then(function(group) {
                            kendo.drawing.pdf.saveAs(group, "Exported.pdf")
                        });
            }

        </script>
    </body>
</html>
