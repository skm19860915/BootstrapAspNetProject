﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dead_Search.aspx.cs" Inherits="Dead_Search" %>

<%@ Register Src="~/ctlSearch.ascx" TagPrefix="uc1" TagName="ctlSearch" %>
<%@ Register Src="~/ctlFooter.ascx" TagPrefix="uc1" TagName="ctlFooter" %>
<%@ Register Src="~/ctlTopMenu.ascx" TagPrefix="uc1" TagName="ctlTopMenu" %>





<!DOCTYPE html>
<html lang="en">
<head>
    <title>Dead Seach</title>
    <meta charset="utf-8">    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
    <meta name = "format-detection" content = "telephone=no" />
    <meta name="description" content="Your description">
    <meta name="keywords" content="Your keywords">
    <meta name="author" content="Your name">
    <meta name="robots" content="nofollow" />


    <!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-872206-2"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-872206-2');
</script>
   <%-- 
    
    <!-- CSS STYLES -->
	<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	
    <link href="css/form.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />

    
	<!-- SCRIPTS -->
	<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <!--[if IE]><html class="ie" lang="en"> <![endif]-->
	
	
     <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/jquery-ui.min.js" type="text/javascript"></script>
	<script src="js/superfish.min.js" type="text/javascript"></script>
	<script src="js/jquery.flexslider-min.js" type="text/javascript"></script>
	<script src="js/myscript.js" type="text/javascript"></script>--%>
  
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
    
   
    
    
    
    <!--[if lt IE 9]>
    <div style='text-align:center'><a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode"><img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." /></a></div>  
    <script src="assets/assets/js/html5shiv.js"></script> 
    <script src="assets/assets/js/respond.min.js"></script>
  <![endif]-->

</head>
<body>
<!--==============================header=================================-->

<!-- HEADER -->
		
     <form id="frmIndex" class="search"  accept-charset="utf-8" runat="server">             
<header id="header">
    
<!-- TOP LINE -->
          <uc1:ctlTopMenu runat="server" ID="ctlTopMenu" />		
<!--==============================content=================================-->

     



       <div class="container" >
      	<div class="row_header2" align="center"  ><br><br><br>
        <h1 class="white2">Oh no!</h1>

<h2  class="white2">Unfortunately, no results were found.</h2>

<h3  class="white">Try adjusting your search!</h3>

<h3  class="white">Try expanding your search!</h3><br>


        	   
          
            
                <uc1:ctlSearch runat="server" ID="ctlSearch" />
      
               <h2 class="white"><a href="AdvanceSearch.aspx"> Use our advance search tool!</a></h2>
                       <br>
                 <a  href="AdvanceSearch.aspx"  class="btn btn-primary btn1"   >  
                      <span>Advanced Search</span>
                     </a>
      </div>         
	</div>
<!--==============================content=================================-->
    </header>

   
          
      
      
      </form>


<!--==============================content=================================-->

    <!--==============================row_1=================================-->
   


<!-- FOOTER -->


    <uc1:ctlFooter runat="server" ID="ctlFooter" />
				
 

</body>
</html>