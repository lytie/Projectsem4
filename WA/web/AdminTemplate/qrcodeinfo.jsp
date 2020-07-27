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
                            </div>

                        </div>
                    </div>
                    <!-- /.container-fluid -->
                </section>
                <c:choose>  
                <c:when test="${qrcode!=null}">
                   <!-- Main content -->
                <section class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header text-center" style="background-color: #ffeded">
                                        <h2>Qrcode Information</h1>
                                    </div>
                                    <div class="card-body" style="background-color: #f6e3e338">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <img src="images/qrcode/image.png" style="width: 100%"/>
                                            </div>
                                            <div class="col-md-9" style="border-color: #ffc107;border-style: solid;border-radius: 20px">
                                                <div class="row">
                                                    <div class="col-md-6" style="padding: 20px;">
                                                        <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">QrCodeId: ${qrcode.getQrCodeId()}</div>
                                                    </div>
                                                    <div class="col-md-6" style="padding: 20px;">
                                                        <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Customer Name: ${qrcode.getCustomerName()}</div>
                                                    </div>
                                                    <div class="col-md-6" style="padding: 20px;">
                                                        <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Email Sended To: ${qrcode.getEmailSendedTo()}</div>
                                                    </div>
                                                    <div class="col-md-6" style="padding: 20px;">
                                                        <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Create Date: <fmt:formatDate value="${qrcode.getCreateDate()}" pattern="dd/MM/yyyy"/></div>
                                                    </div>
                                                    <div class="col-md-6" style="padding: 20px;">
                                                        <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Check In Date: <fmt:formatDate value="${qrcode.getCheckInDate()}" pattern="dd/MM/yyyy"/></div>
                                                    </div>
                                                    <div class="col-md-6" style="padding: 20px;">
                                                        <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Check Out Date: <fmt:formatDate value="${qrcode.getCheckOutDate()}" pattern="dd/MM/yyyy"/></div>
                                                    </div>
                                                    <div class="col-md-6" style="padding: 20px;">
                                                        <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Room Number: ${qrcode.getRoomId().getRoomId()}</div>
                                                    </div>
                                                    <div class="col-md-6" style="padding: 20px;">
                                                        <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Adults Number: ${qrcode.getAdultsNum()}</div>
                                                    </div>
                                                    <div class="col-md-6" style="padding: 20px;">
                                                        <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Children Number: ${qrcode.getChildrenNum()}</div>
                                                    </div>
                                                    <div class="col-md-6" style="padding: 20px;">
                                                        <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Deposits: 
                                                            <c:choose>
                                                                <c:when test="${qrcode.getDeposits()==null}">0</c:when>
                                                                <c:otherwise>${qrcode.getDeposits()}</c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6" style="padding: 20px;">
                                                        <a href="Admin_ReceiptInfo?receiptid=${qrcode.getReceiptId().getReceiptId()}" class="btn btn-warning" style="border-radius: 10px;color: white;margin: 10px"><i class="fas fa-shopping-bag"></i> Click to see Bill</a>
                                                        <c:choose>
                                                                <c:when test="${qrcode.getStatus()==true}">
                                                                    <button class="btn btn-danger" style="border-radius: 10px;color: white;margin: 10px"><i class="fas fa-times"></i>Click to De-Active</button>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <button class="btn btn-success" style="border-radius: 10px;color: white;margin: 10px"><i class="fas fa-check"></i>Click to Active</button>
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
                </c:when>
                <c:otherwise>
                    <section class="content">
                        <div class="card">
                            <div class="card-header">Qrcode Not Found</div>
                            <div class="card-body">
                                <button class="btn btn-warning" onclick="history.back()">Back</button>
                            </div>
                        </div>
                    </section>
                </c:otherwise>
                   </c:choose>
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
