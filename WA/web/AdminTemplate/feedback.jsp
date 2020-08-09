<%-- 
    Document   : mailbox
    Created on : Jul 13, 2020, 4:11:26 PM
    Author     : ADMIN
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.Feedback"%>
<%@page import="java.util.List"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                                <h1>Inbox</h1>
                            </div>

                        </div>
                    </div>
                    <!-- /.container-fluid -->
                </section>

                <!-- Main content -->
                <section class="content">

                    <!-- /.col -->
                    <div class="col-md-12">
                        <div class="card card-primary card-outline">
                            <div class="card-header">
                                <h3 class="card-title">Inbox</h3>


                                <!-- /.card-tools -->
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body p-0">
                                <div class="mailbox-controls">
                                    <!-- Check all button -->

                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default btn-sm"><i class="far fa-trash-alt"></i></button>
                                        <button type="button" class="btn btn-default btn-sm"><i class="fas fa-reply"></i></button>
                                        <button type="button" class="btn btn-default btn-sm"><i class="fas fa-share"></i></button>
                                    </div>
                                    <!-- /.btn-group -->
                                    <button type="button" class="btn btn-default btn-sm"><i class="fas fa-sync-alt"></i></button>
                                    <div class="float-right">


                                        <!-- /.btn-group -->
                                    </div>
                                    <!-- /.float-right -->
                                </div>
                                <div class="table-responsive mailbox-messages">
                                    <table class="table table-hover table-striped">
                                        <tbody>
                                            <c:forEach items="${listfb}" var="fb">
                                                <tr>
                                                    <td class="mailbox-star"><a href=""><i class="fas fa-star text-warning"></i></a></td>
                                                    <td class="mailbox-name"> <a class="" href="Admin_ReadFB?feedbackid=<c:out value="${fb.getFeedBackId()}"/>">
                                                            <c:out value="${fb.getQrCodeId().getEmailSendedTo()}"/>
                                                        </a></td>
                                                        <td class="mailbox-subject">
                                            <fmt:formatDate value="${fb.getFeedBackTime()}" pattern="dd/MM/yyyy"/>
                                            </td>
                                            <td class="mailbox-attachment">
                                                <c:out value="${fb.getQrCodeId().getCustomerName()}"/>
                                            </td>
                                            <td class="mailbox-date">

                                            </td>
                                            </tr>

                                        </c:forEach>

                                        </tbody>
                                    </table>
                                    <!-- /.table -->
                                </div>
                                <!-- /.mail-box-messages -->
                            </div>
                            <!-- /.card-body -->
                            <div class="card-footer p-0">
                                <div class="mailbox-controls">
                                    <!-- Check all button -->

                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default btn-sm"><i class="far fa-trash-alt"></i></button>
                                        <button type="button" class="btn btn-default btn-sm"><i class="fas fa-reply"></i></button>
                                        <button type="button" class="btn btn-default btn-sm"><i class="fas fa-share"></i></button>
                                    </div>
                                    <!-- /.btn-group -->
                                    <button type="button" class="btn btn-default btn-sm"><i class="fas fa-sync-alt"></i></button>
                                    <div class="float-right">


                                        <!-- /.btn-group -->
                                    </div>
                                    <!-- /.float-right -->
                                </div>
                            </div>
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
            </div>
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
</body>

</html>
