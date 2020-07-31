<%-- 
    Document   : addfood
    Created on : Jul 13, 2020, 4:06:19 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="bean.common"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>AdminLTE 3 | Add new Employee</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="<%=common.url%>/dist/css/datepicker-foundation.min.css" rel="stylesheet"/>
        <!-- Font Awesome -->
        <%@include file="css.jsp" %>
    </head>

    <body class="hold-transition sidebar-mini">
        <div class="wrapper">
            <%@include file="navbar.jsp" %>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->


                <!-- Main content -->
                <section class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <!-- left column -->
                            <div class="col-md-12">
                                <!-- jquery validation -->
                                <div class="card card-primary">
                                    <div class="card-header">
                                        <h3 class="card-title">ADD NEW Employee</h3>
                                    </div>
                                    <!-- /.card-header -->
                                    <!-- form start -->
                                    <form  action="Admin_AddEmployee" id="quickForm" method="post">
                                        <div class="card-body">

                                            <div class="form-row">
                                                <div class="form-group col-md-6">
                                                    <label for="inputEmail4">Email</label>
                                                    <input type="email" class="form-control" name="email" placeholder="Email" required="true">
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="inputPassword4">Password</label>
                                                    <input type="password" class="form-control" name="password" placeholder="Password" required="true">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputAddress">Full Name</label>
                                                <input type="text" class="form-control" name="name" placeholder="Full Name" required="true">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputAddress">Phone</label>
                                                <input type="number" class="form-control" name="phone" placeholder="Phone" required="true">
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-md-6">
                                                    <label for="inputPhone">Date Of Birth</label>
                                                    <input name="datepicker" class="form-control" id="inputCity"  required="true">
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <label for="inputState">Role</label>
                                                    <select id="inputState" class="form-control" name="role">
                                                        
                                                        <c:forEach items="${list}" var="r">
                                                            <option value="${r.roleId}">${r.roleName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>

                                            </div>

                                            <!-- /.card-body -->
                                            <div >
                                                <button type="submit" class="btn btn-primary">Submit</button>
                                            </div>
                                            
                                            
                                    </form>
                                </div>
                                <!-- /.card -->
                            </div>
                            <!--/.col (left) -->
                            <!-- right column -->
                            <div class="col-md-6">

                            </div>
                            <!--/.col (right) -->
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
    <script src="<%=common.url%>/dist/js/datepicker-full.js">
    </script>
    <script>



        const elem = document.querySelector('input[name="datepicker"]');
        const datepicker = new Datepicker(elem, {
             
            buttonClass: 'btn',
            format: 'yyyy-mm-dd'
        });
        
      </script>
    <script src="dist/js/datepicker.min.js">
    </script>
    <script src="dist/js/locales/fr.min.js">
    </script>
    <script src="dist/js/datepicker-full.min.js">
    </script>
</html>
