<%-- 
    Document   : addlocation
    Created on : Jul 13, 2020, 4:07:03 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>AdminLTE 3 | Edit Location</title>
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
                                        <h3 class="card-title">Edit Location</small></h3>
                                    </div>
                                    <!-- /.card-header -->
                                    <!-- form start -->
                                    <form role="form" id="quickForm" action="Admin_UpdateLocation" method="post" enctype="multipart/form-data">
                                        <div class="card-body">
                                            <input type="hidden" name="id" value="${location.locationId}" >

                                            <div class="form-group ">
                                                <label >Location Name :</label>
                                                <input type="text" name="name" value="${location.locationName}" class="form-control" id="" placeholder="Location Name" required="">
                                            </div>
                                            <div class="form-group ">
                                                <label >Address :</label>
                                                <input type="text" name="address" value="${location.address}" class="form-control" id="" placeholder="Address" required="">
                                            </div>
                                            <div class="form-group">
                                                <label >Introduce :</label>
                                                <textarea cols="100" rows="4"  class="form-control" name="introduce" required="">${location.introduce}</textarea>
                                            </div>

                                            <div class="form-group col-md-6">
                                                                                          
                                                <img id='output' width='200' src="images/img/${location.locationUrl}"/>	

                                                <input type='file' class="form-control"  accept='image/*' name='file' id='file'  onchange='loadFile(event)' >
                                                <script>
                                                    var loadFile = function (event) {
                                                        var image = document.getElementById('output');
                                                        image.src = URL.createObjectURL(event.target.files[0]);
                                                    };
                                                </script>
                                            </div>

                                            <div style="color: red;font-size: 18px"> ${error}</div>
                                        </div>
                                        <!-- /.card-body -->
                                        <div class="card-footer">
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
