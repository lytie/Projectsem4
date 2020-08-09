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
                                <h4>
                                    <a class="btn btn-info btn-sm" href="Admin_ListRoom">
                                        <i class=" fa fa-plus">
                                        </i> Back to list
                                    </a>   
                                </h4>
                            </div>
                        </div>
                    </div>
                    <!-- /.container-fluid -->
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <!-- left column -->
                            <div class="col-md-12">
                                <!-- jquery validation -->
                                <div class="card card-primary">
                                    <div class="card-header">
                                        <h3 class="card-title">Edit RoomType</small></h3>
                                    </div>
                                    <!-- /.card-header -->
                                    <!-- form start -->
                                    <form role="form" id="quickForm" action="Admin_UpdateRoomType" method="post" enctype="multipart/form-data">
                                        <div class="card-body">
                                            <input type="hidden" name="id" value="${roomtype.getRoomTypeId()}" >
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">RoomType Name :</label>
                                                <input type="text" name="name" value="${roomtype.getRoomTypeName()}" class="form-control" id="" placeholder="Location Name" required="">
                                            </div>

                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Decription :</label>
                                                <textarea type="textarea" name="description" class="form-control" id="textarea" placeholder="Information Decription" rows="5" required="">${roomtype.getDescription()}</textarea>
                                            </div>
                                            <div class="form-group col-md-6">

                                                <img id='output' width='200' src="images/img/${roomtype.getUrl()}"/>	

                                                <input type='file' class="form-control"  accept='image/*' name='file' id='file'  onchange='loadFile(event)' >
                                                <script>
                                                    var loadFile = function(event) {
                                                        var image = document.getElementById('output');
                                                        image.src = URL.createObjectURL(event.target.files[0]);
                                                    };
                                                </script>
                                            </div>

                                            <div style="color: red;font-size: 18px"> ${error}</div>

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