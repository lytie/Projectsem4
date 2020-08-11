<%-- 
    Document   : index2
    Created on : Jul 13, 2020, 4:10:52 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="x-ua-compatible" content="ie=edge">

        <title>Admin Haven</title>

        <!-- Font Awesome Icons -->
        <%@include file="css.jsp" %>
        <link href="https://fonts.googleapis.com/css2?family=Indie+Flower&display=swap" rel="stylesheet">
    </head>
    <body class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed" >
        <div class="wrapper">

            <%@include file="navbar2.jsp" %>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <div class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">

                            </div>
                        </div><!-- /.row -->
                    </div><!-- /.container-fluid -->
                </div>
                <!-- /.content-header -->

                <!-- Main content -->
                <form action="Employee_Information" method="post">
                    <section class="content" id="myCanvas">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-header text-center" style="background-color: #ffeded">
                                            <h2>Employee Information</h1>
                                        </div>
                                        <div class="card-body" style="background-color: #f6e3e338">
                                            <div class="row">
                                                <div class="col-md-12" style="padding-top: 10px;border-color: #ffc107;border-style: solid;border-radius: 20px">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="row">  
                                                                <div class="col-md-6" style="padding: 20px;">
                                                                    <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Name: ${accountemployee.getFullName()}</div>
                                                                </div>
                                                                <div class="col-md-6" style="padding: 20px;">
                                                                    <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Email: ${accountemployee.getEmail()}</div>
                                                                </div>
                                                                <div class="col-md-6" style="padding: 20px;">
                                                                    <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Phone: ${accountemployee.getPhone()}</div>
                                                                </div>
                                                                <div class="col-md-6" style="padding: 20px;">
                                                                    <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Birthday:<fmt:formatDate value="${accountemployee.getDateOfBirth()}" pattern="dd/MM/yyyy"/></div>
                                                                </div>
                                                                <div class="col-md-6" style="padding: 20px;">
                                                                    <div style="border-bottom-color: #eaeaea;border-bottom-style: solid">Role: ${accountemployee.getRoleId().getRoleName()}</div>
                                                                </div>                                         
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6" style="padding: 20px;">
                                                            <input type="hidden" name="id" value="${accountemployee.getAccountId()}"/>
                                                            <div>Old password:<input type="password" name="oldpassword" class="form-control"/></div>
                                                            <div>New password:<input type="password" id="pwd" required name="newpassword" class="form-control"/></div>
                                                            <div>Confirm password:<input type="password" id="cpwd" required name="confirmpassword" class="form-control"/></div>

                                                            <button class="btn btn-success col-12">Submit</button>
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
                </form>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->

            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark">
                <!-- Control sidebar content goes here -->
            </aside>
            <!-- /.control-sidebar -->

            <!-- Main Footer -->
            <%@include file="footer.jsp" %>
        </div>
        <!-- ./wrapper -->

        <!-- REQUIRED SCRIPTS -->
        <!-- jQuery -->
        <%@include file="jslink.jsp" %>
        ${success}
        <script>
            var password = document.getElementById('pwd'),
                    confirm_password = document.getElementById('cpwd');

            function validatePassword() {
                if (password.value !== confirm_password.value) {
                    confirm_password.setCustomValidity("Passwords Don't Match");
                } else {
                    confirm_password.setCustomValidity('');
                }
            }
            password.oninput = validatePassword;
            confirm_password.oninput = validatePassword;
        </script>
    </body>
</html>
