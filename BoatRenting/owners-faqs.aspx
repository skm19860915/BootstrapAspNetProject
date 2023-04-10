<%@ Page Language="C#" AutoEventWireup="true" CodeFile="owners-faqs.aspx.cs" Inherits="BoatRenting.owners_faqs" %>

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
    



    <meta http-equiv="Expires" content="30" />

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <meta name="robots" content="index, follow" />
    <meta
      name="googlebot"
      content="index, follow, max-snippet:-1, max-image-preview:large, max-video-preview:-1"
    />
    <meta
      name="bingbot"
      content="index, follow, max-snippet:-1, max-image-preview:large, max-video-preview:-1"
    />
    <meta property="fb:pages" content="22764423720" />
    <meta
      name="robots"
      content="max-snippet:-1, max-image-preview:large, max-video-preview:-1"
    />
    <link rel="canonical" href="https://www.rentaboat.com/" />
    <meta property="og:locale" content="en_US" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="Rent A Boat" />
    <meta
      property="og:description"
      content="Find & book affordable boat rentals with or without a captain. Rent sailboats, jet skis, yachts charters and other watercrafts anywhere in the world. Rated #1 in customer satisfaction."
    />
    <meta property="og:url" content="https://www.rentaboat.com/" />
    <meta property="og:site_name" content="Rent A Boat" />
    <meta
      property="article:publisher"
      content="https://www.facebook.com/RentaBoatcom-244505213935"
    />
    <meta
      property="article:published_time"
      content="2020-12-28T14:00:30+00:00"
    />
    <meta
      property="article:modified_time"
      content="2020-12-27T14:12:12+00:00"
    />
    <meta
      property="og:image"
      content="https://www.rentaboat.com/images/logo-dark.png"
    />
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
</head>
<body class="body">
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
                        <a class="nav-link dropdown-toggle" href="how-It-works.aspx" id="navbarDropdown4" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">WHY RENTING</a>
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
                        <button data-toggle="modal" aria-selected="false"  class="btn btn-custom align-nav" style="padding: 8px 25px;margin-top: 22px;" onclick="javascript:  return CheckEnterKey(event);" id="btnSignInClient1">SIGN IN</button>
                      </li>
                     
                      
                      <li>

                      </li>
                  </ul>
              </div>
                        <div class="searchbar">
                            <div class="text-center search-form">
                                <div class="form-on-scroll">
                                    <input type="text" placeholder="Where would you like to go boating?" runat="server" id="txtSearch">
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
        <section id="faq" class="section pb-4">
            <div id="faq-container" class="container-fluid">
                <div class="row justify-content-center mt-4">
                    <div class="col-lg-12">
                        <div class="title-head text-center">
                            <h2 class="pt-5 pb-4">BOAT OWNER FREQUENTLY ASKED QUESTIONS</h2>
                        </div>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col-12 accordion" id="faq-accordion">
                        <div class="question-box inactive-question mb-3">
                            <div data-toggle="collapse" data-target="#answer-1">
                                <h5 class="align-self-center m-0">
                                    What is RentaBoat.com?
                                    <span class="d-block float-right text-right">
                                        <i class="fa fa-plus"></i>
                                    </span>
                                </h5>
                            </div>
                            <p id="answer-1" class="collapse mt-3" data-parent="#faq-accordion">
                               RentABoat.com provides an easy solution for all boat owners any type of water experience sharing; boat owners, boat rental facilities, charter boat owners any type of watercraft recreation.  Our user-friendly online tools make it easy to list your watercraft, manage rental requests, and make money. With RentABoat, YOU are in complete control. You set the price, availability, rental requirements and you choose the payment method. Please see your payment options below.
                                <br /><br />Are you interested in listing your boat? You can try all of our features by using our DEMO facility. To sign in, use "DEMO" as a username and "DEMO" as the password.
                            </p>
                        </div>
                        <div class="question-box inactive-question mb-3">
                            <div data-toggle="collapse" data-target="#answer-2">
                                <h5 class="align-self-center m-0">
                                    What advertisement methods can we choose?
                                    <span class="d-block float-right text-right">
                                        <i class="fa fa-plus"></i>
                                    </span>
                                </h5>
                            </div>
                            <p id="answer-2" class="collapse mt-3" data-parent="#faq-accordion">
                                <strong>Percentage:</strong> This is the default payment method. When a client request to rent your boat using our reservation calendar, they will pay a percentage of the listed boat rental price. Boat owners are then asked to deduct this fee from the listed boat rental price. For example: Boat rental price minus RentABoat's online booking fee equals amount paid to boat owner.
                                <br /><br />Please note all rates and terms are negotiated on a case-by-case basis, though our default rate is 10%. You can also require additional deposits or fees.
                                <br /><br /><strong>Per transaction:</strong> Another option is a online transaction fee. When a client requests to rent your boat the charge is a set online fee. (This fee is be negotiated) For example, Boat rental price minus RentABoat's set online transaction fee equals the price due at the boat rental location. You can also require additional deposits or fees.
                                <br /><br />Pay per click: In this scenario, your boat will have its own page with your contact information. If you have a website, there will be a link that directs potential renters to your website. When a potential renter clicks on your profile they will be directed to your website or directed to your RentaBoat.com page. When a renter clicks and is linked to your website you will be charged a per-click fee.
                                <br /><br /><strong>Display Ad:</strong> Another option is to pay a monthly ad fee and receive a page with your boat's information, price and direct contact information. Boat renters will be able to rent through you rather than with our reservation calendar. If you have a website we can add a link that directs potential renters there. Are you interested in using our Display Ad method? Sign in using "DemoAd" as a username and "DemoAd" as the password to view a demo Display Ad listing.
                                <br /><br />Please note all rates and terms are negotiated on a case-by-case scenario. Email info@RentABoat.com for more information.
                            </p>
                        </div>
                        <div class="question-box inactive-question mb-3">
                            <div data-toggle="collapse" data-target="#answer-3">
                                <h5 class="align-self-center m-0">
                                    How does RentABoat.com make money?
                                    <span class="d-block float-right text-right">
                                        <i class="fa fa-plus"></i>
                                    </span>
                                </h5>
                            </div>
                            <p id="answer-3" class="collapse mt-3" data-parent="#faq-accordion">
                                As described above, the boat owner or renting facility will choose a preferred payment method. Please note, the RentABoat.com default payment method is percentage advertising. If percentage advertising is not your preferred payment method please view our other options above and contact us at Info@RentABoat.com.
                            </p>
                        </div>
                        <div class="question-box inactive-question mb-3">
                            <div data-toggle="collapse" data-target="#answer-4">
                                <h5 class="align-self-center m-0">
                                    How do I get my boat on RentABoat.com?
                                    <span class="d-block float-right text-right">
                                        <i class="fa fa-plus"></i>
                                    </span>
                                </h5>
                            </div>
                            <p id="answer-4" class="collapse mt-3" data-parent="#faq-accordion">
                                It’s easy. Simply enter your name, email and password on our List Your Boat page. Once signed in, you will be asked to provide your boat’s information and upload photos. This information will be used to list your boat on our site and submit the sales information to Google. <a href="https://www.rentaboat.com/admin/BoatOwnerSignup.aspx">List your boat</a>
                            </p>
                        </div>
                        <div class="question-box inactive-question mb-3">
                            <div data-toggle="collapse" data-target="#answer-5">
                                <h5 class="align-self-center m-0">
                                    Who can list boats on this site?
                                    <span class="d-block float-right text-right">
                                        <i class="fa fa-plus"></i>
                                    </span>
                                </h5>
                            </div>
                            <p id="answer-5" class="collapse mt-3" data-parent="#faq-accordion">
                                Any boat owner can list their boat on this site. Most are independent boat owners who want to earn some extra income from their boats and boating experience. We also invite boat rental companies and yacht charter companies to sign up for a wholesale account. If you have sub-brokers, our dashboard allows brokers access to your RentABoat.com listings either as Admins or Users. We created this feature for boat renting facilities/yacht charter companies who have multiple brokers leasing our their vessels.
                            </p>
                        </div>
                        <div class="question-box inactive-question mb-3">
                            <div data-toggle="collapse" data-target="#answer-6">
                                <h5 class="align-self-center m-0">
                                    What fees do boat owners/boat renters have to pay?
                                    <span class="d-block float-right text-right">
                                        <i class="fa fa-plus"></i>
                                    </span>
                                </h5>
                            </div>
                            <p id="answer-6" class="collapse mt-3" data-parent="#faq-accordion">
                                No membership fee is required. RentABoat.com is not a club. No annual or monthly fees are involved. Boat owners choose their desired payment method. Boat renters pay the boat owner the deposits and fees listed on the boat owner’s page.
                            </p>
                        </div>
                        <div class="question-box inactive-question mb-3">
                            <div data-toggle="collapse" data-target="#answer-7">
                                <h5 class="align-self-center m-0">
                                    Do I have to use the reservation Calendar?
                                    <span class="d-block float-right text-right">
                                        <i class="fa fa-plus"></i>
                                    </span>
                                </h5>
                            </div>
                            <p id="answer-7" class="collapse mt-3" data-parent="#faq-accordion">
                                No. We can direct clients directly to your website or to your Display Ad on RentaBoat.com for a negotiated fee.
                            </p>
                        </div>
                        <div class="question-box inactive-question mb-3">
                            <div data-toggle="collapse" data-target="#answer-8">
                                <h5 class="align-self-center m-0">
                                    Can I trust a stranger with my boat? Can I be on the boat with them?
                                    <span class="d-block float-right text-right">
                                        <i class="fa fa-plus"></i>
                                    </span>
                                </h5>
                            </div>
                            <p id="answer-8" class="collapse mt-3" data-parent="#faq-accordion">
                                We do a client/customer rating system that allows the boat owner to review information on potential renters before allowing them to rent your boat. If you do not feel comfortable you have the right to deny any boat rental. After renting your boat you will be aaked to rate renters based on your experience of renting to them. You also have the option to be on your boat as a guide. While entering the requirements for renting your boat on your listing, please make it clear that you will be on the boat with them. You can require renter-side insurance. Renter-side insurance can be purchased through any one of these two agencies <a style="color: blue; text-decoration: underline !important" href= https://www.xinsurance.com/risk-class/boat-insurance-personal-watercraft-insurance/" target="_blank>">ExInsurance Boat Rental Policy.</a> <a style="color: blue; text-decoration: underline !important" href= https://www.globalmarineinsurance.com/boat-rental-insurance/" target="_blank>">Global Marine Insurance Agency.</a>
                            </p>
                        </div>
                        <div class="question-box inactive-question mb-3">
                            <div data-toggle="collapse" data-target="#answer-9">
                                <h5 class="align-self-center m-0">
                                    How will boat owners get paid?
                                    <span class="d-block float-right text-right">
                                        <i class="fa fa-plus"></i>
                                    </span>
                                </h5>
                            </div>
                            <p id="answer-9" class="collapse mt-3" data-parent="#faq-accordion">
                                There are two options for boat owners to collect payment
                                <br /><br /><strong>Option 1:</strong> Boat owner collects payment. This is our default payment method. Boat owners collect payment directly from the renter. You are required to contact the renter and collect the remaining balance with whichever payment method you desire.
                                <br /><br /><strong>Option 2:</strong> RentABoat.com collects payment. After your boat is reserved, we distribute the balance to you via check, wire transfer, PayPal, Venmo, or Zelle.
                            </p>
                        </div>
                        <div class="question-box inactive-question mb-3">
                            <div data-toggle="collapse" data-target="#answer-10">
                                <h5 class="align-self-center m-0">
                                    Can boat owners talk to potential customers before renting to them?
                                    <span class="d-block float-right text-right">
                                        <i class="fa fa-plus"></i>
                                    </span>
                                </h5>
                            </div>
                            <p id="answer-10" class="collapse mt-3" data-parent="#faq-accordion">
                                Yes, you must contact the potential renter after receiving the tentative rental request. We send all the renter’s contact information via text and/or email. The renter is sent your contact information as well.
                            </p>
                        </div>
                        <div class="question-box inactive-question mb-3">
                            <div data-toggle="collapse" data-target="#answer-11">
                                <h5 class="align-self-center m-0">
                                    What if the boat is not available when renters request it?
                                    <span class="d-block float-right text-right">
                                        <i class="fa fa-plus"></i>
                                    </span>
                                </h5>
                            </div>
                            <p id="answer-11" class="collapse mt-3" data-parent="#faq-accordion">
                                If you cannot fulfill the request, all online booking fees will be refunded. We encourage contacting the potential client to try to reschedule.
                            </p>
                        </div>
                        <div class="question-box inactive-question mb-3">
                            <div data-toggle="collapse" data-target="#answer-12">
                                <h5 class="align-self-center m-0">
                                    I have my boat on another website, why should I join RentaBoat.com?
                                    <span class="d-block float-right text-right">
                                        <i class="fa fa-plus"></i>
                                    </span>
                                </h5>
                            </div>
                            <p id="answer-12" class="collapse mt-3" data-parent="#faq-accordion">
                                You have nothing to lose because it’s free. Boat owners can advertise their boats on our site risk-free with no maintenance fees. This allows you to expand your services to new customers. Our online tools allow boat owners to print boat rental receipts, contracts, rental reports, keep customer records, see live reservation calendars and administer different users. We are here to bring customers to YOU. Boat owners have nothing to lose by signing up with RentABoat.com so why not give it a try! You can try all of our features by using our Demo portal. To sign in, use "Demo" as the username and "Demo" as the password. If you have a website, we can add a link that directs potential renters to your website. Are you interested in using our Display Ad method? Sign in using "DemoAd" as a username and "DemoAd" as the password to view a demo display ad listing.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="offset-md-2 col-8">
                        <img style="width: 100%; height: auto" src="img/owner-faq.jpg" />
                    </div>
                </div>
            </div>
        </section>
       
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
                <p>© Copyright 2021 Rent A Boat, RentABoat.com | 320 South Counrty Rd. Brookhaven NY, 11719</p>
            </div>
            <div class="col-lg-4 footer-end text-center text-lg-right">
                <p><a href="#">Terms</a> | <a href="#">Privacy</a> | <a href="#">Compliances</a></p>
            </div>
        </div>
    </div>
</section>

        
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
</html>
