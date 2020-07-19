<%-- 
    Document   : information
    Created on : Jul 12, 2020, 5:28:34 PM
    Author     : Admin
--%>


<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entities.Qrcode"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Gallery</title>
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
        <!--End of Tawk.to Script-->
    </head>
    <body class="animsition">

        <%@ include file="cpheader.jsp" %>

        <!-- Title Page -->
    <section class="bg-title-page flex-c-m p-t-160 p-b-80 p-l-15 p-r-15" style="background-image: url(./images/customerpageimg/bg-title-page-02.jpg);">
        <h2 class="tit6 t-center">
            Informations
        </h2>
    </section>

    <!-- Gallery -->
    <div class="section-gallery p-t-118 p-b-100">
        <form action="execute_payment" method="post">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h2 class="mb-3 t-center">Payment Done. Thank you ${payer.firstName} ${payer.lastName} for purchasing our service</h2>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <%@ include file="cpfooter.jsp" %>
    <!--===============================================================================================-->
    <%@ include file="jslink.jsp" %>

</body>
</html>

