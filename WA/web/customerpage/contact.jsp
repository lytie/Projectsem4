<%-- 
    Document   : contact
    Created on : Jul 12, 2020, 5:25:17 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Contact</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->
        <%@ include file="csslink.jsp" %>
        <!--===============================================================================================-->
        <script type="text/javascript">
            var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
            (function() {
                var s1 = document.createElement("script"), s0 = document.getElementsByTagName("script")[0];
                s1.async = true;
                s1.src = 'https://embed.tawk.to/5f02589e223d045fcb7b5bcf/default';
                s1.charset = 'UTF-8';
                s1.setAttribute('crossorigin', '*');
                s0.parentNode.insertBefore(s1, s0);
            })();
        </script>
    </head>
    <body class="animsition">

        <%@ include file="cpheader.jsp" %>


        <!-- Title Page -->
    <section class="bg-title-page flex-c-m p-t-160 p-b-80 p-l-15 p-r-15" style="background-image: url(./images/customerpageimg/bg-title-page-02.jpg);">
        <h2 class="tit6 t-center">
            Contact
        </h2>
    </section>



    <!-- Contact form -->
    <section class="section-contact bg1-pattern p-t-90 p-b-113">

        <div class="container">
            <h3 class="tit7 t-center p-b-62 p-t-105">
                Send us a Message
            </h3>

            <form class="wrap-form-reservation size22 m-l-r-auto" action="CustomerPageContactServlet" method="post">
                <div class="row">
                    <div class="col-12">
                        <!-- Message -->
                        <span class="txt9">
                            Message
                        </span>
                        <textarea class="bo-rad-10 size35 bo2 txt10 p-l-20 p-t-15 m-b-10 m-t-3" required name="message" placeholder="Message"></textarea>
                    </div>
                </div>

                <div class="wrap-btn-booking flex-c-m m-t-13">
                    <!-- Button3 -->
                    <button type="submit" class="btn3 flex-c-m size36 txt11 trans-0-4">
                        Submit
                    </button>
                </div>
            </form>

            <div class="row p-t-135">
                <div class="col-sm-8 col-md-4 col-lg-4 m-l-r-auto p-t-30">
                    <div class="dis-flex m-l-23">
                        <div class="p-r-40 p-t-6">
                            <img src="./images/customerpageimg/icons/map-icon.png" alt="IMG-ICON">
                        </div>

                        <div class="flex-col-l">
                            <span class="txt5 p-b-10">
                                Location
                            </span>

                            <span class="txt23 size38">
                                8th floor, 379 Hudson St, New York, NY 10018
                            </span>
                        </div>
                    </div>
                </div>

                <div class="col-sm-8 col-md-3 col-lg-4 m-l-r-auto p-t-30">
                    <div class="dis-flex m-l-23">
                        <div class="p-r-40 p-t-6">
                            <img src="./images/customerpageimg/icons/phone-icon.png" alt="IMG-ICON">
                        </div>
                        <div class="flex-col-l">
                            <span class="txt5 p-b-10">
                                Call Us
                            </span>

                            <span class="txt23 size38">
                                (+1) 96 716 6879
                            </span>
                        </div>
                    </div>
                </div>

                <div class="col-sm-8 col-md-5 col-lg-4 m-l-r-auto p-t-30">
                    <div class="dis-flex m-l-23">
                        <div class="p-r-40 p-t-6">
                            <img src="./images/customerpageimg/icons/clock-icon.png" alt="IMG-ICON">
                        </div>


                        <div class="flex-col-l">
                            <span class="txt5 p-b-10">
                                Opening Hours
                            </span>

                            <span class="txt23 size38">
                                09:30 AM – 11:00 PM <br/>Every Day
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <%@ include file="cpfooter.jsp" %>

    <!-- Container Selection1 -->
    <div id="dropDownSelect1"></div>



    <!--===============================================================================================-->
    <%@ include file="jslink.jsp" %>

</body>
</html>

