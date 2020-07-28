<%-- 
    Document   : room
    Created on : Jul 13, 2020, 4:12:44 PM
    Author     : ADMIN
--%>
<%@page import="bean.common"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.Room"%>
<%@page import="java.util.List"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>AdminLTE 3 | Room</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="AdminTemplate/plugins/select2/css/select2.min.css">
        <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js'></script>

        <!-- Font Awesome -->
        <%@include file="css.jsp" %>
        <style>
            .grid-container {
                display: grid;
                grid-template-columns: auto auto auto auto;
                grid-gap: 20px;


            }



            .price {
                grid-row-start: 1;
                grid-row-end: 3;
            }
            .Description {
                grid-column-start: 2;
                grid-column-end: 5;
            }
        </style>
    </head>
    <body class="hold-transition sidebar-mini">
        <div class="wrapper">

            <%@include file="navbar.jsp" %>
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->

                <section class="content-header">
                    <div class="container-fluid">


                        <h1 style="margin-bottom: 10px">List Room</h1>

                        <div class="d-flex" >
                            <h4 style="width: 12%"> <a class="btn btn-info btn-sm" href="Admin_AddRoom">
                                    <i class="fa fa-plus"></i> Add Room </a></h4>

                            <form style="width: 30%" action="Admin_Room" method="post">         
                                <div class="form-group" >
                                    <label>Location</label>
                                    <select class="select" data-placeholder="Select a State" name="location" style="width: 60%">

                                        <c:forEach items="${booking_bookMB.listLocation()}" var="lo">
                                            <option value="${lo.locationId}" <c:if test="${locationOne.locationId==lo.locationId}">selected</c:if>>${lo.locationName}</option>
                                        </c:forEach>
                                    </select>

                                    <input type="submit" value="filter"/>
                                </div>
                            </form>
                            <div>
                                Address :${locationOne.address}
                            </div>
                        </div>

                    </div><!-- /.container-fluid -->
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="container-fluid">
                        <!-- Small boxes (Stat box) -->
                        <div class="row">

                            <c:forEach items="${listroom}" var="l">
                                <!-- ./col -->
                                <div class="col-lg-3 col-6">
                                    <!-- small box -->
                                    <div class="small-box <c:if test="${l.status==true}"> bg-success</c:if> <c:if test="${l.status==false}">bg-danger"</c:if>>
                                            <div class="inner">
                                                    <h3>${l.roomId}</h3>

                                            <p>${l.roomTypeId.roomTypeName}</p>
                                        </div>
                                        <div class="icon">
                                            <i class="fas fa-hotel"></i>
                                        </div>
                                        <a  data-toggle="modal" data-target="#R${l.roomId}"  class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                                    </div>
                                    <!--                                    modal start-->
                                    <div class="modal" id="R${l.roomId}">
                                        <div class="modal-dialog modal-dialog-scollable modal-xl " >
                                            <div class="modal-content">

                                                <!-- Modal Header -->
                                                <div class="modal-header">
                                                    <h4 class="modal-title">${l.roomTypeId.roomTypeName} -${l.locationId.locationName} ${l.roomId}</h4>
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                </div>

                                                <!-- Modal body -->
                                                <div class="modal-body">

                                                    <form action="" method="post">
                                                        <div class="grid-container">
                                                            <div class="Price" style="font-size: 25px;">
                                                                Price:
                                                                <div><input value="${l.price}" type="text" name="price" /></div>
                                                            </div>
                                                            <div class="Type">
                                                                Type:${l.roomTypeId.roomTypeName}
                                                            </div>
                                                            <div class="Location">
                                                                Location: ${l.locationId.locationName}
                                                            </div>  
                                                            <div class="status">
                                                                Status:  <select class="select" name="status" >
                                                                    <option value="true" <c:if test="${l.status==true}">selected</c:if> >active</option>
                                                                    <option value="false" <c:if test="${l.status==false}">selected</c:if> >inactive</option>
                                                                    </select>
                                                                </div>
                                                                <div class="Description">
                                                                    <textarea cols="100" rows="5">${l.description}</textarea>

                                                            </div>
                                                            <div>Bed Option:${l.bedOption}</div>
                                                            <div>Size: ${l.size}<sup>2</sup></div>
                                                            <div>View: ${l.view}</div>
                                                            <div>Capacity: 
                                                                <span><c:if test="${l.capacity%2!=0}">${(l.capacity-1)/2}</c:if><c:if test="${l.capacity%2==0}">${(l.capacity)/2}</c:if> Adults</span>
                                                                <span>${l.capacity%2} Children</span>
                                                            </div>
                                                        </div>
                                                        <div style="margin-top: 20px;">
                                                            <div class="d-flex justify-content-around">
                                                                <c:forEach items="${booking_bookMB.listRoomImg(l.roomId)}" var="img">
                                                                    <div style="width: 15%;">
                                                                        <img src="<%=common.urlImg%>/images/${img.url}" alt="Img Room" style="width: 100%;"/>
                                                                        <p>Remove <input type="checkbox" value="${img.roomImageId}" name="ImgR${img.roomImageId}"/></p>

                                                                    </div>

                                                                </c:forEach>


                                                            </div>
                                                        </div>
                                                        <div style="margin-top: 20px; ">
                                                            <div>
                                                                <p id="plus${l.roomId}" style="cursor: pointer;">Add Image <i class='fas fa-plus' ></i></p> 
                                                            </div>
                                                            <script>
                                                                $(document).ready(function () {
                                                                var count = 0;
                                                                $("#plus${l.roomId}").click(function () {
                                                                $("#proper${l.roomId}").append("<div style='margin-left: 15px;padding:5px'>\n\
                                                             <p><input type='file'  accept='image/*' name='image" + count + "' id='file" + count + "'  onchange='loadFile" + count + "(event)' style='display:none;'></p>\n\
                                                             <p><label for='file" + count + "' style='cursor: pointer;color: #009900'>Upload Image</label></p>\n\
                                                             <p><img id='output" + count + "' width='200' />\n\
                                                                </p> <input type='text'  value='" + count + "'/>\n\
                                                             <div id='detele' style='cursor: pointer;color:#CC0000 '>Remove Image</div>\n\
                                                                 <script>\n\
                                                                     var loadFile" + count + " = function(event) {\n\
                                                                                 var image = document.getElementById('output" + count + "');\n\
                                                                                 image.src = URL.createObjectURL(event.target.files[0]);\n\
                                                                     };\n\
                                                                 <\/script>\n\
                                                        </div>");
                                                                    count++;
                                                                });
                                                                
                                                                $('#proper${l.roomId}').on('click', '#detele', function (e) {
                                                                e.preventDefault();
                                                                $(this).parent().remove();
                                                                });
                                                                document.getElementById("demo").value=count;
                                                                });
                                                            </script>
                                                                <div class="" id="proper${l.roomId}" style="width: 100%;display: grid;grid-gap: 50px;grid-template-columns: auto auto auto auto; ">



                                                            </div>
                                                            
                                                        </div> 
                                                                <input type="hidden" id="demo" name="countImg"/>
                                                                <div style="padding: 10px 45%">
                                                                    <input type="submit" value="Save" class="btn btn-outline-primary"/>
                                                                </div>
                                                    </form>

                                                </div>

                                                <!-- Modal footer -->
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <!--                                modal end-->
                                </div>

                            </c:forEach>

                            <div class="card-body pt-0">
                                <!--The calendar -->
                                <div id="calendar" style="width: 100%"></div>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->
            <footer class="main-footer">
                <div class="float-right d-none d-sm-block">
                    <b>Version</b> 3.0.5
                </div>
                <strong>Copyright &copy; 2014-2019 <a href="http://adminlte.io">AdminLTE.io</a>.</strong> All rights
                reserved.
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
    <script src="AdminTemplate/plugins/select2/js/select2.full.min.js"></script>
    <script>
                                                                   $(function () {
                                                                   //Initialize Select2 Elements
                                                                   $('.select').select2()



                                                                   });
    </script>
</html>

