<%-- 
    Document   : addroomImage
    Created on : Jul 13, 2020, 4:08:14 PM
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
                                    <h3 class="card-title">ADD NEW ROOM IMAGE</small></h3>
                                </div>
                                <!-- /.card-header -->
                                <!-- form start -->
                                <form role="form" id="quickForm" action="Admin_AddRoomImage" method="post" enctype="multipart/form-data">
                                    <div class="card-body">
                                        
                                        <div class="form-group col-md-6">
                                                <label for="inputState">Room ID</label>
                                                <select id="inputState" class="form-control">
                                                    <option selected>--Select Option--</option>
                                                    <option>...</option>
                                                    <option>...</option>
                                                    <option>...</option>
                                                </select>
                                            </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">Img Path :</label>
                                            <input type="file" name="fileupload" class="form-control" id="fileupload" placeholder="Choose File Pls" >
                                        </div>

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