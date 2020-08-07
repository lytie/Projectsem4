<%-- 
    Document   : booking
    Created on : Jul 13, 2020, 4:47:37 PM
    Author     : longly
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="bean.common" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


        <title>Haven | Booking</title>
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

        <link href="<%=common.url%>/dist/css/datepicker-foundation.min.css" rel="stylesheet"/>

        <link rel="stylesheet" type="text/css" href="<%=common.url%>/css/component.css" />
        <link rel="stylesheet" type="text/css" href="<%=common.url%>/css/demo.css" />
        <!-- Modernizr is used for flexbox fallback -->
        <script src="<%=common.url%>/js/modernizr.custom.js"></script>
         <link rel='stylesheet' href='https://cdn.rawgit.com/t4t5/sweetalert/v0.2.0/lib/sweet-alert.css'>
        <script src='https://cdn.rawgit.com/t4t5/sweetalert/v0.2.0/lib/sweet-alert.min.js'></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </head>
    <body>
        <!-- Preloader Start -->
        <%@include file="Preloader.html" %>

        <!-- compare-->
        <div class="compare-basket">
            <button class="action action--button action--compare"><i class="fa fa-check"></i><span class="action__text">Compare</span></button>
        </div>
        <!-- Header Start -->
        <%@include file="header.jsp" %>

        <!-- body content-->
        <!-- slider Area Start-->
        <div class="slider-area ">
            <!-- Mobile Menu -->
            <div class="slider-active dot-style">
                <c:forEach items="${booking_bookMB.listImgHero()}" var="l">
                    <div class="single-slider  hero-overly slider-height d-flex align-items-center"
                         data-background="<%=common.urlImg%>/img/${l.img}">
                        <div class="container">
                            <div class="row justify-content-center text-center">
                                <div class="col-xl-9">
                                    <div class="h1-slider-caption">
                                        <h1 data-animation="fadeInUp" data-delay=".4s">${l.textTitle}</h1>
                                        <h3 data-animation="fadeInDown" data-delay=".4s">${l.textShort}</h3>
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
                        <form action="Booking_bookServlet" >
                            <div class="booking-wrap d-flex justify-content-between align-items-center" id="range">

                                <!-- select in date -->
                                <div class="single-select-box mb-30">
                                    <!-- select out date -->
                                    <div class="boking-tittle">
                                        <span> Check In Date:</span>
                                    </div>
                                    <div class="boking-datepicker" >

                                        <i class="gj-icon" role="right-icon" >event</i>

                                        <input id="datepicker1"  name="start" value="${inDate}"/>
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
                                        <input id="datepicker2"  name="end" value="${outDate}" />
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
                                                <c:forEach items="${booking_bookMB.listLocation()}" var="ll">
                                                    <option value="${ll.locationId}" <c:if test="${ll.locationId ==location}">selected</c:if>>${ll.locationName}</option>
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
                                                <option value="1" <c:if test="${adult==1}">selected</c:if>>1</option>
                                                <option value="2" <c:if test="${adult==2}">selected</c:if>>2</option>
                                                <option value="3" <c:if test="${adult==3}">selected</c:if>>3</option>
                                                <option value="4" <c:if test="${adult==4}">selected</c:if>>4</option>
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
                                                    <option value="0" <c:if test="${children==0}">selected</c:if>>0</option>
                                                <option value="1" <c:if test="${children==1}">selected</c:if>>1</option>
                                                <option value="2" <c:if test="${children==2}">selected</c:if>>2</option>
                                                <option value="3" <c:if test="${children==3}">selected</c:if>>3</option>
                                                <option value="4" <c:if test="${children==4}">selected</c:if>>4</option>
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
            <!-- Product grid -->

            <!-- Room -->
            <!-- Make Room Start-->
            <div class="view">
                <section class="grids">
                    <!--                get room-->
                <%
                    if (request.getAttribute("check") == "true") {
                %>
                           
                
                <c:choose >
                    <c:when test="${booking_bookMB.listRoomBook(inDate, outDate, location, capation).isEmpty()}">
                        <div style="margin: 200px ">
                            <div style="font-family: 'Lucida Console', Courier, monospace;font-size: 25px"> No suitable rooms found </div>


                        </div>
                    </c:when>
                    <c:otherwise >


                        <c:forEach items="${booking_bookMB.listRoomBook(inDate, outDate, location, capation)}" var="rb">

                            <section class="make-customer-area customar-padding fix" style=" border: 2px dashed #dca73a; border-radius: 5px">
                                <div class="container-fluid p-0">
                                    <div class="row">
                                        <div class="col-xl-5 col-lg-6">
                                            <div class="customer-img mb-120">

                                                <img src="<%=common.urlImg%>/img/${rb.url}" class="customar-img2" alt="">
                                            </div>
                                        </div>
                                        <div class=" col-xl-7 col-lg-6">
                                            <div class="customer-caption">

                                                <h2 name="name">${rb.roomTypeName} - ${booking_bookMB.location(rb.roomId).locationName} ${booking_bookMB.room(rb.roomId).roomId}</h2>
                                                <input type="hidden" name="nameRoom" value=""/>
                                                <div class="caption-details">
                                                    <p class="pera-dtails">Price: ${rb.price}$ /day </p>

                                                    <div style="display: grid;grid-template-columns: auto auto auto;">
                                                        <p>VIEW: <sqan>${rb.view}</sqan></p>
                                                        <p>BED OPTIONS: <sqan>${rb.bedOptions}</sqan></p>
                                                        <p>ROOM SIZE: <sqan>${rb.roomSize} m<sup>2</sup> </sqan></p>

                                                    </div>
                                                </div>

                                                <span>
                                                    <a href="" data-toggle="modal" data-target="#M${rb.roomId}">View more details</a>
                                                </span>


                                                <div class="product"> 
                                                    <span class="">Add to compare
                                                        <label class="action action--compare-add">

                                                            <input class="check-hidden" type="checkbox" />
                                                            <i class="fa fa-plus"></i>
                                                            <i class="fa fa-check"></i>
                                                        </label>
                                                    </span>
                                                    <div class="product__info">
                                                        <img class="product__image extra" src="<%=common.urlImg%>/img/${rb.url}" alt="Product 1" />
                                                        <h3 class="extra">${rb.roomTypeName}</h3>
                                                        <span class="extra">$ ${rb.price}</span>
                                                        <span class="extra">${rb.view}</span>
                                                        <span class="extra">${rb.bedOptions}</span>
                                                        <span class="extra">${rb.roomSize} m<sup>2</sup></span>

                                                    </div>

                                                </div>

                                                <div class="header-btn">
                                                    <a href="Booking_ConfirmInfo?name=${rb.roomTypeName} - ${booking_bookMB.location(rb.roomId).locationName} ${booking_bookMB.room(rb.roomId).roomId}&price=${rb.price}&id=${rb.roomId}" class="btn  ">Booking</a>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                            <!-- The Modal -->
                            <div class="modal fade" id="M${rb.roomId}">
                                <div class="modal-dialog modal-dialog-scrollable modal-xl">
                                    <div class="modal-content">

                                        <!-- Modal Header -->
                                        <div class="modal-header">
                                            <h1 class="modal-title">${rb.roomTypeName}</h1>
                                            <button type="button" class="close" data-dismiss="modal">×</button>
                                        </div>

                                        <!-- Modal body -->
                                        <div class="modal-body">
                                            <section class="make-customer-area ">
                                                <div class="container-fluid p-0">
                                                    <div class="row">
                                                        <div class="col-xl-5 col-lg-6">
                                                            <div id="D${rb.roomId}" class="carousel slide" data-ride="carousel">
                                                                <ul class="carousel-indicators">
                                                                    <li data-target="#D${rb.roomId}" data-slide-to="0" class="active">

                                                                    </li>
                                                                    <!--                                                        list data-sile-to-->
                                                                    <c:forEach items="${booking_bookMB.listDot(rb.roomId)}" var="dot">
                                                                        <li data-target="D${rb.roomId}" data-slide-to="${dot.intValue()}"></li>
                                                                        </c:forEach>
                                                                </ul>
                                                                <div class="carousel-inner">
                                                                    <!--                                                        list carousel-->
                                                                    <c:forEach items="${booking_bookMB.listRoomImg(rb.roomId)}" var="img" >
                                                                        <c:if  test="${booking_bookMB.listRoomImg(rb.roomId).indexOf(img)==0}">
                                                                            <div class="carousel-item active"> 
                                                                                <img src="<%=common.urlImg%>/images/${img.url}" alt="img" >

                                                                            </div>
                                                                        </c:if>
                                                                        <c:if  test="${booking_bookMB.listRoomImg(rb.roomId).indexOf(img)!=0}">
                                                                            <div class="carousel-item"> 
                                                                                <img src="<%=common.urlImg%>/images/${img.url}" alt="img" >

                                                                            </div>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </div>
                                                                <a class="carousel-control-prev" href="#D${rb.roomId}" data-slide="prev">
                                                                    <span class="carousel-control-prev-icon"></span>
                                                                </a>
                                                                <a class="carousel-control-next" href="#D${rb.roomId}" data-slide="next">
                                                                    <span class="carousel-control-next-icon"></span>
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <div class=" col-xl-7 col-lg-6">

                                                            <div style="display: grid; grid-template-columns: auto auto auto auto;">
                                                                <!--                                                    list icon-->
                                                                <c:forEach items="${booking_bookMB.listConvenient(rb.roomId)}" var="convenient">
                                                                    <div>
                                                                        <img src="<%=common.urlImg%>/icon/${convenient.url}" alt="${convenient.convenientName}" width="25%">
                                                                        <p>${convenient.convenientName}</p>
                                                                    </div>
                                                                </c:forEach>


                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </section>

                                            <p>
                                                ${booking_bookMB.room(rb.roomId).description}</p>
                                        </div>

                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                        </div>

                                    </div>
                                </div>
                            </div>


                        </c:forEach>
                    </c:otherwise>
                </c:choose>
                   

                <%

                } else {
                %>
                <div style="margin: 200px ">
                    <div style="font-family: 'Lucida Console', Courier, monospace;font-size: 25px"> No suitable rooms found </div>


                </div>
                <%
                    }
                %>
            </section>
        </div>
        <!-- product compare wrapper -->
        <section class="compare">
            <button class="action action--close"><i class="fa fa-remove"></i><span class="action__text action__text--invisible">Close comparison overlay</span></button>
        </section>
        <!-- Make customer End-->



${error}
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
        <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script> -->
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
                buttonClass: 'btn',
                format: 'yyyy-mm-dd'
            });</script>

      
        <script src="<%=common.url%>/dist/js/datepicker.min.js">
        </script>
        <script src="<%=common.url%>/dist/js/locales/fr.min.js">
        </script>
        <script src="<%=common.url%>/dist/js/datepicker-full.min.js">
        </script>

        <script src="<%=common.url%>/js/classie.js"></script>
        <script src="<%=common.url%>/js/main.js"></script>
                <script src="https://momentjs.com/downloads/moment.js"></script>

    </body>
</html>