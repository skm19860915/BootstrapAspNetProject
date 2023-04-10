<%@ Page Language="C#" CodeFile="index.aspx.cs" Inherits="BoatRenting.indexN_aspx_cs" EnableEventValidation="false" AutoEventWireup="true" EnableViewState="true" %>

<%@ Register Src="~/ctlFooter.ascx" TagPrefix="uc1" TagName="ctlFooter" %>
<!DOCTYPE html>
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
    <link href="css/menu.css" rel="stylesheet">
    <link href="css/styleN.css" rel="stylesheet">

    <title>Rent A Boat</title>


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

            autocomplete1 = new google.maps.places.Autocomplete(
             /** @type {HTMLInputElement} */(document.getElementById("<%=txtSearch1.ClientID%>")),
                { types: ['geocode'] });
            // When the user selects an address from the dropdown,
            // populate the address fields in the form.
            google.maps.event.addListener(autocomplete1, 'place_changed', function () {
                fillInAddress1();
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


        function gotoDetails(boatid, marinaid, rating) {

            var bid = document.getElementById('<%= txtSelectedBoatId.ClientID %>');
            bid.value = boatid;


            var mid = document.getElementById('<%= txtSelectedMarinaId.ClientID %>');
            mid.value = marinaid;

            var rat = document.getElementById('<%= txtSelectedRating.ClientID %>');
            rat.value = rating;

            document.getElementById('<%=btnShowDetails.ClientID%>').click();

        }




    </script>




    <%--       <script>
           document.getElementById("txtSearch")
               .addEventListener("keyup", function (event) {
                   event.preventDefault();
                   if (event.keyCode == 13) {
                       document.getElementById("btnSearch").click();
                   }
               });


           document.getElementById("txtLoginName")
               .addEventListener("keyup", function (event) {
                   event.preventDefault();
                   if (event.keyCode == 13) {
                       if ($('#ctlTopMenu_txtPassword').val().length == 0) {
                           $('#ctlTopMenu_lblLoginMessage').html("Enter Password.");

                           return false;
                       }


                       event.stopPropagation();

                       TryLogin();



                   }
               });

           document.getElementById("txtPassword")
               .addEventListener("keyup", function (event) {
                   event.preventDefault();
                   if (event.keyCode == 13) {

                       event.stopPropagation();

                       TryLogin();

                   }
               });
    </script>--%>

    <script>
        function enterkeycapture(e) {




            if (e.keyCode == 13) {
                // alert("Test");
                e.preventDefault();
                e.stopPropagation();
                if ($("#exampleModalCenter").hasClass('show')) {


                    document.getElementById("btnSignIn").click();

                }
                else

                    document.getElementById("btnSearch").click();

            }

        }
      </script>

</head>
<body class="body" style="position: static" onkeypress="javscript:enterkeycapture(event)">
    <form id="frmIndex" runat="server" method="post" autocomplete="off">
        <header id="topnav" class="defaultscroll fixed-top sticky">
            <div class="container-fluid pl-3 pr-3 pl-md-5 pr-md-5 mt-3">
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

                                <!-- <a class="search-toggle">
                        <div class="search">
                            <span><i class="fas fa-search"></i></span>
                        </div>
                    </a> -->
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
                                    <a class="nav-link dropdown-toggle" href="how-It-works.html" id="navbarDropdown4" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">WHY RENTING</a>
                                    <div class="dropdown-menu sub-menu" aria-labelledby="navbarDropdown2">
                                        <a class="dropdown-item" href="renting-vs-owning.aspx">Renting vs. Owning</a>
                                        <a class="dropdown-item" href="rental-tips.html">Rental Tips</a>

                                    </div>
                                </li>
                                <li class="">
                                    <a href="about-us.aspx">ABOUT US</a>
                                </li>
                                <li class="">
                                    <a href="contact_us.aspx">Contact Us</a>
                                </li>

                                <li class="">
                                    <button data-toggle="modal" aria-selected="false" class="btn btn-custom align-nav" style="padding: 8px 25px; margin-top: 22px;" onclick="javascript:  return CheckEnterKey(event);" id="btnSignInClient1">SIGN IN</button>
                                </li>


                                <li></li>
                            </ul>
                        </div>
                        <div class="searchbar">
                            <div class="text-center search-form">
                                <div class="form-on-scroll">
                                    <input type="text" placeholder="Where would you like to go boating?" runat="server" id="txtSearch1" aria-autocomplete="none" autocomplete="off">
                                    <button type="submit" class="btn btn-custom-search" runat="server" id="btnSearch1"><i class="fas fa-search pr-0 pr-lg-2"></i><span class="d-none d-lg-inline">SEARCH</span></button>


                                </div>

                                <div class="menu-on-scroll">
                                    <button aria-selected="false" class="btn btn-custom align-nav" data-toggle="modal" onclick="javascript:  return CheckEnterKey(event);" id="btnSignInClient">SIGN IN</button>
                                </div>


                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </header>


        <section class="back-slide" id="home">
            <div class="bg-overlay"></div>
            <div class="home-center">
                <div class="home-desc-center">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8 text-center">
                                <h6 class="home-title text-white">Find A Boat to Rent</h6>
                                <p class="pt-2 home-sub-title text-white mx-auto">Rent boats from real boat-owners throughout the world.</p>
                                <div class="text-center search-form mt-4">
                                    <div id="search-bar" class="form-on-scroll">
                                        <input type="text" placeholder="Where would you like to go boating?" runat="server" id="txtSearch" aria-autocomplete="none" autocomplete="off">


                                        <button type="submit" class="btn btn-custom-search" style="top: 7px; font-size: 14px; padding: 8px 20px; transition: 0s;" runat="server" id="btnSearch" onserverclick="btnSearch_Click"><i class="fas fa-search pr-md-2"></i><span class="d-none d-md-inline">SEARCH</span></button>


                                        <p class="pt-2 pl-0 text-white text-left text-underline"><a href="advancesearch.aspx"><i class="fas fa-angle-double-down"></i>Expand Advanced Search</a></p>





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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section id="service" class="section pb-4">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="title-head text-center">
                            <h2>Popular boat rental locations</h2>
                        </div>
                        <div class="parahgraph text-center">
                            <p>
                                Find your dream boat rental in the best boating locations in the world.<br class="d-md-none d-lg-block">
                                Rent luxury yachts, sailboats, houseboats, pontoon boats, charter boats, jet skis and more.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="row pt-3 mt-3">

                    <div class="col-md-4 col-xl mt-3">
                        <a href="results.aspx?t=4&lat=25.47303326127954&lng=-77.080078125&miles=140&c=6">
                            <div class="service-box clearfix p-3">
                                <div class="service-icon text-center">
                                    <img src="images/icon-1.svg">
                                </div>
                                <div class="service-desc text-center">
                                    <h4>BAHAMAS</h4>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4 col-xl mt-3">
                        <a href="results.aspx?t=4&lat=25.684850188749582&lng=-79.984588623046885&miles=38">
                            <div class="service-box clearfix p-3">
                                <div class="service-icon text-center">
                                    <img src="images/icon-2.svg">
                                </div>
                                <div class="service-desc text-center">
                                    <h4>MIAMI</h4>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4 col-xl mt-3">
                        <a href="results.aspx?t=4&lat=40.094882122321195&lng=-72.86407470703125&miles=75">
                            <div class="service-box clearfix p-3">
                                <div class="service-icon text-center">
                                    <img src="images/icon-3.svg">
                                </div>
                                <div class="service-desc text-center">
                                    <h4>NEW YORK CITY</h4>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4 col-xl mt-3">
                        <a href="results.aspx?t=4&lat=22.749588557614043&lng= -121.21078491210938&miles=176">
                            <div class="service-box clearfix p-3">
                                <div class="service-icon text-center">
                                    <img src="images/icon-4.svg">
                                </div>
                                <div class="service-desc text-center">
                                    <h4>DALLAS</h4>

                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4 col-xl mt-3">
                        <a href="results.aspx?t=4&lat=33.68778175843939&lng=-118.5369873046875&miles=38">
                            <div class="service-box clearfix p-3">
                                <div class="service-icon text-center">
                                    <img src="images/icon-5.svg">
                                </div>
                                <div class="service-desc text-center">
                                    <h4>LOS ANGELES</h4>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4 col-xl mt-3">
                        <a href="results.aspx?t=4&lat=22.749588557614043&lng=-121.21078491210938&miles=753">
                            <div class="service-box clearfix p-4">
                                <div class="service-icon text-center">
                                    <img src="images/icon-6.svg">
                                </div>
                                <div class="service-desc text-center">
                                    <h4>SAN DIEGO</h4>

                                </div>
                            </div>
                        </a>

                    </div>
                </div>
            </div>
        </section>

        <section id="listing" class="section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="title-head text-center">
                            <h2>New Boat Listings</h2>
                        </div>
                    </div>
                </div>
                <div class="row pt-3 mt-3">
                    <asp:Repeater ID="rpHomePhotos" runat="server">
                        <ItemTemplate>

                            <div class="col-sm-6  col-lg-3 mb-3 mb-lg-0">
                                <div class="card">

                                    <a href='javascript:gotoDetails(&#39;<%# DataBinder.Eval(Container.DataItem, "BoatId")%>&#39;,&#39;<%#DataBinder.Eval(Container.DataItem, "MarinaId")%>&#39;,&#39;<%# DataBinder.Eval(Container.DataItem, "Rating")%>&#39;)'>
                                        <img class="card-img-top" src="./boats/<%# DataBinder.Eval(Container.DataItem, "FileName") %>" alt="<%# DataBinder.Eval(Container.DataItem, "FilenameDescription") %>" height="220" width="255" /></a>


                                    <div class="card-body">
                                        <%--  <a class='box1' href='javascript:gotoDetails(&#39;<%# DataBinder.Eval(Container.DataItem, "BoatId")%>&#39;,&#39;<%#DataBinder.Eval(Container.DataItem, "MarinaId")%>&#39;,&#39;<%# DataBinder.Eval(Container.DataItem, "Rating")%>&#39;)'>--%>

                                        <h5 class="card-title"><%# DataBinder.Eval(Container.DataItem, "City") %></h5>
                                        <p class="card-text"><%# DataBinder.Eval(Container.DataItem, "BodyOfWater") %>&nbsp;<%# DataBinder.Eval(Container.DataItem, "State") %></strong>&nbsp;<span><%# DataBinder.Eval(Container.DataItem, "Make") %>&nbsp; <%# DataBinder.Eval(Container.DataItem, "Model") %>&nbsp;<%# DataBinder.Eval(Container.DataItem, "BoatSize") %></p>
                                        <div class="row">
                                            <div class="col-6 text-left pr-0 align-self-center">
                                                <ul class="list-inline small">
                                                    <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
                                                    <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
                                                    <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
                                                    <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
                                                    <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
                                                </ul>

                                            </div>
                                            <div class="col-6 text-right">
                                                <p>from <%# DataBinder.Eval(Container.DataItem, "CurrencySymbol") %><%# DataBinder.Eval(Container.DataItem, "Amount") %></p>
                                            </div>
                                        </div>
                                        <a href='javascript:gotoDetails(&#39;<%# DataBinder.Eval(Container.DataItem, "BoatId")%>&#39;,&#39;<%#DataBinder.Eval(Container.DataItem, "MarinaId")%>&#39;,&#39;<%# DataBinder.Eval(Container.DataItem, "Rating")%>&#39;)' class="btn btn-custom btn-block">More Info</a>

                                    </div>
                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:Repeater>

                    <asp:Button ID="btnShowDetails" runat="server" Style="visibility: hidden; display: none;" OnClick="btnGoDetails_Click" UseSubmitBehavior="false" />

                </div>
            </div>
        </section>
        <section id="call-to-action" class="section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-7 text-center text-md-left align-self-center">
                        <div class="mb-4 mb-md-0">
                            <h3 class="m-0">Rent Boats From Real Boat-Owners Throughout the World.</h3>
                        </div>
                    </div>
                    <div class="col-md-5 text-center text-md-right align-self-center">
                        <a href="./admin/BoatOwnerSignup.aspx" class="btn btn-custom-lg">List Your Boat</a>
                    </div>
                </div>
            </div>
        </section>
        <section id="owners" class="section pb-0">
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-lg-6 owner-text-info">
                        <div class="title title-head text-left mb-5 mb-lg-0 ml-0 ml-lg-4">
                            <h2 class="pb-4">Owners</h2>
                            <ul>
                                <li><i class="fas fa-long-arrow-alt-right"></i>Easiest online rental platform.</li>
                                <li><i class="fas fa-long-arrow-alt-right"></i>Low 5% renter side booking fee.</li>
                                <li><i class="fas fa-long-arrow-alt-right"></i>Free boat owner listing. No fee.</li>
                                <li><i class="fas fa-long-arrow-alt-right"></i>User-friendly owner dashboard.</li>
                                <li><i class="fas fa-long-arrow-alt-right"></i>You set the price and availability.</li>
                            </ul>
                            <a href="owners-faqs.html" class="btn btn-custom-lg">Learn More</a>
                        </div>
                    </div>
                    <div class="col-lg-6 text-center text-lg-right p-lg-0">
                        <div class="owner-image">
                            <!-- <img src="images/owners.png" class="img-fluid"> -->
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section id="renterss" class="section pt-0">
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-lg-6 order-first p-lg-0">
                        <div class="renter-image">
                            <!-- <img src="images/renters.png" class="img-fluid"> -->
                        </div>
                    </div>
                    <div class="col-lg-6 renter-text-info order-second ">
                        <div class="title title-head text-right mb-5 mb-lg-0 mr-0 mr-lg-5">
                            <h2 class="pb-4">Renters</h2>
                            <ul>
                                <li>Lowest boat rental rates available. <i class="fas fa-long-arrow-alt-left"></i></li>
                                <li>Easy searching/Easy booking. <i class="fas fa-long-arrow-alt-left"></i></li>
                                <li>No membership fees. <i class="fas fa-long-arrow-alt-left"></i></li>
                                <li>No monthly dues. <i class="fas fa-long-arrow-alt-left"></i></li>
                                <li>Access your dream boat within seconds! <i class="fas fa-long-arrow-alt-left"></i></li>
                            </ul>
                            <a href="renter_faqs.aspx" class="btn btn-custom-lg">Learn More</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>



        <section id="call-to-action" class="section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-7 text-center text-md-left align-self-center">
                        <div class="mb-4 mb-md-0">
                            <h3 class="m-0">Earn Money. List Your Boat.</h3>
                        </div>
                    </div>
                    <div class="col-md-5 text-center text-md-right">
                        <a href="./admin/BoatOwnerSignup.aspx" class="btn btn-custom-lg">List Your Boat</a>
                    </div>
                </div>
            </div>
        </section>

        <section id="listing" class="section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="title-head text-center">
                            <h2>Boat rentals by state</h2>
                        </div>
                    </div>
                </div>
                <div class="row pt-3 mt-3 ">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                        <div class="us-map">
                            <div id="map"></div>
                        </div>
                    </div>
                    <div class="col-md-2"></div>
                </div>
            </div>
        </section>

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
                        <p>Copyright 2021 Rent A Boat, RentABoat.com | 320 South Country Rd. Brookhaven, NY 11719</p>
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
                        <h1 class="pb-4">Sign In</h1>


                        <%-- form tag here--%>

                        <form class="pb-5" autocomplete="off">
                            <div class="form-group text-field">
                                <asp:TextBox type="text" runat="server" autocomplete="username" class="form-control" ID="txtLoginName" placeholder=" " required />
                                
                                <label class="style-lable">Email</label>
                            </div>
                            <div class="form-group text-field">
                                <asp:TextBox type="password" runat="server" autocomplete="password" class="form-control" ID="txtPassword" placeholder=" " required />
                                <label class="style-lable">Password</label>
                            </div>
                            <div class="form-check text-right forgot-password">
                                <a href="#" data-target="#forgotPasswordPopup" class="forgotpassword">Forgot Password?</a>
                            </div>

                            <asp:Button type="submit" class="btn btn-custom-lg-signup btn-block mt-4" OnClick="btnSignIn_Click" Text="Sign In" runat="server" OnClientClick="return TryLogin();" ID="btnSignIn"></asp:Button>

                        </form>
                        <div class="row ">
                            <div class="col-12">
                                <p class="font-15">
                                    <asp:Label ID="lblLoginMessage" runat="server"></asp:Label>
                                </p>
                            </div>
                        </div>
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

                        <form class="pb-4" aria-autocomplete="none">
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


        <%-- <script src="js/popper.min.js"></script>--%>

        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jquery.easing.min.js"></script>
        <!-- BackSlideShow -->
        <script src="js/jquery.backstretch.min.js"></script>
        <script src="js/jquery.app.js"></script>
        <script src="js/mapdata.js"></script>
        <script src="js/usmap.js"></script>
        <script>






            function TryLogin() {
                var username = document.getElementById('<%= txtLoginName.ClientID%>').value;
                var password = document.getElementById('<%= txtPassword.ClientID%>').value;

                if (password.length == 0) {
                    $('#lblLoginMessage').html("Failed to Login");
                    return false;
                }



                LoginAuth.ValidateLogin(username, password, OnSuccess);

                //PageMethods.ValidateLogin(username, password, OnSuccess);
                return false;

            }

            function OnSuccess(result) {




                if (result == "Failed") {


                    //$('#ctlTopMenu_lblLoginMessage').html("Failed to Login");
                    $('#lblLoginMessage').html("Failed to Login");
                }
                else {
                    $('#lblLoginMessage').html("");
                    document.forms[0].__EVENTTARGET.value = '<%= btnSignIn.UniqueID%>';
                    __doPostBack('<%= btnSignIn.UniqueID%>', 'btnSignIn');
                }



            }

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

            $.backstretch(["images/bg.jpg"], {
                duration: 3000,
                fade: 750
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




                document.getElementById("txtSearch")
                    .addEventListener("keyup", function (event) {

                        //document.getElementById("btnSignInClient").style.display = "none";

                        //document.getElementById("btnSignInClient1").style.display = "none";

                        $('#exampleModalCenter-1').modal('hide');
                        $('#exampleModalCenter').modal('hide')
                        event.preventDefault();

                        if (event.keyCode == 13) {
                            document.getElementById("btnSearch").click();
                        }
                    });

                document.getElementById("txtForgotEmail")
                    .addEventListener("keyup", function (event) {

                        event.preventDefault();
                        document.getElementById('<%= txtLoginName.ClientID%>').value = document.getElementById('<%= txtForgotEmail.ClientID%>').value;
                        if (event.keyCode == 13) {
                            document.getElementById("btn_forgotPassword").click();
                        }
                    });


                document.getElementById("txtLoginName")
                    .addEventListener("keyup", function (event) {
                        event.preventDefault();

                        if (event.keyCode == 13) {
                            if ($('#txtPassword').val().length == 0) {
                                $('#lblLoginMessage').html("Enter Password.");

                                return false;
                            }


                            event.stopPropagation();

                            TryLogin();



                        }
                    });

                document.getElementById("txtPassword")
                    .addEventListener("keyup", function (event) {

                        event.preventDefault();

                        if (event.keyCode == 13) {

                            event.stopPropagation();

                            TryLogin();

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

    </script>
        <script>

            function CheckEnterKey(evt) {

                //  alert("CheckEnterKey");


                $('#exampleModalCenter-1').modal('hide');
                $('#exampleModalCenter').modal('show');



                // alert("enter key" + e.code);
                //if (e.code == 13) {
                //    //alert("enter key");
                //    $('#exampleModalCenter-1').modal('hide');
                //    $('#exampleModalCenter').modal('hide');
                //}
                //else {

                //     $('#exampleModalCenter-1').modal('hide');
                //    $('#exampleModalCenter').modal('hide');
                //}
                return false;

            }


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
        <%--<script>
      $('#exampleModalCenter, #exampleModalCenter-1').on('show.bs.modal', function (e) {
          $('body, header').addClass('test');
      });
  </script>--%>
    </form>
</body>
</html>
