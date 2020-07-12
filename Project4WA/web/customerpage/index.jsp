<%-- 
    Document   : index
    Created on : Jul 12, 2020, 5:26:50 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Home</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="images/icons/favicon.png" />
    <!--===============================================================================================-->
    <link
      rel="stylesheet"
      type="text/css"
      href="vendor/bootstrap/css/bootstrap.min.css"
    />
    <!--===============================================================================================-->
    <link
      rel="stylesheet"
      type="text/css"
      href="fonts/font-awesome-4.7.0/css/font-awesome.min.css"
    />
    <!--===============================================================================================-->
    <link
      rel="stylesheet"
      type="text/css"
      href="fonts/themify/themify-icons.css"
    />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css" />
    <!--===============================================================================================-->
    <link
      rel="stylesheet"
      type="text/css"
      href="vendor/css-hamburgers/hamburgers.min.css"
    />
    <!--===============================================================================================-->
    <link
      rel="stylesheet"
      type="text/css"
      href="vendor/animsition/css/animsition.min.css"
    />
    <!--===============================================================================================-->
    <link
      rel="stylesheet"
      type="text/css"
      href="vendor/select2/select2.min.css"
    />
    <!--===============================================================================================-->
    <link
      rel="stylesheet"
      type="text/css"
      href="vendor/daterangepicker/daterangepicker.css"
    />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/slick/slick.css" />
    <!--===============================================================================================-->
    <link
      rel="stylesheet"
      type="text/css"
      href="vendor/lightbox2/css/lightbox.min.css"
    />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="css/util.css" />
    <link rel="stylesheet" type="text/css" href="css/main.css" />
    <!--===============================================================================================-->
    <!--Start of Tawk.to Script-->
<script type="text/javascript">
  var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
  (function(){
  var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
  s1.async=true;
  s1.src='https://embed.tawk.to/5f02589e223d045fcb7b5bcf/default';
  s1.charset='UTF-8';
  s1.setAttribute('crossorigin','*');
  s0.parentNode.insertBefore(s1,s0);
  })();
  </script>
  <!--End of Tawk.to Script-->
  </head>
  <body class="animsition">
    <%@ include file="cpheader.jsp" %>

    <!-- Slide1 -->
    <section class="section-slide"style="background-color:green">
      <div class="wrap-slick1">
        <div class="slick1" >
          <div
            class="item-slick1 item1-slick1"
            style="background-image: url(../images/home-slide-02.jpg);"
          >
            <div
              class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170"
			>

              <span
                class="caption1-slide1 txt1 t-center animated visible-false m-b-15"
                data-appear="fadeInDown"
              >
                Welcome to
              </span>

              <h2
                class="caption2-slide1 tit1 t-center animated visible-false m-b-37"
                data-appear="fadeInUp"
              >
                Haven de luxe
              </h2>

              <div
                class="wrap-btn-slide1 animated visible-false"
                data-appear="zoomIn"
              >
                <!-- Button1 -->
                <a href="menu.html" class="btn1 size1 txt3 trans-0-4" style="font-size:16px;font-family: Poppins;padding:20px;border-radius: 20px;margin-right: 20px;">
                  Restaurant menu
                </a>

                <a href="servicesmenu.html" class="btn1 size1 txt3 trans-0-4" style="font-size:16px;font-family: Poppins;padding:20px;border-radius: 20px;margin-right: 20px;">
                  Entertainment services
                </a>
              </div>

              
            </div>
          </div>       
        </div>

        <div class="wrap-slick1-dots"></div>
      </div>
    </section>

    
    <!-- Back to top -->
    <div class="btn-back-to-top bg0-hov" id="myBtn">
      <span class="symbol-btn-back-to-top">
        <i class="fa fa-angle-double-up" aria-hidden="true"></i>
      </span>
    </div>

    <!-- Container Selection1 -->
    <div id="dropDownSelect1"></div>

    <!--===============================================================================================-->
    <script
      type="text/javascript"
      src="vendor/jquery/jquery-3.2.1.min.js"
    ></script>
    <!--===============================================================================================-->
    <script
      type="text/javascript"
      src="vendor/animsition/js/animsition.min.js"
    ></script>
    <!--===============================================================================================-->
    <script type="text/javascript" src="vendor/bootstrap/js/popper.js"></script>
    <script
      type="text/javascript"
      src="vendor/bootstrap/js/bootstrap.min.js"
    ></script>
    <!--===============================================================================================-->
    <script type="text/javascript" src="vendor/select2/select2.min.js"></script>
    <!--===============================================================================================-->
    <script
      type="text/javascript"
      src="vendor/daterangepicker/moment.min.js"
    ></script>
    <script
      type="text/javascript"
      src="vendor/daterangepicker/daterangepicker.js"
    ></script>
    <!--===============================================================================================-->
    <script type="text/javascript" src="vendor/slick/slick.min.js"></script>
    <script type="text/javascript" src="js/slick-custom.js"></script>
    <!--===============================================================================================-->
    <script
      type="text/javascript"
      src="vendor/parallax100/parallax100.js"
    ></script>
    <script type="text/javascript">
      $(".parallax100").parallax100();
    </script>
    <!--===============================================================================================-->
    <script
      type="text/javascript"
      src="vendor/countdowntime/countdowntime.js"
    ></script>
    <!--===============================================================================================-->
    <script
      type="text/javascript"
      src="vendor/lightbox2/js/lightbox.min.js"
    ></script>
    <!--===============================================================================================-->
    <script src="js/main.js"></script>
  </body>
</html>

