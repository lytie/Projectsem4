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
            <%@include file="navbar.jsp" %>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h4>
                                    <button class="btn btn-warning btn-sm" onclick="ExportPdf()">
                                        <i class="fa fa-download"></i> Download Receipt 
                                    </button>
                                </h4>
                            </div>

                        </div>
                    </div><!-- /.container-fluid -->
                </section>

                <!-- Main content -->
                <section class="content" id="myCanvas" >
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header text-center" style="background-color: #ffeded">
                                        <h2>Receipt Information</h1>
                                    </div>
                                    <div class="card-body" style="background-color: #f6e3e338">
                                        <div class="row">
                                            <div class="col-md-12" style="padding-top: 10px;border-color: #ffc107;border-style: solid;border-radius: 20px">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <table class="table table-bordered table-striped">
                                                            <thead>
                                                                <tr>
                                                                    <th>Order Date </th>
                                                                    <th>Item </th>
                                                                    <th>Price</th>
                                                                    <th>Quantity</th>
                                                                    <th>Total</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach items="${listReceiptcomponent}" var="lc">
                                                                    <tr>
                                                                        <th><fmt:formatDate value="${lc.getOrderDate()}" pattern="dd/MM/yyyy HH:mm" /></th>
                                                                        <th>${lc.getComponentName()}</th>
                                                                        <th>${lc.getPrice()}</th>
                                                                        <th>${lc.getQuantity()}</th>
                                                                        <th>${lc.getSubtotal()}</th>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="col-md-6" style="padding: 20px;">
                                                        <div>Subtotal: ${receipt.getSubtotal()}</div>
                                                        <div>Tax: ${receipt.getTax()}</div>
                                                        <div>Deposits: ${receipt.getSubtotal()+receipt.getTax()-receipt.getTotal()}</div>
                                                        <div>Total:${receipt.getTotal()}</div>
                                                        <c:choose>
                                                            <c:when test="${receipt.getPayStatus()==true}">
                                                                <button class="btn btn-success col-12" style="margin-top: 10px">Paid</button>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <button class="btn btn-danger col-12" style="margin-top: 10px">Unpaid</button>
                                                            </c:otherwise>
                                                        </c:choose>
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