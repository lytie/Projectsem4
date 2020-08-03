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

                <!-- Main content -->
                <section class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card">
                                        <div class="card-header">
                                            <h3 class="card-title">Convenient List</h3>
                                        </div>
                                        <!-- /.card-header -->
                                        <div class="card-body">
                                            <table id="example1" class="table table-bordered table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>QrCode Id</th>
                                                        <th>Email sended to</th>
                                                        <th>Create Date</th>
                                                        <th>Status</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <c:forEach items="${listQrcode}" var="c">
                                                        <tr>
                                                            <td > 
                                                                <a class="" href="Admin_QrCodeInfo?id=<c:out value="${c.getQrCodeId()}"/>">
                                                                    <c:out value="${c.getQrCodeId()}"/>
                                                                </a>
                                                            </td>
                                                            <td>
                                                                <c:out value="${c.getEmailSendedTo()}"/>
                                                            </td>

                                                            <td>
                                                                <fmt:formatDate value="${c.getCreateDate()}" pattern="dd/MM/yyyy"/>
                                                            </td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${c.getStatus()== true}">Active</c:when>
                                                                    <c:otherwise>Not Active</c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                            <td>
                                                                <c:if test="${c.checkOutDate!=null}">
                                                                    <c:if test="${date.before(c.checkOutDate)||date==c.checkOutDate}">
                                                                        <c:choose>
                                                                            <c:when test="${c.getStatus()== true}">
                                                                                <a class="btn btn-danger btn-sm" href="Admin_StatusQrcode?status=deactivate&id=<c:out value="${c.getQrCodeId()}"/>">
                                                                                    <i class="fas fa-times"></i> Deactivate                          
                                                                                </a> 
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <c:if test="${c.checkInDate==date||c.checkInDate.before(date)}">
                                                                                    <a class="btn btn-success btn-sm" href="Admin_StatusQrcode?status=active&id=<c:out value="${c.getQrCodeId()}"/>">
                                                                                        <i class="fas fa-check"></i> Active                          
                                                                                    </a> 
                                                                                </c:if>
                                                                                <a class="btn btn-dark btn-sm" href="Admin_StatusQrcode?status=cancel&id=<c:out value="${c.getQrCodeId()}"/>">
                                                                                    <i class="fas fa-ban"></i> Cancel                          
                                                                                </a> 
                                                                            </c:otherwise>
                                                                        </c:choose>   
                                                                    </c:if>
                                                                </c:if>
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
