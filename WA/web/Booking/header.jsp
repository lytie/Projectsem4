<%-- 
    Document   : header
    Created on : Jul 19, 2020, 10:59:24 PM
    Author     : longly
--%>

<%@page import="bean.common"%>
<%@page import="entities.Accountcustomer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    </head>
    <body>
        <header>
            <!-- Header Start -->
            <div class="header-area header-sticky">
                <div class="main-header ">
                    <div class="container">
                        <div class="row align-items-center">
                            <!-- logo -->
                            <div class="col-xl-2 col-lg-2">
                                <div class="logo">
                                    <a href="index.jsp"><img src="http://localhost:8080/WA/images/img/newlogo1.png" alt=""></a>
                                </div>
                            </div>
                            <div class="col-xl-8 col-lg-8">
                                <!-- main-menu -->
                                <div class="main-menu f-right d-none d-lg-block">
                                    <nav>
                                        <ul id="navigation">
                                            <li><a href="http://localhost:8080/WA/Haven">Home</a></li>
                                            <li><a href="http://localhost:8080/WA/Booking">Booking</a></li>
                                            <li><a href="http://localhost:8080/WA/Booking/history.jsp">History</a></li>
                                            <!--                                        <li><a href="blog.html">History</a>
                                                                                        
                                                                                    </li>
                                                                                    
                                                                                    <li><a href="contact.html">Contact</a></li>-->
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <div class="col-xl-2 col-lg-2">
                                <!-- header-btn -->
                                <div class="header-btn">
                                    <%
                                        if (session.getAttribute("user") == null) {


                                    %>
                                    <a href="http://localhost:8080/WA/Login" class="btn btn1 d-none d-lg-block ">Login</a>
                                    <% } else {

                                        Accountcustomer accountcustomer = (Accountcustomer) session.getAttribute("user");

                                    %>
                                    <a href="" type="button" data-toggle="dropdown" class="btn btn1 d-none d-lg-block "><%=accountcustomer.getFullName()%></a>
                                    <div class="dropdown-menu" >
                                        <a class="dropdown-item" href="Profile">Profile</a>
                                        <a class="dropdown-item" href="Booking_Logout">Log out</a>
                                    </div>
                                    <% }%>
                                </div>
                            </div>
                            <!-- Mobile Menu -->
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Header End -->
        </header>
    </body>
</html>
