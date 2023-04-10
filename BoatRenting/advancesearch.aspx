<%@ Page Language="C#" CodeFile="advancesearch.aspx.cs" Inherits="BoatRenting.advancesearch_aspx_cs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    <link href="css/advanceSearch.css" rel="stylesheet" />
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
        .list1col img {
            max-width: 100%;
            box-shadow: 5px 10px 5px rgba(0,0,0,0.2)
        }

        h4 {
            color: black;
            margin: 10px 0
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" defaultfocus="txtSearch">
        <%--header-section--%>
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
                                    <button data-toggle="modal" aria-selected="false" class="btn btn-custom align-nav" style="padding: 8px 25px; margin-top: 22px;" onclick="javascript:  return CheckEnterKey(event);" id="btnSignInClient1">SIGN IN</button>
                                </li>


                                <li></li>
                            </ul>
                        </div>
                        <div class="searchbar">
                            <div class="text-center search-form">
                                <div class="form-on-scroll">
                                    <input type="text" placeholder="Where would you like to go boating?" runat="server" id="txtSearch">
                                    <button type="submit" class="btn btn-custom-search" runat="server" id="btnSearch"><i class="fas fa-search pr-0 pr-lg-2"></i><span class="d-none d-lg-inline">SEARCH</span></button>
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

        <%--body-section--%>
        <section class="section mt-4">
            <div class="container" style="padding-top: 50px;">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h1>Advance Search</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <h3>Find a boat</h3>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs">
                            <li class="advancesearch nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#newTab2" style="color: #31708f;">By Boat Type</a>
                            </li>
                            <li class="advancesearch nav-item">
                                <a class="nav-link" data-toggle="tab" href="#newTab1" style="color: #31708f;">By Location</a>
                            </li>

                            <li class="advancesearch nav-item">
                                <a class="nav-link" data-toggle="tab" href="#newTab3" style="color: #31708f;">By Manufacturer</a>
                            </li>
                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content" style="border: 2px solid #bce8f1; margin-top: -2px;">
                            <div class="tab-pane container fade" id="newTab1">
                                <div class="row">
                                    <div class="col-md-10" style="padding: 10px 0 0px 25px;">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" style="background-color: black; border: 0;" id="basic-addon1">Zip</span>
                                                    </div>
                                                    <asp:TextBox ID="txtZip" runat="server" MaxLength="5" class="form-control" placeholder="Zip"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon1" style="background-color: black; border: 0;">Country</span>
                                                    </div>
                                                    <asp:DropDownList ID="ddCountry" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddCountry_SelectedIndexChanged"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon1" style="background-color: black; border: 0;">State</span>
                                                    </div>
                                                    <asp:DropDownList ID="ddState" runat="server" class="form-control"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <asp:CompareValidator ID="CompareValidator1" ControlToValidate="txtZip" runat="server" ErrorMessage="Numbers only" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon1" style="background-color: black; border: 0;">City</span>
                                                    </div>
                                                    <asp:TextBox ID="txtCity" runat="server" class="form-control" placeholder="City"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon1" style="background-color: black; border: 0;">Miles</span>
                                                    </div>
                                                    <asp:TextBox ID="txtMiles" runat="server" class="form-control" placeholder="Miles"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon1" style="background-color: black; border: 0;">Body of Water</span>
                                                    </div>
                                                    <asp:DropDownList ID="ddBodyOfWater" runat="server" class="form-control"></asp:DropDownList>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                            </div>
                                            <div class="col-md-4">
                                                <asp:CompareValidator ID="CompareValidator2" ControlToValidate="txtMiles" runat="server" ErrorMessage="Numbers only" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <asp:Label ID="lblMessageBoatLocation" runat="server" Font-Bold="true" Font-Size="Small" ForeColor="Red"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-2" style="padding-right: 0px;">
                                        <div class="input-group" style="width: 100%; height: 100%">
                                            <asp:Button ID="lnkSearch1" runat="server" class="btn btn-custom" Style="width: 101%; height: 101%; margin-top: -1px; "
                                                OnClick="lnkSearch1_Click" Text="Search Now"></asp:Button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane container active" id="newTab2">
                                <div class="row">
                                    <div class="col-md-10" style="padding: 10px 0 0px 25px;">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon1" style="background-color: black; border: 0;">Boat Type</span>
                                                    </div>
                                                    <asp:DropDownList ID="ddBoatType" runat="server" class="form-control"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon1"style="background-color:black; border:0;">Price</span>
                                                    </div>
                                                    <asp:TextBox ID="txtStartPrice" runat="server" class="form-control" placeholder="Lowest"></asp:TextBox>
                                                    <asp:TextBox ID="txtEndPrice" runat="server" class="form-control" placeholder="Highest"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon1" style="background-color: black; border: 0;">Boat ID</span>
                                                    </div>
                                                    <asp:TextBox ID="txtBoatID" class="form-control" placeholder="Boat ID" focus runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon1" style="background-color: black; border: 0;">Facility ID</span>
                                                    </div>
                                                    <asp:TextBox ID="txtFacilityID" placeholder="Facility ID" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3">
                                            </div>
                                            <div class="col-md-3">
                                                <asp:CompareValidator ID="CompareValidator3" ControlToValidate="txtStartPrice" runat="server" ErrorMessage="Numbers only" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                                <asp:CompareValidator ID="CompareValidator4" ControlToValidate="txtEndPrice" runat="server" ErrorMessage="Numbers only" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <asp:Label ID="lblMessageBoatType" runat="server" Font-Bold="true" Font-Size="Small" ForeColor="Red"></asp:Label>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-2" style="padding-right: 0;">
                                        <div class="input-group" style="width: 100%; height: 100%">
                                            <asp:Button ID="lnkBoatType" runat="server" class="btn btn-custom" Style="width: 100%; height: 102%; margin-top: -1px;"
                                                OnClick="lnkBoatType_Click" Text="Search Now"></asp:Button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane container fade" id="newTab3">
                                <div class="row">
                                    <div class="col-md-10" style="padding: 10px 0 0px 25px;">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon1" style="background-color: black; border: 0;">Make</span>
                                                    </div>
                                                    <asp:DropDownList ID="ddMake" runat="server" class="form-control"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon1" style="background-color: black; border: 0;">Model</span>
                                                    </div>
                                                    <asp:TextBox ID="txtModel" runat="server" class="form-control" placeholder="Model"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon1" style="background-color: black; border: 0;">Year</span>
                                                    </div>
                                                    <asp:TextBox ID="txtYearFrom" placeholder="From" runat="server" class="form-control"></asp:TextBox>
                                                    <asp:TextBox ID="txtYearTo" placeholder="To" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <asp:Label ID="lblMessageByManufacturer" runat="server" Font-Bold="true" Font-Size="Small" ForeColor="Red"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-2" style="padding-right: 0px;">
                                        <div class="input-group" style="width: 100%; height: 100%">
                                            <asp:Button ID="lnkByManufacturer" runat="server" class="btn btn-custom" Style="width: 102%; height: 102%; margin-top: -1px;"
                                                OnClick="lnkByManufacturer_Click" Text="Search Now"></asp:Button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row mt-5">
                    <div class="col-md">
                    </div>
                    <div class="col-md">
                        <asp:Button ID="lnkSearchAll" runat="server" class="btn btn-custom" Style="width: 100%; height: 70px;"
                            OnClick="lnkSearchAll_Click" Text="Search All"></asp:Button>
                    </div>
                    <div class="col-md">
                    </div>
                    <div class="col-md">
                        <asp:Button ID="lnkClearAll" runat="server" class="btn btn-custom" Style="width: 100%; height: 70px; "
                            OnClick="lnkClearAll_Click" Text="Clear All"></asp:Button>
                    </div>
                    <div class="col-md">
                    </div>
                </div>


                <%-- <br />
                <br />
                <br />
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel with-nav-tabs panel-info" style="border: 0;">
                            <div class="panel-heading" style="width: 372px; padding: 0; background-color: #EEEEEE; border: 0px solid;">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#tab1info" data-toggle="tab" style="">By Location</a></li>
                                    <li><a href="#tab2info" data-toggle="tab">By Boat Type</a></li>
                                    <li><a href="#tab3info" data-toggle="tab">By Manufacturer</a></li>

                                </ul>
                            </div>
                            <div class="panel-body" style="padding: 0; border: 2px solid #bce8f1; border-radius: 3px; margin-top: -2px;">
                                <div class="tab-content">
                                    <div class="tab-pane fade in active" id="tab1info">
                                        <div class="row">
                                            <div class="col-md-10" style="padding: 10px 0 10px 25px;">
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <div class="input-group" style="width: 100%">
                                                            <span class="input-group-addon" id="tab1zip" style="width: 50px">Zip</span>
                                                            <input type="text" class="form-control" placeholder="Zip" aria-describedby="basic-addon1">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="input-group" style="width: 100%">
                                                            <span class="input-group-addon" id="basic-addon1" style="width: 70px">Country</span>
                                                            <asp:DropDownList ID="DropDownList2" runat="server" class="form-control">
                                                                <asp:ListItem>-- Select --</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="input-group" style="width: 100%">
                                                            <span class="input-group-addon" style="width: 70px">State</span>
                                                            <asp:DropDownList ID="DropDownList3" runat="server" class="form-control">
                                                                <asp:ListItem>-- Select --</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <div class="input-group" style="width: 100%;">
                                                            <span class="input-group-addon" id="tab1city" style="width: 50px">City</span>
                                                            <input type="text" class="form-control" placeholder="City" aria-describedby="basic-addon1">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="input-group" style="width: 100%;">
                                                            <span class="input-group-addon" id="tab1miles">Miles</span>
                                                            <input type="text" class="form-control" placeholder="Miles" aria-describedby="basic-addon1">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="input-group" style="width: 100%;">
                                                            <span class="input-group-addon">Body of Water</span>
                                                            <asp:DropDownList ID="DropDownList1" runat="server" class="form-control">
                                                                <asp:ListItem>-- Select --</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="input-group" style="width: 100%; height: 100%">
                                                    <button type="submit" class="btn btn-custom" style="width: 101%; height: 270%; margin-top: -1px; color: #31708f !important; background-color: #bce8f1; border: 1px solid #bce8f1 !important">Search Now</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="tab2info">
                                        <div class="row">
                                            <div class="col-md-10" style="padding: 10px 0 10px 25px;">
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <div class="input-group" style="width: 100%">
                                                            <span class="input-group-addon" id="tab2boattype">Boat Type</span>
                                                            <asp:DropDownList ID="DropDownList4" runat="server" class="form-control">
                                                                <asp:ListItem>-- Select --</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="input-group" style="width: 100%">
                                                            <span class="input-group-addon" id="tab2price">Price</span>
                                                            <input type="text" class="form-control" placeholder="Lowest" aria-describedby="basic-addon1">
                                                            <input type="text" class="form-control" placeholder="Highest" aria-describedby="basic-addon1">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="input-group" style="width: 100%">
                                                            <span class="input-group-addon" id="tab2boatid">Boat ID</span>
                                                            <input type="text" class="form-control" placeholder="Boat ID" aria-describedby="basic-addon1">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="input-group" style="width: 100%">
                                                            <span class="input-group-addon" id="tab2facilityid">Facility ID</span>
                                                            <input type="text" class="form-control" placeholder="Facility ID" aria-describedby="basic-addon1">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="input-group" style="width: 100%; height: 100%">
                                                    <button type="submit" class="btn btn-custom" style="width: 101%; height: 258%; margin-top: -1px; color: #31708f !important; background-color: #bce8f1; border: 1px solid #bce8f1 !important">Search Now</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="tab3info">
                                        <div class="row">
                                            <div class="col-md-10" style="padding: 10px 0 10px 25px;">
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <div class="input-group" style="width: 100%">
                                                            <span class="input-group-addon" id="tab3make">Make</span>
                                                            <asp:DropDownList ID="DropDownList5" runat="server" class="form-control">
                                                                <asp:ListItem>-- Select --</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="input-group" style="width: 100%">
                                                            <span class="input-group-addon" id="tab2boatid">Model</span>
                                                            <input type="text" class="form-control" placeholder="Model" aria-describedby="basic-addon1">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="input-group" style="width: 100%">
                                                            <span class="input-group-addon" id="tab2price">Year</span>
                                                            <input type="text" class="form-control" placeholder="From" aria-describedby="basic-addon1">
                                                            <input type="text" class="form-control" placeholder="To" aria-describedby="basic-addon1">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="input-group" style="width: 100%; height: 100%">
                                                    <button type="submit" class="btn btn-custom" style="width: 101%; height: 258%; margin-top: -1px; color: #31708f !important; background-color: #bce8f1; border: 1px solid #bce8f1 !important">Search Now</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>
            </div>
        </section>


        <%--footer-section--%>
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
                        <p>© Copyright 2021 Rent A Boat, RentABoat.com | 320 South Country Rd. Brookhaven NY, 11719</p>
                    </div>
                    <div class="col-lg-4 footer-end text-center text-lg-right">
                        <p><a href="#">Terms</a> | <a href="#">Privacy</a> | <a href="#">Compliances</a></p>
                    </div>
                </div>
            </div>
        </section>


        <!-- Modal -- SIgn in / Sign Up / Forger Password -->
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
                            <asp:Button type="submit" class="btn btn-custom-lg-signup btn-block mt-4" Text="Sign In" runat="server"></asp:Button>
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
            //$.backstretch(["images/bg.jpg"], {
            //    duration: 3000,
            //    fade: 750
            //});

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
    </form>
</body>
</html>
