<%-- 
    Document   : information
    Created on : Jul 12, 2020, 5:28:34 PM
    Author     : Admin
--%>

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

		<div class="container">
			<div class="row">
                <div class="col-md-4">
                    <img src="./images/customerpageimg/image.png" style="max-width: 100%;max-height: 100%;width: 100%" alt="">
                </div>
                <div class="col-md-8">
                    <div style="background-color: #dddddd40;height: 100%;" class=" p-md-4">
                        <h2 class="mb-3">Trịnh Thiêm Bảo</h2>
                        <div class="row">
                            <div class="p-3 col-md-6">
                                <p>CodeId: <span class="p-l-20">1QWERTTYUIOPASDFGHJKL</span></p>
                                <p>Phone: <span class="p-l-20">0234022645</span></p>
                                <p>Email: <span class="p-l-20">abc@gmail.com</span></p>
                                <p>Check-in Date: <span class="p-l-20">7/7/2020</span></p>
                                <p>Check-out Date: <span class="p-l-20">8/8/2020</span></p>
                            </div>
                            <div class="p-3 col-md-6">
                                <p>Room number: <span class="p-l-20">1</span></p>
                                <p>Number of adults: <span class="p-l-20">2</span></p>
                                <p>Number of children: <span class="p-l-20">0</span></p>
                                <p>Deposits: <span class="p-l-20">1500</span></p>
                            </div>
                        </div>        
                        <button class="btn" style="background-color: #dca73a;color: #fff; border-color:#dca73a ;"><a style="color: white;" href="cart.html">Click to see your bills</a></button>        
                    </div>  
                </div>
            </div>
		</div>

	</div>
	<%@ include file="cpfooter.jsp" %>
<!--===============================================================================================-->
	<%@ include file="jslink.jsp" %>

</body>
</html>

