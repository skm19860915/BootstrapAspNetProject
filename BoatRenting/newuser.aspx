<%@ Page language="C#" CodeFile="newuser.aspx.cs" Inherits="BoatRenting.newuser_aspx_cs" %>
<%@ Import Namespace = "nce.adosql" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<%
    //countryID = 0;
    //firstName = Request["firstName"];
    //lastName = Request["lastName"];
    ////password = Request("password")
    ////password2 = Request("password2")
    //email = Request["email"];
    //email2 = Request["email2"];
    //adress = Request["adress"];
    //phone = Request["phone"];
    //phone2 = Request["phone2"];
    //mobilephone = Request["mobilephone"];
    //fax = Request["fax"];
    //zip = Request["zip"];
    //city = Request["city"];
    //if (!(Request["new_user_country"] == ""))
    //{
    //    countryID = Request["new_user_country"];
    //}
    //con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstringDATA");
    //Response.Expires = 0;
    //oConn = new Connection();
    //oConn.ConnectionString = con;
    //oConn.ConnectionTimeout = 500;
    //oConn.Open(null);
    //Session["Kart"] = Convert.ToString(Request.Form["hdn_session"]);
    //Set rs=Server.CreateObject("ADODB.Recordset")
    //Session["clientID"] = Request.Form["hdn_clientID"];
    //*************
    debugTEST_Kart = Convert.ToString(Session["Kart"]);
    debugTEST_clientID = Convert.ToString(Session["clientID"]);
    //*************

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
			</ul>
	
		</div><!-- SUB MENU	-->

		<table cellpadding="0" cellspacing="0" width="780" height="25" style="background: url('images/sub_menu_bg.gif')	repeat-x bottom	left; margin-left: 1px;	color: #666">
		<tr>
			<td	width="29" height="25"></td>
			<td	width="657"	height="25">
<input type=button value="Back" onClick="history.go(-1)">&nbsp;| &nbsp;
			<a href="default.aspx">Home</a>&nbsp;| &nbsp;
			<a href="rentwithus.aspx">Advertise on this site</a>&nbsp;|&nbsp;
			<a href="contactus.aspx">Contact	Us</a>&nbsp;|&nbsp;
			<a href="members.aspx">Facility</a>&nbsp;|&nbsp;
			<a href="facilities_faqs.aspx">Facilities FAQs</a>&nbsp;|&nbsp;
			<a href="renters_faqs.aspx">Renters FAQs</a>&nbsp;|&nbsp;
			<a href="Articles.aspx">Articles</a>&nbsp;|&nbsp;
			<a href="sitemap.aspx">Site Map</a>
			</td>
			<td	width="130"	height="25">
			<div><a	href="members.aspx" class="buttonMenu-Sign" style="color:white;"><b>
			  Manager Sign In</b></div></a></td>
		</tr>
		</table>

		<div id="new_user_creation">
			<form id="form1" runat="server">
			<input type="hidden" name="cmb_boat" value =<%= Request["cmb_boat"] %>>
			<input type="hidden" name="cmb_country" value = "<%= Request["cmb_country"] %>" >
			<input type="hidden" name="cmb_body" value = "">
			<input type="hidden" name="cmb_facility">
			<input type="hidden" name="cmb_state" value = "">
			<input type="hidden" name="cmb_zip" value = "">
			<input type="hidden" name="city" value = "<%= Request["city"] %>">
			<input type="hidden" name="zip" value = "<%= Request["zip"] %>">
			<input type="hidden" name="firstName" value = "<%= Request["firstName"] %>" >
			<input type="hidden" name="lastName" value = "<%= Request["lastName"] %>">
			<!--

			<input type="hidden" name="password" value = "<%= Request["password"] %>">
			<input type="hidden" name="password2" value = "<%= Request["password2"] %>">
			-->

			<input type="hidden" name="email" value = "<%= Request["email"] %>">
			<input type="hidden" name="email2" value = "<%= Request["email2"] %>">
			<input type="hidden" name="adress" value = "<%= Request["adress"] %>">
			<input type="hidden" name="phone" value = "<%= Request["phone"] %>">
			<input type="hidden" name="phone2" value = "<%= Request["phone2"] %>">
			<input type="hidden" name="mobilephone" value = "<%= Request["mobilephone"] %>">
			<input type="hidden" name="fax" value = "<%= Request["fax"] %>">
			<table id="facility_table" cellpadding="0" cellspacing="0">
				<tr>
					<th colspan="2">New User</th>
				</tr>
				<tr>
					<td class="align_right">First Name</td>
					<td>
                    <input type="text" name="new_user_first_name" id="new_user_first_name" runat="server" class="form_firstname" maxlength="50" size="20"  /><span class="hilite">*</span></td>
					<script> document.frm_newuser.new_user_first_name.value = document.frm_newuser.firstName.value </script>
				</tr>
				<tr>
					<td class="align_right">Last Name</td>
					<td>
                    <input type="text" name="new_user_last_name" id="new_user_last_name" runat="server" class="form_lastname" maxlength="50" size="20"/><span class="hilite">*</span></td>
				</tr>
				
<!--
				<tr>
					<td class="align_right">Password:</td>
					<td><input type="password" name="new_user_password" id="new_user_password" class="form_firstname" maxlength="30" value ="<%= password %>"/><span class="hilite">*</span></td>
				</tr>
				

				<tr>
					<td class="align_right">Confirm Password:</td>
					<td><input type="password" name="new_user_confirm_password" id="new_user_confirm_password" class="form_firstname" maxlength="30" value ="<%= password2 %>"/></td>
				</tr>

-->


				<tr>
					<td class="align_right">Email Address:</td>
					<td>
                    <input type="text" name="new_user_email" id="new_user_email" class="form_email" runat="server" maxlength="100" size="20"/><span class="hilite">*</span></td>
				</tr>
				<tr>
					<td class="align_right">Confirm Email:</td>
					<td>
                    <input type="text" name="new_user_confirm_email" id="new_user_confirm_email" runat="server" class="form_email" maxlength="100"  size="20"/></td>
				</tr>
				<tr>
					<td class="align_right">Address:</td>
					<td>
                    <input type="text" name="new_user_address" id="new_user_address" runat="server" class="form_address" maxlength="100" size="20" /><span class="hilite" >*</span></td>
				</tr>
				<tr>
					<td class="align_right">City:</td>
					<td>
                    <input type="text" name="new_user_city" id="new_user_city" runat="server" class="form_city" maxlength="50" size="20"/><span class="hilite" >*</span></td>
				</tr>
				<tr>
					<td class="align_right">Country:</td>
					<td><%
    //Country();
    %>

    <asp:DropDownList ID="new_user_country" runat="server" AutoPostBack="True" 
                              onselectedindexchanged="cboCountry_SelectedIndexChanged">
                          </asp:DropDownList>
 <span class="hilite">*</span></td>
					</tr>

<span class="hilite">*</span></td>
				</tr>
				<tr>
					<td class="align_right">State:</td>
					<td>
<%--                    <%
    States();
%>
--%>
 <span class="hilite">                          <asp:DropDownList ID="new_user_state" runat="server">
                            <asp:ListItem Value="0">- select State -</asp:ListItem>
                          </asp:DropDownList>
						*</span></td>
				</tr>
				<tr>
					<td class="align_right">Zip Code:</td>
					<td>
                    <input type="text" name="new_user_zipcode" id="new_user_zipcode" runat="server" class="form_zipcode" maxlength="5" size="20"/> <span class="hilite">*</span></td>
				</tr>
				<tr>
					<td class="align_right">Phone Number:</td>
					<td>
                    <input type="text" name="new_user_phone_number" id="new_user_phone_number" runat="server" class="form_phone" maxlength="20" size="20"/><span class="hilite">*</span></td>
				</tr>
				<tr>
					<td class="align_right">Additional Phone Number:</td>
					<td>
                    <input type="text" name="new_user_secondary_number" id="new_user_secondary_number" runat="server" class="form_phone" maxlength="20" size="20"/></td>
				</tr>
				<tr>
					<td class="align_right">Mobile Phone:</td>
					<td>
                    <input type="text" name="new_user_cell_phone" id="new_user_cell_phone" runat="server" class="form_phone" maxlength="20" size="20"/></td>
				</tr>
				<tr>
					<td class="align_right">Fax Number:</td>
					<td>
                    <input type="text" name="new_user_fax_number" id="new_user_fax_number" runat="server" class="form_phone" maxlength="20" size="20" /></td>
				</tr>
			</table>
<span class="hilite">*</span> Required Information<br />
&nbsp;<asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Reset" 
                    BackColor="#FF9933" ForeColor="White" Height="20px" Width="115px" />			&nbsp;
                    
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Continue" 
                    BackColor="#FF9933" ForeColor="White" Height="20px" Width="124px" />			
                    
                    &nbsp;
			</form>
		</div>

		<div id="footer">
			<div id="footer_details">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:Contact();">Contact Us </a>
				631-286-7816  <a href="mailto:info@boatrenting.com">info@boatrenting.com</a>
				</div>
		</div>
	</div> <!-- Container Ends Here --><script src="http://www.google-analytics.com/urchin.js" type="text/javascript">
	    </script>
<script type="text/javascript">
	_uacct = "UA-872206-1";
	urchinTracker();
	    </script>

</body>
<script language="JavaScript">
function Clean(){
	document.frm_newuser.reset();
}

function Validar () {
    var chk=false;

	//Initialise variables
	var errorMsg = "";

	if (document.getElementById("new_user_first_name").value == ""){
		errorMsg += "\n\t First Name \t                  - Write your First name";
	}

	if (document.getElementById("new_user_last_name").value == ""){
		errorMsg += "\n\t Last Name \t                  - Write your Last name";
	}

	if (document.getElementById("new_user_email").value == ""){
		errorMsg += "\n\t E-mail \t\t                  - Write your E-mail";
	}

	if (document.getElementById("new_user_email").value != "")
	{
		strEmail = document.getElementById("new_user_email").value;
		if (strEmail.length>0)
		{
			if (strEmail.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == -1)
			{
				errorMsg += "\n\t E-mail \t\t                  - Your E-mail address is invalid";
			}
		}
	}

	if (document.getElementById("new_user_email").value != document.getElementById("new_user_confirm_email").value){
		errorMsg += "\n\t E-mail \t\t                  - Your confirmation E-mail is not correct";
	}

	

	//if (document.getElementById("new_user_password").value == ""){
	//	errorMsg += "\n\t Password \t                  - Write your password";
	//}




	//if (document.getElementById("new_user_password").value != document.getElementById("new_user_confirm_password").value){
	//	errorMsg += "\n\t Password \t                  - Your confirmation password is not correct";
	//}



	if (document.getElementById("new_user_address").value == ""){
		errorMsg += "\n\t Address \t\t                  - Write your Address";
	}

	if (document.getElementById("new_user_city").value == ""){
		errorMsg += "\n\t City \t\t                  - Write your City";
	}

	if (document.getElementById("new_user_state").value == "0" &&
		(document.getElementById("new_user_country").value == 1 ||
		document.getElementById("new_user_country").value == 5)){
		errorMsg += "\n\t State \t\t                  - Select your State";
	}

	//if (document.getElementById("new_user_zipcode").value == ""){
	//	errorMsg += "\n\t Zip code \t\t                  - Write your Zip code";
	//}

	if (document.getElementById("new_user_country").value == "0"){
		errorMsg += "\n\t Country \t\t                  - Select your Country";
	}

	if (document.getElementById("new_user_phone_number").value == ""){
		errorMsg += "\n\t Phone Number \t                  - Write your Phone number";
	}

	//If there is aproblem with the form then display an error
	if (errorMsg != ""){
		msg = "______________________________________________________________\n\n";
		msg += "Your enquiry has not been sent because there are problem(s) with the form.\n";
		msg += "Please correct the problem(s) and re-submit the form.\n";
		msg += "______________________________________________________________\n\n";
		msg += "The following field(s) need to be corrected:\n";

		errorMsg += alert(msg + errorMsg + "\n\n");
		return false;
	}
	return true;
}

function Register(){
	if (Validar()){
	  	document.frm_newuser.action="newuser_save.aspx";
	  	document.frm_newuser.submit();
	}
}

function QuickSearch(x){
	document.frm_newuser.cmb_boat.value = x;
	document.frm_newuser.cmb_country.value = 0;
	document.frm_newuser.cmb_body.value = 0;
	document.frm_newuser.cmb_facility.value = 0;
	document.frm_newuser.cmb_state.value = 0;
	document.frm_newuser.cmb_zip.value = 0;
	document.frm_newuser.action = "results.aspx";
	document.frm_newuser.submit();
}
function Contact(){
	document.frm_newuser.action = "contactus.aspx";
	document.frm_newuser.submit();
}
function LoadStates(){

	document.frm_newuser.cmb_country.value = document.frm_newuser.new_user_country.selectedIndex;
	document.frm_newuser.firstName.value = document.frm_newuser.new_user_first_name.value;
	document.frm_newuser.lastName.value = document.frm_newuser.new_user_last_name.value;
	
       //document.frm_newuser.password.value = document.frm_newuser.new_user_password.value;
	//document.frm_newuser.password2.value = document.frm_newuser.new_user_confirm_password.value;
	document.frm_newuser.email.value = document.frm_newuser.new_user_email.value;
	document.frm_newuser.email2.value = document.frm_newuser.new_user_confirm_email.value;
	document.frm_newuser.adress.value = document.frm_newuser.new_user_address.value;
	document.frm_newuser.city.value = document.frm_newuser.new_user_city.value;
	document.frm_newuser.zip.value = document.frm_newuser.new_user_zipcode.value;
	document.frm_newuser.phone.value = document.frm_newuser.new_user_phone_number.value;
	document.frm_newuser.phone2.value = document.frm_newuser.new_user_secondary_number.value;
	document.frm_newuser.mobilephone.value = document.frm_newuser.new_user_cell_phone.value;
	document.frm_newuser.fax.value = document.frm_newuser.new_user_fax_number.value;

	document.frm_newuser.action = "newuser.aspx";
	document.frm_newuser.submit();
}

    </script>


</html>
