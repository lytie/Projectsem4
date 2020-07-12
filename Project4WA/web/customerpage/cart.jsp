<%-- 
    Document   : cart
    Created on : Jul 12, 2020, 5:24:10 PM
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
	<title>Reservation</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--===============================================================================================-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
	<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="images/icons/favicon.png" />
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/themify/themify-icons.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/lightbox2/css/lightbox.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" type="text/css" href="css/cart.css">
	<!--===============================================================================================-->
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
</head>

<body class="animsition">

	<%@ include file="cpheader.jsp" %>

	<!-- Title Page -->
	<section class="bg-title-page flex-c-m p-t-160 p-b-80 p-l-15 p-r-15"
		style="background-image: url(images/bg-title-page-02.jpg);">
		<h2 class="tit6 t-center">
			Your Order
		</h2>
	</section>


	<!-- Reservation -->
	<section class="section-reservation bg1-pattern p-t-100 p-b-113">
		<div class="site-section">
			<div class="container">
				<div class="row mb-5">
					<form class="col-md-12" method="post">
						<div class="site-blocks-table">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th class="product-thumbnail">Order Date</th>
										<th class="product-name">Product</th>
										<th class="product-price">Price</th>
										<th class="product-quantity">Quantity</th>
										<th class="product-total">Total</th>
										<th class="product-remove">Remove</th>
									</tr>
								</thead>
								<tbody>
									<tr class="product">
										<td class="product-thumbnail cart-row">
											07/07/2020 15:00
										</td>
										<td class="product-name cart-row">
											<h2 class="h5 text-black">Top Up T-Shirt</h2>
										</td>
										<td class="cart-price cart-row">$49.00</td>
										<td class="cart-row">
											x5
										</td>
										<td class="product-line-price cart-row">$49.00</td>
										<td class="cart-row"><a href="#"
												class="btn btn-outline-danger height-auto btn-sm">X</a></td>
									</tr>

									<tr class="product">
										<td class="product-thumbnail cart-row">
											07/07/2020 15:00
										</td>
										<td class="product-name cart-row">
											<h2 class="h5 text-black">Top Up T-Shirt</h2>
										</td>
										<td class="cart-price cart-row">$49.00</td>
										<td class="cart-row">
											x5
										</td>
										<td class="product-line-price cart-row">$49.00</td>
										<td class="cart-row"><a href="#"
												class="btn btn-outline-danger height-auto btn-sm">X</a></td>
									</tr>
									
								</tbody>
							</table>
						</div>
					</form>
				</div>

				<div class="row">
					<div class="col-md-6">
                                            <h2 class="m-b-20">Scan qr code to pay your bill</h2>
                                                <img src="../images/image.png" style="max-width: 100%;max-height: 100%" alt="lunch-04"/>
                                
					</div>
					<div class="col-md-6 pl-5">
						<div class="row justify-content-end">
							<div class="col-md-7">
								<div class="row">
									<div class="col-md-12 text-right border-bottom mb-5">
										<h3 class="text-black h4 text-uppercase">Cart Totals</h3>
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-md-6">
										<span class="text-black">Subtotal</span>
									</div>
									<div class="col-md-6 text-right">
										<strong class="text-black">$230.00</strong>
									</div>
								</div>
								<div class="row mb-5">
									<div class="col-md-6">
										<span class="text-black">Total</span>
									</div>
									<div class="col-md-6 text-right">
										<strong class="text-black">$230.00</strong>
									</div>
								</div>

								<div class="row">
									<div class="col-md-12">
										<button class="btn btn-warning btn-lg btn-block" style="color: white;"
											onclick="window.location='checkout.html'">Proceed To Checkout</button>
									</div>
								</div>
							</div>
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
	<script type="text/javascript" src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/bootstrap/js/popper.js"></script>
	<script type="text/javascript" src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/daterangepicker/moment.min.js"></script>
	<script type="text/javascript" src="vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/slick/slick.min.js"></script>
	<script type="text/javascript" src="js/slick-custom.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/parallax100/parallax100.js"></script>
	<script type="text/javascript">
		$('.parallax100').parallax100();
	</script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/lightbox2/js/lightbox.min.js"></script>
	<!--===============================================================================================-->
	<script src="js/main.js"></script>
	
	<script type="text/javascript">

		var sitePlusMinus = function () {
			$('.js-btn-minus').on('click', function (e) {
				e.preventDefault();
				if ($(this).closest('.input-group').find('.form-control').val() != 0) {
					$(this).closest('.input-group').find('.form-control').val(parseInt($(this).closest('.input-group').find('.form-control').val()) - 1);
				} else {
					$(this).closest('.input-group').find('.form-control').val(parseInt(0));
				}
			});
			$('.js-btn-plus').on('click', function (e) {
				e.preventDefault();
				$(this).closest('.input-group').find('.form-control').val(parseInt($(this).closest('.input-group').find('.form-control').val()) + 1);
			});
		};
		sitePlusMinus();
	</script>

</body>

</html>
