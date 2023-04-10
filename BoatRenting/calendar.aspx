<%@ Page Language="C#" AutoEventWireup="true" CodeFile="calendar.aspx.cs" Inherits="calendar" %>

<%@ Register Src="~/ctlNoRentingInfo.ascx" TagPrefix="uc1" TagName="ctlNoRentingInfo" %>
<%@ Register Src="~/ctlBoatQuestions.ascx" TagPrefix="uc1" TagName="ctlBoatQuestions" %>

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="Cache-control" content="public, max-age=600" />
    <link rel="icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
    <meta name="format-detection" content="telephone=1-888-610-2628" />
    <meta name="description" content="Find & book affordable boat rentals with or without a captain. Rent sailboats, jet skis, yachts charters and other watercrafts anywhere in the world. Rated #1 in customer satisfaction.">
    <meta name="keywords" content="Boat Rentals, rent a boat, Boat Rental, sail boat rentals, sailboat rental, houseboat rental, boat rental and charter, boat, boating, boats, ski boat rentals, boating clubs, jet ski rentals, personal water craft rentals, pwc rentals, yacht charters, Cabin boat rentals, power boat rentals, worldwide boat rentals">
    <meta name="author" content="Kenny Hilderbrandt">
    <meta name="google-site-verification" content="o_nt02lBg_GRoNrr7bSFXxw5lo7F8ULgeHZ58KaGx10" />


    <asp:Literal ID="ltrogtags" runat="server"></asp:Literal>


    <meta http-equiv="Expires" content="30" />

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <meta name="robots" content="index, follow" />
    <meta
        name="googlebot"
        content="index, follow, max-snippet:-1, max-image-preview:large, max-video-preview:-1" />
    <meta
        name="bingbot"
        content="index, follow, max-snippet:-1, max-image-preview:large, max-video-preview:-1" />
    <meta property="fb:pages" content="22764423720" />
    <meta
        name="robots"
        content="max-snippet:-1, max-image-preview:large, max-video-preview:-1" />
    <link rel="canonical" href="https://www.rentaboat.com/" />
    <meta property="og:locale" content="en_US" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="Rent A Boat" />
    <meta
        property="og:description"
        content="Find & book affordable boat rentals with or without a captain. Rent sailboats, jet skis, yachts charters and other watercrafts anywhere in the world. Rated #1 in customer satisfaction." />
    <meta property="og:url" content="https://www.rentaboat.com/" />
    <meta property="og:site_name" content="Rent A Boat" />
    <meta
        property="article:publisher"
        content="https://www.facebook.com/RentaBoatcom-244505213935" />
    <meta
        property="article:published_time"
        content="2020-12-28T14:00:30+00:00" />
    <meta
        property="article:modified_time"
        content="2020-12-27T14:12:12+00:00" />
    <meta
        property="og:image"
        content="https://www.rentaboat.com/images/logo-dark.png" />
    <meta property="og:image:width" content="1600" />
    <meta property="og:image:height" content="840" />
    <meta property="fb:app_id" content="{appId}" />
    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:creator" content="@RentABoat_com" />
    <meta name="twitter:site" content="@RentABoat_com" />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400&family=Poppins:wght@600;700;800;900&display=swap" rel="stylesheet">
    <script async src="https://static.addtoany.com/menu/page.js"></script>
    <link href="css/menu.css" rel="stylesheet">
    <link href="css/styleN.css" rel="stylesheet">
    <title>Rent A Boat</title>
    <script src="js/googletracking.js" type="text/javascript"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDWHiLBM1hzypiPVydCCSLoYbRPMbG2C-M&libraries=places"></script>
    <script>
        var placeSearch, autocomplete, autocomplete1;
        var componentForm = {
            street_number: 'short_name',
            route: 'long_name',
            locality: 'long_name',
            administrative_area_level_1: 'short_name',
            country: 'long_name',
            postal_code: 'short_name',

        };
        var cleared = false;
        function clearAddressSelection() {


            if (!cleared) {



                var st = document.getElementById('<%= txtStreetName.ClientID %>');
                st.value = "";

                var city = document.getElementById('<%= txtCityName.ClientID %>');
                city.value = "";

                var state = document.getElementById('<%= txtState.ClientID %>');
                state.value = "";

                var zip = document.getElementById('<%= txtZipCode.ClientID %>');
                zip.value = "";

                var lat = document.getElementById('<%= txtLat.ClientID %>');
                lat.value = "";

                var lon = document.getElementById('<%= txtLon.ClientID %>');
                lon.value = "";



                cleared = true;

            }

        }

        function initialize() {
            // Create the autocomplete object, restricting the search
            // to geographical location types.
            //  clearAddressSelection();
            autocomplete = new google.maps.places.Autocomplete(
             /** @type {HTMLInputElement} */(document.getElementById("<%=txtSearch.ClientID%>")),
                { types: ['geocode'] });
            // When the user selects an address from the dropdown,
            // populate the address fields in the form.
            google.maps.event.addListener(autocomplete, 'place_changed', function () {
                fillInAddress();
            });


        }

        // The START and END in square brackets define a snippet for our documentation:
        // [START region_fillform]
        function fillInAddress() {
            // Get the place details from the autocomplete object.
            var place = autocomplete.getPlace();




            var latlng = place.geometry.location;


            var address = "";
            var streetno = "";
            var route = "";
            var locality = "";
            var postalcode = "";
            var administrativearea = "";
            var country = "";

            // Get each component of the address from the place details
            //and fill the corresponding field on the form.
            for (var i = 0; i < place.address_components.length; i++) {
                var addressType = place.address_components[i].types[0];
                // alert(addressType);
                if (componentForm[addressType]) {
                    var val = place.address_components[i][componentForm[addressType]];
                    //  document.getElementById(addressType).value = val;
                    //alert(addressType);

                    if (addressType == "street_number")
                        streetno = val;
                    else if (addressType == "route")
                        route = val;
                    else if (addressType == "locality")
                        locality = val;
                    else if (addressType == "postal_code")
                        postalcode = val;
                    else if (addressType == "administrative_area_level_1")
                        administrativearea = val;

                    else if (addressType == "country")
                        country = val;

                    // alert(val);

                }

            }

            // alert(postalcode);

            var st = document.getElementById('<%= txtStreetName.ClientID %>');
            st.value = route;

            var city = document.getElementById('<%= txtCityName.ClientID %>');
            city.value = locality;

            var state = document.getElementById('<%= txtState.ClientID %>');
            state.value = administrativearea;

            var zip = document.getElementById('<%= txtZipCode.ClientID %>');
            zip.value = postalcode;

            var lat = document.getElementById('<%= txtLat.ClientID %>');
            lat.value = latlng.lat();

            var lon = document.getElementById('<%= txtLon.ClientID %>');
            lon.value = latlng.lng();

            var coun = document.getElementById('<%= txtCountry.ClientID %>');
            coun.value = country;


            document.getElementById('<%=btnSearch.ClientID%>').click();

        }

        function fillInAddress1() {
            // Get the place details from the autocomplete object.
            var place = autocomplete1.getPlace();




            var latlng = place.geometry.location;


            var address = "";
            var streetno = "";
            var route = "";
            var locality = "";
            var postalcode = "";
            var administrativearea = "";
            var country = "";

            // Get each component of the address from the place details
            //and fill the corresponding field on the form.
            for (var i = 0; i < place.address_components.length; i++) {
                var addressType = place.address_components[i].types[0];
                // alert(addressType);
                if (componentForm[addressType]) {
                    var val = place.address_components[i][componentForm[addressType]];
                    //  document.getElementById(addressType).value = val;
                    //alert(addressType);

                    if (addressType == "street_number")
                        streetno = val;
                    else if (addressType == "route")
                        route = val;
                    else if (addressType == "locality")
                        locality = val;
                    else if (addressType == "postal_code")
                        postalcode = val;
                    else if (addressType == "administrative_area_level_1")
                        administrativearea = val;

                    else if (addressType == "country")
                        country = val;

                    // alert(val);

                }

            }

            // alert(postalcode);

            var st = document.getElementById('<%= txtStreetName.ClientID %>');
            st.value = route;

            var city = document.getElementById('<%= txtCityName.ClientID %>');
            city.value = locality;

            var state = document.getElementById('<%= txtState.ClientID %>');
            state.value = administrativearea;

            var zip = document.getElementById('<%= txtZipCode.ClientID %>');
            zip.value = postalcode;

            var lat = document.getElementById('<%= txtLat.ClientID %>');
            lat.value = latlng.lat();

            var lon = document.getElementById('<%= txtLon.ClientID %>');
            lon.value = latlng.lng();

            var coun = document.getElementById('<%= txtCountry.ClientID %>');
            coun.value = country;


            document.getElementById('<%=btnSearch.ClientID%>').click();

        }

    </script>
    <style>
        .carousel-inner img {
            width: 100%;
            height: 250px;
        }
        .carousel-indicators li {
            position: relative;
            -ms-flex: 0 1 auto;
            flex: 0 1 auto;
            width: 10px;
            height: 10px;
            margin-right: 3px;
            margin-left: 3px;
            text-indent: -991px;
            cursor: pointer;
            border-radius: 5px;
            background-color: darkgray;
            top: 50px;
        }
        .carousel-indicators .active {
            background-color: #FE5974;
        }
        #more {display: none;}
        #readMoreBtn{
            outline:none;
            border: none;
            background-color: white; color: #FE5974 !important; 
            font-size:16px; font-weight:bold; 
            text-decoration:underline!important;
        }
        .newDropDownStype{
            display: inline-block;
            height: 3em;    
            -webkit-appearance: none;
            -moz-appearance: none;
            height: 25px!important;
            border: none;
            outline: none;
            color:red;
            overflow-y: hidden;
            float: right;
            margin-right: 35px;
            margin-top: 8px;
        }
        .newDropDownStype option{
            display: inline-block;
            width: 2.5em;
            height: 2.5em;
            float: left;
            font-weight: bold;
        }
        .newDropDownStype option:first-child{
            border-right:2px solid #C9C9C9;
        }
        .dropdown-item {
            border-radius: 8px;
            border: 5px solid #fff;
            color: #fff;
            text-align: center;
        }

            .dropdown-item:hover,
            .dropdown-item:focus {
                border-radius: 8px !important;
                border: 5px solid #fff !important;
                color: #fff;
                text-align: center !important;
            }

        #dropdownMenuButton:hover,
        #dropdownMenuButton:focus,
        #share1:hover,
        #share1:focus, 
        #share2:hover,
        #share2:focus,
        #share3:hover,
        #share3:focus,
        #share4:hover,
        #share4:focus
        {
            
            opacity: 0.5;
        }
        .details_label{
            font-weight: bold;
            padding-right: 10px;
        }
        .mini-span{
            width: 25px;
            display: inline-block;
            margin-right: 20px;
        }
        .boatPriceTable{
            width: 100% !important;
        }
        #hr-detail{
            display: none;
        }
        #boat-description-div{
            margin-bottom: unset;
        }
        .td-1{
            padding-right:18px; padding-bottom:18px;
        }
        .td-2{
            padding-left:18px; padding-bottom:18px;
        }
        .td-3{
            padding-right:18px; padding-top:18px;
        }
        .td-4{
            padding-left:18px; padding-top:18px;
        }
        img.advancedImg{
            width: 250px;
            height: 200px;
            border: 1px solid black;
            margin-top: 1px;
        }
        img.allGalleryImgs{
            width: 100%;
            margin-bottom: 10px;
            border: 1px solid black;
        }
        .main-img{
            width: 100%; height: 438px!important;
        }
        .photo-btn{
            border: 2px solid #fe5974 !important; 
            background-color: white; 
            color: #FE5974 !important; 
            position: absolute; 
            top:86%; 
            left:68%; 
            border: 1px solid #fe5974; 
            cursor: pointer;
        }
        #lblBoatID{
            margin-right: 20px;
        }
        .date-span{
            font-weight: bold;
        }
        .btn-clear{
            color: #6c757d;
            background-color: white;
            border-radius: unset;
            border: 2px solid #6c757d;
            width: 150px;
            height: 44px;
            font-size: 16px;
        }
        .btn-continue{
            font-size: 16px;
            width: 150px;
            height: 44px;
            transition: all 0.4s;
            color: #fff !important;
            border: 1px solid #FE5974 !important;
            border-radius: 0;
            background-color: #FE5974;
        }
        #detail-div{
            margin-top: 50px;
        }
        .my-h1{
            font-size: 40px;
        }
        .my-h4{
            font-size: 30px;
        }
        .my-div-text{
            font-size: 16px;
        }
        .my-div-text-big{
            font-size: 25px;
        }
        .star-div{
            float: right !important;
            height: 25px;
            margin-top: 8px;
        }
        #dropdownMenuButton{
            width: 45px;
        }
        #share-div{
            float: right !important;
        }
        #click-here-a{
            background-color: white; 
            color: #FE5974 !important; 
            font-size:16px; 
            font-weight:bold; 
            text-decoration:underline!important;
        }
        #ddRentOption{
            font-size: 16px;
        }
        #span1{
            margin-right: 130px;
        }
        #span2{
            margin-right: 35px;
        }
        .btn-contact{
            border: 2px solid #FE5974 !important; 
            margin-top: 28px; 
            background-color: white; 
            color: #FE5974 !important;
            border-radius: unset;
        }
        #ddCurrency{
            width: 90px; 
            height: 40px; 
            float: right;
            margin-bottom: 20px;
        }
        .dot {
            height: 10px;
            width: 10px!important;
            background-color: #bbb;
            border-radius: 50%;
            display: inline-block;
            margin: 10px;
            padding: 0px;
            border: unset;
            color: #bbb;
        }
        .dot:hover{
            color: #FE5974 !important;
            background-color: #FE5974 !important;
        }
        .hr1{
            margin-top: 85px; 
            margin-bottom: 85px; 
            width: 100%;
        }
        .hr2{
            margin-top: 85px; 
            margin-bottom: 85px; 
            width: 100%;
        }
        .pick-span{
            margin-left: unset;
        }
        .drop-span{
            margin-left: 40px;
        }
        .my-br{
            display: none;
        }
        .my-div1{
            margin-top: 100px;
            margin-bottom: 125px;
        }
        .expand-div{
        }
        @media only screen and (max-device-width: 480px) {
            .expand-div{
                padding: 0 !important;
            }
            .my-div1{
                margin-top: 65px;
                margin-bottom: 75px;
            }
            .pick-span{
                margin-left: 15px;
            }
            .drop-span{
                margin-left: 15px;
            }
            .my-br{
                display: block;
            }
            .hr1{
                margin-top: 60px; 
                margin-bottom: 60px; 
                width: 100%;
            }
            .hr2{
                margin-top: 60px; 
                margin-bottom: 60px; 
                width: 93%;
            }
            #ddCurrency{
                margin-top: -10px;
            }
            .btn-contact{
                border: 2px solid #FE5974 !important; 
                margin-top: 28px; 
                background-color: white; 
                color: #FE5974 !important;
                width: 190px;
                height: 45px;
                font-size: 12px;
                padding: 12px 1px;
                border-radius: unset;
            }
            #span1{
                margin-right: 89px;
            }
            #span2{
                margin-right: 5px;
            }
            .mini-span{
                width: 18px;
                display: inline-block;
                margin-right: 3px;
            }
            #ddRentOption{
                font-size: 12px;
            }
            #click-here-a{
                font-size:14px; 
            }
            #readMoreBtn{
                font-size:14px;
            }
            #detail-div{
                margin-top: 30px;
            }
            .my-h1{
                font-size: 25px;
            }
            .my-h4{
                font-size: 20px;
            }
            .my-div-text{
                font-size: 14px;
            }
            .my-div-text-big{
                font-size: 14px;
            }
            .star-div{
                float: left !important;
                height: 18px;
                margin-top: 7px;
            }
            #dropdownMenuButton{
                width: 35px;
            }
            #share-div{
                float: right !important;
            }
            #hr-detail{
                display: block;
            }
            #boat-description-div{
                margin-bottom: 85px;
            }
            .boatPriceTable{
                font-size: 11px;
            }
            .td-1{
                padding-right:8px; padding-bottom:8px;
            }
            .td-2{
                padding-left:8px; padding-bottom:8px;
            }
            .td-3{
                padding-right:8px; padding-top:8px;
            }
            .td-4{
                padding-left:8px; padding-top:8px;
            }
            img.advancedImg{
                width: 80px;
                height: 80px;
                border: 1px solid black;
                margin-top: 1px;
            }
            .main-img{
                height: 350px !important;
            }
            .photo-btn{
                border: 2px solid #fe5974 !important; 
                background-color: white; 
                color: #FE5974 !important; 
                position: absolute; 
                top:104%; 
                left:70%; 
                border: 1px solid #fe5974; 
                cursor: pointer;
                width: 100px;
                height: 35px;
                font-size: 14px;
                padding: 5px;
                text-transform: unset;
                text-align: center;
            }
            #lblBoatID{
                display: block;
            }
        }
    </style>
</head>
<body class="body">
    <form id="frmBoatDetails" runat="server">
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
                                    <a href="index.aspx">Home</a>
                                </li>
                                <li class="active nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">RENT a Boat</a>
                                    <div class="dropdown-menu sub-menu" aria-labelledby="navbarDropdown2">
                                        <a class="dropdown-item" href="how_to_rent_a_boat.aspx">How To Rent</a>
                                        <a class="dropdown-item" href="renter_faqs.aspx">Renter FAQ's</a>

                                    </div>
                                </li>

                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown3" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">LIST YOUR BOAT</a>
                                    <div class="dropdown-menu sub-menu" aria-labelledby="navbarDropdown2">
                                        <a class="dropdown-item" href="how-It-works.aspx">How it Works</a>
                                        <a class="dropdown-item" href="./admin/BoatOwnerSignup.aspx">List Your Boat</a>
                                        <a class="dropdown-item" href="owners-faqs.aspx">Owner FAQ's</a>
                                        <a class="dropdown-item" href="marine-liability-insurance.aspx">Marine Liability Insurance</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown ">
                                    <a class="nav-link dropdown-toggle" href="how-It-works.aspx" id="navbarDropdown4" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">WHY RENTING</a>
                                    <div class="dropdown-menu sub-menu" aria-labelledby="navbarDropdown2">
                                        <a class="dropdown-item" href="renting-vs-owning.aspx">Renting vs. Owning</a>
                                        <a class="dropdown-item" href="rental-tips.aspx">Rental Tips</a>

                                    </div>
                                </li>
                                <li class="">
                                    <a href="about-us.aspx">ABOUT US</a>
                                </li>
                                <li class="">
                                    <a href="contact_us.aspx">Contact Us</a>
                                </li>

                                <li class="">
                                    <button class="btn btn-custom align-nav" data-toggle="modal" data-target="#exampleModalCenter" onclick="javascript:return false;">SIGN IN</button>
                                </li>


                                <li></li>
                            </ul>
                        </div>
                        <div class="searchbar">
                            <div class="text-center search-form">
                                <div class="form-on-scroll">
                                    <asp:TextBox type="text" placeholder="Where would you like to go boating?" runat="server" ID="txtSearch"></asp:TextBox>
                                    <button type="submit" class="btn btn-custom-search" runat="server" id="btnSearch" onserverclick="btnSearch_Click"><i class="fas fa-search pr-0 pr-lg-2"></i><span class="d-none d-lg-inline">SEARCH</span></button>
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

        <%--------------body-section---------------%>
        <%-- <asp:Literal ID="lblMarinaAddress" runat="server"></asp:Literal>--%>
        <section class="section pb-4 mt-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-12" id="detail-div">
                        <h1 class="my-h1">Boat Details</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-8 col-12 my-div-text-big">
                        <asp:Literal ID="lblNewTitle" runat="server"></asp:Literal>
                    </div>
                    <div class="col-md-4 col-12">
                        <div id="share-div">
                            <img src="img/share.PNG" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="padding: 3px; margin: 5px 0px 0px -8px;">
                                <a id="share1" runat="server" target="_blank" class="btn btn-primary dropdown-item" style="background-color: #3b5998;" href="#!" role="button"><i class="fab fa-facebook me-2"></i>&nbsp; SHARE</a>
                                <a id="share2" runat="server" target="_blank" class="btn btn-primary dropdown-item" style="background-color: #cb2027;" href="#!" role="button"><i class="fab fa-pinterest me-2"></i>&nbsp; PIN</a>
                                <a id="share3" runat="server" target="_blank" class="btn btn-primary dropdown-item" style="background-color: #E37D71;" href="#!" role="button"><i class="fas fa-envelope me-2"></i>&nbsp; EMAIL</a>
                                <a id="share4" runat="server" target="_blank" class="btn btn-primary dropdown-item" style="background-color: #55acee;" href="#!" role="button"><i class="fab fa-twitter me-2"></i>&nbsp; TWEET</a>
                            </div>
                        </div>
                        <div class="star-div"><asp:Literal ID="ltrRating" runat="server"></asp:Literal></div>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="d-none d-sm-block col-md-6 col-12 boat-page-image" style="padding-top: 3px">
                                <img src="" alt="" runat="server" id="mainboatpic" class="main-img" />
                                <asp:HiddenField ID="hpicmain" runat="server" />
                            </div>
                            <div class="d-none d-sm-block col-md-6 boat-page-thumb">
                                <asp:Literal ID="advancedImageGallery" runat="server"></asp:Literal>
                                <!-- <iframe style="height: 100%; width: 100%; border-width: inherit;" marginheight="0" marginwidth="0" scrolling="auto" name="f_morePic" src="picscroll.aspx"></iframe> -->
                            </div>
                            <div class="d-block d-sm-none col-12 expand-div">
                                <asp:Literal ID="mobileImageGallery" runat="server"></asp:Literal>
                            </div>
                        </div>
                        <div class="my-div-text" style="padding-top: 10px; color: #888888;">
                            <asp:Label ID="lblBoatID" runat="server"></asp:Label>
                            <asp:Label ID="lblFacilityNumber" runat="server"></asp:Label>
                        </div>
                        <!-- <div class="row mt-3 pl-3">
                            <div class="col-12">
                                <div class="row" style="padding-right: 15px;">
                                    <div class="col" style="height: 42px; padding: 0;">
                                        <asp:Literal ID="ltrSocialButtons" runat="server"></asp:Literal>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                        <div class="row mt-3">
                            <div class="col-md-6 expand-div">
                                <div class="mt-2">
                                    <h4 class="my-h4">Boat Description</h4>
                                </div>
                                <div id="boat-description-div" class="mt-2 my-div-text">
                                    <asp:Literal ID="lblBoatDescription" runat="server"></asp:Literal>
                                </div>
                            </div>
                            <div class="col-md-6 expand-div">
                                <div>
                                    <span class="my-h4" style="font-weight: 600; font-family: 'Poppins', sans-serif !important;">Rental Price</span>
                                    <asp:DropDownList ID="ddCurrency" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddCurrency_SelectedIndexChanged" class="form-control"></asp:DropDownList>
                                </div>
                                <div class="mt-2">
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <asp:Literal ID="ltrPricing" runat="server"></asp:Literal>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="ddCurrency" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr class="hr1" style="margin-left: 15px; margin-right: 15px;">
                    <div class="col-md-6">
                        <div class="mt-2">
                            <h4 class="my-h4">Boat Details</h4>
                        </div>
                        <div class="mt-2 my-div-text">
                            <table class="boatdetails">
                                <tr>
                                    <td>
                                        <label class="details_label">Boat Name: </label><asp:Literal ID="lblBoatName1" runat="server"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="details_label">Location: </label>
                                        <asp:Label ID="lblCity" runat="server"></asp:Label>,&nbsp;
                                        <asp:Label ID="lblState" runat="server"></asp:Label>,&nbsp;
                                        <asp:Label ID="lblPostalCode" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="details_label">Body Of Water: </label><asp:Label ID="lblBodyOfWater" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="details_label">Captain or Guide Available For Hire: </label><asp:Literal ID="lblCaptain" runat="server"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="details_label">Make: </label><asp:Literal ID="lblBoatMake" runat="server"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="details_label">Model: </label><asp:Literal ID="lblBoatModel" runat="server"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="details_label">Year: </label><asp:Literal ID="lblBoatYear" runat="server"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="details_label">Length: </label><asp:Literal ID="lblBoatLength" runat="server"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="details_label">Passengers: </label><asp:Literal ID="lblPassengers" runat="server"></asp:Literal>
                                    </td>
                                </tr>
                                <tr id="divBoatSale" runat="server">
                                    <td>
                                        <label class="details_label">This Boat Is For Sale: </label><asp:Literal ID="lblBoatSalePrice" runat="server"></asp:Literal>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <hr id="hr-detail" class="hr1">
                    </div>
                    <div class="col-md-6">
                        <div>
                            <div class="mt-2">
                                <h4 class="my-h4">Make Rental Request</h4>
                            </div>
                        </div>
                        <div class="my-div-text">
                            <div>
                                <asp:UpdatePanel ID="uplChooseDate" runat="server">
                                    <ContentTemplate>
                                        <asp:Panel ID="pnlRenting" runat="server">
                                            <div>
                                                <div>
                                                    <div class="boat-page-overview">
                                                        <!-- <div id="divStep1" runat="server">
                                                            <h6 style="margin-top: 12px;">Step 1 : Choose Time </h6>
                                                        </div> -->
                                                        <div class="mt-3 mb-3">
                                                            <div>
                                                                <span class="date-span">Step 1: </span>Choose Type of Rental
                                                            </div>
                                                        </div>
                                                        <div">
                                                            <div>
                                                                <asp:DropDownList ID="ddRentOption" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddRentOption_SelectedIndexChanged"></asp:DropDownList>
                                                            </div>
                                                        </div>
                                                        <div class="mt-3">
                                                            <div>
                                                                <span class="date-span">Step 2: </span>Select Dates
                                                            </div>
                                                        </div>
                                                        <div class="mt-3">
                                                            <div>
                                                                <span class="date-span pick-span">Pick Up Date: </span><asp:Label ID="lblPickUpDate" class="text-danger" runat="server">MM/DD/YY</asp:Label><br class="my-br">
                                                                <span class="date-span drop-span">Drop Off Date: </span><asp:Label ID="lblDropOffDate" class="text-danger" runat="server">MM/DD/YY</asp:Label>
                                                            </div>
                                                        </div>
                                                        <div class="control-group">
                                                            <asp:Panel ID="pnlStartDateHide" runat="server">
                                                                <div id="divStartDateInfo" runat="server">
                                                                    <h6 class="d-none">Step 2: Please Select a Date </h6>
                                                                </div>
                                                                <asp:LinkButton ID="lnkSelectADate" runat="server" Text="Select Pick Up Date" OnClick="lnkSelectADate_Click" class="btn btn-secondary d-none"></asp:LinkButton>
                                                                <asp:Panel ID="pnlStartDateCalendar" runat="server" CssClass="popupControl">
                                                                    <div style="background-color: #f0f4f4; margin: 5px;">
                                                                        <table cellspacing="0" cellpadding="1" title="Calendar" border="0" style="color: Black; background-color: White; font-family: Verdana; font-size: 8pt; width: 100%!important; border-collapse: collapse;">
                                                                            <tr class="calPickupDropOff">
                                                                                <td class="calPickupDropOff">
                                                                                    <div style="background-color: #f0f4f4; padding: 0px;">
                                                                                        <!--must be no padding-->
                                                                                        <table class="calPickupDropOff" cellspacing="0" cellpadding="1" title="Calendar" border="0" style="color: Black; background-color: #f0f4f4; border-color: #999999; border-width: 1px; border-style: solid; font-family: Verdana; font-size: 8pt; width: 100%!important; border-collapse: collapse;">
                                                                                            <tr>
                                                                                                <td align="left" style="width: 15%;" class="calPickupDropOff">
                                                                                                    <asp:ImageButton ID="btnPreviousMonthStartDate" OnClick="btnPreviousMonthStartDate_Click" runat="server" ImageUrl="images/arrow-prev.jpg" />
                                                                                                </td>
                                                                                                <td align="center" style="width: 70%;" valign="bottom" class="calPickupDropOff">&nbsp; &nbsp;
                                                                                <asp:DropDownList ID="ddMonthStartCalendar" runat="server" Width="100px" AutoPostBack="true" OnSelectedIndexChanged="ddMonthStartCalendar_SelectedIndexChanged" Font-Bold="true">
                                                                                    <asp:ListItem Text="January" Value="1"></asp:ListItem>
                                                                                    <asp:ListItem Text="February" Value="2"></asp:ListItem>
                                                                                    <asp:ListItem Text="March" Value="3"></asp:ListItem>
                                                                                    <asp:ListItem Text="April" Value="4"></asp:ListItem>
                                                                                    <asp:ListItem Text="May" Value="5"></asp:ListItem>
                                                                                    <asp:ListItem Text="June" Value="6"></asp:ListItem>
                                                                                    <asp:ListItem Text="July" Value="7"></asp:ListItem>
                                                                                    <asp:ListItem Text="August" Value="8"></asp:ListItem>
                                                                                    <asp:ListItem Text="September" Value="9"></asp:ListItem>
                                                                                    <asp:ListItem Text="October" Value="10"></asp:ListItem>
                                                                                    <asp:ListItem Text="November" Value="11"></asp:ListItem>
                                                                                    <asp:ListItem Text="December" Value="12"></asp:ListItem>
                                                                                </asp:DropDownList>
                                                                                                    &nbsp; &nbsp;
                                                                                <asp:DropDownList ID="ddYearStartCalendar" runat="server" Width="70px" AutoPostBack="true" OnSelectedIndexChanged="ddYearStartCalendar_SelectedIndexChanged" Font-Bold="true">
                                                                                </asp:DropDownList>
                                                                                                </td>
                                                                                                <td align="right" style="width: 15%;" class="calPickupDropOff">
                                                                                                    <asp:ImageButton ID="btnNextMonthStartDate" OnClick="btnNextMonthStartDate_Click" runat="server" ImageUrl="images/arrow-next.jpg" />
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr class="calPickupDropOff">
                                                                                <td class="calPickupDropOff">
                                                                                    <asp:Calendar ID="calStartDate" runat="server" DayNameFormat="Shortest" CssClass="calPickupDropOff" OnSelectionChanged="calStartDate_SelectionChanged" OnVisibleMonthChanged="calStartDate_VisibleMonthChanged" OnDayRender="calStartDate_DayRender" ShowTitle="false">
                                                                                        <SelectedDayStyle />
                                                                                        <TodayDayStyle />
                                                                                        <SelectorStyle />
                                                                                        <WeekendDayStyle />
                                                                                        <OtherMonthDayStyle />
                                                                                        <NextPrevStyle />
                                                                                        <DayHeaderStyle CssClass="calPickupDropOff" />
                                                                                        <TitleStyle />
                                                                                    </asp:Calendar>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </div>
                                                                    <br />
                                                                </asp:Panel>
                                                            </asp:Panel>
                                                        </div>
                                                        <asp:Panel ID="pnlEndDateHide" runat="server">
                                                            <div id="divEndDateInfo" runat="server">
                                                                <h6 class="d-none">Step 2: Please Select a Drop Off Date </h6>
                                                            </div>
                                                            <asp:LinkButton ID="lnkEndDate" runat="server" Text="SELECT DROP OFF DATE" OnClick="lnkEndDate_Click" class="btn btn-secondary d-none"></asp:LinkButton>
                                                            <asp:Panel ID="pnlEndDateCalendar" runat="server" CssClass="popupControl">
                                                                <table cellspacing="0" cellpadding="1" title="Calendar" border="0" style="color: Black; background-color: White; font-family: Verdana; font-size: 8pt; border-collapse: collapse; width: 100%;">
                                                                    <tr class="calPickupDropOff">
                                                                        <td class="calPickupDropOff">
                                                                            <div style="background-color: #f0f4f4; padding: 5px;">
                                                                                <table cellspacing="0" cellpadding="1" title="Calendar" border="0" style="color: Black; background-color: #f0f4f4; font-family: Verdana; font-size: 8pt; border-collapse: collapse; width: 100%;">
                                                                                    <tr>
                                                                                        <td align="left" style="width: 15%;" class="calPickupDropOff">
                                                                                            <asp:ImageButton ID="btnPreviousMonthEndDate" OnClick="btnPreviousMonthEndDate_Click" runat="server" ImageUrl="images/arrow-prev.jpg" />
                                                                                        </td>
                                                                                        <td align="center" style="width: 70%;" valign="bottom" class="calPickupDropOff">&nbsp; &nbsp;
                                                                        <asp:DropDownList ID="ddMonthEndCalendar" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddMonthEndCalendar_SelectedIndexChanged" Width="100px" Font-Bold="true">
                                                                            <asp:ListItem Text="January" Value="1"></asp:ListItem>
                                                                            <asp:ListItem Text="February" Value="2"></asp:ListItem>
                                                                            <asp:ListItem Text="March" Value="3"></asp:ListItem>
                                                                            <asp:ListItem Text="April" Value="4"></asp:ListItem>
                                                                            <asp:ListItem Text="May" Value="5"></asp:ListItem>
                                                                            <asp:ListItem Text="June" Value="6"></asp:ListItem>
                                                                            <asp:ListItem Text="July" Value="7"></asp:ListItem>
                                                                            <asp:ListItem Text="August" Value="8"></asp:ListItem>
                                                                            <asp:ListItem Text="September" Value="9"></asp:ListItem>
                                                                            <asp:ListItem Text="October" Value="10"></asp:ListItem>
                                                                            <asp:ListItem Text="November" Value="11"></asp:ListItem>
                                                                            <asp:ListItem Text="December" Value="12"></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                                            &nbsp; &nbsp;
                                                                        <asp:DropDownList ID="ddYearEndCalendar" runat="server" Width="70px" AutoPostBack="true" OnSelectedIndexChanged="ddYearEndCalendar_SelectedIndexChanged" Font-Bold="true">
                                                                        </asp:DropDownList>
                                                                                        </td>
                                                                                        <td align="right" style="width: 15%;" class="calPickupDropOff">
                                                                                            <asp:ImageButton ID="btnNextMonthEndDate" OnClick="btnNextMonthEndDate_Click" runat="server" ImageUrl="images/arrow-next.jpg" />
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr class="calPickupDropOff">
                                                                        <td class="calPickupDropOff">
                                                                            <asp:Calendar ID="calEndDate" runat="server" DayNameFormat="Shortest" BackColor="White" BorderColor="#999999" CellPadding="1" Font-Names="Verdana" CssClass="calPickupDropOff" Font-Size="8pt" ForeColor="Black" OnSelectionChanged="calEndDate_SelectionChanged" OnVisibleMonthChanged="calEndDate_VisibleMonthChanged" OnDayRender="calEndDate_DayRender" ShowTitle="false">
                                                                                <SelectedDayStyle />
                                                                                <TodayDayStyle />
                                                                                <SelectorStyle />
                                                                                <WeekendDayStyle />
                                                                                <OtherMonthDayStyle />
                                                                                <NextPrevStyle />
                                                                                <DayHeaderStyle CssClass="calPickupDropOff" />
                                                                                <TitleStyle />
                                                                            </asp:Calendar>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <br />
                                                            </asp:Panel>
                                                            
                                                        </asp:Panel>
                                                        <asp:Panel ID="pnlStartEndTimeHide" runat="server">
                                                            <div id="divTimeInfo" runat="server">
                                                                <h4 class="my-h4" class="red">Step 3: Choose your hours </h4>
                                                            </div>
                                                            <asp:DropDownList ID="ddStartTime" runat="server"></asp:DropDownList>
                                                            <asp:DropDownList ID="ddEndTime" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddEndTime_SelectedIndexChanged"></asp:DropDownList>
                                                        </asp:Panel>
                                                    </div>
                                                </div>
                                            </div>
                                            <div>
                                                <div>
                                                    <span class="mini-span" style="background-color: #BADB85;">&nbsp;</span><span id="span1">Available</span>
                                                    <span class="mini-span" style="background-color: #fff; border: 1px solid #ccc;">&nbsp;</span><span>Not Available</span> 
                                                </div><br>
                                                <div>
                                                    <span class="mini-span" style="background-color: #F3A141;">&nbsp;</span><span id="span2">Available Half Day AM</span>
                                                    <span class="mini-span" style="background-color: #65ADB8;">&nbsp;</span><span>Available Half Day PM</span>
                                                </div>
                                            </div>
                                            <div>
                                                <div>
                                                    <asp:Panel ID="pnlOneDay" runat="server">
                                                        <hr style="margin-top: 30px; margin-bottom: 30px; width: 100%;">
                                                        <asp:Label ID="lblMessageOneDayRental" class="text-danger" runat="server"></asp:Label>
                                                        <div class="btns" style="float: left!important; margin-top: 19px;">
                                                            <asp:LinkButton ID="lnkClearSelectionOneDay" runat="server" class="btn btn-clear" Text="Clear" OnClick="lnkClearSelection_Click"></asp:LinkButton>
                                                        </div>
                                                        <div class="btns" style="float: right!important">
                                                            <div style="font-size: small" runat="server" id="divOneDayInfo" class="text-danger">Single day rental press</div>
                                                            <asp:LinkButton ID="lnkContinueWithOneDayRental" runat="server" class="btn btn-continue" Text="Continue" OnClick="lnkContinueWithOneDayRental_Click"></asp:LinkButton>
                                                        </div>
                                                    </asp:Panel>
                                                    <asp:Panel ID="pnlContinueHide" runat="server">
                                                        <div>
                                                            <span class="date-span" style="margin-bottom: 0px;">Step  <%=LastStepNo %>: </span>We need your information!
                                                        </div>
                                                        <div style="color: red; float: left; font-size: medium;">
                                                            <asp:Label ID="lblMessageContinue" runat="server"></asp:Label>
                                                        </div>
                                                        <br />
                                                        <div class="btns" style="float: left!important">
                                                            <asp:LinkButton ID="lnkClearSelection" runat="server" CssClass="btn btn-clear" Text="Clear" OnClick="lnkClearSelection_Click"></asp:LinkButton>
                                                        </div>
                                                        <div class="btns" style="float: left!important; margin-left: 15px;">
                                                            <asp:LinkButton ID="lnkContinue" runat="server" CssClass="btn btn-continue" Text="Continue" OnClick="lnkContinue_Click"></asp:LinkButton>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlNoRenting" runat="server">
                                            <uc1:ctlNoRentingInfo runat="server" ID="ctlNoRentingInfo" />
                                        </asp:Panel>
                                        <asp:HiddenField ID="txtAllowSameDayRental" Value="1" runat="server" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                <hr class="hr2">
                <div class="row">
                    <div class="col-md-12 expand-div">
                        <div class="row">
                            <div class="col-md-12 mt-2">
                                <h4 class="my-h4">Rental Details</h4>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mt-2 my-div-text">
                                <table class="rentaldetails">
                                    <tr>
                                        <td>
                                            <label class="details_label">Requirements:</label><asp:Literal ID="lblRequirements" runat="server"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="details_label">Cancellation Policy:</label><asp:Literal ID="lblCancellationPolicy" runat="server"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="details_label">Facility Name:</label><asp:Literal ID="lblOwner" runat="server"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="details_label">Tax Rates:</label><asp:Literal ID="lblTaxRate" runat="server"></asp:Literal>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-md-6 mt-2 my-div-text">
                                <table class="rentaldetails">
                                    <tr>
                                        <td>
                                            <label class="details_label">Reservation Deposit:</label><asp:Literal ID="lblReservationDeposit" runat="server"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="details_label">Security Deposit:</label><asp:Literal ID="lblSecurityDeposit" runat="server"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="details_label">More Boats From This Owner:</label><asp:Literal ID="lblMoreBoatsFromOwner" runat="server"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:HyperLink ID="lnkScrollBottom" runat="server" class="btn btn-contact"  NavigateUrl="#dvAsk"><span>Contact Boat Owner</span></asp:HyperLink>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <hr class="hr2">
                <div class="row">
                    <div class="col-md-12">
                        <iframe src="" frameborder="0" allowfullscreen runat="server" id="iframeVideo" style="width: 100%; min-height: 480px;"></iframe>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 expand-div">
                        <div class="row">
                            <div class="col-md-12 mt-2">
                                <h4 class="my-h4">Area and Attractions</h4>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 mt-2 mb-3 my-div-text">
                                <asp:Literal ID="lblAreaAttractions" runat="server"></asp:Literal>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 mt-2">
                                <iframe name="myIframe" id="myIframe" width="100%" height="400px" runat="server"></iframe>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- <div class="row mt-3 result-bg" style="padding: 15px;">
                    <div class="col-md-6">
                        <asp:LinkButton ID="btnShowAreaMap" runat="server" class="btn btn-custom " Style="width: 100%"><span>Area Map</span></asp:LinkButton>
                    </div>
                </div> -->
                <div class="row my-div1">
                    <div class="col-md-12 expand-div">
                        <div class="row">
                            <div class="col-md-12 mt-2">
                                <h4 class="my-h4" style="margin-bottom: 30px;">Questions and Answers about this Boat</h4>
                            </div>
                        </div>
                        <div class="row">
                            <div id="dvAsk" class="col-md-12 my-div-text" style="margin-top: -40px;">
                                <uc1:ctlBoatQuestions runat="server" ID="ctlBoatQuestions" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%--------------body-section end---------------%>


        <%--------------footer-section start---------------%>

        <section class="section bg-gradient pb-4 pt-5">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 text-center text-lg-left">
                        <div class="footer-info">
                            <a href="index.aspx">
                                <img src="images/logo-light.png" class="img-fluid" width="200">
                            </a>
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
                      Select Language: 
                                    <div id="google_translate_element">
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
                        <p class="text-uppercase footer-title"><a href="contact_us.aspx">Contact Us</a></p>
                        <div class="contact-us">
                            <p><i class="fas fa-phone-alt pr-2"></i><a href="tel:1-888-610">1-888-610-BOAT</a></p>
                            <p><i class="fas fa-phone-alt pr-2"></i><a href="tel:631-286-7816">631-286-7816</a></p>
                            <p><i class="fas fa-envelope pr-2"></i><a href="mailto:info@rentaboat.spam"><span>info@rentaboat.com</span></a></p>
                        </div>
                    </div>
                </div>
                <hr style="background-color: white;">
                <div class="row footer-bottom">
                    <div class="col-lg-8 text-center text-lg-left">
                        <p>© Copyright 2021 Rent A Boat, RentABoat.com | 320 South Counrty Rd. Brookhaven NY, 11719</p>
                    </div>
                    <div class="col-lg-4 footer-end text-center text-lg-right">
                        <p><a href="#">Terms</a> | <a href="#">Privacy</a> | <a href="#">Compliances</a></p>
                    </div>
                </div>
            </div>
        </section>

        <%--------------footer-section end---------------%>

        <!-- Modal SIgn in Sign Up -->
        <!-- Modal -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">

                    <div class="modal-body text-center padding-5">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <i class="far fa-times-circle"></i>
                        </button>
                        <h1 class="pb-4">Sign In</h1>


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
                                <a href="#" data-target="#forgotPasswordPopup" class="forgotpassword">Forgot Password?</a>
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
        <div class="modal fade" id="forgotPasswordPopup" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">

                    <div class="modal-body text-center padding-5">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <i class="far fa-times-circle"></i>
                        </button>
                        <h1 class="pb-4">Forgot Password?</h1>


                        <%-- form tag here--%>

                        <form class="pb-4" autocomplete="off">
                            <div class="form-group text-field">
                                <asp:TextBox type="text" runat="server" autocomplete="username" class="form-control" ID="txtForgotEmail" placeholder=" " required />

                                <label class="style-lable">Email</label>
                            </div>

                            <asp:Button type="submit" class="btn btn-custom-lg-signup btn-block mt-4" Text="Let's Go !" runat="server" OnClientClick="return ForgotPassword();" ID="btn_forgotPassword" OnClick="btn_forgotPassword_Click"></asp:Button>

                            <br />
                            <p>We will send the password to your email address..</p>
                        </form>
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
                    $('#forgotPasswordPopup').modal('hide');
                    $('#exampleModalCenter').modal('hide')

                });
                $(".sign-in").click(function (e) {
                    $('#forgotPasswordPopup').modal('hide');
                    $('#exampleModalCenter-1').modal('hide');
                    $('#exampleModalCenter').modal('show')

                });
                $(".forgotpassword").click(function (e) {
                    $('#exampleModalCenter-1').modal('hide');
                    $('#exampleModalCenter').modal('hide');
                    $('#forgotPasswordPopup').modal('show');

                });
            });

            document.getElementById("txtForgotEmail")
                .addEventListener("keyup", function (event) {

                    event.preventDefault();
                    document.getElementById('<%= txtLoginName.ClientID%>').value = document.getElementById('<%= txtForgotEmail.ClientID%>').value;
                    if (event.keyCode == 13) {
                        document.getElementById("btn_forgotPassword").click();
                    }
                });


            function ForgotPassword() {


                var forgotEmailid = document.getElementById('<%= txtForgotEmail.ClientID%>').value;

                if (forgotEmailid == "") {
                    alert('Please provide the email.');
                    return false;
                }
                document.forms[0].__EVENTTARGET.value = '<%= btn_forgotPassword.UniqueID %>';
                __doPostBack('<%= btn_forgotPassword.UniqueID%>', 'btn_forgotPassword');

                return false;
            }


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
        <script>
            function areaMap(zipcode) {

                console.log(zipcode)

                window.open("http://www.google.com/maps?q=" + zipcode + "&sa=X&oi=map&ct=title", "_blank", "height=800,width=900,status=yes,toolbar=no,menubar=no,location=no");

                return false;


            }

            function readMoreFunction()
            {
                var dots = document.getElementById("dots");
                var moreText = document.getElementById("more");
                var btnText = document.getElementById("readMoreBtn");

                if (dots.style.display === "none") {
                    dots.style.display = "inline";
                    btnText.innerHTML = "Read more";
                    moreText.style.display = "none";
                } else {
                    dots.style.display = "none";
                    btnText.innerHTML = "Read less"; 
                    moreText.style.display = "inline";
                }
            }
        </script>
        <script>
            $(document).ready(function () {
                $('.carousel').on('touchstart', function(event){
                    const xClick = event.originalEvent.touches[0].pageX;
                    $(this).one('touchmove', function(event){
                        const xMove = event.originalEvent.touches[0].pageX;
                        const sensitivityInPx = 5;

                        if( Math.floor(xClick - xMove) > sensitivityInPx ){
                            $(this).carousel('next');
                        }
                        else if( Math.floor(xClick - xMove) < -sensitivityInPx ){
                            $(this).carousel('prev');
                        }
                    });
                    $(this).on('touchend', function(){
                        $(this).off('touchmove');
                    });
                });

                var table = document.getElementsByClassName('qa_table')[0];
                var showMore = document.getElementById("showMore");
                
                var atds = document.getElementsByClassName('a-td');
                console.log(table.rows.length);

                if(table.rows.length > 1)
                {
                    for (var i = 1; i < table.rows.length; i++) 
                    {
                        console.log(atds[i - 1].innerText.trim());
                        var atdLength = atds[i - 1].innerText.trim().length;
                        console.log(atdLength);
                        if(atdLength == 7){
                            table.deleteRow(i);
                            i--;
                        }
                    }
                }
                
                if(table.rows.length < 2)
                {
                    table.deleteRow(0);
                    table.insertRow(0).insertCell(0).innerHTML = "<div>No Questions have been answered about this boat</div>";
                    table.rows[0].style.display = "revert";
                }
                else
                {
                    for (var i = 0; i < atds.length; i++) {
                        atds[i].innerHTML = '<span style="color:#65ADB8;font-weight:600;">' + atds[i].innerText.substring(0, 7) + '</span>' + atds[i].innerText.substring(7);
                    }
                    
                    var qtds = document.getElementsByClassName('q-td');
                    for (var i = 0; i < qtds.length; i++) {
                        qtds[i].innerHTML = '<span style="color:#65ADB8;font-weight:600;">' + qtds[i].innerText.substring(0, 9) + '</span>' + qtds[i].innerText.substring(9);
                    }

                    console.log(table.rows.length);
                    if(table.rows.length < 4)
                    {
                        for(var i = 0; i < table.rows.length; i++)
                        {
                            table.rows[i].style.display = "revert";
                        }
                    }
                    else
                    {
                        table.rows[1].style.display = "revert";
                        table.rows[2].style.display = "revert";
                        showMore.style.display = "revert";
                    }
                }

                $("#showMoreLink").click(function(event){
                    event.preventDefault();
                    for(var i = 0; i < table.rows.length; i++)
                    {
                        table.rows[i].style.display = "revert";
                    }
                    showMore.style.display = "none";
                });
            });
        </script>
    </form>
</body>
</html>

