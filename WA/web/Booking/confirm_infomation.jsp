<%-- 
    Document   : confirm_infomation
    Created on : Jul 13, 2020, 4:58:43 PM
    Author     : longly
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hotel</title>
        <meta name="description" content=""/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>

        <link rel="manifest" href="site.webmanifest"/>
		<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico"/>
        <!-- Place favicon.ico in the root directory -->

		<!-- CSS here -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css"/>
        <link rel="stylesheet" href="assets/css/gijgo.css"/>
        <link rel="stylesheet" href="assets/css/slicknav.css"/>
        <link rel="stylesheet" href="assets/css/animate.min.css"/>
        <link rel="stylesheet" href="assets/css/magnific-popup.css"/>
        <link rel="stylesheet" href="assets/css/fontawesome-all.min.css"/>
        <link rel="stylesheet" href="assets/css/themify-icons.css"/>
        <link rel="stylesheet" href="assets/css/themify-icons.css"/>
        <link rel="stylesheet" href="assets/css/slick.css"/>
        <link rel="stylesheet" href="assets/css/nice-select.css"/>
        <link rel="stylesheet" href="assets/css/style.css"/>
        <link rel="stylesheet" href="assets/css/responsive.css"/>
    </head>
    <body>
        <!-- Preloader Start -->
        <%@include file="Preloader.html" %>
        
         <!-- Header Start -->
         <%@include file="header.html" %>
           
         <!-- body content-->
         <main>

        <!-- slider Area Start-->
        <div class="slider-area">
            <div class="single-slider hero-overly slider-height2 d-flex align-items-center" data-background="assets/img/hero/servicespage_hero.jpg" >
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
    <a class="ml-35" href="#"></a>
    <div class="hero-caption">
                                <span><a href="#" style="color: Black">Back to Booking</a></span>
                                
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
                                                    <a href="#" class="d-flex">
                                                    <p></p>
                                                    <p>Hoi AN</p>
                                                    </a>
                                                </li>
                                                <li>
                                                   <a href="#" class="d-flex">
                                                      <p> </p>
                                                      <p>July 23 - July 24, 2020</p>
                                                   </a>
                                                </li>
                                                <li>
                                                   <a href="#" class="d-flex">
                                                      <p>1 Adults</p>
                                                      <p> 1 Childent</p>
                                                   </a>
                                                </li>
                                                <li>
                                                   <a href="#" class="d-flex">
                                                      <p>ONE-BEDROOM VILLA</p>
                                                      <p></p>
                                                   </a>
                                                </li>
                                                <li>
                                                   <a href="#" class="">
                                                      <p>Price: </p>
                                                      <p>100$</p>
                                                   </a>
                                                </li>
                                                <li>
                                                   <a href="#" class="">
                                                      <p>Deposit (10%)</p>
                                                    <h3>10$</h3>
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
                                <form class="form-contact contact_form"  id="contactForm">
                                    
                                        <div class="">
                                            <div class="form-group">
                                                <input class="form-control valid" name="name" id="name" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your name'" placeholder="Enter your name">
                                            </div>
                                        </div>
                                        <div class="">
                                            <div class="form-group">
                                                <input class="form-control valid" name="email" id="email" type="email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email address'" placeholder="Email">
                                            </div>
                                        </div>
                                        <div class="">
                                            <div class="form-group">
                                                <input class="form-control" name="subject" id="subject" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Phone'" placeholder="Enter Phone">
                                            </div>
                                        </div>
                                       
                                        <div class="">
                                            <div class="form-group">
                                                <textarea class="form-control w-100" name="message" id="message" cols="20" rows="4" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Note'" placeholder=" Enter Note"></textarea>
                                            </div>
                                        </div>
                                    
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
        <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
		
		<!-- Jquery, Popper, Bootstrap -->
		<script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="./assets/js/popper.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
	    <!-- Jquery Mobile Menu -->
        <script src="./assets/js/jquery.slicknav.min.js"></script>

		<!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="./assets/js/owl.carousel.min.js"></script>
        <script src="./assets/js/slick.min.js"></script>
        <!-- Date Picker -->
        <script src="./assets/js/gijgo.min.js"></script>
		<!-- One Page, Animated-HeadLin -->
        <script src="./assets/js/wow.min.js"></script>
		<script src="./assets/js/animated.headline.js"></script>
		
		<!-- Scrollup, nice-select, sticky -->
        <script src="./assets/js/jquery.scrollUp.min.js"></script>
        <script src="./assets/js/jquery.nice-select.min.js"></script>
		<script src="./assets/js/jquery.sticky.js"></script>
        <script src="./assets/js/jquery.magnific-popup.js"></script>
        
        <!-- contact js -->
        <script src="./assets/js/contact.js"></script>
        <script src="./assets/js/jquery.form.js"></script>
        <script src="./assets/js/jquery.validate.min.js"></script>
        <script src="./assets/js/mail-script.js"></script>
        <script src="./assets/js/jquery.ajaxchimp.min.js"></script>
        
		<!-- Jquery Plugins, main Jquery -->	
        <script src="./assets/js/plugins.js"></script>
        <script src="./assets/js/main.js"></script>
    </body>
</html>
