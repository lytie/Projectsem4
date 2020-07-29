<%-- 
    Document   : confirm_infomation
    Created on : Jul 13, 2020, 4:58:43 PM
    Author     : longly
--%>

<%@page import="bean.common"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hotel</title>
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


        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>


        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="<%=common.url%>/plugins/OwlCarousel2-2.3.4/owl.carousel.css"/>
        <link rel="stylesheet" type="text/css" href="<%=common.url%>/plugins/OwlCarousel2-2.3.4/owl.theme.default.css"/>
        <link rel="stylesheet" type="text/css" href="<%=common.url%>/plugins/OwlCarousel2-2.3.4/animate.css"/>
        <link rel="stylesheet" type="text/css" href="<%=common.url%>/styles/main_styles.css"/>
        <link rel="stylesheet" href="<%=common.url%>/assets/css/responsive.css"/>
        <link rel="stylesheet" href="<%=common.url%>/assets/css/style.css"/>
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
                <div class="single-slider hero-overly slider-height2 d-flex align-items-center" data-background="<%=common.urlImg%>/img/confirmpage.jpg" >
                    <div class="container">
                        <div class="row ">
                            <div class="col-md-11 offset-xl-1 offset-lg-1 offset-md-1">
                                <div class="hero-caption">

                                    <h2>CONFIRM</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- slider Area End-->

            <div class="mb-65">
                <a class="ml-35" href=""></a>
                <div class="hero-caption">
                    <%
                        String start = (String) session.getAttribute("inDate");
                        String end = (String) session.getAttribute("outDate");
                        int selectLocation = Integer.valueOf(String.valueOf(session.getAttribute("location")));
                        int selectAdult = Integer.valueOf(String.valueOf(session.getAttribute("adult")));
                        int selectChildren = Integer.valueOf(String.valueOf(session.getAttribute("children")));
                    %>
                    <span>
                        <form action="http://localhost:8080/WA/Booking_bookServlet" method="post">
                            <input type="hidden" name="start" value="<%=start%>"/>
                            <input type="hidden" name="end" value="<%=end%>"/>
                            <input type="hidden" name="selectLocation" value="<%=selectLocation%>"/>
                            <input type="hidden" name="selectAdult" value="<%=selectAdult%>"/>
                            <input type="hidden" name="selectChildren" value="<%=selectChildren%>"/>
                            <button class="btn btn-warning"  type="submit" style="color: Black">Back to Booking</button>
                        </form>
                    </span>

                </div>
            </div>


            <section class="make-customer-area fix">
                <div class="container-fluid p-0">
                    <div class="row">
                        <div class="col-xl-3 col-lg-4">
                            <div class="blog_right_sidebar">
                                <aside class="single_sidebar_widget post_category_widget">
                                    <h4 class="widget_title">YOUR RESERVATION</h4>
                                    <ul class="list cat-list">
                                        <li>
                                            <a href="" class="">
                                                <p>${booking_bookMB.location(id).locationName}</p>
                                                <p>${booking_bookMB.location(id).address}</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="" class="d-flex">
                                                <p>CheckIn Date: ${inDate} </p>
                                                <p>CheckOut Date: ${outDate}</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="" class="">
                                                <p>${adult} Adults  </p>

                                                <p>${children} Children</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="" class="d-flex">
                                                <p>${booking_bookMB.room(id).roomTypeId.roomTypeName} - ${booking_bookMB.room(id).locationId.locationName} ${id}</p>
                                                <p></p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="" class="">
                                                <p>Price: </p>
                                                <p>${booking_bookMB.room(id).price}$</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="" class="">
                                                <p>Deposit (10%)</p>
                                                <h3>${(booking_bookMB.room(id).price)/10}$</h3>
                                                <p></p>
                                            </a>
                                        </li>
                                    </ul>
                                </aside>
                            </div>
                        </div>
                        <div class=" col-xl-8 col-lg-7">
                            <div >
                                <h2 class="contact-title">CONFIRM YOUR STAY</h2>
                            </div>
                            <div class="">
                                <form class="form-contact contact_form"  id="contactForm" action="Booking_ConfirmInfo" method="post">

                                    <div class="">
                                        <div class="form-group">
                                            <input class="form-control valid" name="name" id="name" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your name'" placeholder="Enter your name" required=""/>
                                        </div>
                                    </div>
                                    <div class="">
                                        <div class="form-group">
                                            <input class="form-control valid" name="email" id="email" type="email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email address'" placeholder="Email"required=""/>
                                        </div>
                                    </div>
                                    <div class="">
                                        <div class="form-group">
                                            <input class="form-control" name="phone" id="phone" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Phone'" placeholder="Enter Phone"required=""/>
                                        </div>
                                    </div>
                                    <input type="hidden" name="start" value="<%=start%>"/>
                                    <input type="hidden" name="end" value="<%=end%>"/>
                                    <input type="hidden" name="selectAdult" value="<%=selectAdult%>"/>
                                    <input type="hidden" name="selectChildren" value="<%=selectChildren%>"/>
                                    <input type="hidden" name="idRoom" value="${id}"/>
                                    <input type="hidden" name="deposit" value="${(booking_bookMB.room(id).price)/10}"/>
                                    
                                    <div class="form-group mt-3">
                                        <button type="submit" class="button button-contactForm boxed-btn">Booking</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <!-- Footer Start-->
        <%@include file="footer.html" %>
        <!-- JS here -->

        <!-- All JS Custom Plugins Link Here here -->
        <script src="<%=common.url%>/assets/js/vendor/modernizr-3.5.0.min.js"></script>

        <!-- Jquery, Popper, Bootstrap -->
        <script src="<%=common.url%>/assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="<%=common.url%>/assets/js/popper.min.js"></script>
        <script src="<%=common.url%>/assets/js/bootstrap.min.js"></script>
        <!-- Jquery Mobile Menu -->
        <script src="./assets/js/jquery.slicknav.min.js"></script>

        <!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="<%=common.url%>/assets/js/owl.carousel.min.js"></script>
        <script src="<%=common.url%>/assets/js/slick.min.js"></script>
        <!-- Date Picker -->
        <script src="<%=common.url%>/assets/js/gijgo.min.js"></script>
        <!-- One Page, Animated-HeadLin -->
        <script src="<%=common.url%>/assets/js/wow.min.js"></script>
        <script src="./assets/js/animated.headline.js"></script>

        <!-- Scrollup, nice-select, sticky -->
        <script src="<%=common.url%>/assets/js/jquery.scrollUp.min.js"></script>
        <script src="<%=common.url%>/assets/js/jquery.nice-select.min.js"></script>
        <script src="<%=common.url%>/assets/js/jquery.sticky.js"></script>
        <script src="<%=common.url%>/assets/js/jquery.magnific-popup.js"></script>

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
