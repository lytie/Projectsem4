<%-- 
    Document   : index
    Created on : Jul 13, 2020, 4:10:36 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.*"%>
<%@page import="java.util.List"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>AdminLTE 3 | Admin Page</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Font Awesome -->
        <%@include file="css.jsp" %>
    </head>
    <body class="hold-transition sidebar-mini layout-fixed">
        <div class="wrapper">

            <%@include file="navbar.jsp" %>

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
                        <!-- /.row -->
                        <div class="row">
                            <div class="card col-12" style="position: relative; left: 0px; top: 0px;">
                                <div class="card-header ui-sortable-handle" style="cursor: move;">
                                    <h3 class="card-title">
                                        <i class="fas fa-chart-pie mr-1"></i>
                                        Sales
                                    </h3>
                                    <div class="card-tools">
                                        <ul class="nav nav-pills ml-auto">
                                            <li class="nav-item">
                                                <a class="nav-link active" href="#revenue-chart" data-toggle="tab">Today revenue</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#sales-chart" data-toggle="tab">Total revenue</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div><!-- /.card-header -->
                                <div class="card-body">
                                    <div class="tab-content p-0">
                                        <!-- Morris chart - Sales -->
                                        <div class="chart tab-pane active" id="revenue-chart" style="position: relative;">                                                 
                                            <div class="row">
                                                <div class="col-md-6 text-uppercase">From Booking Deposits:</div>
                                                <div class="col-md-6 text-right">$${todayBookingDepositsRevenue}</div>
                                            </div>   
                                            <div class="row">
                                                <div class="col-md-6 text-uppercase">From Paid Services:</div>
                                                <div class="col-md-6 text-right">$${todayServiceRevenue}</div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6 text-uppercase">Total:</div>
                                                <div class="col-md-6 text-right">$${todayRevenue}</div>
                                            </div> 
                                            <div class="row " style="border-top:1px solid;padding-top: 10px" >
                                                <div class="col-md-6 text-uppercase">Yesterday revenue:</div>
                                                <div class="col-md-6 text-right">
                                                    <c:if test="${growthvalue<0}">
                                                        <span style="color: red;padding-right: 10px">${growthvalue}%<i class="fa fa-arrow-down" aria-hidden="true"></i></span>$${yesterdayRevenue}
                                                    </c:if>
                                                    <c:if test="${growthvalue>=0}">
                                                        <span style="color: green;padding-right: 10px">${growthvalue}%<i class="fa fa-arrow-up" aria-hidden="true"></i></span>$${yesterdayRevenue}
                                                    </c:if>    
                                                </div>
                                            </div> 
                                        </div>
                                        <div class="chart tab-pane" id="sales-chart" style="position: relative;">                    
                                            <div class="row">
                                                <div class="col-md-6 text-uppercase">From Booking Deposits:</div>
                                                <div class="col-md-6 text-right">$${allBookingDepositsRevenue}</div>
                                            </div>   
                                            <div class="row">
                                                <div class="col-md-6 text-uppercase">From Paid Services:</div>
                                                <div class="col-md-6 text-right">$${allServiceRevenue}</div>
                                            </div>
                                            <div class="row " style="border-top:1px solid;padding-top: 10px" >
                                                <div class="col-md-6 text-uppercase">Real Revenue:</div>
                                                <div class="col-md-6  text-right">$${allRealRevenue}</div>
                                            </div> 
                                            <div class="row " style="border-top:1px solid;padding-top: 10px" >
                                                <div class="col-md-6 text-uppercase">Unpaid Revenue:</div>
                                                <div class="col-md-6  text-right">$${unpaidRevenue}</div>
                                            </div> 
                                            <div class="row " style="border-top:1px solid;padding-top: 10px" >
                                                <div class="col-md-6 text-uppercase">Total Estimated Revenue:</div>
                                                <div class="col-md-6  text-right">$${estimatedRevenue}</div>
                                            </div> 
                                        </div>  
                                    </div>
                                </div>
                            </div>
                            <!-- /.card -->
                        </div>
                        <!-- Small boxes (Stat box) -->
                        <div class="row">
                            <div class="col-lg-4 col-6">
                                <!-- small box -->
                                <div class="small-box bg-info">
                                    <div class="inner">
                                        <h3>${listNewFoodandDrinksOrders.size()}</h3>

                                        <p>New Food and Drinks Orders</p>
                                    </div>
                                    <div class="icon">
                                        <i class="ion ion-bag"></i>
                                    </div>
                                    <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                            <!-- ./col -->
                            <div class="col-lg-4 col-6">
                                <!-- small box -->
                                <div class="small-box bg-success">
                                    <div class="inner">
                                        <h3>${listNewRoomBooked.size()}<sup style="font-size: 20px"></sup></h3>

                                        <p>New Room Booked</p>
                                    </div>
                                    <div class="icon">
                                        <i class="ion ion-ios-bookmarks"></i>
                                    </div>
                                    <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                            <!-- ./col -->
                            <div class="col-lg-4 col-6">

                                <!-- small box -->
                                <div class="small-box bg-warning">
                                    <div class="inner">
                                        <h3>${listNewAccountcustomers.size()}</h3>

                                        <p>User Registrations</p>
                                    </div>
                                    <div class="icon">
                                        <i class="ion ion-person-add"></i>
                                    </div>
                                    <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                            <!-- ./col -->
                            <div class="col-lg-4 col-6">
                                <!-- small box -->
                                <div class="small-box bg-gradient-danger">
                                    <div class="inner">
                                        <h3>${listNewFeedbacks.size()}</h3>

                                        <p>New feedbacks</p>
                                    </div>
                                    <div class="icon">
                                        <i class="ion ion-android-mail"></i>
                                    </div>
                                    <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                            <!-- ./col -->
                            <div class="col-lg-4 col-6">
                                <!-- small box -->
                                <div class="small-box bg-gradient-teal">
                                    <div class="inner">
                                        <h3>${listNewTickets.size()}</h3>

                                        <p>Ticket sold</p>
                                    </div>
                                    <div class="icon">
                                        <i class="ion ion-cash"></i>
                                    </div>
                                    <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                            <!-- ./col -->
                            <div class="col-lg-4 col-6">
                                <!-- small box -->
                                <div class="small-box bg-gradient-fuchsia">
                                    <div class="inner">
                                        <h3>15</h3>

                                        <p>Working Employee</p>
                                    </div>
                                    <div class="icon">
                                        <i class="ion ion-ios-people"></i>
                                    </div>
                                    <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                            <!-- ./col -->
                        </div>

                        <!-- Main row -->
                        <div class="row">
                            <div class="chart col-12">
                                <!-- Sales Chart Canvas -->
                                <canvas id="myChart"  ></canvas>   
                            </div>
                        </div>
                        <!-- /.row (main row) -->
                    </div><!-- /.container-fluid -->
                </section>
                <!-- right col -->
            </div>
            <!-- /.row (main row) -->
        </div><!-- /.container-fluid -->
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
<script type="text/javascript">
    var ctx = document.getElementById('myChart').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['Today total revenue', 'Service revenue', 'Room Booking Deposits revenue'],
            datasets: [{
                    
                    label: 'Today total revenue ${todayRevenue}$',
                    data: [${todayRevenue}, ${todayServiceRevenue},${todayBookingDepositsRevenue}],
                    backgroundColor: [
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 99, 132, 0.2)',                     
                        'rgba(255, 206, 86, 0.2)',
                    ],
                    borderColor: [
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 99, 132, 1)',
                        'rgba(255, 206, 86, 1)',
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

