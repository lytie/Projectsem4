<%-- 
    Document   : signup
    Created on : Jul 13, 2020, 5:04:01 PM
    Author     : longly
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="bean.common"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Haven | Infomation Customer</title>

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
                    <form class="login100-form validate-form p-l-55 p-r-55 p-t-178" action="Login_Google" method="post">
                        <span class="login100-form-title">
                            Infomation Customer
                        </span>

                        <div class="wrap-input100 validate-input m-b-12" >
                            <input class="input100" type="text" name="name" placeholder="Full Name" value="${name}" required=""/>
                            <span class="focus-input100"></span>
                        </div>


                        <div class="m-b-10 fs-12" style="color: red">
                            <c:if test="${errName!=null}"><sup>*</sup>${errName}</c:if>

                            </div>
                            <input type="hidden" value="${email}" name="email"/>

                        <div class="wrap-input100 validate-input m-b-12" >
                            <input class="input100" type="number" name="phone" placeholder="Phone" value="${phone}" required=""/>
                            <span class="focus-input100"></span>
                        </div>
                        <div class="m-b-10 fs-12" style="color: red">
                            <c:if test="${errPhone!=null}"><sup>*</sup>${errPhone}</c:if>
                            </div>
                            <div class="wrap-input100 validate-input m-b-12">
                                <input class="input100" type="password" id="txtNewPassword" name="pass" placeholder="Password" required="" />
                                <span class="focus-input100"></span>
                            </div>
                            <div class="m-b-10 fs-12" style="color: red">
                            <c:if test="${errPass!=null}"><sup>*</sup>${errPass}</c:if>
                            </div>

                            <div class="wrap-input100 validate-input m-b-12">
                                <input class="input100" type="password" id="txtConfirmPassword" name="passconfirm" placeholder="Confirm password" required=""/>
                                <span class="focus-input100"></span>
                            </div>
                            <div>
                                <div class="registrationFormAlert" style="color:red;" id="CheckPasswordMatch">
                                </div>
                                <div class="m-b-19 fs-12" style="color: red">
                                <c:if test="${errConfirmPass!=null}"><sup>*</sup>${errConfirmPass}</c:if>
                                </div>

                                <div class="container-login100-form-btn">
                                    <input type="submit" class="login100-form-btn" value="Sign up"/>

                                </div>


                        </form>
                        <div class="flex-col-c p-t-100 p-b-40">
                          

                            <a href="http://localhost:8080/WA/Haven" class="txt3">
                                Back Home
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                function checkPasswordMatch() {
                    var password = $("#txtNewPassword").val();
                    var confirmPassword = $("#txtConfirmPassword").val();
                    if (password !== confirmPassword)
                        $("#CheckPasswordMatch").html("Passwords does not match!");
                    else
                        $("#CheckPasswordMatch").html("");
                }
                $(document).ready(function () {
                    $("#txtConfirmPassword").keyup(checkPasswordMatch);
                });
            </script>

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
