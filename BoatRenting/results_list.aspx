﻿<%@ Page language="C#" CodeFile="results_list.aspx.cs" Inherits="BoatRenting.results_list_aspx_cs" Debug="true" %>
<%@ Import Namespace = "nce.adosql" %>
<%@ Import Namespace = "nce.scripting" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Results</title>
    <meta charset="utf-8">    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
    <meta name = "format-detection" content = "telephone=no" />
    <meta name="description" content="Your description">
    <meta name="keywords" content="Your keywords">
    <meta name="author" content="Your name">
    

    
    
    <!-- CSS STYLES -->
	<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	
    <link href="css/form.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />

    
	<!-- SCRIPTS -->
	<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <!--[if IE]><html class="ie" lang="en"> <![endif]-->
	
<%--	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
	
    --%>
     <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/jquery-ui.min.js" type="text/javascript"></script>
	<script src="js/superfish.min.js" type="text/javascript"></script>
	<script src="js/jquery.flexslider-min.js" type="text/javascript"></script>
	<script src="js/myscript.js" type="text/javascript"></script>
  
        <script>
        $(document).ready(function () {

            $('.list2 li a').hover(function () {
                $(this).stop().css({ color: '#b6b6b6' });
                $(this).parent().siblings('em').find('img').stop().css({ 'margin-top': '-7px' });
            }, function () {
                $(this).stop().css({ color: '#c11030' });
                $(this).parent().siblings('em').find('img').stop().css({ 'margin-top': 0 });
            })

            ////////////
           
        });

    </script>
    
    <script>
        $(function () {
            $("#datepicker1,#datepicker2").datepicker();
        });
    </script>
    
    
    
    <!--[if lt IE 9]>
    <div style='text-align:center'><a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode"><img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." /></a></div>  
    <script src="assets/assets/js/html5shiv.js"></script> 
    <script src="assets/assets/js/respond.min.js"></script>
  <![endif]-->

</head>
<body>
<!--==============================header=================================-->

<!-- HEADER -->
				
                
<header id="header">
<!-- TOP LINE -->
					<div class="full_width top_line clearfix">
						<div class="row">
                    		<div class="col-lg-12 col-sm-12" align="right"><a href="#members.aspx">Owner Sign In</a> <%--**##**| <a href="#">Renter Sign In</a>--%></div>
                        </div>
					</div><!-- //TOP LINE -->
                    

<div class="menu_block clearfix">
        <div class="navbar-brand"><img src="img/logo.png" alt="Rent A Boat"/></div>
        <!-- RESPONSIVE BUTTON MENU -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="glyphicon glyphicon-align-justify"></span>
							</button>
						</div><!-- //RESPONSIVE BUTTON MENU -->
                        
           <div class="navbar-collapse collapse">
							<ul class="nav navbar-nav">
                  <li><a href="index.aspx">HOME</a></li>
                  <li class="sub-menu"><a href="how_to_rent_a_boat.aspx">RENTERS<em class="indicator2"></em></a>
                       <ul>
                       		<li><a href="renter_faqs.aspx">FAQ's</a></li>
                          	<li><a href="how_to_rent_a_boat.aspx">How To Rent</a></li>
                           	<%--**##**<li class="last" ><a href="renters-sign-in.html">Sign In</a></li>--%>
                       </ul>
                  </li>
                  <li class="sub-menu" ><a href="facilities_mant.aspx">OWNERS<em class="indicator2"></em></a>
                  		<ul>
                            
							<li><a href="./admin/BoatOwnerSignup.aspx">List Your Boat</a></li> 
                            
                            <li><a href="owners-faqs.html">FAQ's</a></li>
                            <li><a class="last"  href="members.aspx">Sign in</a></li>
                        </ul>                                     
                  </li>
                  <li ><a href="about-us.html">ABOUT US</a></li>
                  <li class="sub-menu"><a href="how-It-works.html">HOW IT WORKS<em class="indicator2"></em></a>
                        <ul>
                          <li><a href="how-It-works.html">How it Works</a></li>
                          <li><a href="renting-vs-owning.html">Renting vs. Owning</a></li>
                          <li><a href="rental-tips.html">Rental Tips</a></li>
                          <li><a class="last" href="marine-liability-insurance.html">Marine Liability Insurance</a></li>
                        </ul>
                   </li>
                  <li><a href="contact_us.aspx">CONTACT US</a></li>
                </ul>
            </div>
        </div>  
       

<!--==============================content=================================-->

      <div class="container" >
      	<div class="row_header2" align="center" >
        	<h3  style="color:#fff;">Find Boat Rentals In Your Area Now!</h3>
              
                       <form id="search" runat="server">
                        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           <input placeholder="Where do you want to go?" name="s" type="text">
                              <%--<a href="#" class="btn btn-primary btn1 btn-search" ><span>search</span>--%>
                              <asp:Button ID="Button1" runat="server" Height="44px" Text="Search" 
                                 Width="86px" BackColor="#E90314" onclick="Button1_Click" />
                        <%--</a>--%>                    
                     &nbsp;</form>
      </div>         
	</div>

</header>
<!--==============================content=================================-->

    <!--==============================row_1=================================-->
<div class="container">
      <div class="row">
           <div class="col-lg-12 col-sm-12 padbot20">
             <h2>Search Results</h2>
             
             
             <!-- Search item -->
             
             <div class="boat-list-item">
             	<!--Image-->
             	<div class="boat-list-image">
		<img src="https://d2jh4nh0bx3cra.cloudfront.net/9021_get-attachment-1.aspx_tb.jpeg" alt="Suntracker Party Barge" />
   				</div>
                
                <!--overview-->
              	<div class="products-list-item-overview">
              		<h2><a href="">Suntracker Party Barge</a></h2>
                <p> Could have a small description here?</p>
                
             		<ul class="list-result">
             			<li>State<br><span class="boat-result">New York</span></li>
                		<li>City<br><span class="boat-result">Brookhaven</span></li>
                		<li>Year<br><span class="boat-result">1998</span></li>
                		<li>Make<br><span class="boat-result">Bayliner</span></li>
                		<li>Model<br><span class="boat-result">Open Bow</span></li>
                		<li>Category<br><span class="boat-result">Speed</span></li>
                		<li>Captain<br><span class="boat-result">Yes</span></li>
                	</ul>
                    <div style="clear:both"></div>
                </div>

				<!-- Price / BookNow -->
		
				<div class="products-price">				
					<span class="price-from-label">From&nbsp;USD</span>
					<span class="price">$299.00</span>
							
					<a class="btn-submit" href="">Book now!</a>
                </div>
    	</div>



<!-- Search item -->

<div style="clear:both"></div>


<!-- Search item -->
             
             <div class="boat-list-item">
             	<!--Image-->
             	<div class="boat-list-image">
		<img src="https://d2jh4nh0bx3cra.cloudfront.net/9021_SS-188-OB-GOF2754_3913_tb.jpg" alt="20&#039; Hurricane Bowrider" />
   				</div>
                
                <!--overview-->
              	<div class="products-list-item-overview">
              		<h2><a href="">Hurricane Bowrider</a></h2>
                <p> Could have a small description here?</p>
                
             		<ul class="list-result">
             			<li>State<br><span class="boat-result">New York</span></li>
                		<li>City<br><span class="boat-result">Brookhaven</span></li>
                		<li>Year<br><span class="boat-result">1998</span></li>
                		<li>Make<br><span class="boat-result">Bayliner</span></li>
                		<li>Model<br><span class="boat-result">Open Bow</span></li>
                		<li>Category<br><span class="boat-result">Speed</span></li>
                		<li>Captain<br><span class="boat-result">Yes</span></li>
                	</ul>
                    <div style="clear:both"></div>
                </div>

				<!-- Price / BookNow -->
		
				<div class="products-price">				
					<span class="price-from-label">From&nbsp;USD</span>
					<span class="price">$299.00</span>
							
					<a class="btn-submit" href="">Book now!</a>
                </div>
    	</div>



<!-- Search item -->

<div style="clear:both"></div>


<!-- Search item -->
             
             <div class="boat-list-item">
             	<!--Image-->
             	<div class="boat-list-image">
		<img src="https://d2jh4nh0bx3cra.cloudfront.net/9021_240family_tb.jpg" alt="26&#039; Sea Ray Bowrider" />
   				</div>
                
                <!--overview-->
              	<div class="products-list-item-overview">
              		<h2><a href="">Sea Ray Bowrider</a></h2>
                <p> Could have a small description here?</p>
                
             		<ul class="list-result">
             			<li>State<br><span class="boat-result">New York</span></li>
                		<li>City<br><span class="boat-result">Brookhaven</span></li>
                		<li>Year<br><span class="boat-result">1998</span></li>
                		<li>Make<br><span class="boat-result">Bayliner</span></li>
                		<li>Model<br><span class="boat-result">Open Bow</span></li>
                		<li>Category<br><span class="boat-result">Speed</span></li>
                		<li>Captain<br><span class="boat-result">Yes</span></li>
                	</ul>
                    <div style="clear:both"></div>
                </div>

				<!-- Price / BookNow -->
		
				<div class="products-price">				
					<span class="price-from-label">From&nbsp;USD</span>
					<span class="price">$299.00</span>
							
					<a class="btn-submit" href="">Book now!</a>
                </div>
    	</div>



<!-- Search item -->

<div style="clear:both"></div>

<br><br><br>






		






       </div>
   </div>
</div>    


<!-- FOOTER -->


				<footer class="full_width footer_block">
                <div class="container">
					<div class="row" >
						<div class="col-lg-3 col-sm-3 padbot20">
							<h2>Get in touch</h2>
							1-888-610-BOAT<br />
                            631-286-7816<br />
                            <a href="mailto:info@boatrenting.com">info@boatrenting.com</a><br><br>
                             <ul class="social">
							<li class="icon1"><a href="javascript:void(0);" alt=""></a></li>
							<li class="icon2"><a href="javascript:void(0);" alt=""></a></li>							
							<li class="icon4"><a href="javascript:void(0);" alt=""></a></li>
							<li class="icon5"><a href="javascript:void(0);" alt=""></a></li>
							<li class="icon6"><a href="javascript:void(0);" alt=""></a></li>
						</ul><!-- //SOCIAL ICONS -->
						</div>
                        
						<div class="col-lg-3 col-sm-3">
							<h2>Learn More</h2>
							<a href="rentwithus.aspx">How To List</a><br />
							<a href="how_to_rent_a_boat.aspx">How To Rent</a><br />
							<a href="owners-faqs.html">Owners FAQ's</a><br />
							<a href="renter_faqs.aspx">Renters FAQ's</a><br /> 							
						</div>
                        
						<div class="col-lg-3 col-sm-3">
							<h2>Company</h2>
							<a href="about-us.html">About</a><br />
							<a href="#">Press</a><br />
							<a href="#">Testimonials</a><br />
							<a href="#">Policies</a><br />							
						</div>
                        
                        <div class="col-lg-3 col-sm-3">
							<h2>Articles</h2>
							<a href="renting-vs-owning.html">Renting vs Owning</a><br />
							<a href="rental-tips.html">Rental Tips</a><br />
							<a href="marine-liability-insurance.html">Marine Liability Insurance</a><br />							
						</div>
					</div>
                    <div style="width:65%; margin-left:auto; margin-right:auto"><hr /></div>
                    <div class="row" >
                    	<div align="center">&copy; Copyright 2015 Rent a Boat RentABoat.com  | <a href="#">Privacy Policy</a><br>
                        631-286-7816  |  320 South Counrty Rd<br>Brookhaven NY 11719<br>

                    </div></div></div>
				</footer><!-- //FOOTER -->
				


</body>
</html>