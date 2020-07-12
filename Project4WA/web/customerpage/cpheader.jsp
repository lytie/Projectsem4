<%-- 
    Document   : cpheader
    Created on : Jul 12, 2020, 5:03:09 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!-- Header -->
	<header>
		<!-- Header desktop -->
		<div class="wrap-menu-header gradient1 trans-0-4">
			<div class="container h-full">
				<div class="wrap_header trans-0-3">
					<!-- Logo -->
					<div class="logo">
						<a href="index.html">
                                                    <img src="images/icons/newlogo2.png" alt="IMG-LOGO" data-logofixed="images/icons/newlogo1.png">
						</a>
					</div>

					<!-- Menu -->
					<div class="wrap_menu p-l-45 p-l-0-xl">
						<nav class="menu">
							<ul class="main_menu">
								<li>
									<a href="index.jsp">Home</a>
								</li>
								<li>
									<a href="menu.jsp">Menu</a>
								</li>

								<li>
									<a href="servicesmenu.jsp">Entertainment</a>
								</li>

								<li>
									<a href="information.jsp">Your Information</a>
								</li>

								<li>
									<a href="cart.jsp">Your bill</a>
								</li>

								<li>
									<a href="contact.jsp">Feedback</a>
								</li>
							</ul>
						</nav>
					</div>

					<!-- Social -->
					<div class="social flex-w flex-l-m p-r-20">
						<a href="#"><i class="fa fa-tripadvisor" aria-hidden="true"></i></a>
						<a href="#"><i class="fa fa-facebook m-l-21" aria-hidden="true"></i></a>
						<a href="#"><i class="fa fa-twitter m-l-21" aria-hidden="true"></i></a>
						<a href="#" class="btn-show-sidebar m-l-33 trans-0-4">
							<i class="fa fa-shopping-cart" aria-hidden="true"></i>
							<span class="number">2</span>
						</a>
						<!--<button class="btn-show-sidebar m-l-33 trans-0-4"></button>-->
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- Sidebar -->
	<aside class="sidebar trans-0-4">
		<!-- Button Hide sidebar -->
		<button class="btn-hide-sidebar ti-close color0-hov trans-0-4"></button>

		<!-- - -->
		<ul class="menu-sidebar p-t-95 p-b-70">
			<form class="col-md-12" method="post">
				<div class="site-blocks-table">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th class="product-thumbnail">Image</th>
								<th class="product-name">Product</th>
								<th class="product-price">Price</th>
								<th class="product-quantity">Quantity</th>
								<th class="product-total">Total</th>
								<th class="product-remove">Remove</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="product-thumbnail">
									<img src="images/bg-intro-03.jpg" alt="Image" class="img-fluid">
								</td>
								<td class="product-name">
									<h2 class="h5 text-black">Top Up T-Shirt</h2>
								</td>
								<td>$49.00</td>
								<td>
									<div class="input-group mb-3" style="max-width: 120px;">
										<div class="input-group-prepend">
											<button class="btn btn-outline-warning js-btn-minus"
												type="button" >&minus;</button>
										</div>
										<input type="text" class="form-control text-center " value="1" placeholder=""
											aria-label="Example text with button addon"
											aria-describedby="button-addon1">
										<div class="input-group-append">
											<button class="btn btn-outline-warning js-btn-plus"
												type="button">&plus;</button>
										</div>
									</div>

								</td>
								<td class="full-price">$49.00</td>
								<td><a href="#" 
										class="btn btn-outline-danger height-auto btn-sm">X</a></td>
							</tr>

							<tr>
								<td class="product-thumbnail">
									<img src="images/bg-intro-03.jpg" alt="Image" class="img-fluid">
								</td>
								<td class="product-name">
									<h2 class="h5 text-black">Top Up T-Shirt</h2>
								</td>
								<td>$49.00</td>
								<td>
									<div class="input-group mb-3" style="max-width: 120px;">
										<div class="input-group-prepend">
											<button class="btn btn-outline-warning js-btn-minus"
												type="button" >&minus;</button>
										</div>
										<input type="text" class="form-control text-center " value="1" placeholder=""
											aria-label="Example text with button addon"
											aria-describedby="button-addon1">
										<div class="input-group-append">
											<button class="btn btn-outline-warning js-btn-plus"
												type="button">&plus;</button>
										</div>
									</div>

								</td>
								<td class="full-price">$49.00</td>
								<td><a href="#" 
										class="btn btn-outline-danger height-auto btn-sm">X</a></td>
							</tr>
                                                        <tr>
								<td class="product-thumbnail">
									<img src="images/bg-intro-03.jpg" alt="Image" class="img-fluid">
								</td>
								<td class="product-name">
									<h2 class="h5 text-black">Top Up T-Shirt</h2>
								</td>
								<td>$49.00</td>
								<td>
									<div class="input-group mb-3" style="max-width: 120px;">
										<div class="input-group-prepend">
											<button class="btn btn-outline-warning js-btn-minus"
												type="button" >&minus;</button>
										</div>
										<input type="text" class="form-control text-center " value="1" placeholder=""
											aria-label="Example text with button addon"
											aria-describedby="button-addon1">
										<div class="input-group-append">
											<button class="btn btn-outline-warning js-btn-plus"
												type="button">&plus;</button>
										</div>
									</div>

								</td>
								<td class="full-price">$49.00</td>
								<td><a href="#" 
										class="btn btn-outline-danger height-auto btn-sm">X</a></td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
		</ul>

		<!-- - -->
		<div class="gallery-sidebar">
			<!-- - -->
			<!-- Gallery -->
			<div class="row">
				<div class="col-md-12 pl-5">
					<div class="row ">
						<div class="col-md-12">
							<div class="row">
								<div class="col-md-12 text-center border-bottom mb-5">
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
										onclick="window.location='checkout.html'">Buy ticket</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="m-t-10 col-md-12">
					<div class="row">
						<div class="col-md-6 pl-5">
							<button class="btn btn-warning btn-sm btn-block" style="color: white;">Update Cart</button>
							
						</div>
						<div class="col-md-6">
							<button class="btn btn-warning btn-sm btn-block" style="color: white;">Continue Shopping</button>
					
						</div>
					</div >
					
				</div>
			</div>
					
		</div>
	</aside>
	<!-- Sidebar -->