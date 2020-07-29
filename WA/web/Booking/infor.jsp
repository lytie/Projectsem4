<%-- 
    Document   : history
    Created on : Jul 13, 2020, 4:54:07 PM
    Author     : longly
--%>

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
        <link rel='stylesheet' href='https://cdn.rawgit.com/t4t5/sweetalert/v0.2.0/lib/sweet-alert.css'>
        <script src='https://cdn.rawgit.com/t4t5/sweetalert/v0.2.0/lib/sweet-alert.min.js'></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
                <div class="single-slider hero-overly slider-height2 d-flex align-items-center" data-background="<%=common.urlImg%>/img/profilepage.jpg" >
                    <div class="container">
                        <div class="row ">
                            <div class="col-md-11 offset-xl-1 offset-lg-1 offset-md-1">
                                <div class="hero-caption">
                                    <span>Information</span>
                                    <h2>Information</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- slider Area End-->
            <%
                Accountcustomer accountcustomer = (Accountcustomer) session.getAttribute("user");
            %>
            <!-- History Start-->
            <div class="container-fluid mb-105">
                <section class="profile-section spad">
                    <div class="container">
                        <div class="profile-agent-content">
                            <div class="row">
                                <div class="col-lg-6 ">
                                    <div class="profile-agent-info">
                                        <div class="pi-text">
                                            <h5><%=accountcustomer.getFullName()%></h5>
                                            <p><%=accountcustomer.getEmail()%></p>
                                            <p><%=accountcustomer.getPhone()%></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="profile-agent-info">
                                        <div class="pi-text">
                                            <h5>Change password</h5>
                                        </div>
                                        <form action="Profile" method="post">
                                            <ul>
                                                <li>Old Password:<input type="password" class="form-control" name="old" required=""/></li>
                                                <li>New Password: <input type="password" class="form-control" id="new" name="new" required=""/></li>
                                                <li>Confirm New Password:  <input type="password" class="form-control" id="confirm" name="confirm" required=""/></li>
                                                <li><button class="btn btn-warning mt-10">Submit</button></li>
                                            </ul>

                                        </form>
                                        <div class="m-t-30 m-l-35 fs-15" style="color: red">
                                            <c:if test="${err!=null}">${err}</c:if>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>


            <!-- History End-->




        </main>

        <!-- Footer Start-->
        <%@include file="footer.html" %>

        <!-- JS here -->
     <script src="<%=common.url%>/vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <!--===============================================================================================-->
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

        <script type="text/javascript">
            $('.success').each(function () {
                swal("Change password successfully!!!", "", "success");
            });
        </script>
      
    </body>
</html>
