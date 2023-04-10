<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderSummary.aspx.cs" Inherits="BoatRenting.OrderSummary"  MaintainScrollPositionOnPostback="true"   %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>Order Summary</title>
    <meta charset="utf-8">    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
    <meta name = "format-detection" content = "telephone=no" />
    <meta name="description" content="Your description">
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
    
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400&family=Poppins:wght@600;700;800;900&display=swap" rel="stylesheet">
<link href="css/menu.css" rel="stylesheet">
<link href="css/styleN.css" rel="stylesheet">
<link href="OrderSummary.css" rel="stylesheet">

<style>
    #more {display: none;}
    #readMoreBtn{
        outline:none;
        border: none;
        background-color: white; color: #FE5974 !important; 
        font-size:16px; font-weight:bold; 
        text-decoration:underline!important;
    }
    #moreInfoBtn{
        outline:none;
        border: none;
        background-color: white; color: #FE5974 !important; 
        font-size:16px; font-weight:bold; 
        text-decoration:underline!important;
    }
</style>

<script>
    $(document).ready(function () {
        $('.list2 li a').hover(function () {
            $(this).stop().css({ color: '#b6b6b6' });
            $(this).parent().siblings('em').find('img').stop().css({ 'margin-top': '-7px' });
        }, function () {
            $(this).stop().css({ color: '#c11030' });
            $(this).parent().siblings('em').find('img').stop().css({ 'margin-top': 0 });
        })
    });
</script>
   
<script src="//clevertree.github.io/zip-lookup/zip-lookup.min.js" type="text/javascript" ></script>

<!--[if lt IE 9]>
<div style='text-align:center'><a href="//windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode"><img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." /></a></div>  
<script src="assets/assets/js/html5shiv.js"></script> 
<script src="assets/assets/js/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">//<![CDATA[
var tlJsHost = ((window.location.protocol == "https:") ? "https://secure.comodo.com/" : "http://www.trustlogo.com/");
document.write(unescape("%3Cscript src='" + tlJsHost + "trustlogo/javascript/trustlogo.js' type='text/javascript'%3E%3C/script%3E"));
//]]>
</script>
</head>
<body class="body">
<!--==============================header=================================-->

<!-- HEADER -->
<form id="frmContactForm" class="contact-form" runat="server">		
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
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
                <!-- Navigation Menu-->
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
                        <a class="dropdown-item" href="rental-tips.html" >Rental Tips</a>
                        
                        </div>
                    </li>
                    <li class="">
                        <a href="about-us.html" >ABOUT US</a>
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
                            <input type="text" placeholder="Where would you like go boating?" runat="server" id="txtSearch" >
                            <button type="submit" class="btn btn-custom-search" runat="server" id="btnSearch" onserverclick="btnSearch_Click"> <i class="fas fa-search pr-0 pr-lg-2"></i> <span class="d-none d-lg-inline">SEARCH</span></button>
                        </div>
                        <div class="menu-on-scroll">
                            <button class="btn btn-custom align-nav" data-toggle="modal" data-target="#exampleModalCenter" onclick="javascript:return false;">SIGN IN</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<!--==============================content=================================-->

    <!--==============================row_1=================================-->
<section class="section pb-5 mt-5">
    <div class="container pb-3">
        <div class="row">
            <div class="col-12 mt-5">
                <h2 class="mt-5">Rental Request Summary</h2>
                <div class="d-none d-sm-block">
                    <div class="row">
                        <div class="col-4">
                            <img style="height: 316px !important" src="./boats/<%=orderSummary.ImageFileName %>" class="mt-3 img-fluid" alt="<%= orderSummary.ImageFileNameDescription %>" />
                        </div>
                        <div class="col-8">
                             <div class="card mt-3 border rounded-0 shadow-none" style="height: 316px !important;">
                                 <h5 class="card-header text-center">Boat Description</h5>
                                 <div class="card-body shadow-sm">
                                     <div class="row p-3">
                                         <div class="col-6">
                                             <span class="font-weight-bold">Make #:</span> <%= orderSummary.BoatMake %><br>
                                             <span class="font-weight-bold">Boat #:</span> <%= orderSummary.BoatID %><br>
                                             <span class="font-weight-bold">Facility #:</span> <%= orderSummary.MarinaID %><br>
                                             <span class="font-weight-bold">Length:</span> <%= orderSummary.BoatSize %><br>
                                             <span class="font-weight-bold">Passengers:</span> <%= orderSummary.MaximumPassengers %><br><br>
                                             <span class="font-weight-bold">Location:</span> <%= orderSummary.CountryName %>- <%= orderSummary.StateName %> - <%= orderSummary.City %> , <%= orderSummary.BodyOfWater %></td>
                                         </div>
                                         <div class="col-6">
                                             <span class="font-weight-bold">Description:</span>
                                             <asp:Literal ID="lblBoatDescription" runat="server"></asp:Literal>
                                         </div>
                                     </div>
                                 </div>
                             </div>
                        </div>
                    </div>
                </div>
                <div class="d-block d-sm-none">
                    <div class="row">
                        <div class="col-12">
                            <div class="card-group mt-4">
                                 <div class="card mt-3 border rounded-0 shadow-none">
                                     <h5 class="card-header">Boat Description</h5>
                                     <div class="card-body shadow-sm">
                                         <div class="row">
                                             <div class="col-6">
                                                <img style="height: 120px !important" src="./boats/<%=orderSummary.ImageFileName %>" class="mt-3 img-fluid" alt="<%= orderSummary.ImageFileNameDescription %>" />
                                             </div>
                                             <div class="col-6">
                                                <span class="font-weight-bold">Make #:</span> <%= orderSummary.BoatMake %><br>
                                                <span class="font-weight-bold">Boat #:</span> <%= orderSummary.BoatID %><br>
                                                <span class="font-weight-bold">Facility #:</span> <%= orderSummary.MarinaID %><br>
                                                <span class="font-weight-bold">Length:</span> <%= orderSummary.BoatSize %><br>
                                                <span class="font-weight-bold">Passengers:</span> <%= orderSummary.MaximumPassengers %><br><br>
                                                <span class="font-weight-bold">Location:</span> <%= orderSummary.CountryName %>- <%= orderSummary.StateName %> - <%= orderSummary.City %> , <%= orderSummary.BodyOfWater %></td>
                                            </div>
                                         </div>
                                         <div class="row">
                                            <span class="font-weight-bold">Description:</span><%= orderSummary.BoatDescription %>
                                         </div>
                                     </div>
                                 </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="card-group mt-4 text-center">
                             <div class="card mt-3 border rounded-0 shadow-none">
                                 <h5 class="card-header">Requested Days</h5>
                                 <div class="card-body shadow-sm">
                                     <div class="row align-items-center h-100 p-3">
                                         <div class="col-12">
                                             <span class="font-weight-bold">From:</span><%= orderSummary.RentStartDate %><br>
                                             <span class="font-weight-bold">To:</span><%= orderSummary.RentEndDate %>
                                         </div>
                                     </div>
                                 </div>
                             </div>
                             <div class="card mt-3 border rounded-0 shadow-none card1">
                                 <h5 class="card-header">Rental Details</h5>
                                 <div class="card-body shadow-sm">
                                     <div class="row align-items-center h-100 p-3">
                                         <div class="col-12">
                                             <%= orderSummary.RentTypeDescription %><br /><%= orderSummary.RentingTimeFromTo %><br><br>
                                             <span class="font-weight-bold">
                                                 TOTAL:<asp:Label ID="lblCurrencySymbol2" runat="server"></asp:Label><%= orderSummary.TotalRentAmount.ToString("F") %>
                                             </span>
                                         </div>
                                     </div>
                                 </div>
                             </div>
                             <div class="card mt-3 border rounded-0 shadow-none card2">
                                 <h5 class="card-header">Rental Request Fee*</h5>
                                 <div class="card-body shadow-sm">
                                     <div class="row align-items-center h-100 p-3">
                                         <div class="col-12">
                                            <span class="font-weight-bold">
                                                <asp:Label ID="lblCurrencySymbol1" runat="server"></asp:Label> <%= orderSummary.MarinaOnlineReservationFee.ToString("F") %>
                                            </span>
                                            <br><br>*This fee will be deducted off the rental price. Pay the remaining balance (
                                            <span class="font-weight-bold">
                                                <asp:Label ID="lblCurrencySymbol3" runat="server"></asp:Label><asp:Literal ID="lblBalance1" runat="server"></asp:Literal>
                                            </span>
                                            ) directly to the boat owner.
                                            <button type="button" data-toggle="modal" id="moreInfoBtn" data-target="#moreInfoModel">More Info</button>
                                            <div class="modal fade" id="moreInfoModel" tabindex="-1" role="dialog" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content p-4" style='border-radius:20px;'>
                                                        <div class="modal-header">
                                                            <h4 class="modal-title">Rental Request Fee</h4>
                                                            <button type="button" class="mr-2 mt-3 close" data-dismiss="modal">&times;</button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <span>Your credit card change will not fully be settled until boat owner confirms availabilty, and rental
                                                                acceptance. Once confirmed, the charge will be settled. This rental request fee will be deducted off the
                                                                rental price by the boat owner.<br><br>
                                                                Please contact the boat owner immediately after receiving their contact information to pay the balance 
                                                                (
                                                                    <span class="font-weight-bold">
                                                                        <asp:Label ID="lblCurrencySymbol4" runat="server"></asp:Label><asp:Literal ID="lblBalance2" runat="server"></asp:Literal>
                                                                    </span>
                                                                ).
                                                                Boat owners may request payments by trusted payment platforms like Venmo, Zelle, PayPal or Credit Card but
                                                                never by Wire Transfer.
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                         </div>
                                     </div>
                                 </div>
                             </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
  </div>   
</section>
<section class="section" style="background-color: rgba(0,0,0,.05);">
    <div class="container pb-5">
        <div class="row pb-5">
            <div class="col-lg-12">
                <asp:Panel ID="accountGroup" CssClass='d-block card p-4' style="margin: 0 auto; border-radius: 12px;" runat="server">
                    <div class="card-body">
                        <div class="pb-4">
                            <span style="font-size: 18px; font-weight: bold;" class="card-title mb-4">Step 4: Renter's information</span>
                            <a id="returnLogin" class="d-none" href="javascript:void(0)" style="color: #FE5974; text-decoration: underline !important;">Have an account? Log in</a>
                            <a id="returnPayment" class="d-none" href="javascript:void(0)" style="color: #FE5974; text-decoration: underline !important;">Back to Payment</a>
                        </div>
                        <asp:Panel ID="login" CssClass='d-block' runat="server">
                            <div class="form-group">
                                <label class="text-muted" for="txtUsername">Email</label>
                                <asp:TextBox ID="txtUsername" ValidationGroup="LoginGroup" runat="server"  CssClass='form-control' TextMode="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtUsernameError" ValidationGroup="LoginGroup" runat="server" ControlToValidate="txtUsername" Display="Dynamic" Text="This is a required field" Font-Size="10pt" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group mb-5">
                                <label class="text-muted" for="txtPassword">Password</label>
                                <asp:TextBox ID="txtPassword" ValidationGroup="LoginGroup" runat="server"  CssClass='form-control' TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtPasswordError" ValidationGroup="LoginGroup" runat="server" ControlToValidate="txtPassword" Display="Dynamic" Text="This is a required field" Font-Size="10pt" ForeColor="Red"></asp:RequiredFieldValidator>
                                <small id="passwordlHelp" class="form-text text-info float-right mb-4">Forget Password?</small>
                            </div>
                            <asp:LinkButton ID="lnkReturingCustomer" ValidationGroup="LoginGroup" runat="server" CssClass="btn btn-info btn-block" Text="LOG IN" OnClick="lnkReturingCustomer_Click"></asp:LinkButton>
                            <button type="button" id="createBtn" class="btn btn-outline-secondary btn-block text-capitalize">Create an account</button>
                        </asp:Panel>
                        <asp:Panel ID="create1" CssClass='d-none' runat="server">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label class="text-muted" for="renterInputFirstName">First Name</label>
                                    <asp:TextBox ID="renterInputFirstName" runat="server"  CssClass='form-control'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="renterInputFirstNameError" ValidationGroup="CreateGroup1" runat="server" ControlToValidate="renterInputFirstName" Display="Dynamic" Text="This is a required field" Font-Size="10pt" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="text-muted" for="renterInputLastName">Last Name</label>
                                    <asp:TextBox ID="renterInputLastName" runat="server"  CssClass='form-control'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="renterInputLastNameError" ValidationGroup="CreateGroup1" runat="server" ControlToValidate="renterInputLastName" Display="Dynamic" Text="This is a required field" Font-Size="10pt" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="text-muted" for="renterInputAddressLine1">Address Line 1</label>
                                <asp:TextBox ID="renterInputAddressLine1" runat="server"  CssClass='form-control'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="renterInputAddressLine1Error" ValidationGroup="CreateGroup1" runat="server" ControlToValidate="renterInputAddressLine1" Display="Dynamic" Text="This is a required field" Font-Size="10pt" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label class="text-muted" for="renterInputAddressLine2">Address Line 2 (optional)</label>
                                <asp:TextBox ID="renterInputAddressLine2" runat="server"  CssClass='form-control'></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="text-muted" for="renterInputCity">City</label>
                                <asp:TextBox ID="renterInputCity" runat="server"  CssClass='form-control'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="renterInputCityError" ValidationGroup="CreateGroup1" runat="server" ControlToValidate="renterInputCity" Display="Dynamic" Text="This is a required field" Font-Size="10pt" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label class="text-muted" for="ddState">State</label>
                                    <asp:DropDownList ID="ddState" CssClass="form-control" runat="server" class='zip-lookup-field-state'></asp:DropDownList>
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="text-muted" for="ddCountry">Country</label>
                                    <asp:DropDownList ID="ddCountry" CssClass="form-control" runat="server" AutoPostBack="false" OnSelectedIndexChanged="ddCountry_SelectedIndexChanged" ></asp:DropDownList>
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="text-muted" for="renterInputZipCode">Zip/Postal Code</label>
                                    <asp:TextBox ID="renterInputZipCode" runat="server"  CssClass='form-control'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="renterInputZipCodeError" ValidationGroup="CreateGroup1" runat="server" ControlToValidate="renterInputZipCode" Display="Dynamic" Text="This is a required field" Font-Size="10pt" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label class="text-muted" for="renterInputPhone">Phone</label>
                                    <asp:TextBox ID="renterInputPhone" runat="server"  CssClass='form-control'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="renterInputPhoneError" ValidationGroup="CreateGroup1" runat="server" ControlToValidate="renterInputPhone" Display="Dynamic" Text="This is a required field" Font-Size="10pt" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group col-md-6">
                                </div>
                            </div>
                            <div id="changedEmail" class="form-group d-none">
                                <label class="text-muted" for="changeInputEmail">Email</label>
                                <asp:TextBox ID="changeInputEmail" runat="server"  CssClass='form-control' TextMode="Email"></asp:TextBox>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                </div>
                                <div class="form-group col-md-6">
                                    <button type="button" id="nextBtn" class="d-block btn btn-info btn-block text-capitalize">Next&nbsp;&nbsp;&gt;</button>
                                    <button type="button" id="changeBtn" class="d-none btn btn-info btn-block text-capitalize">Save Changes</button>
                                </div>
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="create2" CssClass='d-none' runat="server">
                            <div class="form-group">
                                <label class="text-muted" for="renterInputEmail2">Email</label>
                                <asp:TextBox ID="renterInputEmail2" runat="server"  CssClass='form-control' TextMode="Email"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="text-muted" for="renterInputConfirmEmail">Confirm Email</label>
                                <asp:TextBox ID="renterInputConfirmEmail" runat="server"  CssClass='form-control' TextMode="Email"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="text-muted" for="renterInputPassword2">Password</label>
                                <asp:TextBox ID="renterInputPassword2" runat="server"  CssClass='form-control' TextMode="Password"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="text-muted" for="renterInputConfirmPassword">Confirm Password</label>
                                <asp:TextBox ID="renterInputConfirmPassword" runat="server"  CssClass='form-control' TextMode="Password"></asp:TextBox>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <button type="button" id="backBtn" class="btn btn-outline-secondary btn-block text-capitalize">&lt;&nbsp;&nbsp;Back</button>
                                </div>
                                <div class="form-group col-md-6">
                                    <button type="button" id="completeBtn" class="btn btn-info btn-block text-capitalize">Create Account</button>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </asp:Panel>
                <asp:Panel ID="paymentGroup" CssClass='d-none' style="margin: 0 auto; border-radius: 12px;" runat="server">
                    <div class="card-body">
                        <div class="pb-4">
                            <span style="font-size: 18px; font-weight: bold;" class="card-title mb-4">Step 5: Payment</span>
                            <a id="returnChange" class="d-block float-right" href="javascript:void(0)" style="color: #FE5974; text-decoration: underline !important;">Edit Renter Information</a>
                        </div>
                        <div id="primay">
                            <div class="form-group">
                                <label class="text-muted" for="renterBillingNameOnCard">Name On Card</label>
                                <asp:TextBox ID="renterBillingNameOnCard" runat="server"  CssClass='form-control'></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="text-muted" for="renterBillingCardNumber">Card Number</label>
                                <asp:TextBox ID="renterBillingCardNumber" runat="server"  CssClass='form-control'></asp:TextBox>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label class="text-muted" for="ddExpMonth">Expiration Date</label>
                                    <asp:DropDownList ID="ddExpMonth" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="text-muted" for="ddExpYear">&nbsp;</label>
                                    <asp:DropDownList ID="ddExpYear" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="text-muted" for="renterInputSecurityCode">Security Code</label>
                                    <asp:TextBox ID="renterInputSecurityCode" runat="server"  CssClass='form-control'></asp:TextBox>
                                </div>
                            </div>
                            <div>
                                <label class="text-muted" for="renterBillingAddress">Billing Address:</label>
                            </div>
                            <div class="form-group form-check">
                                <asp:CheckBox ID="check1" runat="server" CssClass='form-check-input' AutoPostBack="false" checked/>
                                <label class="form-check-label" for="check1">123 Street</label>
                            </div>
                            <div class="form-group form-check">
                                <asp:CheckBox ID="check2" runat="server" CssClass='form-check-input' AutoPostBack="false"/>
                                <label class="form-check-label" for="check2">Add different address</label>
                            </div>
                        </div>
                        <div id="secondary" class="d-none">
                            <div class="form-group">
                                <label class="text-muted" for="otherInputAddressLine1">Address Line 1</label>
                                <asp:TextBox ID="otherInputAddressLine1" runat="server"  CssClass='form-control'></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="text-muted" for="otherInputAddressLine2">Address Line 2 (optional)</label>
                                <asp:TextBox ID="otherInputAddressLine2" runat="server"  CssClass='form-control'></asp:TextBox>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label class="text-muted" for="ddBillingState">State</label>
                                    <asp:DropDownList ID="ddBillingState" CssClass="form-control" runat="server" ></asp:DropDownList>
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="text-muted" for="ddBillingCountry">Country</label>
                                    <asp:DropDownList ID="ddBillingCountry" CssClass="form-control" runat="server" AutoPostBack="false" OnSelectedIndexChanged="ddBillingCountry_SelectedIndexChanged" ></asp:DropDownList>
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="text-muted" for="otherInputZipCode">Zip/Postal Code</label>
                                    <asp:TextBox ID="otherInputZipCode" runat="server"  CssClass='form-control'></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-row mt-4">
                            <div class="form-group col-md-6">
                                <button type="button" id="cancelBtn" class="btn btn-outline-secondary btn-block text-capitalize">Cancel</button>
                            </div>
                            <div class="form-group col-md-6">
                                <button type="submit" class="btn btn-info btn-block text-capitalize">Send Request</button>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="text-muted">
                                Once rental request is sent, you will receive the boat owner's contact information, boat information, and boat location or address.
                            </label>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</section>
<section class="section d-none">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-sm-12 mt-5">
              <br><br><br><br><br><br><br><br><br><br><br>
              <!--booking result-->
              <table>
              <thead>
                  <tr style="">
                     <th></th>
                     <th>Boat Description</th>
                     <th>Rental Description</th>
                     <th>Occupied Days</th>
                     <th>Online Fee</th>
                 </tr>
                 </thead>
                 <tbody>
                 <tr>
                     <td><div class="boat-page-image">
 
         <img src="./boats/<%=orderSummary.ImageFileName %>" alt="<%= orderSummary.ImageFileNameDescription %>" />
                    </div></td>
                     <td class="list"><%= orderSummary.BoatName %><br>
                          <span class="boat-page-item">Boat #:</span> <%= orderSummary.BoatID %><br>
                           <span class="boat-page-item">Facility #:</span> <%= orderSummary.MarinaID %><br>
 
                     <span class="boat-page-item">Length:</span> <%= orderSummary.BoatSize %><br>
                     <span class="boat-page-item">Passengers:</span> <%= orderSummary.MaximumPassengers %><br>
                     <span class="boat-page-item">Description:</span><%= orderSummary.BoatDescription %><br>
                     <span class="boat-page-item">Location:</span> <%= orderSummary.CountryName %>- <%= orderSummary.StateName %> - <%= orderSummary.City %> , <%= orderSummary.BodyOfWater %></td>
                     <td class="list"><%= orderSummary.RentTypeDescription %><br /><%= orderSummary.RentingTimeFromTo %>
                         <br />  <br />
                        <asp:Label ID="lblCurrencySymbol" runat="server"></asp:Label> <%= orderSummary.TotalRentAmount.ToString() %>
                     </td>
                     <td class="list">From: <%= orderSummary.RentStartDate %><br>To: <%= orderSummary.RentEndDate %></td>
                    
                 </tr>
                 </tbody>
                 </table>
                  
 
               
                 <br><br>     
                
                         
 
     
 
 
  
 
 
 
 
 
     <asp:UpdatePanel ID="upPay" runat="server">
          <ContentTemplate>
              <fieldset>
                 
                   <div class="row">
                     <div class="col-lg-6 col-sm-6 padbot20">
 
           
                      
            <div class="boat-page-overview">
            
                      <h4 class="red">Step 4 : Renters Information.</h4>
         
                <asp:Panel ID="pnlCheckReturningUser" runat="server">
             Check here if you are Returning Customer <asp:CheckBox ID="chkReturningCustomer" OnCheckedChanged="chkReturningCustomer_CheckedChanged" runat="server" style="width:15px; height:15px;  display:inline;" AutoPostBack="true"/>
                </asp:Panel>
                <asp:Panel ID="pnlGetUserName" runat="server">
                
                 <h2 class="red">Returning Customer</h2>
            
             <div class="control-group">
   
    
                
 </div>
 <div class="control-group">
 
   
      
     <br />
   
 </div>
             
               
 <div style="clear:both;"></div>
 
 <asp:LinkButton ID="lnkForgotPassword" runat="server" Text="Forgot Password." OnClick="lnkForgotPassword_Click"  ></asp:LinkButton>
 
 <div style="clear:both;"></div>
 <br />
 
 
      <div class="" align="right">                     
      
   
      
    
     
      </div>
 
 
 
  <br />
     <div style="clear:both;"></div>
     <asp:Label ID="lblReturingCustomerMessage" runat="server" Font-Bold="true" Font-Size="Small" ForeColor="Red"></asp:Label>
  <br />
   
    
                    
                    
       <asp:Button ID="btnh1" runat="server" style="display:none"/>             
                    
      <asp:ModalPopupExtender ID="modalForgotPassword" runat="server"
     TargetControlID="btnh1"
     PopupControlID="pnlEnterEmail"
     BackgroundCssClass="modalBackground" 
    
    
     CancelControlID="btnCancel"
    
    />
    
 
 
 
              <asp:Panel id="pnlEnterEmail" style="display: none" runat="server">
     
                              
                  <div style="background-color:white">
                 <div style="background-color:red;color:white">
                    
                     <asp:Label ID="lblEnterEmailHeader" runat="server" Text=" PROVIDE THE EMAIL ADDRESS OF THE ACCOUNT"></asp:Label>
                   
                
                      </div>
                 <div style="margin-top:10px;">                   
                 <div runat="server" id="divEnterEmail">
                      EMail Address :   <asp:TextBox ID="txtEmailForgotPassword" runat="server"></asp:TextBox>
                     </div>
                     <br />
                     <asp:Label ID="lblMessageForgotPassword" runat="server" Font-Bold="true"></asp:Label>
                     
                 </div>
                      <br />
                      <br />
 
                 <div align="center" >
                     <asp:Button ID="btnSendPassword" runat="server" Text ="SEND PASSWORD"  OnClick="btnSendPassword_Click"  Font-Bold="true"  Width="200px"/>
                     &nbsp;&nbsp;
                     <asp:Button ID="btnCancel" runat="server" Text ="Cancel"    Font-Bold="true" Width="100px"/>
                     
                  </div>
         </div>
 </asp:Panel>                
                    
                    
                    
    </asp:Panel>
 
     
 
 
 
     
 
     <asp:Panel ID="pnlCreateNewUser" runat="server" >
 
 
 
        
        
             <h4 class="red">NEW Customer:</h4>
         
             <div class="control-group2">
 
   <label class="control-label" > First Name:</label> <asp:TextBox ID="txtFirstNameNewUser" runat="server" class="input-xlarge"></asp:TextBox>
                 
    <asp:RequiredFieldValidator ID="rftxtFirstNameNewUser" runat="server" ControlToValidate="txtFirstNameNewUser" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           
 
 </div>
 <div class="control-group">
 
      <label class="control-label" >  Last Name:
          </label> <asp:TextBox ID="txtLastNameNewUser" runat="server" class="input-xlarge"></asp:TextBox>
    
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLastNameNewUser" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           
 
      </div>
 
 
 <div class="control-group">
 
    <label class="control-label" > Address 1:</label> <asp:TextBox ID="txtAddress1NewUser" runat="server" class="input-xlarge"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAddress1NewUser" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           
 
 </div>
 <div class="control-group">
   <label class="control-label" >Address 2:</label> <asp:TextBox ID="txtAddress2NewUser" runat="server" class="input-xlarge"></asp:TextBox>
    
 </div>
 
       <div id="addressdiv">
            <div  id="zipcodediv">
 
    <label class="control-label" > Zip/Postal Code:</label> <asp:TextBox ID="txtZipcodeNewUser" runat="server"  class='zip-lookup-field-zipcode' MaxLength="5" ></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtZipcodeNewUser" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           
 
 
              
 
 
                
 
 
 </div>
    
            
 
           <div class="control-group">
 
    <label class="control-label" > City:</label> <asp:TextBox ID="txtCityNewUser" runat="server" class='zip-lookup-field-city'></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCityNewUser" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           
 
 </div>
 
   </div>
              
                        
                
                 <div class="control-group">
 
   <label class="control-label" >  Contact Phone:</label> <asp:TextBox ID="txtContactPhoneNewUser" runat="server" class="input-xlarge"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtContactPhoneNewUser" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           
 
 
 </div>
 
         <%-- <div class="control-group">
 
   <label class="control-label" > User Name :</label> <asp:TextBox ID="txtUsernameNew" runat="server" class="input-xlarge"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtUsernameNew" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           
 
 </div>--%>
                 <div class="control-group">
 
   <label class="control-label" > Email:</label> <asp:TextBox ID="txtEmailNewUser" runat="server" class="input-xlarge"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtEmailNewUser" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           
 
 </div>
                 <div class="control-group">
 
    <label class="control-label" > Confirm Email:</label> <asp:TextBox ID="txtComfirmEmailNewUser" runat="server" class="input-xlarge"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtComfirmEmailNewUser" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           
 
 </div>
  
   
 
     <asp:Panel ID="pnlPassword" runat="server">
      <div class="control-group">
 
   <label class="control-label" >  Password:</label> <asp:TextBox ID="txtNewUserPassword" runat="server" class="input-xlarge" TextMode="Password"></asp:TextBox>
    
 </div>
                 <div class="control-group">
 
    <label class="control-label" > Confirm Password:</label> <asp:TextBox ID="txtNewUserPasswordConfirm" runat="server" class="input-xlarge" TextMode="Password"></asp:TextBox>
    
 </div>
    </asp:Panel> 
 
        <br />
           <asp:Label ID="lblMessageNewUserSave" runat="server" ></asp:Label>
       
 
         <div style="clear:both;"></div>   
 <br>
   <div class="">  <asp:LinkButton ID="lnkCreateNewUser" runat="server" CssClass="right-btn btn3" Text="SAVE" Width="200px" OnClick="lnkCreateNewUser_Click" ValidationGroup="saveRecord"></asp:LinkButton>
                      
   
         </div>
      
 
 
 
     </asp:Panel>
 </div>
 
 
                         </div>
 
 
   
          
                         
                         <div class="col-lg-6 col-sm-6 padbot20">      
                            
 
 
 <div class="boat-page-overview">
           <h4 class="red">Step 5 : Renters Information.</h4>  
 
         <h2 class="red">Payment Information:</h2>
             
    <%-- <label class="control-label" >Select Payment Type</label>
 
 
 
 <select id="Select1" name="Payment Type" class="input-xlarge">
                       <option>Visa</option>
                       <option>Master Card</option>
                     <option>Amex</option>
                     <option>Discover</option>
                 </select>
  <div style="clear:both;"></div>   
 <br>--%>
 
             <label class="control-label" >Card Number</label>
   
     <asp:TextBox ID="txtCardNumber" runat="server" CssClass="input-xlarge"></asp:TextBox>
 
      <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtCardNumber" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="payment"></asp:RequiredFieldValidator>           
 
     <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterType="Numbers"
     TargetControlID="txtCardNumber" />
 
 
 
  <div style="clear:both;"></div>   
 <br>
     
 
     
 
 <label class="control-label" >Expiration Date</label>
    
    
   
     
      <div style="clear:both;"></div>   
 <br>
 
 
    <label class="control-label" >CID#</label> 
    
     <asp:TextBox ID="txtCID" runat="server" CssClass="input-xlarge" style="width:120px;"></asp:TextBox>
 
        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtCID" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="payment"></asp:RequiredFieldValidator>           
     <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" FilterType="Numbers"
     TargetControlID="txtCID" />
 <div style="clear:both;"></div>
 
 
 <label class="control-label" >Name on the Card</label>
 
     <asp:TextBox ID="txtNameOnCard" runat="server" CssClass="input-xlarge"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtNameOnCard" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="payment"></asp:RequiredFieldValidator>           
 
   <div style="clear:both;"></div>   
 <br>
 
     <div style="clear:both;"></div>   
 <br>
 
     <asp:CheckBox ID="chkBillingAddressDifferent" runat="server" style="width:15px; height:15px;  display:inline;" AutoPostBack="true" OnCheckedChanged="chkBillingAddressDifferent_CheckedChanged"/>
 *If the billing address is different check here 
 
 <br><br>
 
 <asp:Panel ID="pnlBillingAddress" runat="server">
 
     <div class="control-group">
 
    <label class="control-label" >Street Address:</label> <asp:TextBox ID="txtBilingStreetAddress" runat="server" class="input-xlarge"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtBilingStreetAddress" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="billing"></asp:RequiredFieldValidator>           
 
 </div>
 
        <div class="control-group">
 
    <label class="control-label" > Zip/Postal Code:</label> <asp:TextBox ID="txtBillingZipcode" runat="server" ></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtBillingZipcode" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="billing"></asp:RequiredFieldValidator>           
 
 </div>
       
 
    
            
             <div class="control-group">
 
   <label class="control-label" >  Country: </label>
                
             
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="ddBillingCountry" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="billing"></asp:RequiredFieldValidator>           
 
                   </div>
 
         <div class="control-group">
 
   <label class="control-label" >  State:</label>
             
       <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="ddBillingState" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="billing"></asp:RequiredFieldValidator>           
 
 
 </div>
 
           <div class="control-group">
 
    <label class="control-label" > City:</label> <asp:TextBox ID="txtBillingCity" runat="server" ></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtBillingCity" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="billing"></asp:RequiredFieldValidator>           
 
 </div>
 
   
              
 
 
 </asp:Panel>
 
 
 
 
 <h4 class="red">Step 6: You're almost done!</h4>
 
 <h4 class="red">Press PURCHASE to receive confirmation, boat information, and directions to the boat.</h4>
   
 <br>
 
   <asp:Label ID="lblMessage" runat="server" Font-Bold="true" Font-Size="Large" ForeColor="Red"></asp:Label> 
    <br />
     
 <div class="btns" align="left">                     
 
     <asp:LinkButton ID="lnkGoback" runat="server" Text="GO BACK" class="btn3 " OnClick="lnkGoback_Click"></asp:LinkButton>
          </div>            
 <div class=""  style="margin-left:20px;">
       <asp:LinkButton ID="lnkPurchase" runat="server" Text="PURCHASE" OnClick="lnkPurchase_Click" class="right-btn btn3 "   OnClientClick="this.style.visibility= 'hidden';ShowProgress();"  ></asp:LinkButton>  
     
      </div>
 
 
   
     
 
     </div>
 
 </div>
                       </div>
 
 
 <div class="loading" align="center">
     Processing Credit Card. Please wait...<br />
     <br />
     <img alt="loading" src="img/loader.gif" style="margin-left:40px;margin-right:40px; margin-top:40px;" />  
 </div>
 <script type="text/javascript">
     function ShowProgress() {
         setTimeout(function () {
             var modal = $('<div />');
             modal.addClass("modal");
             $('body').append(modal);
             var loading = $(".loading");
             loading.show();
             var top = Math.max($(window).height() / 2 - loading[0].offsetHeight / 2, 0);
             var left = Math.max($(window).width() / 2 - loading[0].offsetWidth / 2, 0);
             loading.css({ top: top, left: left });
         }, 1);
     }
    
 
 
 
     function pageLoad()
     {
         
 
         var loading = $(".loading");
         loading.hide();
     }
 </script>
 
 </fieldset>
          
 
 
                <asp:ModalPopupExtender ID="mdlPopup" runat="server"
     TargetControlID="btnHidden"
     PopupControlID="pnlNoAvailability"
     BackgroundCssClass="modalBackground" 
     DropShadow="true" 
    
     
    
    />
    
 <asp:Button ID="btnHidden" runat="server" style="display: none" />
 
 
              <asp:Panel id="pnlNoAvailability" style="display: none" runat="server">
     
                              
                  <div style="background-color:white">
                 <div style="background-color:red;color:white">
                    
                      <asp:Label ID="lblModelHeader" runat="server"></asp:Label>
                 </div>
                 <div style="margin-top:10px;">                   
                       <asp:Label ID="lblModelBody" runat="server" Font-Bold="true" ></asp:Label>
                     
                 </div>
                      <br />
                      <br />
 
                 <div align="center" >
                     <asp:Button ID="btnOK" runat="server" Text ="OK"  OnClick="btnOK_Click"  Font-Bold="true" CssClass="btn3 " Width="100px"/>
                     
                  </div>
         </div>
 </asp:Panel>
              
 
 
 
 
                 <asp:ModalPopupExtender ID="mdlError" runat="server"
     TargetControlID="Button1"
     PopupControlID="pnlError"
     BackgroundCssClass="modalBackground" 
     CancelControlID="btnCancelError"
     DropShadow="true" 
    
     
    
    />
    
 <asp:Button ID="Button1" runat="server" style="display: none" />
 
 
              <asp:Panel id="pnlError" style="display: none" runat="server">
     
                              
                  <div style="background-color:white">
                 <div style="background-color:red;color:white">
                    
                      <asp:Label ID="lblPopupErrorHeader" runat="server" Font-Bold="true"></asp:Label>
                 </div>
                 <div style="margin-top:10px;">                   
                       <asp:Label ID="lblPopupErrorMessage" runat="server" Font-Bold="true" ForeColor="Red" ></asp:Label>
                     
                 </div>
                      <br />
                      <br />
 
                 <div align="center" >
                     <asp:Button ID="btnCancelError" runat="server" Text ="OK"    Font-Bold="true" CssClass="btn3 " Width="100px"/>
                     
                  </div>
         </div>
 </asp:Panel>
 
 
 
 
  </ContentTemplate>
 
      </asp:UpdatePanel>   
              
     
      
        
      
     
 
 
 
             
    </div>
    </div>
</section>
</form>
<!-- FOOTER -->
<section class="section bg-gradient pb-4 pt-5">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 text-center text-lg-left">
                <div class="footer-info">
                   <a href="index.aspx"> <img src="images/logo-light.png" class="img-fluid" width="200"> </a>
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
                            <select class="form-control" id="exampleFormControlSelect1">
                              <option selected style="color: black;"> Select Language</option>
                              <option style="color: black;">English</option>
                              <option style="color: black;">French</option>
                            </select>
                          </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 text-center text-lg-right">
                <p class="text-uppercase footer-title"><a href="contact_us.aspx">Contact Us</a></p>
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
                <p>Copyright 2021 Rent A Boat, RentABoat.com | 320 South Country's Rd. Brookhaven NY, 11719</p>
            </div>
            <div class="col-lg-4 footer-end text-center text-lg-right">
                <p><a href="#">Terms</a> | <a href="#">Privacy</a> | <a href="#">Compliances</a></p>
            </div>
        </div>
    </div>
</section>
 <!-- Optional JavaScript -->
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 <script src="js/popper.min.js"></script>
 <script src="js/bootstrap.bundle.min.js"></script>
 <script src="js/jquery.easing.min.js"></script>
<script>
$(document).ready(function(){
    $('#returnLogin').click(function(){
        $("#login").attr('class', 'd-block');
        $("#create1").attr('class', 'd-none');
        $("#create2").attr('class', 'd-none');
        $('#returnLogin').attr('class', 'd-none');
    });
    $('#createBtn').click(function(){
        $("#login").attr('class', 'd-none');
        $("#create1").attr('class', 'd-block');
        $("#create2").attr('class', 'd-none');
        $('#returnLogin').attr('class', 'd-block float-right');
    });
    $('#nextBtn').click(function(){
        $("#login").attr('class', 'd-none');
        $("#create1").attr('class', 'd-none');
        $("#create2").attr('class', 'd-block');
        $('#returnLogin').attr('class', 'd-block float-right');
    });
    $('#backBtn').click(function(){
        $("#login").attr('class', 'd-none');
        $("#create1").attr('class', 'd-block');
        $("#create2").attr('class', 'd-none');
        $('#returnLogin').attr('class', 'd-block float-right');
    });
    $('#completeBtn').click(function(){
        $("#accountGroup").attr('class', 'd-none');
        $("#paymentGroup").attr('class', 'd-block card p-4');
    });
    $('#check2').click(function(){
        if ($('#secondary').attr("class") == "d-block"){
            $("#secondary").attr('class', 'd-none');
            $('#check1').prop('checked', true);
            $('#check2').prop('checked', false);
        }else{
            $("#secondary").attr('class', 'd-block');
            $('#check1').prop('checked', false);
            $('#check2').prop('checked', true);
        }
    });
    $('#check1').click(function(){
        if ($('#secondary').attr("class") == "d-block"){
            $("#secondary").attr('class', 'd-none');
            $('#check1').prop('checked', true);
            $('#check2').prop('checked', false);
        }else{
            $("#secondary").attr('class', 'd-block');
            $('#check1').prop('checked', false);
            $('#check2').prop('checked', true);
        }
    });
    $('#returnChange').click(function(){
        $("#accountGroup").attr('class', 'd-block card p-4');
        $("#login").attr('class', 'd-none');
        $("#create1").attr('class', 'd-block');
        $("#create2").attr('class', 'd-none');
        $('#returnLogin').attr('class', 'd-none');
        $('#returnPayment').attr('class', 'd-block float-right');
        $('#nextBtn').attr('class', 'd-none');
        $('#changeBtn').attr('class', 'd-block btn btn-info btn-block text-capitalize');
        $("#paymentGroup").attr('class', 'd-none');
        $("#changedEmail").attr('class', 'form-group d-block');
    });
    $('#changeBtn').click(function(){
        $("#accountGroup").attr('class', 'd-none');
        $("#paymentGroup").attr('class', 'd-block card p-4');
    });
    $('#returnPayment').click(function(){
        $("#accountGroup").attr('class', 'd-none');
        $("#paymentGroup").attr('class', 'd-block card p-4');
    });
    $('#cancelBtn').click(function(){
        $("#accountGroup").attr('class', 'd-block card p-4');
        $("#login").attr('class', 'd-block');
        $("#create1").attr('class', 'd-none');
        $("#create2").attr('class', 'd-none');
        $('#returnLogin').attr('class', 'd-none');
        $("#paymentGroup").attr('class', 'd-none');
    });
});
</script>
</body>
</html>