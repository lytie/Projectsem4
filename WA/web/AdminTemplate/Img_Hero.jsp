<%-- 
    Document   : roomImage
    Created on : Jul 13, 2020, 4:13:24 PM
    Author     : ADMIN
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.Roomimage"%>
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
        <link rel='stylesheet' href='https://cdn.rawgit.com/t4t5/sweetalert/v0.2.0/lib/sweet-alert.css'>
        <script src='https://cdn.rawgit.com/t4t5/sweetalert/v0.2.0/lib/sweet-alert.min.js'></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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

                                    <!-- /.card-header -->


                                    <div class="card">
                                        <div class="card-header">
                                            <h3 class="card-title">Banner Image</h3>
                                        </div>
                                        <form action="Admin_ImgHero" method="post">
                                            <div style="float: right;margin-right: 5%;padding: 10px">
                                                <a class="btn btn-info btn-sm" href="Admin_AddImgHero">
                                                    <i class=" fa fa-plus">
                                                    </i> Add Banner
                                                </a>
                                                 <input type="submit"class="btn btn-success btn-sm" value="Update"/>
                                            </div>

                                           
                                            <!-- /.card-header -->
                                            <div class="card-body">
                                                <table id="" class="table table-bordered table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th>Banner Number</th>
                                                            <th>Banner Image</th>
                                                            <th>Title top</th>
                                                            <th>Title under</th>
                                                            <th>Choose to Show</th>

                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${listImg}" var="t">
                                                            <tr>
                                                                <td>${t.idHero}</td>
                                                                <td width="400"><img src="images/img/${t.img}" width="300" height="110" /></td>
                                                                <td><input type="text" value="${t.textTitle}" maxlength="30" name="top${t.idHero}" class="form-control"/>
                                                                    </td>
                                                                <td><input type="text" value="${t.textShort}" maxlength="20" name="under${t.idHero}" class="form-control"/>
                                                                    </td>
                                                                <td>
                                                                    <input type="checkbox" name="choose${t.idHero}" <c:if test="${t.choose}">checked</c:if> value="${t.idHero}"/>


                                                                    </td>
                                                                </tr>
                                                        </c:forEach>

                                                    </tbody>

                                                </table>
                                            </div>
                                        </form>
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
        <div class="${success}"></div>
        <!-- jQuery -->
        <%@include file="jslink.jsp" %>
    </body>
    <script type="text/javascript">
        $('.success').each(function () {
            swal("Update Success", "", "success");
        });
    </script>
</html>
