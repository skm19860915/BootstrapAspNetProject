<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderSummary.aspx.cs" Inherits="BoatRenting.OrderSummary"  MaintainScrollPositionOnPostback="true"   %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/ctlTopMenu.ascx" TagPrefix="uc1" TagName="ctlTopMenu" %>
<%@ Register Src="~/ctlFooter.ascx" TagPrefix="uc1" TagName="ctlFooter" %>



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
    
    
    <!-- CSS STYLES -->
	<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	
    <link href="css/form.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />

 

	<!-- SCRIPTS -->
	<!--[if IE]><script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <!--[if IE]><html class="ie" lang="en"> <![endif]-->
	
	<%--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
	--%>
     <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/jquery-ui.min.js" type="text/javascript"></script>
	<script src="js/superfish.min.js" type="text/javascript"></script>
	<script src="js/jquery.flexslider-min.js" type="text/javascript"></script>
	<%--<script src="js/myscript.js" type="text/javascript"></script>
  --%>
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
    
   
     <%--  <script src="//ziplookup.googlecode.com/git/zip-lookup/zip-lookup.min.js" type="text/javascript" ></script>--%>

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
<body>
<!--==============================header=================================-->

<!-- HEADER -->
		 <form id="frmContactForm" class="contact-form" runat="server" defaultbutton="lnkReturingCustomer">		
                 
<header id="header" >
<!-- TOP LINE -->
			
                         <uc1:ctlTopMenu runat="server" ID="ctlTopMenu" />
                  
   
<!--==============================content=================================-->

      <div class="container" >
      	<div class="row_header2" align="center" >
        	<h1 class="white" >Welcome Aboard!</h1>
              
                         
      </div>         
	</div>
    <script type="text/javascript">//<![CDATA[
var tlJsHost = ((window.location.protocol == "https:") ? "https://secure.comodo.com/" : "http://www.trustlogo.com/");
document.write(unescape("%3Cscript src='" + tlJsHost + "trustlogo/javascript/trustlogo.js' type='text/javascript'%3E%3C/script%3E"));
//]]>
</script>
</header>
<!--==============================content=================================-->

    <!--==============================row_1=================================-->
<div class="container">
      <div class="row">
           <div class="col-lg-12 col-sm-12 padbot20">
         
             <h2>Order Summary:</h2>
            
             
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
                    <td class="list"><asp:Label ID="lblCurrencySymbol1" runat="server"></asp:Label> <%= orderSummary.MarinaOnlineReservationFee.ToString("F") %><br>
*This fee will be deducted off the rental price. Pay the remaining balance directly to the boat owner.</td>
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
  
   
                <asp:TextBox ID="txtUsername" placeholder="User Name or Email Address" CssClass="input-xlarge" runat="server"></asp:TextBox>
</div>
<div class="control-group">

  
     <asp:TextBox ID="txtPassword" placeholder="Password" CssClass="input-xlarge" runat="server" TextMode="Password"  ></asp:TextBox>
    <br />
  
</div>
            <script>
                function SubmitLoginForm(e)
                {
                  
                 

                    if (e.keyCode == 13) {
                        e.preventDefault();
                    
                      
                        $("#lnkReturingCustomer").trigger("click");
                       
                    }

                }

                function LoginUserClick()
                {                   
                 
                    document.getElementById('lnkReturingCustomer').click();
                }


            </script>   

              
<div style="clear:both;"></div>

<asp:LinkButton ID="lnkForgotPassword" runat="server" Text="Forgot Password." OnClick="lnkForgotPassword_Click"  ></asp:LinkButton>

<div style="clear:both;"></div>
<br />


     <div class="" align="right">                     
     
  
     <asp:LinkButton ID="lnkReturingCustomer" runat="server" CssClass="right-btn btn3" Text="LOGIN" OnClick="lnkReturingCustomer_Click" TabIndex="9"   ></asp:LinkButton>
   
    
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

  <label class="control-label" >  Country: </label>
               
            <asp:DropDownList ID="ddCountry" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddCountry_SelectedIndexChanged" ></asp:DropDownList>
                
               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddCountry" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           

                  </div>

        <div class="control-group">

  <label class="control-label" >  State:</label>
            <asp:DropDownList ID="ddState" runat="server" class='zip-lookup-field-state'></asp:DropDownList>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddState" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="saveRecord"></asp:RequiredFieldValidator>           


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
   
   <asp:DropDownList ID="ddExpMonth" runat="server" style="width:100px;" class="input-xlarge"></asp:DropDownList>
  <asp:DropDownList ID="ddExpYear" runat="server" style="width:100px;" class="input-xlarge"></asp:DropDownList>
  
    
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
               
            <asp:DropDownList ID="ddBillingCountry" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddBillingCountry_SelectedIndexChanged" ></asp:DropDownList>
                
               <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="ddBillingCountry" Display="Dynamic" Text="* Required" ForeColor="Red" ValidationGroup="billing"></asp:RequiredFieldValidator>           

                  </div>

        <div class="control-group">

  <label class="control-label" >  State:</label>
            <asp:DropDownList ID="ddBillingState" runat="server" ></asp:DropDownList>
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

<style type="text/css">
    .modal
    {
        position: fixed;
        top: 0;
        left: 0;
        background-color: black;
        z-index: 99;
        opacity: 0.8;
        filter: alpha(opacity=80);
        -moz-opacity: 0.8;
        min-height: 100%;
        width: 100%;
    }
    .loading
    {
        font-family: Arial;
        font-size: 10pt;
        border: 5px solid #67CFF5;
        width: 300px;
        height: 300px;
        display: none;
        position: fixed;
        background-color: White;
        z-index: 999;
    }
</style>
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

</div>

               </form>
<!-- FOOTER -->
    
    <img src="https://www.rentaboat.com/comodo_secure_seal.png" alt="comdo secure" />
    <uc1:ctlFooter runat="server" ID="ctlFooter" />	
				
   <%--<script language="JavaScript" type="text/javascript">
TrustLogo("https://www.rentaboat.com/comodo_secure_seal.png", "SC5", "none");
</script>
<a href="https://ssl.comodo.com/ev-ssl-certificates.php" id="comodoTL">EV SSL</a>--%>

</body>
</html>