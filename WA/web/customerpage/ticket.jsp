<%-- 
    Document   : ticket
    Created on : Jul 22, 2020, 7:45:09 PM
    Author     : Admin
--%>
<%@page import="entities.Ticket"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Your Ticket</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->
        <%@ include file="csslink.jsp" %>
        <!--===============================================================================================-->
        <!--Start of Tawk.to Script-->
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

        <!-- Header -->
        <%@ include file="cpheader.jsp" %>

        <!-- Title Page -->
    <section class="bg-title-page flex-c-m p-t-160 p-b-80 p-l-15 p-r-15" style="background-image: url(./images/customerpageimg/bg-title-page-02.jpg);">
        <h2 class="tit6 t-center">
            Your Ticket
        </h2>
    </section>



    <!-- Gallery -->
    <div class="section-gallery p-t-118 p-b-100">

        <div class="wrap-gallery isotope-grid flex-w p-l-25 p-r-25">
            <!-- - -->
            <%
                    List<Ticket> list = (List<Ticket>) request.getAttribute("list");
                    for (Ticket ticket : list) {
            %>
            <div class="item-gallery isotope-item bo-rad-10 hov-img-zoom">
                <h2 class="t-center m-b-20"><%=ticket.getTicketName()%>-Left:<%=ticket.getQuantity()%></h2>
                <img src="./images/ticket/<%=ticket.getTicketUrl()%>" alt="IMG-GALLERY">

                <div class="overlay-item-gallery trans-0-4 flex-c-m">
                    <a class="btn-show-gallery flex-c-m fa fa-search" href="./images/ticket/<%=ticket.getTicketUrl()%>" data-lightbox="gallery"></a>
                </div>
            </div>
            <%
            }
            %>
        </div>
    </div>


    <!-- Footer -->
    <%@ include file="cpfooter.jsp" %>

    <!--===============================================================================================-->
    <%@ include file="jslink.jsp" %>

</body>
</html>

