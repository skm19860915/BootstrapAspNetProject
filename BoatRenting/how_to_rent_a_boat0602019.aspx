<%@ Page language="C#" CodeFile="how_to_rent_a_boat.aspx.cs" Inherits="BoatRenting.how_to_rent_a_boat_aspx_cs" %>
<%@ Import Namespace = "Microsoft.VisualBasic" %>
<%@ Import Namespace = "nce.adosql" %>
<%@ Register Src="~/ctlSearch.ascx" TagPrefix="uc1" TagName="ctlSearch" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <title>How to Rent a Boat - RentABoat</title>
    <meta charset="utf-8">    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
    <meta name = "format-detection" content = "telephone=no" />
    <meta name="description" content="Renters worldwide who are looking for boat rentals can reserve a boat in seconds. Search sailboats, pontoon boats, charter boats, houseboats, and more.">
    <meta name="keywords" content="Your keywords">
    <meta name="author" content="Your name">
    
    <!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-872206-2"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-872206-2');
</script>

    
    
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
    
   
    <script type='text/javascript'>
window.__lo_site_id = 153732;

	(function() {
		var wa = document.createElement('script'); wa.type = 'text/javascript'; wa.async = true;
		wa.src = 'https://d10lpsik1i8c69.cloudfront.net/w.js';
		var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(wa, s);
	  })();
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
                    		<div class="col-lg-12 col-sm-12" align="right"><div class="col-lg-12 col-sm-12" align="right"><a href="admin/BoatOwnerSignup.aspx">List Your Boat /</a>&nbsp&nbsp
<a href="MemberSignIn.aspx"> Sign In</a> <!--**##**| <a href="#">Renter Sign In</a>--></div>
                        </div>
					</div><!-- //TOP LINE -->
                    

<div class="menu_block clearfix">
        
        <div class="navbar-brand"><a href="http://www.rentaboat.com/"><img src="img/logo.png" alt="Rent A Boat"/></a></div>
        <!-- RESPONSIVE BUTTON MENU -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="glyphicon glyphicon-align-justify"></span>
							</button>
						</div><!-- //RESPONSIVE BUTTON MENU -->
                        
           <div class="navbar-collapse collapse">
							<ul class="nav navbar-nav">
                  <li><a href="index.aspx">HOME</a></li>
                  <li class="sub-menu" class="active"><a>RENTERS<em class="indicator2"></em></a>
                       <ul>
                       		<li><a href="renter_faqs.aspx">FAQ's</a></li>
                          	<li class="active"><a class="active" href="how_to_rent_a_boat.aspx">How To Rent</a></li>
                           	<!--**##**<li class="last" ><a href="renters-sign-in.html">Sign In</a></li>-->
                       </ul>
                  </li>
                  <li class="sub-menu" ><a>LIST YOUR BOAT<em class="indicator2"></em></a>
                  		<ul>
                           
							<li><a href="./admin/BoatOwnerSignup.aspx">List Your Boat</a></li> 
                            
                            <li><a href="owners-faqs.html">FAQ's</a></li>
                            <li><a class="last"  href="MemberSignIn.aspx">Sign in</a></li>
                        </ul>                                     
                  </li>
                  <li ><a href="about-us.html">ABOUT US</a></li>
                  <li class="sub-menu"><a>HOW IT WORKS<em class="indicator2"></em></a>
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
     <form runat="server" id="frmSearch">
     <div class="container" >
      	<div class="" align="center" >
        <h1 class="white" >How to Rent a Boat</h1>
		   		<div style="width:65%; margin-left:auto; margin-right:auto"><hr /></div>
        
        	<h3  style="color:#fff;">Search for boat rentals in your area!</h3>
              
                 <%--       <form id="search" runat="server">
                        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           <input placeholder="Where do you want to go?" name="s" type="text">
                              <asp:Button ID="Button1" runat="server" Height="44px" Text="Search" 
                                 Width="86px" BackColor="#E90314" onclick="Button1_Click" />
                     &nbsp;
            </form>  --%>

              <uc1:ctlSearch runat="server" ID="ctlSearch" />

               
            <img src="images/552fcc396d555.png" width="865" style="max-width:865px; width:100%">
            
            <div class="row" >
              <div class="col-lg-12 col-sm-12 padbot20">
               <h2 style="color:#fff; font-size:24px;">Easily find your perfect boat in the best locations worldwide with our boat rental network. Choose from hundreds of boats of all kinds.</h2> 
            </div></div>       
      </div>         
	</div>


   </form>
</header>
<!--==============================content=================================-->

    <!--==============================row_1=================================-->
<div class="container">
      <div class="row">
           <div class="col-lg-12 col-sm-12 padbot20">
            <div align="Left"><h2>Why rent from us</h2></div>
      <p>Rentaboat.com lets you easily search for the perfect boat rental in the most popular destinations with real time availability, current photos, boat rental rates and more. It’s up to you if you want a captain or guide as most of our rental boats are available with or without one.</p>
           

         
            <div align="Left"><h2>How to rent a boat</h2></div>
            <h3 class="red">Search boats</h3>
<p>Start by searching for boat rentals in your preferred area. Review boat details, current photos, rates, star ratings, and booking requirements.</p>

<h3 class="red">Book a boat</h3>
<p>Once you find your perfect match, request to book that boat! Once you request to book, you will receive the boat owner/facilities contact information which allows you to communicate with them directly! </p>

<h3 class="red">Set sail</h3>
<p>After your booking request is confirmed, arrive at the rental location and sail away on your rental boat!</p>

<h3 class="red">Complete your profile</h3>
<p>After booking your first boat on RentABoat.com, you will receive a renter profile. Sign in using your email and password to view past and present rentals with us! You can also upload a photo and write a short bio to help boat owners get to know you before renting their boat! If you're already a boater, make sure you fill out your boating information and experiences. </p>

             
            <div align="Left"><h2>5 steps to reserve</h2></div>
            <ol>
            	<li> Choose a location</li>
                <li> Choose your perfect boat</li>
                <li> Choose your time/date </li>
                <li> Enter your information </li>
                <li> Receive confirmation from the boat owner</li>
                </ol>
             
            <div align="Left"><h2>Contact us</h2></div>
            <p>Please <a href="renter_faqs.aspx" data-url="renters-faqs">click here</a> for more information or feel free to contact RentABoat.com! Give us a call at 631-286-7816 or send us an email at <a href="mailto:info@rentaboat.com">Info@RentABoat.com</a>! We would love to hear from you!</p>

       <br><br>
       </div>
       </div>
       <!--**##**<div align="center">*You do not have to sign up to view boats!</div>
       
	<div class="row">
        <div class="col-lg-2 col-sm-2 padbot20"></div>
        <div class="col-lg-4 col-sm-4 padbot20">
       <div class="boat-page-overview">
            <h2 class="red">Returning Customer</h2>
             <form id="contact-form" class="contact-form"><fieldset>
            <div class="control-group">
  
    <input id="" name="" placeholder="User Name" class="input-xlarge" type="text">
</div>
<div class="control-group">

    <input id="" name="" placeholder="Password" class="input-xlarge" type="text">
</div>
<div style="clear:both;"></div>
<div class="btns" align="right">
                        <a href="#" data-type="submit" class="btn3 ">Request to Book</a>
                      </div>
</fieldset></form>

		</div>
</div>
<div class="col-lg-4 col-sm-4 padbot20">
<div class="boat-page-overview">
		<h2 class="red">NEW Customer</h2>
             <form id="contact-form" class="contact-form"><fieldset>
            <div class="control-group">

    <input id="" name="" placeholder="First Name" class="input-xlarge" type="text">
</div>
<div class="control-group">

    <input id="" name="" placeholder="Last Name" class="input-xlarge" type="text">
    </div>
<div class="control-group">

    <input id="" name="" placeholder="Email" class="input-xlarge" type="text">
</div>
<div class="control-group">

    <input id="" name="" placeholder="Password" class="input-xlarge" type="text">
</div>
<div class="control-group">

    <input id="" name="" placeholder="Confirm Password" class="input-xlarge" type="text">
</div>
<div style="clear:both;"></div>
<div class="btns" align="right">
                        <a href="#" data-type="submit" class="btn3 ">Request to Book</a>
                      </div>
</fieldset></form>-->
</div>
</div>

<div class="col-lg-2 col-sm-2 padbot20"></div>

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
                            <a href="mailto:Info@RentABoat.com">Info@RentABoat.com</a><br><br>
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
							<a href="admin/BoatOwnerSignup.aspx">How To List</a><br />
							<a href="how_to_rent_a_boat.aspx">How To Rent</a><br />
							<a href="owners-faqs.html">Owners FAQ's</a><br />
                            <a href="renter_faqs.aspx">Renters FAQ's</a><br /> 							
						</div>
                        
						<div class="col-lg-3 col-sm-3">
							<h2>Company</h2>
							<a href="about-us.html">About</a><br />
							<a href="news.html">Press</a><br />
							<a href="#">Testimonials</a><br />
							<a href="termsconditions.aspx">Policies</a><br />							
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
				


	<script>

	    window.onload = function () {
	        document.getElementById("ctlSearch_txtSearch" />").focus();
	    };
	</script>

</body>
</html>