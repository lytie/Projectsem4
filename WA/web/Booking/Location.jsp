
<%@page import="entities.Location"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page  import="bean.common"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta http-equiv="x-ua-compatible" content="ie=edge"/>
        <title>Haven | Location</title>
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
        <%@include file="header.jsp" %>

        
        <main>
            
            <!-- slider Area Start-->
        <div class="slider-area">
            <div class="single-slider hero-overly slider-height2 d-flex align-items-center" data-background="<%=common.urlImg%>/img/locationpage.jpg" >
                <div class="container">
                    <div class="row ">
                        <div class="col-md-11 offset-xl-1 offset-lg-1 offset-md-1">
                            <div class="hero-caption">
                                <span>Location</span>
                                <h2>Location</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- slider Area End-->
        
        <!-- Dining Start -->
        <div class="dining-area dining-padding-top">
            
            
            <%
                List<Location> list=(List<Location>)request.getAttribute("location");
                
                    for (Location l : list) {
                            
                        if(l.getLocationId()%2!=0){
                        
                %>
            <!-- Single Left img -->
            <div class="single-dining-area" id="L<%=l.getLocationId() %>">
                <div class="container">
                    <div class="row justify-content-end">
                        <div class="col-lg-4 col-md-4">
                            <img src="<%=common.urlImg%>/img/<%=l.getLocationUrl() %>" alt="img"/>
                        </div>
                        <div class="col-lg-8 col-md-8">
                            <div class="dining-caption">
                                
                               <h3><%=l.getLocationName() %></h3>
                                <p><%=l.getIntroduce() %></p>
                                <span>Address: <%=l.getAddress() %></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
            <%}else{
                %>
            <!-- single Right img -->
            <div class="single-dining-area " id="L<%=l.getLocationId() %>">
                <div class="container">
                    <div class="row justify-content-start">
                        <div class="col-lg-8 col-md-8">
                            <div class="dining-caption text-right">
                                <h3><%=l.getLocationName() %></h3>
                                <p><%=l.getIntroduce() %></p>
                                <span>Address: <%=l.getAddress() %></span>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4">
                            <img src="<%=common.urlImg%>/img/<%=l.getLocationUrl() %>" alt="img"/>

                        </div>
                    </div>
                </div>
            </div> 
            <% }
}
                %>
        </div>
        <!-- Dining End -->
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
        </script>
    


    </body>
</html>
