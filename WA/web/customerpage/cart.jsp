<%-- 
    Document   : cart
    Created on : Jul 12, 2020, 5:24:10 PM
    Author     : Admin
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entities.Qrcode"%>
<%@page import="entities.Receiptcomponent"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Reservation</title>
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
    <section class="bg-title-page flex-c-m p-t-160 p-b-80 p-l-15 p-r-15"
             style="background-image: url(./images/customerpageimg/bg-title-page-02.jpg);">
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
                                    </tr>
                                </thead>
                                <tbody>
                                    <%                                        
                                        float subtotal = 0;
                                        float tax = 0;
                                        float total = 0;
                                        SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
                                        Qrcode qrcode = (Qrcode) request.getAttribute("qrcode");
                                        List<Receiptcomponent> list = (List<Receiptcomponent>) request.getAttribute("list");
                                        for (Receiptcomponent receiptcomponent : list) {
                                            subtotal += receiptcomponent.getSubtotal();
                                            tax = subtotal * 10 / 100;
                                            total = subtotal + tax;
                                    %>
                                    <tr class="product">
                                        <td class="product-thumbnail cart-row">
                                            <%=format.format(receiptcomponent.getOrderDate())%>
                                        </td>
                                        <td class="product-name cart-row">
                                            <h2 class="h5 text-black"><%=receiptcomponent.getComponentName()%></h2>
                                        </td>
                                        <td class="cart-price cart-row">$<%=receiptcomponent.getPrice()%></td>
                                        <td class="cart-row">
                                            x<%=receiptcomponent.getQuantity()%>
                                        </td>
                                        <td class="product-line-price cart-row">$<%=receiptcomponent.getSubtotal()%></td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </form>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <h2 class="m-b-20">Scan qr code to pay your bill</h2>
                        <img src="./images/customerpageimg/image.png" style="max-width: 100%;max-height: 100%" alt="lunch-04"/>

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
                                        <strong class="text-black">$<%=subtotal%></strong>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <span class="text-black">Tax</span>
                                    </div>
                                    <div class="col-md-6 text-right">
                                        <strong class="text-black">$<%=tax%></strong>
                                    </div>
                                </div>
                                <div class="row mb-5">
                                    <div class="col-md-6">
                                        <span class="text-black">Deposits</span>
                                    </div>
                                    <div class="col-md-6 text-right">
                                        <strong class="text-black">$<%=qrcode.getDeposits()%></strong>
                                    </div>
                                </div>
                                <div class="row mb-5">
                                    <div class="col-md-6">
                                        <span class="text-black">Total</span>
                                    </div>
                                    <div class="col-md-6 text-right">
                                        <strong class="text-black">$<%=total-qrcode.getDeposits()%></strong>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <button class="btn btn-warning btn-lg btn-block" style="color: white;">
                                            <a href="AuthorizePaymentServlet?id=<%=qrcode.getQrCodeId()%>">Proceed To Checkout</a>
                                        </button>
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
    <%@ include file="jslink.jsp" %>



</body>

</html>
