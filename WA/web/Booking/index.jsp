

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page  import="bean.common"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta http-equiv="x-ua-compatible" content="ie=edge"/>
        <title>Haven</title>
        <meta name="description" content=""/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>

        <link rel="manifest" href="site.webmanifest"/>
        <link rel="shortcut icon" type="image/x-icon" href="<%=common.url%>/assets/img/favicon.ico"/>

        <!-- CSS here -->
        <link rel="stylesheet" href="<%=common.url%>/assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="<%=common.url%>/assets/css/owl.carousel.min.css"/>
        <link rel="stylesheet" href="<%=common.url%>/assets/css/gijgo.css"/>
        <link rel="stylesheet" href="<%=common.url%>/assets/css/slicknav.css"/>
        <link rel="stylesheet" href="<%=common.url%>/assets/css/animate.min.css"/>
        <link rel="stylesheet" href="<%=common.url%>/assets/css/magnific-popup.css"/>
        <link rel="stylesheet" href="<%=common.url%>/assets/css/fontawesome-all.min.css"/>
        <link rel="stylesheet" href="<%=common.url%>/assets/css/themify-icons.css"/>
        <link rel="stylesheet" href="<%=common.url%>/assets/css/slick.css"/>
        <link rel="stylesheet" href="<%=common.url%>/assets/css/nice-select.css"/>

        <link href="<%=common.url%>/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="<%=common.url%>/plugins/OwlCarousel2-2.3.4/owl.carousel.css"/>
        <link rel="stylesheet" type="text/css" href="<%=common.url%>/plugins/OwlCarousel2-2.3.4/owl.theme.default.css"/>
        <link rel="stylesheet" type="text/css" href="<%=common.url%>/plugins/OwlCarousel2-2.3.4/animate.css"/>
        <link rel="stylesheet" type="text/css" href="<%=common.url%>/styles/main_styles.css"/>
        <link rel="stylesheet" href="<%=common.url%>/assets/css/responsive.css"/>
        <link rel="stylesheet" href="<%=common.url%>/assets/css/style.css"/>
        <link href="<%=common.url%>/dist/css/datepicker-foundation.min.css" rel="stylesheet"/>

    </head>
    <body>
        <!-- Preloader Start -->
        <%@include file="Preloader.html" %>

        <!-- Header Start -->
        <%@include file="header.html" %>

        <!-- body content-->
        <main>

            <!-- slider Area Start-->
            <div class="slider-area ">
                <!-- Mobile Menu -->
                <div class="slider-active dot-style">
                    <c:forEach items="${booking_IndexMB.listImgHero()}" var="lh">
                        <div class="single-slider  hero-overly slider-height d-flex align-items-center"
                             data-background="<%=common.urlImg%>/img/${lh.img}">
                            <div class="container">
                                <div class="row justify-content-center text-center">
                                    <div class="col-xl-9">
                                        <div class="h1-slider-caption">
                                            <h1 data-animation="fadeInUp" data-delay=".4s">${lh.textTitle}</h1>
                                            <h3 data-animation="fadeInDown" data-delay=".4s">${lh.textShort}</h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>
            <!-- slider Area End-->
            <div id="inline" style="display: none;">
            </div>
            <!-- Booking Room Start-->
            <div class="booking-area">
                <div class="container">
                    <div class="row ">
                        <div class="col-12">
                            <form action="">
                                <div class="booking-wrap d-flex justify-content-between align-items-center" id="range">

                                    <!-- select in date -->
                                    <div class="single-select-box mb-30">
                                        <!-- select out date -->
                                        <div class="boking-tittle">
                                            <span> Check In Date:</span>
                                        </div>
                                        <div class="boking-datepicker" >

                                            <i class="gj-icon" role="right-icon" >event</i>
                                            <input id="datepicker1"  name="start" />
                                        </div>
                                    </div>
                                    <!-- Single Select Box -->
                                    <div class="single-select-box mb-30">
                                        <!-- select out date -->
                                        <div class="boking-tittle">
                                            <span>Check OutDate:</span>
                                        </div>
                                        <div class="boking-datepicker">
                                            <i class="gj-icon" role="right-icon">event</i>
                                            <input id="datepicker2"  name="end" />
                                        </div>
                                    </div>

                                    <!-- Single Select Box -->
                                    <div class="single-select-box mb-30">
                                        <div class="boking-tittle">
                                            <span>Locations:</span>
                                        </div>
                                        <div class="select-this">

                                            <div class="select-itms">
                                                <select name="selectLocation" id="select3">
                                                    <c:forEach items="${booking_IndexMB.listLocation()}" var="ll">
                                                        <option value="${ll.locationId}">${ll.locationName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>

                                        </div>
                                    </div>
                                    <!-- Single Select Box -->
                                    <div class="single-select-box mb-30">
                                        <div class="boking-tittle">
                                            <span>Adults:</span>
                                        </div>
                                        <div class="select-this">

                                            <div class="select-itms">
                                                <select name="selectAdult" id="select1">
                                                    <option value="2">1</option>
                                                    <option value="4">2</option>
                                                    <option value="6">3</option>
                                                    <option value="8">4</option>
                                                </select>
                                            </div>

                                        </div>
                                    </div>
                                    <!-- Single Select Box -->
                                    <div class="single-select-box mb-30">
                                        <div class="boking-tittle">
                                            <span>Children:</span>
                                        </div>
                                        <div class="select-this">

                                            <div class="select-itms">
                                                <select name="selectChildren" id="select2">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                </select>
                                            </div>

                                        </div>
                                    </div>

                                    <!-- Single Select Box -->
                                    <div class="single-select-box pt-45 mb-30">
                                        <input type="submit" class="btn select-btn" value="Book Now"/>
                                    </div>


                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Booking Room End-->


            <!-- Locations -->

            <div class="locations container_custom">
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div class="section_title text-center">
                                <h1>Explore Hot Locations</h1>
                            </div>
                            <div class="locations_container d-flex flex-row align-items-start justify-content-between flex-wrap">

                                <!--                                 Location  -->
                                <c:forEach items="${booking_IndexMB.toplistLocation()}" var="topl">

                                    <div class="location">
                                        <img src="<%=common.urlImg%>/img/${topl.locationUrl}" alt="" width="100%" height="140">
                                        <div class="location_title text-center">
                                            <div><a href="">${topl.locationName}<div>+</div></a></div>
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <!-- Make customer Start-->
            <section class="make-customer-area customar-padding fix">
                <div class="container-fluid p-0">
                    <div class="row">
                        <div class="col-xl-5 col-lg-6">
                            <div class="customer-img mb-120">
                                <img src="<%=common.urlImg%>/img/customar1.png" class="customar-img1" alt="">
                                <img src="<%=common.urlImg%>/img/customar2.png" class="customar-img2" alt="">
                                <div class="service-experience heartbeat">
                                    <h3>25 Years of Service<br>Experience</h3>
                                </div>
                            </div>
                        </div>
                        <div class=" col-xl-4 col-lg-4">
                            <div class="customer-caption">
                                <span>About our company</span>
                                <h2>Make the customer the hero of your story</h2>
                                <div class="caption-details">
                                    <p class="pera-dtails">Lorem ipsum dolor sit amet, consectetur adipisic- ing elit, sed
                                        do eiusmod tempor inc. </p>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                        incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.
                                    </p>
                                    <a href="#" class="btn more-btn1">Book now <i class="ti-angle-right"></i> </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Make customer End-->

            <!-- Room Start -->
            <section class="room-area">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-8">
                            <!--font-back-tittle  -->
                            <div class="font-back-tittle mb-45">
                                <div class="archivment-front">
                                    <h3>Top Rooms Type</h3>
                                </div>
                                <h3 class="archivment-back">Rooms Type</h3>
                            </div>
                        </div>
                    </div>
                    <div class="row">

                        <!--                            top type room-->
                        <c:forEach items="${booking_IndexMB.toplistRoomtype()}" var="toplr">
                            <div class="col-xl-4 col-lg-6 col-md-6">
                               
                                <div class="single-room mb-50">
                                    <div class="room-img">
                                        <a><img src="<%=common.urlImg%>/img/${toplr.url}" alt="" width="100%" height="300"></a>
                                    </div>
                                    <div class="room-caption">
                                        <h3><a>${toplr.roomTypeName}</a></h3>
                                        <div class="per-night">
                                            <span><span>${toplr.description}</span></span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </c:forEach>



                    </div>

                </div>

            </section>
            <!-- Room End -->


            <!-- Gallery img Start-->
            <div class="gallery-area fix">
                <div class="container-fluid p-0">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="gallery-active owl-carousel">
                                <div class="gallery-img">
                                    <a href="#"><img src="<%=common.urlImg%>/img/gallery1.jpg" alt=""></a>
                                </div>
                                <div class="gallery-img">
                                    <a href="#"><img src="<%=common.urlImg%>/img/gallery2.jpg" alt=""></a>
                                </div>
                                <div class="gallery-img">
                                    <a href="#"><img src="<%=common.urlImg%>/img/gallery3.jpg" alt=""></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Gallery img End-->
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
        <script src="<%=common.url%>/assets/js/jquery.slicknav.min.js"></script>

        <!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="<%=common.url%>/assets/js/owl.carousel.min.js"></script>
        <script src="<%=common.url%>/assets/js/slick.min.js"></script>
        <!-- Date Picker 
        <script src="./assets/js/gijgo.min.js"></script>-->

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
        <script src="<%=common.url%>/js/jquery-3.3.1.min.js"></script>
        <script src="<%=common.url%>/styles/bootstrap-4.1.2/popper.js"></script>
        <script src="<%=common.url%>/styles/bootstrap-4.1.2/bootstrap.min.js"></script>
        <script src="<%=common.url%>/plugins/greensock/TweenMax.min.js"></script>
        <script src="<%=common.url%>/plugins/greensock/TimelineMax.min.js"></script>
        <script src="<%=common.url%>/plugins/scrollmagic/ScrollMagic.min.js"></script>
        <script src="<%=common.url%>/plugins/greensock/animation.gsap.min.js"></script>
        <script src="<%=common.url%>/plugins/greensock/ScrollToPlugin.min.js"></script>
        <script src="<%=common.url%>/plugins/Isotope/isotope.pkgd.min.js"></script>
        <script src="<%=common.url%>/plugins/OwlCarousel2-2.3.4/owl.carousel.js"></script>
        <script src="<%=common.url%>/plugins/easing/easing.js"></script>
        <script src="<%=common.url%>/plugins/progressbar/progressbar.min.js"></script>
        <script src="<%=common.url%>/plugins/parallax-js-master/parallax.min.js"></script>
        <script src="<%=common.url%>/js/custom.js"></script>
        <script src="<%=common.url%>/dist/js/datepicker-full.js">
        </script>
        <script>



            const elem1 = document.querySelector('input[name="start"]');
            const datepicker1 = new Datepicker(elem1, {
                buttonClass: 'btn'
            });
            const elem2 = document.getElementById('inline');
            const datepicker2 = new Datepicker(elem2, {
                buttonClass: 'btn'
            });
            const elem3 = document.getElementById('range');
            const datepicker3 = new DateRangePicker(elem3, {
                minDate: new Date(),
                buttonClass: 'btn'
            });</script>
        <script src="dist/js/datepicker.min.js">
        </script>
        <script src="dist/js/locales/fr.min.js">
        </script>
        <script src="dist/js/datepicker-full.min.js">
        </script>


    </body>
</html>
