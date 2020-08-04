<%-- 
    Document   : receipt
    Created on : Jul 13, 2020, 4:12:23 PM
    Author     : ADMIN
--%>

<%@page import="entities.Receipt"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
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
        <title>AdminLTE 3 | Receipt</title>
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
                                    <button onclick="$('table').tblToExcel();" class="btn btn-info btn-sm" href="#">
                                        <i class=" fa fa-download">
                                        </i> Export to excel
                                    </button>
                                </h4>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card">
                                        <div class="card-header">
                                            <h3 class="card-title">Receipt List</h3>
                                        </div>
                                        <!-- /.card-header -->
                                        <div class="card-body">
                                            <table id="example1" class="table table-bordered table-striped">
                                                <thead>

                                                    <tr>
                                                        <th>Receipt Id :</th>
                                                        <th>Pay Date :</th>
                                                        <th>Subtotal :</th>
                                                        <th>Tax :</th>
                                                        <th>Total :</th>
                                                        <th>Pay Status :</th>
                                                        <th>Action</th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${listrc}" var="lc">
                                                        <tr>
                                                            <td>${lc.getReceiptId()}</td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${lc.getPayDate()==null}">
                                                                        ---------
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <fmt:formatDate value="${lc.getPayDate()}" pattern="dd/MM/yyyy HH:mm"/>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                            <td>${lc.getSubtotal()}</td>
                                                            <td >${lc.getTax()}</td>
                                                            <td >${lc.getTotal()}</td>
                                                            <td >
                                                                <c:choose>
                                                                    <c:when test="${lc.getPayDate()==null}">
                                                                        UnPaid
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        Paid
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                            <td>
                                                                <a class="btn btn-info btn-sm" href="Admin_ReceiptInfo?receiptid=${lc.getReceiptId()}">
                                                                    <i class="fas fa-info">
                                                                    </i> See Details
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>

                                                </tbody>

                                            </table>
                                        </div>
                                        <!-- /.card-body -->
                                    </div>
                                    <!-- /.card -->
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
