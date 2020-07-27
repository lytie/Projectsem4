<%-- 
    Document   : convenient
    Created on : Jul 13, 2020, 4:09:39 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

                                <h4><a class="btn btn-info btn-sm" href="#">
                                        <i class=" fa fa-plus">
                                        </i> Add Convenient
                                    </a></h4>
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
                                                        <th>Convenient Name :</th>
                                                        <th>Image :</th>
                                                        <th>Action</th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    
                                                   <c:forEach items="${listcon}" var="c">
                                                <tr>
                                                    <td width="35%"><c:out value="${c.getConvenientName()}"/></td>
                                                    
                                                    <td width="200"><img src="images/icon/${c.url}" width="150" height="100" /></td>
                                                    
                                                    <td width="20%">

                                                        <a class="btn btn-info btn-sm" href="Admin_UpdateConvenient">
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
