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
        <a href="Admin_Login?action=logout" class="btn btn-warning" style="color: white">Log out</a>
    </ul>
</nav>
<!-- /.navbar -->

<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="AdminIndexServlet" class="brand-link">
        <img src="images/admintemplate/logo.png" alt="AdminLTE Logo" class="brand-image img-square "
             style="opacity: .8">
        <span class="brand-text font-weight-light">Haven Deluxe</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="info col-12">
                <a href="AdminIndexServlet" class="d-block">HOME PAGE/<span style="color: #c59636">Trinh Thiem Bao</span></a>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class
       with font-awesome or any other icon font library -->
                <li class="nav-item has-treeview">
                    <a href="Admin_ImgHero" class="nav-link">
                        <i class="nav-icon fa fa-credit-card"></i>
                        <p>
                            Banner
                        </p>
                    </a>

                </li>
                <li class="nav-item has-treeview">
                    <a href="Admin_Employee" class="nav-link">
                        <i class="nav-icon fa fa-user"></i>
                        <p>
                            Employee

                        </p>
                    </a>

                </li>
                <li class="nav-item has-treeview">
                    <a href="Admin_Customer" class="nav-link">
                        <i class="nav-icon fa fa-map-signs"></i>
                        <p>
                            Customers
                        </p>
                    </a>

                </li>

                <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fa fa-bed"></i>
                        <p>
                            Room
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="Admin_Room" class="nav-link">
                                <i class="fa fa-sort-down nav-icon"></i>
                                <p>Room Booking</p>
                            </a>
                        </li>
                    </ul>

                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="Admin_RoomType" class="nav-link">
                                <i class="fa fa-sort-down nav-icon"></i>
                                <p>Room Type</p>
                            </a>
                        </li>
                    </ul>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="Admin_ListRoom" class="nav-link">
                                <i class="fa fa-sort-down nav-icon"></i>
                                <p>List Room</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item has-treeview">
                    <a href="Admin_Location" class="nav-link">
                        <i class="nav-icon fa fa-map-signs"></i>
                        <p>
                            Location
                        </p>
                    </a>

                </li>
                <li class="nav-item has-treeview">
                    <a href="Admin_Receipt" class="nav-link">
                        <i class="nav-icon fa fa-credit-card"></i>
                        <p>
                            Receipt
                        </p>
                    </a>

                </li>
                <li class="nav-item has-treeview">
                    <a href="Admin_Services" class="nav-link">
                        <i class="nav-icon fa fa-map-signs"></i>
                        <p>
                            Service
                        </p>
                    </a>

                </li>

                <li class="nav-item has-treeview">
                    <a href="Admin_Convenient" class="nav-link">
                        <i class="nav-icon fa fa-wifi"></i>
                        <p>
                            Convenient
                        </p>
                    </a>

                </li>
                <li class="nav-item has-treeview">
                    <a href="Admin_QrCode" class="nav-link">
                        <i class="nav-icon fa fa-qrcode"></i>
                        <p>
                            Qrcode
                        </p>
                    </a>

                </li>
                <li class="nav-item has-treeview">
                    <a href="Admin_Feedback" class="nav-link">
                        <i class="nav-icon far fa-envelope"></i>
                        <p>
                            FeedBack
                        </p>
                    </a>
                </li>


        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>