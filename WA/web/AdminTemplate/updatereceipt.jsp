<%-- 
    Document   : addconvenient
    Created on : Jul 13, 2020, 4:05:09 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
            

            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                    <div class="row">
                        <!-- left column -->
                        <div class="col-md-12">
                            <!-- jquery validation -->
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">Update Receipt</small></h3>
                                </div>
                                <!-- /.card-header -->
                                <!-- form start -->
                                <form role="form" id="quickForm">
                                    <div class="card-body">
                                        
                                        <div class="form-group col-md-6">
                                            <label for="">Pay Date :</label>
                                            <input type="datetime"  class="form-control" id="exampleInputFullName" placeholder="Pay Date" readonly="">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="">Sub total :</label>
                                            <input type="number"  class="form-control" id="exampleInputFullName" placeholder="Sub Total" readonly="">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="">Tax :</label>
                                            <input type="number" name="text" class="form-control" id="exampleInputFullName" placeholder="Tax" readonly="">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="">Total</label>
                                            <input type="number" name="text" class="form-control" id="exampleInputFullName" placeholder="Total" readonly="">
                                        </div>
                                        <div class="form-group col-md-6">
                                                <label for="inputState">Status</label>
                                                <select id="inputState" class="form-control">
                                                    <option selected>--Select Option--</option>
                                                    <option>...</option>
                                                    <option>..</option>
                                                </select>
                                            </div>
                                        
                                        
                                    </div>
                                    <!-- /.card-body -->
                                    <div class="card-footer">
                                        <button type="submit" class="btn btn-primary">Update</button>
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
