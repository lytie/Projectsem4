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
        <title>Haven - SignUp</title>
	
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
                            <form class="login100-form validate-form p-l-55 p-r-55 p-t-178" action="Booking_signUpServlet" method="post">
					<span class="login100-form-title">
						Sign Up
					</span>

					<div class="wrap-input100 validate-input m-b-12" >
                                            <input class="input100" type="text" name="name" placeholder="Full Name" value="${name}"/>
						<span class="focus-input100"></span>
					</div>
                                  
             
					<div class="m-b-10 fs-12" style="color: red">
                                            <c:if test="${errName!=null}"><sup>*</sup>${errName}</c:if>
                                            
					</div>
					<div class="wrap-input100 validate-input m-b-12" >
                                            <input class="input100" type="email" name="email" placeholder="Email" value="${email}"/>
						<span class="focus-input100"></span>
					</div>
					<div class="m-b-10 fs-12" style="color: red">
                                            <c:if test="${errEmail!=null}"><sup>*</sup>${errEmail}</c:if>
                                            
					</div>
					<div class="wrap-input100 validate-input m-b-12" >
                                            <input class="input100" type="text" name="phone" placeholder="Phone" value="${phone}">
						<span class="focus-input100"></span>
					</div>
					<div class="m-b-10 fs-12" style="color: red">
                                            <c:if test="${errPhone!=null}"><sup>*</sup>${errPhone}</c:if>
					</div>
					<div class="wrap-input100 validate-input m-b-12">
                                            <input class="input100" type="password" name="pass" placeholder="Password" >
						<span class="focus-input100"></span>
					</div>
					<div class="m-b-10 fs-12" style="color: red">
                                            <c:if test="${errPass!=null}"><sup>*</sup>${errPass}</c:if>
					</div>

					<div class="wrap-input100 validate-input m-b-12">
                                            <input class="input100" type="password" name="passconfirm" placeholder="Confirm password" >
						<span class="focus-input100"></span>
					</div>
					<div class="m-b-19 fs-12" style="color: red">
                                            <c:if test="${errConfirmPass!=null}"><sup>*</sup>${errConfirmPass}</c:if>
					</div>

					<div class="container-login100-form-btn">
                                            <input type="submit" class="login100-form-btn" value="Sign up"/>
						
					</div>

					
				</form>
                                        <div class="flex-col-c p-t-100 p-b-40">
						<a href="http://localhost:8080/WA/Login" class="txt1 p-b-9">
							Have an account? <span class="txt3">Sign In</span>
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
    </body>
</html>
