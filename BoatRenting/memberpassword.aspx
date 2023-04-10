<%@ Page Language="C#" AutoEventWireup="true" CodeFile="memberpassword.aspx.cs" Inherits="memberspassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FORGOT PASSWORD</title>
    <style type="text/css" media="screen">@import "br.css";</style>

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



</head>
<body>
    <form id="form1" runat="server">
   <div id="container">
		<div id="banner"></div>
		<div id="menu">
			<ul>
				<li id="current"><a href="default.asp">Home</a></li>
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
		
		
		<div id="search_field">
					<div id="login" style="width: 384; height: 241">
						<h1>Manager (Boat Owner) Password Retrieval</h1>
					<br />

                       <table>
                           <tr>
                               <td align="right">Email:</td>
                               <td align="right"><asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>	</td>
                           </tr>

                           <tr>
                               <td colspan="2">
                                   <br />

                                   <asp:Label ID="lblMessage" Font-Size="Medium" Font-Bold="true" runat="server"></asp:Label>
                                </td>

                           </tr>
                           <tr>
                               <td>

                               </td>
                               <td align="right">
                                    <asp:LinkButton ID="btnSubmit" Text="Submit" OnClick="btnSubmit_Click" CssClass="button" runat="server"></asp:LinkButton>

                               </td>
                           </tr>
                       </table>
                       
                        <p>Forgot Your Password? No Worries...</p>
                        <p>Just enter the email account you signed-up with, and 
                        we'll mail you your password </p>
						<div class="question" style="width: 354; height: 19">
                          <p style="text-align: center"><a href="members.aspx">
                          <font size="2">Sign In</font></a><font size="2">&nbsp;|&nbsp;</font>
						</div>
					</div>
		</div>

       </div>


    </form>
</body>
</html>
