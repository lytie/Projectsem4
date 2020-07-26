<%-- 
    Document   : room
    Created on : Jul 13, 2020, 4:12:44 PM
    Author     : ADMIN
--%>
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
        <!-- Font Awesome -->
        <%@include file="css.jsp" %>
        <style>
            .grid-container {
                display: grid;
                grid-template-columns: auto auto auto auto;
                grid-gap: 20px;


            }



            .Price {
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

                                        <c:forEach items="${booking_bookMB.listLocation()}" var="l">
                                            <option value="${l.locationId}" <c:if test="${locationOne.locationId==l.locationId}">selected</c:if>>${l.locationName}</option>
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
                                                            <div class="Price">
                                                                Price:<input value="${l.Price}" type="text" name="price" />
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
                                                                <p>
                                                                    ${l.Price}
                                                                </p>
                                                            </div>
                                                            <div>Bed Option:${l.Price}</div>
                                                            <div>Size: ${l.Price}<sup>2</sup></div>
                                                            <div>View: ${l.Price}</div>
                                                            <div>Capacity: ${l.Price}</div>
                                                        </div>
                                                        <div class="d-flex">
                                                            
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

