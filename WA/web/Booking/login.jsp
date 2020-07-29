<%-- 
    Document   : login
    Created on : Jul 13, 2020, 5:02:23 PM
    Author     : longly
--%>

<%@page import="bean.common"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Haven - login</title>

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
        <link rel='stylesheet' href='https://cdn.rawgit.com/t4t5/sweetalert/v0.2.0/lib/sweet-alert.css'>
        <script src='https://cdn.rawgit.com/t4t5/sweetalert/v0.2.0/lib/sweet-alert.min.js'></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </head>
    <body>
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <form class="login100-form validate-form p-l-55 p-r-55 p-t-178" action="Login" method="post">
                        <span class="login100-form-title">
                            Sign In
                        </span>

                        <div class="wrap-input100 validate-input m-b-16" >
                            <input class="input100" type="email" name="email" placeholder="Email" required="">
                            <span class="focus-input100"></span>
                        </div>

                        <div class="wrap-input100 validate-input" >
                            <input class="input100" type="password" name="pass" placeholder="Password" required="">
                            <span class="focus-input100"></span>
                        </div>

                        <div class="text-right p-t-13 p-b-23">
                            <span class="txt1">
                                Forgot
                            </span>

                            <a href="ForgotPassword" class="txt2">
                                Password?
                            </a>
                        </div>

                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                Sign in
                            </button>
                        </div>


                    </form>
                    <div class="m-t-30 m-l-35 fs-15" style="color: red">
                        <c:if test="${err!=null}">${err}</c:if>

                    </div>

                    <div class="flex-col-c p-t-120 p-b-40">
                        <a href="http://localhost:8080/WA/SignUp" class="txt1 p-b-9">
                            Don’t have an account? <span class="txt3">Sign up</span>
                        </a>

                        <a href="http://localhost:8080/WA/Haven" class="txt3">
                            Back Home
                        </a>
                    </div>
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
        <script type="text/javascript">
            $('.success').each(function () {
                swal("Please check your email to verify your account", "Email sended to: ${e}", "success");
            });
        </script>
        <script type="text/javascript">
            $('.active').each(function () {
                swal("Please check your email to verify your account", "", "warning");
            });
        </script>
        <script type="text/javascript">
            $('.reset').each(function () {
                swal("Please check your email to reset password of your account", "Email sended to: ${e}", "success");
            });
        </script>
        <script type="text/javascript">
            $('.noEmail').each(function () {
                swal("Email hasn't been registered", "", "error");
            });
        </script>
        <script type="text/javascript">
            $('.pass').each(function () {
                swal("Reset Password Success", "", "success");
            });
        </script>
    </body>
</html>
