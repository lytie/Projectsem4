<%-- 
    Document   : navbar
    Created on : Jul 13, 2020, 4:47:23 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
   
    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
        <c:if test="${sessionScope.accountemployee.getRoleId().getRoleId() == 1}">
            <a href="AdminIndexServlet" class="btn btn-info" style="color: white;margin-right: 10px">To admin page</a>
        </c:if>
        
        <a href="Admin_Login?action=logout" class="btn btn-warning" style="color: white">Log out</a>
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
                <a href="EmployeeIndexServlet" class="d-block">${sessionScope.accountemployee.getRoleId().getRoleName()}/<span style="color: #c59636">${sessionScope.accountemployee.getFullName()}</span></a>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class
       with font-awesome or any other icon font library -->

                <li class="nav-item has-treeview">
                    <a href="Employee_Information?id=${sessionScope.accountemployee.getAccountId()}" class="nav-link">
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
                            <a href="Employee_Checkout" class="nav-link">
                                <i class="fa fa-sort-down nav-icon"></i>
                                <p>Check-out</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item has-treeview">
                    <a href="Employee_CheckTickets" class="nav-link">
                        <i class="nav-icon fa fa-user"></i>
                        <p>
                            Check tickets 
                        </p>
                    </a>
                </li>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>