<%@ Page language="C#" CodeFile="facility.aspx.cs" Inherits="BoatRenting.facility_aspx_cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
<head>
   <!-- Required meta tags -->
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css">
   <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400&family=Poppins:wght@600;700;800;900&display=swap" rel="stylesheet">
   <link href="css/menu.css" rel="stylesheet">
   <link href="css/styleN.css" rel="stylesheet">
   <link href="css/facility.css" rel="stylesheet">
   <title>Welcome to BoatRenting.com!</title>
 
</head>
<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">

<script src="http://www.google-analytics.com/urchin.js" type="text/java_script">
</script>
<form id="frmHowToRent" runat="server">
   <header id="topnav" class="darkheader defaultscroll fixed-top sticky">
   <div class="container-fluid pl-3 pr-3 pl-lg-4 pr-lg-4 pl-xl-5 pr-xl-5 mt-3">
       <!-- Logo container-->
       <div class="grid-on-mobile">
           <div>
               <a href="index.aspx" class="logo text-uppercase">
                   <img src="images/logo-light.png" alt="" class="logo-light" height="50" />
                   <img src="images/logo-dark.png" alt="" class="logo-dark" height="50" />
               </a>
           </div>
           <!-- End Logo container-->
           <div class="">
           <div class="menu-extras">
               <div class="menu-item">
                   <!-- Mobile menu toggle-->
                   <a class="navbar-toggle">
                       <div class="lines">
                           <span><i class="fas fa-bars"></i></span>
                       </div>
                   </a>
               <!-- End mobile menu toggle-->
               </div>
           </div>
               <div id="navigations">
               <ul class="navigation-menu">
                       <li class="">
                       <a href="index.aspx" >Home</a>
                   </li>
                   <li class="active nav-item dropdown">
                       <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">RENT a Boat</a>
                       <div class="dropdown-menu sub-menu" aria-labelledby="navbarDropdown2">
                           <a class="dropdown-item" href="how_to_rent_a_boat.aspx" >How To Rent</a>
                           <a class="dropdown-item" href="renter_faqs.aspx" >Renter FAQ's</a>
                           
                       </div>
                   </li>

                   <li class="nav-item dropdown">
                       <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown3" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">LIST YOUR BOAT</a>
                       <div class="dropdown-menu sub-menu" aria-labelledby="navbarDropdown2">
                       <a class="dropdown-item" href="how-It-works.aspx" >How it Works</a>
                       <a class="dropdown-item" href="./admin/BoatOwnerSignup.aspx" >List Your Boat</a>
                       <a class="dropdown-item" href="owners-faqs.aspx" >Owner FAQ's</a>
                       <a class="dropdown-item" href="marine-liability-insurance.aspx" >Marine Liability Insurance</a>
                       </div>
                   </li>
                   <li class="nav-item dropdown ">
                       <a class="nav-link dropdown-toggle" href="how-It-works.html" id="navbarDropdown4" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">WHY RENTING</a>
                       <div class="dropdown-menu sub-menu" aria-labelledby="navbarDropdown2">
                       <a class="dropdown-item" href="renting-vs-owning.aspx" >Renting vs. Owning</a>
                       <a class="dropdown-item" href="rental-tips.aspx" >Rental Tips</a>
                       
                       </div>
                   </li>
                   <li class="">
                       <a href="about-us.aspx" >ABOUT US</a>
                   </li>
                   <li class="">
                       <a href="contact_us.aspx" >Contact Us</a>
                   </li>
                   <li class="">
                       <button data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-custom align-nav" style="padding: 8px 25px;margin-top: 22px;" onclick="javascript:return false;">SIGN IN</button>
                   </li>
               </ul>
           </div>
               <div class="searchbar">
                   <div class="text-center search-form">
                       <div  class="form-on-scroll">
                           <input type="text" placeholder="Where would you like to go boating?" runat="server" id="txtSearch" >
                           <button type="submit" class="btn btn-custom-search" runat="server" id="btnSearch" onserverclick="btnSearch_Click"> <i class="fas fa-search pr-0 pr-lg-2"></i> <span class="d-none d-lg-inline">SEARCH</span></button>
                       </div>
                       <div class="menu-on-scroll">
                           <button class="btn btn-custom align-nav" data-toggle="modal" data-target="#exampleModalCenter" onclick="javascript:return false;">SIGN IN</button>
                       </div>
                   </div>
               </div>
           </div>
       </div>
       <asp:Label ID="lblMessage" runat="server"></asp:Label>
                       <asp:HiddenField ID="txtStreetName" runat="server" />
                       <asp:HiddenField ID="txtCityName" runat="server" />
                       <asp:HiddenField ID="txtState" runat="server" />
                       <asp:HiddenField ID="txtZipCode" runat="server" />
                       <asp:HiddenField ID="txtCountry" runat="server" />

                       <asp:HiddenField ID="txtLat" runat="server" />
                       <asp:HiddenField ID="txtLon" runat="server" />
                       <asp:HiddenField ID="txtSelectedBoatId" runat="server" />
                       <asp:HiddenField ID="txtSelectedMarinaId" runat="server" />
                       <asp:HiddenField ID="txtSelectedRating" runat="server" />
   </div>
   </header>

   <section id="service" class="section pb-4">
       <div class="container">
           <div class="row">
               <div class="col-lg-12 col-sm-12 padbot20">
                  <br>
               <h2 style="font-family: Verdana, sans-serif; font-size: 24px; line-height: 30px; font-weight: 200; color: #4CAEB8;">Search Results</h2>
               <!-- Search item -->
                   <div>
                       <div style="float:right">
                       </div>
                   </div>
                   <div class="boat-list-item">
                   <!--Image-->
                   <div class="boat-list-image">
                           <a class="" href="javascript:gotoDetails('2932','124','1')">
           <img src="./boats/124_2932_0.jpg" alt="Test">
                       </a>
                   </div>
                   
                   <!--overview-->
                   <div class="products-list-item-overview">
                       <h2><ahref='javascript:gotodetails(&#39;2932&#39;,&#39;124&#39;,&#39;1&#39;)'>  test</ahref='javascript:gotodetails(&#39;2932&#39;,&#39;124&#39;,&#39;1&#39;)'></h2>
               <p>   Speed</p>
               
                   <ul class="list-result">
                       <li>State<br><span class="boat-result">  New York</span></li>
                       <li>City<br><span class="boat-result">  BLUE POINT</span></li>
                       <li>Zip<br><span class="boat-result">  11715</span></li>
                       <li>Body Of Water<br><span class="boat-result">  </span></li>
                       <li>Year<br><span class="boat-result">  </span></li>
                       <li>Make<br><span class="boat-result">  test</span></li>
                       <li>Model<br><span class="boat-result">  test</span></li>
                       
                   </ul>
                   <div style="clear:both"></div>
                   </div>
                   <!-- Price / BookNow -->
                   <div class="products-price">				
                       <span class="price-from-label">From&nbsp;USD</span>
                       <span class="price"> $10.00 </span>
                               
                       <a class="btn-submit" href="javascript:gotoDetails('2932','124','1')">Book now!</a>
                   </div>
           </div>
   
   
   
   <div style="clear:both"></div>
                   <div class="boat-list-item">
                   <!--Image-->
                   <div class="boat-list-image">
                           <a class="" href="javascript:gotoDetails('106','124','1')">
           <img src="./boats/result_106.jpg" alt="kennny hilderbrandt">
                       </a>
                               </div>
                   
                   <!--overview-->
                       <div class="products-list-item-overview">
                           <h2><ahref='javascript:gotodetails(&#39;106&#39;,&#39;124&#39;,&#39;1&#39;)'>  Unit # 01</ahref='javascript:gotodetails(&#39;106&#39;,&#39;124&#39;,&#39;1&#39;)'></h2>
                   <p>   Fishing</p>
                   
                       <ul class="list-result">
                           <li>State<br><span class="boat-result">  Florida</span></li>
                           <li>City<br><span class="boat-result">  VERO BEACH</span></li>
                           <li>Zip<br><span class="boat-result">  32960</span></li>
                           <li>Body Of Water<br><span class="boat-result">  </span></li>
                           <li>Year<br><span class="boat-result">  </span></li>
                           <li>Make<br><span class="boat-result">  Sea Boss</span></li>
                           <li>Model<br><span class="boat-result">  Center Console</span></li>
                           
                       </ul>
                       <div style="clear:both"></div>
                   </div>
   
                   <!-- Price / BookNow -->
           
                   <div class="products-price">				
                       <span class="price-from-label">From&nbsp;USD</span>
                       <span class="price"> $100.00 </span>
                               
                       <a class="btn-submit" href="javascript:gotoDetails('106','124','1')">Book now!</a>
                   </div>
           </div>
   <div style="clear:both"></div>
   
                           <div class="boat-list-item">
                   <!--Image-->
                   <div class="boat-list-image">
                           <a class="" href="javascript:gotoDetails('121','124','1')">
           <img src="./boats/result_121.jpg" alt="">
                       </a>
                               </div>
                   
                   <!--overview-->
                       <div class="products-list-item-overview">
                           <h2><ahref='javascript:gotodetails(&#39;121&#39;,&#39;124&#39;,&#39;1&#39;)'>  unit # 02</ahref='javascript:gotodetails(&#39;121&#39;,&#39;124&#39;,&#39;1&#39;)'></h2>
                   <p>   Speed</p>
                   
                       <ul class="list-result">
                           <li>State<br><span class="boat-result">  New York</span></li>
                           <li>City<br><span class="boat-result">  BLUE POINT</span></li>
                           <li>Zip<br><span class="boat-result">  11715</span></li>
                           <li>Body Of Water<br><span class="boat-result">  </span></li>
                           <li>Year<br><span class="boat-result">  </span></li>
                           <li>Make<br><span class="boat-result">  Starcraft</span></li>
                           <li>Model<br><span class="boat-result">  Deck Boat</span></li>
                           
                       </ul>
                       <div style="clear:both"></div>
                   </div>
   
                   <!-- Price / BookNow -->
           
                   <div class="products-price">				
                       <span class="price-from-label">From&nbsp;USD</span>
                       <span class="price"> $10.00 </span>
                               
                       <a class="btn-submit" href="javascript:gotoDetails('121','124','1')">Book now!</a>
                   </div>
           </div>
   <div style="clear:both"></div>
                           <div class="boat-list-item">
                   <!--Image-->
                   <div class="boat-list-image">
                           <a class="" href="javascript:gotoDetails('122','124','1')">
           <img src="./boats/result_122.jpg" alt="">
                       </a>
                               </div>
                   
                   <!--overview-->
                       <div class="products-list-item-overview">
                           <h2><ahref='javascript:gotodetails(&#39;122&#39;,&#39;124&#39;,&#39;1&#39;)'>  Unit # 03</ahref='javascript:gotodetails(&#39;122&#39;,&#39;124&#39;,&#39;1&#39;)'></h2>
                   <p>   Speed</p>
                   
                       <ul class="list-result">
                           <li>State<br><span class="boat-result">  New York</span></li>
                           <li>City<br><span class="boat-result">  BLUE POINT</span></li>
                           <li>Zip<br><span class="boat-result">  11715</span></li>
                           <li>Body Of Water<br><span class="boat-result">  </span></li>
                           <li>Year<br><span class="boat-result">  </span></li>
                           <li>Make<br><span class="boat-result">  Craig Cat</span></li>
                           <li>Model<br><span class="boat-result">  Sport</span></li>
                           
                       </ul>
                       <div style="clear:both"></div>
                   </div>
   
                   <!-- Price / BookNow -->
           
                   <div class="products-price">				
                       <span class="price-from-label">From&nbsp;USD</span>
                       <span class="price"> $10.00 </span>
                               
                       <a class="btn-submit" href="javascript:gotoDetails('122','124','1')">Book now!</a>
                   </div>
           </div>
   <div style="clear:both"></div>
   
   <input type="button" name="btnShowDetails" value="" onclick="javascript:__doPostBack('btnShowDetails','')" id="btnShowDetails" style="visibility: hidden; display: none;">
                   
   
   <!-- Search item -->
           </div>
       </div>
   </div>
   </section>

   <section class="section bg-gradient pb-4 pt-5">
       <div class="container">
           <div class="row">
               <div class="col-lg-8 text-center text-lg-left">
                   <div class="footer-info">
                       <img src="images/logo-light.png" class="img-fluid" width="200">
                       <p>"As conscious traveling Paupers we must always be concerned about our dear Mother Earth. If you think about it, you travel across her face, and She is the host to your journey; without Her we could not find the unfolding adventures that attract and feed our souls". - Unknown</p>
                   </div>
                   <div class="row">
                       <div class="col-md-7">
                           <ul class="footer-icons list-inline mt-3">
                               <li class="list-inline-item"><a href="https://m.facebook.com/RentaBoatcom-244505213935/?ref=bookmarks" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
                               <li class="list-inline-item"><a href="https://twitter.com/RentABoat_com" target="_blank"><i class="fab fa-twitter"></i></a></li>
                               <li class="list-inline-item"><a href="https://www.instagram.com/rentaboat_com/" target="_blank"><i class="fab fa-instagram"></i></a></li>
                           </ul>
                       </div>
                       <div class="col-md-5 align-self-center">
                           <div class="form-group select-language">
                           <%-- <select class="form-control" id="exampleFormControlSelect1">
                               <option selected style="color: black;"> Select Language</option>
                               <option style="color: black;" >English</option>
                               <option style="color: black;">French</option>
                               </select>--%>
                           <%--  <asp:DropDownList ID="ddLanguage" runat="server" CssClass="form-control"  AutoPostBack="true" OnSelectedIndexChanged="ddLanguage_SelectedIndexChanged">
                                   <asp:ListItem Text="Select Lanaguage"  Value=""></asp:ListItem>
                                   <asp:ListItem Text="English" Value="en"></asp:ListItem>
                                   <asp:ListItem Text="French" Value="fr"></asp:ListItem>
                               </asp:DropDownList>--%>
                       Select Language:  <div id="google_translate_element">
                           </div>
                       </div>
                   </div>
               </div>
           </div>
       
           <script type="text/javascript">  
               function googleTranslateElementInit() {
                   new google.translate.TranslateElement(
                       { pageLanguage: 'en' },
                       'google_translate_element'
                   );
               }
           </script>  
       
           <script type="text/javascript" src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"> 
           </script>  
       
           <div class="col-lg-4 text-center text-lg-right">
               <p class="text-uppercase footer-title">Contact Us</p>
               <div class="contact-us">
                   <p><i class="fas fa-phone-alt pr-2"></i> <a href="tel:1-888-610">1-888-610-BOAT</a></p>
                   <p><i class="fas fa-phone-alt pr-2"></i> <a href="tel:631-286-7816">631-286-7816</a></p>
                   <p><i class="fas fa-envelope pr-2"></i> <a href="mailto:info@rentaboat.spam"> <span>info@rentaboat.com</span></a></p>
               </div>
           </div>
           </div>
           <hr style="background-color: white;">
           <div class="row footer-bottom">
               <div class="col-lg-8 text-center text-lg-left">
                   <p> Copyright 2021 Rent A Boat, RentABoat.com | 320 South Country Rd. Brookhaven, NY 11719</p>
               </div>
               <div class="col-lg-4 footer-end text-center text-lg-right">
                   <p><a href="#">Terms</a> | <a href="#">Privacy</a> | <a href="#">Compliances</a></p>
               </div>
           </div>
       </div>
   </section>

   <!-- MOdal SIgn in Sign Up -->

  <!-- Modal -->
  <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">

        <div class="modal-body text-center padding-5">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <i class="far fa-times-circle"></i>
              </button>
            <h1 class="pb-4"> Sign In</h1>
          
            
          <%-- form tag here--%>

                        <form class="pb-5">
                            <div class="form-group text-field">
                                <asp:TextBox type="text" runat="server" class="form-control" ID="txtLoginName" placeholder=" " />

                                <label class="style-lable">Email</label>
                            </div>
                            <div class="form-group text-field">
                                <asp:TextBox type="password" runat="server" class="form-control" ID="txtPassword" placeholder=" " />
                                <label class="style-lable">Password</label>
                            </div>
                            <div class="form-check text-right forgot-password">
                                <a href="forgotpassword.aspx" class="form-check-label">Forgot Password?</a>
                            </div>
                            <asp:Button type="submit" class="btn btn-custom-lg-signup btn-block mt-4" OnClick="btnSignIn_Click" Text="Sign In" runat="server"></asp:Button>
                        </form>
                        <div class="row ">
                            <div class="col-12">
                                <p class="font-15">Don't have an account? <a href="#" data-toggle="modal" data-target="#exampleModalCenter-1" class="sign-up">Sign up now!</a> </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="exampleModalCenter-1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">

                    <div class="modal-body text-center padding-5">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <i class="far fa-times-circle"></i>
                        </button>
                        <h1 class="pb-4">Sign Up</h1>
                        <form class="pb-4">
                            <div class="form-group text-field">
                                <input type="text" class="form-control" id="exampleInputFirstName" placeholder=" " required>
                                <label class="style-lable">First Name</label>
                            </div>
                            <div class="form-group text-field">
                                <input type="text" class="form-control" id="exampleInputLastName" placeholder=" " required>
                                <label class="style-lable">Last Name</label>
                            </div>
                            <div class="form-group text-field">
                                <input type="text" class="form-control" id="exampleInputEmail1" placeholder=" " required>
                                <label class="style-lable">Email</label>
                            </div>
                            <div class="form-group text-field">
                                <input type="password" class="form-control" id="exampleInputPassword1" placeholder=" " required>
                                <label class="style-lable">Password</label>
                            </div>
                            <div class="form-group text-field">
                                <input type="password" class="form-control" id="exampleInputPasswordConfirm" placeholder=" " required>
                                <label class="style-lable">Confirm Password</label>
                            </div>
                            <div class="form-check text-left">
                                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label text-black font-15" for="exampleCheck1">I accept the Terms and Conditions and agree with them.                    </label>
                            </div>
                            <button type="submit" class="btn btn-custom-lg-signup btn-block mt-4">Sign Up</button>
                        </form>
                        <div class="row ">
                            <div class="col-12">
                                <p class="font-15">Already have an account? <a href="#" class="sign-in">Sign In now!</a> </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   <!-- Optional JavaScript -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   <script src="js/popper.min.js"></script>
   <script src="js/bootstrap.bundle.min.js"></script>
   <script src="js/jquery.easing.min.js"></script>
   <!-- BackSlideShow -->
   <script src="js/jquery.backstretch.min.js"></script>
   <script>
       $.backstretch(["images/bg.jpg"], {
           duration: 3000,
           fade: 750
       });

       // Toggle plus minus icon on show hide of collapse element
       $(".collapse").on('show.bs.collapse', function () {
           $(this).parents(".question-box").find(".fa").removeClass("fa-plus").addClass("fa-minus");
           $(this).parents(".question-box").removeClass("inactive-question").addClass("border border-secondary")
       }).on('hide.bs.collapse', function () {
           $(this).parents(".question-box").find(".fa").removeClass("fa-minus").addClass("fa-plus");
           $(this).parents(".question-box").addClass("inactive-question").removeClass("border border-secondary")
       });

       $(document).ready(function () {
           $(".navbar-toggle").click(function (e) {
               $("#navigations").toggleClass('show-menu');

               e.stopPropagation();
           });
           $(document).click(function (e) {
               if (!$(e.target).is('#navigations, #navigations *')) {
                   if ($("#search-bar").css("visibility") === "hidden") {
                       $("#navigations").removeClass('show-menu');

                   }
               }
           });
       });


       $(document).ready(function () {
           $(".sign-up").click(function (e) {
               $('#exampleModalCenter').modal('hide')

           });
           $(".sign-in").click(function (e) {
               $('#exampleModalCenter-1').modal('hide');
               $('#exampleModalCenter').modal('show')

           });
       });

   </script>
   <script>
       $(document).ready(function () {
           setTimeout(function () {
               $('tspan').each(function () {
                   if ($(this).text() == "Simplemaps.com Trial") {
                       $(this).css("display", "none");
                   }
               });
           }, 100);

           $(window).resize(function () {
               setTimeout(function () {
                   $('tspan').each(function () {
                       if ($(this).text() == "Simplemaps.com Trial") {
                           $(this).css("display", "none");
                       }
                   });
               }, 350);
           })

       });
   </script>
   <script>
       $('#exampleModalCenter, #exampleModalCenter-1').on('show.bs.modal', function (e) {
           $('body, header').addClass('test');
       });


       (function ($) {

           'use strict';

           function toggleMenu(state) {
               if (state == "on") {
                   $('#navigations').slideDown();
                   $('body').addClass('maun-open');
               } else if (state == "off") {
                   $('#navigations').slideUp();
                   $('body').removeClass('maun-open');
               }
           }

           function initSmoothLink() {
               $('.navigation-menu a').on('click', function (event) {
                   var $anchor = $(this);
                   $('html, body').stop().animate({
                       scrollTop: $($anchor.attr('href')).offset().top - 0
                   }, 1500, 'easeInOutExpo');
                   event.preventDefault();
               });
           }
           function initDropdownMenu() {
               $(document).on('click', ".darkheader .dropdown", function (event) {
                   //event.preventDefault();
                   $(this).toggleClass("sub-menu-opened");
               });
           }

           function initScrollspy() {
               $("#navigations").scrollspy({ offset: 70 });
           }

           //navigation-v2 code

           function init() {
               initScrollspy();
               initDropdownMenu()
           }
           init();


       })(jQuery)

   </script>
</form>
</body>
<script type="text/java_script">
_uacct = "UA-872206-1";
urchinTracker();
</script>

</html>
