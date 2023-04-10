<%@ Page language="C#" CodeFile="membersdemo.aspx.cs" Inherits="BoatRenting.membersdemo_aspx_cs" %>
<%@ Import Namespace = "Microsoft.VisualBasic" %>
<%@ Import Namespace = "nce.adosql" %>
<!--#include file="__functions.aspx"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%
    if (((Convert.ToString(Session["Kart"]) == "") || ((Convert.ToString(Session["Kart"])).Substring(0, 3) == "adm")))
    {
        VBMath.Randomize();
        varSession = "";
        for(i = 0; i <= 50; i += 1)
        {
            varSession = varSession + "" + Convert.ToString(Conversion.Int(((float)6.0 * VBMath.Rnd()) + (float)1.0));
        }
        Session.Add("Kart", varSession);
    }
    Username = Request["txtUsername"];
    Password = Request["txtPassword"];
    if (NVL(Username, "!!!!") != "!!!!")
    {
        Login(Username, Password);
        if (NVL(Convert.ToString(Session["userID"]), "0") != "0")
        {
            //if session("Kart") = "" then
            VBMath.Randomize();
            varSession = "adm";
            for(i = 0; i <= 47; i += 1)
            {
                varSession = varSession + "" + Convert.ToString(Conversion.Int(((float)6.0 * VBMath.Rnd()) + (float)1.0));
            }
            Session.Add("Kart", varSession);
            //end if
            Response.Redirect(Convert.ToString(Session["defaultPage"]));
        }
        else
        {
            Message = "User/Password invalid, Please try again!";
        }
    }
%>
<html>
<head>
<title>Welcome to BoatRenting.com!</title>
<style type="text/css" media="screen">@import "br.css";</style>
<meta http-equiv="Content-type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Content-Language" content="en-us" />
<meta name="ROBOTS" content="ALL" />
</head>
<body>
<form name="frm_search" action="" method="post">
<input type="hidden" name="cmb_boat">
<input type="hidden" name="cmb_country">
<input type="hidden" name="cmb_body">
<input type="hidden" name="cmb_facility">
<input type="hidden" name="cmb_state">
<input type="hidden" name="cmb_zip">
	<div id="container">
		<div id="banner"></div>
		<div id="menu">
			<ul>
				<li id="current"><a href="default.aspx">Home</a></li>
				<li><a href="javascript:QuickSearch(3)">Boating Clubs</a></li>
				<li><a href="javascript:QuickSearch(12)">Cabin</a></li>
				<li><a href="javascript:QuickSearch(8)">Charters</a></li>
				<li><a href="javascript:QuickSearch(10)">Dinner</a></li>
				<li><a href="javascript:QuickSearch(9)">Excursions</a></li>
				<li><a href="javascript:QuickSearch(1)">Fishing</a></li>
				<li><a href="javascript:QuickSearch(7)">Jet Ski</a></li>
				<li><a href="javascript:QuickSearch(4)">Paddle</a></li>
				<li><a href="javascript:QuickSearch(11)">Pontoon</a></li>
				<li><a href="javascript:QuickSearch(2)">Sailing</a></li>
				<li><a href="javascript:QuickSearch(6)">Speed</a></li>
				<li><a href="javascript:QuickSearch(5)">Yachts</a></li>
				<!--li><a href="javascript:QuickSearch(13)">Houseboat</a></li-->
			</ul>
		</div>
		<div id="sub_menu">
			<a href="default.aspx">Home</a>&nbsp;|&nbsp;
			<a href="rentwithus.aspx">Rent With Us</a>&nbsp;|&nbsp;
			<a href="contactus.aspx">Contact Us</a>&nbsp;|&nbsp;
			<a href="members.aspx">Members</a>&nbsp;|&nbsp;
			<a href="facilities_faqs.aspx">Facilities FAQs</a>&nbsp;|&nbsp;
			<a href="renters_faqs.aspx">Renters FAQs</a>&nbsp;| &nbsp;
			<a href="sitemap.aspx">Site Map</a>
		</div>
		<div id="main_boat_picture"></div>
		<div id="search_field">
					<div id="login">
						 <h1></a>&nbsp;      <font size="2" color="#990000"> To demo as a rental facility use DEMO as user name and DEMO for password</h1>

						<table class="login_table" cellpadding="0" cellspacing="0">
							<tr>
								<td class="align_right"> User Name:</td>
								<td>
                                <input type="text" name="txtusername" class="login_username" size="20"/></td>
							</tr>
							<tr>
								<td class="align_right">Password:</td>
								<td>
                                <input type="password" name="txtpassword" class="login_password" size="20"/></td>
							</tr>
							<tr>
								<td colspan="2"><a class="button" href="javascript:Login()">Sign In</a></td>
							</tr>
						</table>

						<div class="question"><a href="memberspassword.aspx">Forgot your password? </a>&nbsp; |&nbsp;<a href="javascript:New();">New User</a>
						</div>
					</div>
		</div>
		<div id="ad_box">
			<a href="rentwithus.aspx"><h1>Advertise with Us</h1></a>
			<div id="greenbox"><img src="images/nothingtolose.gif"/></div>
			<div id="ad_box_list">
				<ul>
					<li><a href="rentwithus.aspx" style="text-decoration:none;font-size:10pt;color:#000000">Free Set up</a></li>
					<li><a href="rentwithus.aspx" style="text-decoration:none;font-size:10pt;color:#000000">No Up-front Cost</a></li>
					<li><a href="rentwithus.aspx" style="text-decoration:none;font-size:10pt;color:#000000">24hr. Access</a></li>
					<li><a href="rentwithus.aspx" style="text-decoration:none;font-size:10pt;color:#000000">Free Online Self-Scheduling Calendar</a></li>
					<li><a href="rentwithus.aspx" style="text-decoration:none;font-size:10pt;color:#000000">Instant Self Enrollment</a></li>
					<li><a href="rentwithus.aspx" style="text-decoration:none;font-size:10pt;color:#000000">24hr. Online Reservation Service</a></li>
					<li><a href="rentwithus.aspx" style="text-decoration:none;font-size:10pt;color:#000000">Upload Your Own Boat Pictures</a></li>
				</ul>
				<a class="button" href="members.aspx">Facility Login</a>
				<a class="button" href="facilities_mant.aspx">New Facility</a>
				<br><br>
				<a class="button" href="rentwithus.aspx">Learn More</a>
				<a class="button" href="#">New Captain</a>
			</div>
		</div>
		<div id="sponsored_packages">
		<h1>Facility Specials and Products</h1>
		<h2>New at BoatRenting.com</h2>

		<table>
		  <tr>
			<th>Name</th>
			<th>Description</th>
							  </tr>
		  <tr>
		    <td>
            <a style="font-size:10pt;font-weight:normal" href="http://www.boatrenting.com/gps1.aspx">GPS Boat Tracking Systems</a></td>
		    <td>Rent a GPS Boat Locater</td>
		    		  </tr>
		  <tr>
		    <td>
            <a style="font-size:10pt;font-weight:normal" href="displayad.aspx">Display Ad Advertising</a></td>
		    	<td>For a monthly price, Advertise Your Boat</td>	    
		    
		  </tr>
		  <tr>
		    <td>
            <a style="font-size:10pt;font-weight:normal" href="prop.aspx">Rental Prop Blades</a></td>
		    <td>Purchase Composite Propeller Blades</td>
		    </tr>
		  <tr>
		    <td>
            <a style="font-size:10pt;font-weight:normal" href="http://www.boatrenting.com/facilitybusinessqa.aspx">Rental Insurance</a></td>
		    <td>Need Insurance, Looking to get into the boat rental biz? We can Help.</td>
		</table>
		<!--<a href="#" class="localrates">Find out local rates</a>-->
		<a href="sponsored.aspx" class="button">See More Packages</a>
		</div><br>
		&nbsp;&nbsp;<a href="#" class="button"><b>Are you a boat captain? Looking for some work? We can use you</b></a>
		<div id="footer">
			<div id="footer_details">
				BoatRenting.com &middot; 320 South Country Road &middot; Brookhaven/Bellport NY 11719 &middot; 631-286-7816 &middot; <a href="mailto:info@boatrenting.com">info@boatrenting.com</a>
			</div>
		</div>
	</div>
</form>
</body>
<script language="JavaScript" type="text/javascript">
function QuickSearch(x){
	document.frm_search.cmb_boat.value = x;
	document.frm_search.cmb_country.value = 0;
	document.frm_search.cmb_body.value = "0";
	document.frm_search.cmb_facility.value = 0;
	document.frm_search.cmb_state.value = 0;
	document.frm_search.cmb_zip.value = 0;
	document.frm_search.action = "results.aspx";
	document.frm_search.submit();
}

function Login(){
	document.frm_search.action = "members.aspx";
	document.frm_search.submit();
}

function New(){
	document.frm_search.action = "facilities_mant.aspx";
	document.frm_search.submit();
}

function Clear(){
	document.frm_search.cmb_country.selectedIndex = 0;
	document.frm_search.cmb_state.selectedIndex = 0;
	document.frm_search.cmb_body.value = "";
	document.frm_search.cmb_facility.selectedIndex = 0;
	document.frm_search.cmb_boat.selectedIndex = 0;
	document.frm_search.txt_zip.value="";
	document.frm_search.txt_city.value="";
}
</script>
<script src="http://www.google-analytics.com/urchin.js" type="text/java_script">
</script>
<script type="text/java_script">
_uacct = "UA-872206-1";
urchinTracker();
</script>
</font>
</html>

