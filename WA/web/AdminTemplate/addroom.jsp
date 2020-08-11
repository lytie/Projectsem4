<%-- 
    Document   : addroom
    Created on : Jul 13, 2020, 4:07:41 PM
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
        <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js'></script>
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
                                        </i> Back to Room List
                                    </a>
                                </h4>
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
                                <div class="card card-primary" style="margin: 2%">
                                    <div class="card-header">
                                        <h3 class="card-title">ADD NEW ROOM</small></h3>
                                    </div>
                                    <!-- /.card-header -->
                                    <!-- form start -->
                                    <form role="form" id="quickForm" action="Admin_AddRoom" method="post" enctype="multipart/form-data">

                                        <div class="card-body" >
                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    <label for="inputState">Location:</label>
                                                    <select  class="form-control" name="location">
                                                        <c:forEach items="${location}" var="loca">
                                                            <option value="${loca.locationId}">${loca.locationName}</option>
                                                        </c:forEach>

                                                    </select>
                                                </div>

                                                <div class="form-group col-md-6">
                                                    <label for="inputState">Room Type:</label>
                                                    <select  class="form-control" name="roomType">
                                                        <c:forEach items="${roomType}" var="type">
                                                            <option value="${type.roomTypeId}">${type.roomTypeName}</option>
                                                        </c:forEach>

                                                    </select>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-4">
                                                    <label >Price ($):</label>
                                                    <input type="number" min="0" name="price" class="form-control"  placeholder="Enter Price" required="">
                                                </div>

                                                <div class="form-group col-md-4">
                                                    <label >Adult Opacity:</label>
                                                    <select  class="form-control" name="adult">

                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                    </select>
                                                </div>

                                                <div class="form-group col-md-4">
                                                    <label >Children Opacity:</label>
                                                    <select  class="form-control" name="children">
                                                        <option value="0">0</option>
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div>
                                                <label for="inputState">Description:</label>
                                                <textarea cols="120" rows="4" name="description" class="form-control" required=""></textarea>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-4">
                                                    <label >Bed Option:</label>
                                                    <input type="text" name="bed" class="form-control" placeholder="Enter Bed Option">
                                                </div>

                                                <div class="form-group col-md-4">
                                                    <label >Size room:</label>
                                                    <input type="number" min="10"   name="size" class="form-control"  placeholder="Enter Size Room" required="">
                                                </div>

                                                <div class="form-group col-md-4">
                                                    <label >View:</label>
                                                    <input type="text" name="view" class="form-control"  placeholder="Enter View" required="">
                                                </div>
                                            </div>
                                            <div>
                                                <div>
                                                    <p id="plus" style="cursor: pointer;" class="btn btn-outline-primary">Add Image <i class='fas fa-plus' ></i></p> 
                                                </div>
                                                <script>
                                                    $(document).ready(function() {
                                                        var count = 0;
                                                        $("#plus").click(function() {
                                                            $("#proper").append("<div style='margin-left: 15px;padding:5px'>\n\
                                                 <p><input type='file'  accept='image/*' name='image" + count + "' id='file" + count + "'  onchange='loadFile" + count + "(event)' style='display:none;'></p>\n\
                                                 <p><label for='file" + count + "' style='cursor: pointer;color: #009900'>Upload Image</label></p>\n\
                                                 <p><img id='output" + count + "' width='200' />\n\
                                                    </p> \n\
                                                 <div id='detele' style='cursor: pointer;color:#CC0000 '>Remove Image</div>\n\
                                                     <script>\n\
                                                         var loadFile" + count + " = function(event) {\n\
                                                                     var image = document.getElementById('output" + count + "');\n\
                                                                     image.src = URL.createObjectURL(event.target.files[0]);\n\
                                                         };\n\
                                                     <\/script>\n\
                                            </div>");
                                                            count++;
                                                            document.getElementById("demo").value = count;
                                                        });
                                                        $('#proper').on('click', '#detele', function(e) {
                                                            e.preventDefault();
                                                            $(this).parent().remove();
                                                        });

                                                    });
                                                </script>
                                                <div class="" id="proper" style="width: 100%;display: grid;grid-gap: 50px;grid-template-columns: auto auto auto auto; ">


                                                </div>
                                                <input id="demo" name="demo" type="hidden" value="0"/>
                                            </div>
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
