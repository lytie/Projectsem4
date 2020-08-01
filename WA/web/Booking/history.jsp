<%-- 
    Document   : history
    Created on : Jul 13, 2020, 4:54:07 PM
    Author     : longly
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


        <title>Haven</title>
        <meta name="description" content=""/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>

        <link rel="manifest" href="site.webmanifest"/>
        <link rel="shortcut icon" type="image/x-icon" href="<%=common.url%>/assets/img/favicon.ico"/>
        <!-- Place favicon.ico in the root directory -->

        <!-- CSS here -->
        <link rel="stylesheet" href="<%=common.url%>/assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="<%=common.url%>/assets/css/owl.carousel.min.css"/>
        <link rel="stylesheet" href="<%=common.url%>/assets/css/gijgo.css"/>
        <link rel="stylesheet" href="<%=common.url%>/assets/css/slicknav.css"/>
        <link rel="stylesheet" href="<%=common.url%>/assets/css/animate.min.css"/>
        <link rel="stylesheet" href="<%=common.url%>/assets/css/magnific-popup.css"/>
        <link rel="stylesheet" href="<%=common.url%>/assets/css/fontawesome-all.min.css"/>
        <link rel="stylesheet" href="<%=common.url%>/assets/css/themify-icons.css"/>
        <link rel="stylesheet" href="<%=common.url%>/assets/css/themify-icons.css"/>
        <link rel="stylesheet" href="<%=common.url%>/assets/css/slick.css"/>
        <link rel="stylesheet" href="<%=common.url%>/assets/css/nice-select.css"/>
        <link rel="stylesheet" href="<%=common.url%>/assets/css/style.css"/>
        <link rel="stylesheet" href="<%=common.url%>/assets/css/responsive.css"/>
        <link rel="stylesheet" href="<%=common.url%>/css/style.css" type="text/css"/>
    </head>
    <body>
        <!-- Preloader Start -->
        <%@include file="Preloader.html" %>

        <!-- Header Start -->
        <%@include file="header.jsp" %>

        <!-- body content-->
        <main>

            <!-- slider Area Start-->
            <div class="slider-area">
                <div class="single-slider hero-overly slider-height2 d-flex align-items-center" data-background="<%=common.urlImg%>/img/historypage.jpg" >
                    <div class="container">
                        <div class="row ">
                            <div class="col-md-11 offset-xl-1 offset-lg-1 offset-md-1">
                                <div class="hero-caption">
                                    <span>History</span>
                                    <h2>History</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- slider Area End-->
            <%
                if (session.getAttribute("user") != null) {

            %>
            <c:forEach items="${list}" var="l">
                <!-- History Start-->
                <div class="container-fluid mb-105">
                    <section class="profile-section spad">
                        <div class="container">
                            <div class="profile-agent-content">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="profile-agent-info">
                                            <div class="">
                                                <img src="images/img/${l.url}" alt="${l.url}">

                                            </div>
                                            <div class="pi-text">
                                                <h5>${l.roomTypeName}</h5>
                                                <span>${l.locationName}</span>
                                                <p>${l.checkInDate}</p>
                                                <p>${l.checkOutDate}</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="profile-agent-widget">
                                            <ul>
                                                <li>Service Name <span>Quantity <span>Price($)</span></span></li>

                                                

                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="profile-agent-newslatter">
                                            <ul>
                                                <li>SubTotal: <span>${l.subtotal}$</span></li>
                                                <li>Tax: <span>${l.tax}$</span></li>
                                                <li>Deposits: <span>${l.deposits}$</span></li>
                                                <li>Total: <span>${l.total}$</span></li>

                                            </ul>
                                            <c:if test="${l.getCheckOutDate().before(date)}">
                                                <div style="padding: 35%">
                                                    <i class='far fa-check-circle' style='font-size:60px;color:#00AA00'></i>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                                
                        </div>
                    </section>
                </div>
            </c:forEach>
            <!-- History End-->
            <%} else {
            %>



        </main>


        <div class="mt-90 mb-95" style="text-align: center">Login to view history </div>

        <% }%>

        <!-- Footer Start-->
        <%@include file="footer.html" %>

        <!-- JS here -->
        <script src="<%=common.url%>/vendor/jquery/jquery-3.2.1.min.js"></script>
        <script src="<%=common.url%>/vendor/bootstrap/js/popper.js"></script>
        <script src="<%=common.url%>/vendor/bootstrap/js/bootstrap.min.js"></script>
        <!-- All JS Custom Plugins Link Here here -->
        <script src="<%=common.url%>/assets/js/vendor/modernizr-3.5.0.min.js"></script>

        <!-- Jquery, Popper, Bootstrap -->
        <script src="<%=common.url%>/assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="<%=common.url%>/assets/js/popper.min.js"></script>
        <script src="<%=common.url%>/assets/js/bootstrap.min.js"></script>
        <!-- Jquery Mobile Menu -->
        <script src="<%=common.url%>/assets/js/jquery.slicknav.min.js"></script>

        <!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="<%=common.url%>/assets/js/owl.carousel.min.js"></script>
        <script src="<%=common.url%>/assets/js/slick.min.js"></script>
        <!-- Date Picker -->
        <script src="<%=common.url%>/assets/js/gijgo.min.js"></script>
        <!-- One Page, Animated-HeadLin -->
        <script src="<%=common.url%>/assets/js/wow.min.js"></script>
        <script src="<%=common.url%>/assets/js/animated.headline.js"></script>
        <script src="<%=common.url%>/assets/js/jquery.magnific-popup.js"></script>

        <!-- Scrollup, nice-select, sticky -->
        <script src="<%=common.url%>/assets/js/jquery.scrollUp.min.js"></script>
        <script src="<%=common.url%>/assets/js/jquery.nice-select.min.js"></script>
        <script src="<%=common.url%>/assets/js/jquery.sticky.js"></script>

        <!-- contact js -->
        <script src="<%=common.url%>/assets/js/contact.js"></script>
        <script src="<%=common.url%>/assets/js/jquery.form.js"></script>
        <script src="<%=common.url%>/assets/js/jquery.validate.min.js"></script>
        <script src="<%=common.url%>/assets/js/mail-script.js"></script>
        <script src="<%=common.url%>/assets/js/jquery.ajaxchimp.min.js"></script>

        <!-- Jquery Plugins, main Jquery -->    
        <script src="<%=common.url%>/assets/js/plugins.js"></script>
        <script src="<%=common.url%>/assets/js/main.js"></script>
    </body>
</html>
