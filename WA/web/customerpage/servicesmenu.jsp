<%-- 
    Document   : servicesmenu
    Created on : Jul 12, 2020, 5:29:19 PM
    Author     : Admin
--%>

<%@page import="entities.Service"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Menu</title>
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
    <section class="bg-title-page flex-c-m p-t-160 p-b-80 p-l-15 p-r-15" style="background-image: url(./images/customerpageimg/services-page-01.jpg);">
        <h2 class="tit6 t-center">
            Haven de luxe services
        </h2>
    </section>


    <!-- Main menu -->



    <!-- Lunch -->
    <section class="section-lunch bgwhite">
		<div class="container">
			<div class="row p-t-108 p-b-70">	
                            <%
                                List<Service> list = (List<Service>) request.getAttribute("list");
                                for (Service service : list) {
                            %>
                            <!-- Block3 -->
                            <div class="col-md-6 blo3 flex-w flex-col-l-sm m-b-30">
                                <div class="pic-blo3 size20 bo-rad-10 hov-img-zoom m-r-28">
                                    <a href="#"><img src="./images/customerpageimg/<%=service.getServiceurl()%>" alt="IMG-MENU"></a>
                                </div>

                                <div class="text-blo3 size21 flex-col-l-m">
                                    <a href="#" class="txt21 m-b-3">
                                        <%=service.getServiceName()%>
                                    </a>

                                    <span class="txt23">
                                        <%=service.getServiceDescription()%>
                                    </span>

                                    <span class="txt22 m-t-20">
                                        $<%=service.getServicePrice()%> <a href="SessionCartServlet?action=add&serviceid=<%=service.getServiceId()%>" class="btn btn-outline-warning "  >Add to orders</a>
                                    </span>
                                </div>

                            </div>
                            <%
                                }
                            %>   
			</div>
		</div>
	</section>

    <!-- Dinner -->

    <%@ include file="cpfooter.jsp" %>


    <!--===============================================================================================-->
    <%@ include file="jslink.jsp" %>

</body>
</html>
