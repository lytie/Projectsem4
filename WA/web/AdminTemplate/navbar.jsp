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
                <form class="form-inline ml-3">
                    <div class="input-group input-group-sm">
                        <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
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
                <a href="index.jsp" class="brand-link">
                    <img src="dist/img/logo.png" alt="AdminLTE Logo" class="brand-image img-square "
                         style="opacity: .8">
                    <span class="brand-text font-weight-light">Haven Deluxe</span>
                </a>

                <!-- Sidebar -->
                <div class="sidebar">
                    <!-- Sidebar user (optional) -->
                    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                        <div class="image">
                            <img src="./dist/img/user2-160x160.jpg" class="img-square elevation-2" alt="User Image">
                        </div>
                        <div class="info">
                            <a href="index.jsp" class="d-block">HOME PAGE</a>
                        </div>
                    </div>

                    <!-- Sidebar Menu -->
                    <nav class="mt-2">
                        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                            <!-- Add icons to the links using the .nav-icon class
                   with font-awesome or any other icon font library -->

                            <li class="nav-item has-treeview">
                                <a href="employee.jsp" class="nav-link">
                                    <i class="nav-icon fa fa-user"></i>
                                    <p>
                                        Employee

                                    </p>
                                </a>

                            </li>
                            <li class="nav-item has-treeview">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fas fa-book"></i>
                                    <p>
                                        Customers
                                        <i class="fas fa-angle-left right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">


                                    <li class="nav-item">
                                        <a href="customers.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Information</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="receipt.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Receipt</p>
                                        </a>
                                    </li>

                                </ul>
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
                                        <a href="room.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>List Room</p>
                                        </a>
                                    </li>
                                </ul>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="roomImage.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Room Image</p>
                                        </a>
                                    </li>
                                </ul>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="roomtype.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Room Type</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item has-treeview">
                                <a href="location.jsp" class="nav-link">
                                    <i class="nav-icon fa fa-map-signs"></i>
                                    <p>
                                        Location
                                    </p>
                                </a>

                            </li>
                            <li class="nav-item has-treeview">
                                <a href="convenient.jsp" class="nav-link">
                                    <i class="nav-icon fa fa-wifi"></i>
                                    <p>
                                        Convenient
                                    </p>
                                </a>

                            </li>
                            <li class="nav-item has-treeview">
                                <a href="service.jsp" class="nav-link">
                                    <i class="nav-icon fa fa-asterisk"></i>
                                    <p>
                                        Entertainment
                                    </p>
                                </a>

                            </li>
                            <li class="nav-item has-treeview">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon far fa-envelope"></i>
                                    <p>
                                        FeedBack
                                        <i class="fas fa-angle-left right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="mailbox.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Inbox</p>
                                        </a>
                                    </li>

                                    <li class="nav-item">
                                        <a href="read-mail.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Read</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item has-treeview">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon far fa-plus-square"></i>
                                    <p>
                                        Form Login
                                        <i class="fas fa-angle-left right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="../examples/login.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Login</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../examples/register.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Register</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../examples/forgot-password.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Forgot Password</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../examples/recover-password.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Recover Password</p>
                                        </a>
                                    </li>

                                </ul>
                            </li>

                    </nav>
                    <!-- /.sidebar-menu -->
                </div>
                <!-- /.sidebar -->
            </aside>