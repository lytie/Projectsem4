<%-- 
    Document   : addfood
    Created on : Jul 13, 2020, 4:06:19 PM
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
                                        <h3 class="card-title">Add new Service</h3>
                                    </div>
                                    <!-- /.card-header -->
                                    <!-- form start -->
                                    <form role="form" id="quickForm"action="Admin_AddService" method="post" enctype="multipart/form-data" >
                                        <div class="card-body">
                                            <div class="form-group col-md-6">
                                                <label for="inputState">Service Type</label>
                                                <select id="inputState" class="form-control" name="serviceType">
                                                    <c:forEach items="${serviceType}" var="se">

                                                        <option value="${se.serviceTypeId}">${se.typeName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">Service Name :</label>
                                                <input type="text" name="name" class="form-control" id="exampleInputFullName" placeholder="Service Name" required="">
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">Price :</label>
                                                <input type="number" name="price" min="0" class="form-control" id="exampleInputFullName" placeholder="Price" required="">
                                            </div>

                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Decription :</label>
                                                <textarea type="textarea" name="decription" class="form-control" id="textarea" placeholder="Decription" rows="5" required=""></textarea> 
                                            </div>

                                            <div class="custom-file">
                                                <input type="file" class="custom-file-input" id="customFile" required accept='image/*' onchange='loadFile(event)' name='file'>
                                                <label class="custom-file-label" for="customFile">Choose file Image</label>

                                            </div>
                                            <div>
                                                <img id='output' width='200' />	
                                            </div>
                                            <script>
                                                var loadFile = function(event) {
                                                    var image = document.getElementById('output');
                                                    image.src = URL.createObjectURL(event.target.files[0]);
                                                };
                                            </script>

                                        </div>
                                        <div>${error}</div>
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
