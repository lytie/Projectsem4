<%-- 
    Document   : cpheader
    Created on : Jul 12, 2020, 5:03:09 PM
    Author     : Admin
--%>

<%@page import="entities.Service"%>
<%@page import="entities.Item"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!-- Header -->
<header>
    <!-- Header desktop -->
    <div class="wrap-menu-header gradient1 trans-0-4"style="height: 130px">
        <div class="container h-full">
            <div class="wrap_header trans-0-3" >
                <!-- Logo -->
                <div class="logo">
                    <a href="index.html">
                        <img src="./images/customerpageimg/icons/newlogo2.png" alt="IMG-LOGO" data-logofixed="./images/customerpageimg/icons/newlogo1.png">
                    </a>
                </div>

                <!-- Menu -->
                <div class="wrap_menu p-l-30 p-l-0-xl">
                    <nav class="menu">
                        <ul class="main_menu">
                            <li>
                                <a href="CustomerPageIndexServlet">Home</a>
                            </li>
                            <li>
                                <a href="CustomerPageMenuServlet">Menu</a>
                            </li>

                            <li>
                                <a href="CustomerPageServicesMenuServlet">Entertainment</a>
                            </li>

                            <li>
                                <a href="CustomerPageInformationServlet">Your Information</a>
                            </li>
                            <li>
                                <a href="CustomerPageTicketServlet">Your Ticket</a>
                            </li>
                            <li>
                                <a href="CustomerPageCartServlet">Your bill</a>
                            </li>
                            <li>
                                <a href="CustomerPageContactServlet">Feedback</a>
                            </li>
                            <li>
                                <div class="social flex-w flex-l-m p-r-20">
                                    <a href="#"><i class="fa fa-tripadvisor" aria-hidden="true"></i></a>
                                    <a href="#"><i class="fa fa-facebook m-l-21" aria-hidden="true"></i></a>
                                    <a href="#"><i class="fa fa-twitter m-l-21" aria-hidden="true"></i></a>
                                    <a href="#" class="btn-show-sidebar m-l-33 trans-0-4">
                                        <i class="fa fa-shopping-cart" aria-hidden="true"></i>

                                        <%
                                            int itemnum = 0;
                                            if (session.getAttribute("cart") != null) {

                                                List<Item> cart = (List<Item>) session.getAttribute("cart");
                                                for (Item item : cart) {
                                                    itemnum++;
                                                }
                                            }
                                        %>
                                        <span class="number"><%=itemnum%></span>
                                    </a>
                                    <!--<button class="btn-show-sidebar m-l-33 trans-0-4"></button>-->
                                </div>
                            </li>
                        </ul>
                    </nav>
                </div>

            </div>
        </div>
    </div>
</header>

<!-- Sidebar -->
<aside class="sidebar trans-0-4" ">
    <form action="SessionCartServlet">
        <!-- Button Hide sidebar -->
        <div class="btn-hide-sidebar ti-close color0-hov trans-0-4"></div>

        <!-- - -->
        <ul class="menu-sidebar p-t-95 p-b-70">
            <div class="col-md-12">
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
                            <%
                                float sessiontotal = 0;
                                float sessionsubtotal = 0;
                                float sessiontax = 0;
                                if (session.getAttribute("cart") != null) {
                                    List<Item> cart = (List<Item>) session.getAttribute("cart");
                                    for (Item item : cart) {
                                        sessionsubtotal += item.getService().getServicePrice() * item.getQuantity();
                                        sessiontax = sessionsubtotal * 10 / 100;
                                        sessiontotal = sessionsubtotal + sessiontax;

                            %>
                            <tr>
                        <input type="hidden" value="<%=item.getService().getServiceId()%>"/>
                        <td class="product-thumbnail">
                            <img src="./images/customerpageimg/<%= item.getService().getServiceurl()%>" alt="Image" class="img-fluid">
                        </td>
                        <td class="product-name">
                            <h2 class="h5 text-black"><%= item.getService().getServiceName()%></h2>
                        </td>
                        <td>$<%= item.getService().getServicePrice()%></td>
                        <td>
                            <div class="input-group mb-3" style="max-width: 120px;">
                                <div class="input-group-prepend">   
                                    <button class="btn btn-outline-warning js-btn-minus"
                                            type="button" >&minus;</button>
                                </div>
                                <input type="text" readonly name="quantity<%=cart.indexOf(item)%>" class="form-control text-center " value="<%=item.getQuantity()%>" placeholder=""
                                       aria-label="Example text with button addon"
                                       aria-describedby="button-addon1">
                                <div class="input-group-append">
                                    <button class="btn btn-outline-warning js-btn-plus"
                                            type="button">&plus;</button>
                                </div>
                            </div>
                        </td>
                        <td class="full-price">$<%= item.getService().getServicePrice() * item.getQuantity()%></td>
                        <td><a href="SessionCartServlet?action=remove&serviceid=<%=item.getService().getServiceId()%>" onclick="return confirm('Do you want to remove this ?')"
                               class="btn btn-outline-danger height-auto btn-sm">X</a></td>
                        </tr>
                        <%
                                }
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
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
                                    <strong class="text-black">$<%=sessionsubtotal%></strong>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <span class="text-black">Tax</span>
                                </div>
                                <div class="col-md-6 text-right">
                                    <strong class="text-black">$<%=sessiontax%></strong>
                                </div>
                            </div>
                            <div class="row mb-5">
                                <div class="col-md-6">
                                    <span class="text-black">Total</span>
                                </div>
                                <div class="col-md-6 text-right">
                                    <strong class="text-black">$<%=sessiontotal%></strong>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <button class="btn btn-warning btn-lg btn-block" style="color: white;"
                                            type="submit" name="action" value="confirm">Buy</button>
                                </div>
                                <div class="col-md-6">
                                    <button type="submit" name="action" value="update" class="btn btn-warning btn-sm btn-block" style="color: white;">Update Cart</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </form>
</aside>
<!-- Sidebar -->