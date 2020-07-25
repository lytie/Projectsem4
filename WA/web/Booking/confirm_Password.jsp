<%-- 
    Document   : signup
    Created on : Jul 13, 2020, 5:04:01 PM
    Author     : longly
--%>

<%@page import="bean.common"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login V8</title>

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="<%=common.url%>/images/icons/favicon.ico"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="<%=common.url%>/vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="<%=common.url%>/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="<%=common.url%>/vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="<%=common.url%>/vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="<%=common.url%>/vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="<%=common.url%>/vendor/select2/select2.min.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="<%=common.url%>/vendor/daterangepicker/daterangepicker.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="<%=common.url%>/css/util.css">
        <link rel="stylesheet" type="text/css" href="<%=common.url%>/css/main.css">
        <!--===============================================================================================-->
    </head>
    <body>
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <form class="login100-form validate-form p-l-55 p-r-55 p-t-178" action="Booking_resetPassword" method="post">
                        <span class="login100-form-title">
                            Confirm Password
                        </span>

                        <div class="wrap-input100 validate-input m-b-16" >
                            <input class="input100" type="password" name="password" placeholder="Enter Password" required="">

                            <span class="focus-input100"></span>
                        </div>
                        <div class="wrap-input100 validate-input m-b-16" data-validate="Please enter username">
                            <input class="input100" type="password" name="passwordConfirm" placeholder="Enter Password Confirm" required="">

                            <span class="focus-input100"></span>
                        </div>

                        <%
                            request.setAttribute("token", request.getParameter("token").toString());
                        %>


                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                Submit
                            </button>
                        </div>
                        <div class="m-t-30 m-l-35 fs-15" style="color: red">
                            <c:if test="${err!=null}">${err}</c:if>

                        </div>

                        <div class="flex-col-c p-t-170 p-b-40">


                            <a href="Login" class="txt3">
                                Back Sign In
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <!--===============================================================================================-->
        <script src="<%=common.url%>/vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="<%=common.url%>/vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="<%=common.url%>/vendor/bootstrap/js/popper.js"></script>
        <script src="<%=common.url%>/vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="<%=common.url%>/vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="<%=common.url%>/vendor/daterangepicker/moment.min.js"></script>
        <script src="<%=common.url%>/vendor/daterangepicker/daterangepicker.js"></script>
        <!--===============================================================================================-->
        <script src="<%=common.url%>/vendor/countdowntime/countdowntime.js"></script>
        <!--===============================================================================================-->
        <script src="<%=common.url%>/js/login.js"></script>
    </body>
</html>
