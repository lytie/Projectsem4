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
    <title>AdminLTE 3 | DataTables</title>
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
                            
                            <h4><a class="btn btn-info btn-sm" href="Admin_AddService">
                     <i class=" fa fa-plus">
                              </i> Add new Entertainment
                    </a></h4>
                        
                </div>
                <!-- /.container-fluid -->
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">

                                <!-- /.card-header -->


                                <div class="card">
                                    <div class="card-header">
                                        <h3 class="card-title">List Entertainment</h3>
                                    </div>
                                    <!-- /.card-header -->
                                    <div class="card-body">
                                        <table id="example1" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Service Name</th>
                                                    <th>Price</th>
                                                    <th>Description</th>
                                                    <th>URL</th>
                                                    
                                                    <th>Action</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${listentertainment}" var="s">
                                                <tr>
                                                    <td><c:out value="${s.getServiceName()}"/></td>
                                                    <td><c:out value="${s.getServicePrice()}"/></td>
                                                    <td><c:out value="${s.getServiceDescription()}"/></td>
                                                    <td width="100"><img src="images/customerpageimg/${s.getServiceurl()}" width="80" height="70" /></td>
                                                    
                                                    <td>

                                                        <a class="btn btn-info btn-sm" href="#">
                                                            <i class="fas fa-pencil-alt">
                              </i> Edit
                                                        </a>
                                                        <a class="btn btn-danger btn-sm" href="#">
                                                            <i class="fas fa-trash">
                              </i> Delete
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
            <footer class="main-footer">
                <div class="float-right d-none d-sm-block">
                    <b>Version</b> 3.0.5
                </div>
                <strong>Copyright &copy; 2014-2019 <a href="http://adminlte.io">AdminLTE.io</a>.</strong> All rights reserved.
            </footer>

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
