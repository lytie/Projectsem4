<%-- 
    Document   : navbar
    Created on : Jul 13, 2020, 4:47:23 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>

    </ul>
    <form class="form-inline ml-3" action="Admin_QrCodeInfo" method="get">
        <div class="input-group input-group-sm">
            <input class="form-control form-control-navbar" name="id" required oninvalid="this.setCustomValidity('Enter a qrcode id please')"
                   oninput="this.setCustomValidity('')" type="search" placeholder="Check qrcode id" aria-label="Search">
            <div class="input-group-append">
                <button class="btn btn-navbar" type="submit">
                    <i class="fas fa-search"></i>
                </button>
            </div>
        </div>
    </form>
    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
        <!-- Messages Dropdown Menu -->

        <!-- Notifications Dropdown Menu -->
        <li class="nav-item dropdown">
            <a class="nav-link" data-toggle="dropdown" href="#">
                <i class="far fa-bell"></i>
                <span class="badge badge-warning navbar-badge">15</span>
            </a>
            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                <span class="dropdown-item dropdown-header">15 Notifications</span>
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item">
                    <i class="fas fa-envelope mr-2"></i> 4 new messages
                    <span class="float-right text-muted text-sm">3 mins</span>
                </a>
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item">
                    <i class="fas fa-users mr-2"></i> 8 friend requests
                    <span class="float-right text-muted text-sm">12 hours</span>
                </a>
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item">
                    <i class="fas fa-file mr-2"></i> 3 new reports
                    <span class="float-right text-muted text-sm">2 days</span>
                </a>
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
            </div>
        </li>

    </ul>
</nav>
<!-- /.navbar -->

<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="EmployeeIndexServlet" class="brand-link">
        <img src="images/admintemplate/logo.png" alt="AdminLTE Logo" class="brand-image img-square "
             style="opacity: .8">
        <span class="brand-text font-weight-light">Haven Deluxe</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="info col-12">
                <a href="EmployeeIndexServlet" class="d-block">Reception/<span style="color: #c59636">Trinh Thiem Bao</span></a>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class
       with font-awesome or any other icon font library -->

                <li class="nav-item has-treeview">
                    <a href="Employee_Information?id=1" class="nav-link">
                        <i class="nav-icon fa fa-user"></i>
                        <p>
                            Your Information

                        </p>
                    </a>

                </li>
                <li class="nav-item has-treeview">
                    <a href="Employee_Room" class="nav-link">
                        <i class="nav-icon fa fa-user"></i>
                        <p>
                            List Room   

                        </p>
                    </a>

                </li>
                <li class="nav-item has-treeview">
                    <a href="Admin_Receipt" class="nav-link">
                        <i class="nav-icon fa fa-credit-card"></i>
                        <p>
                            Order for customers
                        </p>
                    </a>
                </li>
                <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="nav-icon far fa-envelope"></i>
                        <p>
                            Check-in & Check-out
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="Employee_Checkin" class="nav-link">
                                <i class="fa fa-sort-down nav-icon"></i>
                                <p>Check-in</p>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a href="read-mail.jsp" class="nav-link">
                                <i class="fa fa-sort-down nav-icon"></i>
                                <p>Check-out</p>
                            </a>
                        </li>
                    </ul>
                </li>


        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>