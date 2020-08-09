<%-- 
    Document   : service
    Created on : Jul 13, 2020, 4:13:41 PM
    Author     : ADMIN
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.Accountemployee"%>
<%@page import="java.text.SimpleDateFormat"%>
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

                                <h4><a class="btn btn-info btn-sm" href="Admin_AddEmployee">
                                        <i class=" fa fa-plus">
                                        </i> Add new Employee
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
                                                        <h3 class="card-title">List Employee</h3>
                                                    </div>
                                                    <!-- /.card-header -->
                                                    <div class="card-body">
                                                        <table id="example1" class="table table-bordered table-striped">
                                                            <thead>
                                                                <tr>
                                                                    <th>Full Name</th>
                                                                    <th>Email</th>
                                                                    <th>Phone</th>
                                                                    <th>Date Of Birth</th>
                                                                    <th>Role</th>
                                                                    <th>Action</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach items="${listAccE}" var="s">
                                                                    <tr>
                                                                        <td width="15%">${s.getFullName()}</td>
                                                                        <td width="15%">${s.getEmail()}</td>
                                                                        <td width="15%">${s.getPhone()}</td>
                                                                        <td width="20%"><fmt:formatDate value="${s.getDateOfBirth()}" pattern="dd/MM/yyyy"/></td>
                                                                        <td width="10%">${s.getRoleId().getRoleName()}</td>
                                                                        <td>
                                                                            <c:if test="${s.getRoleId().getRoleId()!=1}">
                                                                                <c:if test="${s.getStatus()==true}">
                                                                                    <a class="btn btn-danger btn-sm" href="Admin_Employee?id=${s.getAccountId()}&action=deactive">
                                                                                        <i class="fas fa-ban">
                                                                                        </i> De-active 
                                                                                    </a>
                                                                                </c:if>
                                                                                <c:if test="${s.getStatus()!=true}">
                                                                                    <a class="btn btn-success btn-sm" href="Admin_Employee?id=${s.getAccountId()}&action=active">
                                                                                        <i class="fas fa-check">
                                                                                        </i> Active 
                                                                                    </a>
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
