<%-- 
    Document   : service
    Created on : Jul 13, 2020, 4:13:41 PM
    Author     : ADMIN
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.Service"%>
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
                                <h4>
                                    <a class="btn btn-info btn-sm" href="Admin_AddRoom">
                                        <i class=" fa fa-plus">
                                        </i> Add new Room
                                    </a>   
                                </h4>
                            </div>
                        </div>
                    </div>
                    <!-- /.container-fluid -->
                </section>

                <!-- Main content -->
                <section class="content" id="result">
                    <data>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-12">
                                    <div class="card">

                                        <!-- /.card-header -->
                                        <div class="card">
                                            <div class="card-header">
                                                <h3 class="card-title">List Services</h3>
                                            </div>
                                            <!-- /.card-header -->
                                            <div class="card-body" >

                                                <table id="example1" class="table table-bordered table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th>Room Id</th>
                                                            <th>Location</th>
                                                            <th>Room Type</th>
                                                            <th>Price</th>
                                                            <th>Status</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>

                                                        <c:forEach items="${list}" var="s">
                                                            <tr >

                                                                <td><c:out value="${s.getRoomId()}"/></td>
                                                                <td><c:out value="${s.getLocationId().getLocationName()}"/></td>
                                                                <td><c:out value="${s.getRoomTypeId().getRoomTypeName()}"/></td>
                                                                <td><c:out value="${s.getPrice()}"/></td>
                                                                <td><c:out value="${s.getStatus()}"/></td>

                                                                <td>

                                                                    <a class="btn btn-info btn-sm" href="Admin_UpdateRoom?id=${s.getRoomId()}">
                                                                        <i class="fas fa-pencil-alt">
                                                                        </i> Details-Edit
                                                                    </a>
                                                                    <c:if test="${s.getStatus()==true}">
                                                                        <a class="btn btn-danger btn-sm" href="Admin_UpdateRoom?id=${s.getRoomId()}&action=deactive">
                                                                            <i class="fas fa-ban">
                                                                            </i> De-active 
                                                                        </a>
                                                                    </c:if>
                                                                        <c:if test="${s.getStatus()!=true}">
                                                                        <a class="btn btn-success btn-sm" href="Admin_UpdateRoom?id=${s.getRoomId()}&action=active">
                                                                            <i class="fas fa-check">
                                                                            </i> Active 
                                                                        </a>
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
                    </data>
                </section>
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