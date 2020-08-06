<%-- 
    Document   : index2
    Created on : Jul 13, 2020, 4:10:52 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


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
                                <h1 class="m-0 text-dark">Overall View</h1>
                            </div>
                        </div><!-- /.row -->
                    </div><!-- /.container-fluid -->
                </div>
                <!-- /.content-header -->

                <!-- Main content -->
                <section class="content">
                    <div class="container-fluid">
                        <div class="card"style="font-family: 'Indie Flower', cursive;">
                            <div class="card-header ui-sortable-handle" style="cursor: move;">
                                <h3 class="card-title">
                                    <i class="ion ion-clipboard mr-1"></i>
                                    Things to note today
                                </h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                    <button type="button" class="btn btn-tool" data-card-widget="remove">
                                        <i class="fas fa-times"></i>
                                    </button>     
                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <ul class="todo-list ui-sortable" data-widget="todo-list">
                                    <li class="">
                                        <!-- drag handle -->
                                        <span class="handle ui-sortable-handle">
                                            <i class="fas fa-bookmark"></i>
                                            <i class="fas fa-ellipsis-v"></i>
                                        </span>
                                        <!-- checkbox -->
                                        <div class="icheck-primary d-inline ml-2">
                                            <input type="checkbox" value="" name="todo1" id="todoCheck1">
                                            <label for="todoCheck1"></label>
                                        </div>
                                        <!-- todo text -->
                                        <span class="text">${listCheckInSchedule.size()} Check-in schedule </span>
                                        <!-- Emphasis label -->

                                        <!-- General tools such as edit or delete-->
                                        <div class="tools">
                                            <a href="AdminIndexServlet" style="color: red"><i class="fas fa-edit"></i></a>
                                            <i class="fas fa-trash-o"></i>
                                        </div>
                                    </li>
                                    <li class="">
                                        <span class="handle ui-sortable-handle">
                                            <i class="fas fa-bookmark"></i>
                                            <i class="fas fa-ellipsis-v"></i>
                                        </span>
                                        <div class="icheck-primary d-inline ml-2">
                                            <input type="checkbox" value="" name="todo2" id="todoCheck2" >
                                            <label for="todoCheck2"></label>
                                        </div>
                                        <span class="text">${newcustomer} new customers</span>
                                        <div class="tools">
                                            <a href="AdminIndexServlet" style="color: red"><i class="fas fa-edit"></i></a>
                                            <i class="fas fa-trash-o"></i>
                                        </div>
                                    </li>
                                    <li>
                                        <span class="handle ui-sortable-handle">
                                            <i class="fas fa-bookmark"></i>
                                            <i class="fas fa-ellipsis-v"></i>
                                        </span>
                                        <div class="icheck-primary d-inline ml-2">
                                            <input type="checkbox" value="" name="todo3" id="todoCheck3">
                                            <label for="todoCheck3"></label>
                                        </div>
                                        <span class="text">${listCheckOutSchedule.size()} Check-out schedule</span>
                                        <div class="tools">
                                            <a href="AdminIndexServlet" style="color: red"><i class="fas fa-edit"></i></a>
                                            <i class="fas fa-trash-o"></i>
                                        </div>
                                    </li>
                                    <li>
                                        <span class="handle ui-sortable-handle">
                                            <i class="fas fa-bookmark"></i>
                                            <i class="fas fa-ellipsis-v"></i>
                                        </span>
                                        <div class="icheck-primary d-inline ml-2">
                                            <input type="checkbox" value="" name="todo4" id="todoCheck4">
                                            <label for="todoCheck4"></label>
                                        </div>
                                        <span class="text">${employeeBirthDay.getFullName()} Birthday</span>
                                        <small class="badge badge-success"><i class="far fa-clock"></i> 
                                            <c:choose>
                                                <c:when test="${untilbirthday >=365}">
                                                    Today
                                                </c:when>
                                                <c:when test="${untilbirthday ==1}">
                                                    Tomorrow
                                                </c:when>
                                                <c:otherwise>
                                                    ${untilbirthday} days
                                                </c:otherwise>
                                            </c:choose>
                                        </small>
                                        <div class="tools">
                                            <a href="AdminIndexServlet" style="color: red"><i class="fas fa-edit"></i></a>
                                            <i class="fas fa-trash-o"></i>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <!-- /.card-body -->
                            <div class="card-footer clearfix">
                            </div>

                        </div>

                    </div><!--/. container-fluid -->
                </section>
                <div class="row">
                    <div class="chart col-12" >
                        <div class="text-center text-uppercase text-info" style="font-size: 40px;font-family: 'Indie Flower', cursive; ">This week new Customer</div>
                        <!-- Sales Chart Canvas -->
                        <canvas id="myChart"></canvas> 
                    </div>
                </div>

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
        <script>
            var ctx = document.getElementById('myChart').getContext('2d');
            var myChart = new Chart(ctx, {
                type: 'horizontalBar',
                data: {
                    labels: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
                    datasets: [{
                            label: 'Monday',
                            data: [${monday}, ${tuesday}, ${wednesday}, ${thursday}, ${friday}, ${saturday},${sunday}],
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)',
                                'rgba(255, 179, 64, 0.2)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)',
                                'rgba(255, 179, 64, 1)'
                            ],
                            borderWidth: 1
                        }]
                },
                options: {
                    scales: {
                        yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                    }
                }
            });
        </script>
    </body>
</html>
