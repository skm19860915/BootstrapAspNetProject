<%@ Page Language="C#" CodeFile="index.aspx.cs" Inherits="BoatRenting.indexN_aspx_cs" EnableEventValidation="false" %>



<%@ Register Src="~/ctlFooter.ascx" TagPrefix="uc1" TagName="ctlFooter" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>BOAT RENTALS, YACHT CHARTERS, SAILBOAT RENTAL & BOATS FOR HIRE</title>
    <meta charset="utf-8">
    <meta http-equiv="Cache-control" content="public, max-age=600" />
     <link rel="icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
    <meta name="format-detection" content="telephone=1-888-610-2628" />
    <meta name="description" content="Find & book affordable boat rentals with or without a captain. Rent sailboats, jet skis, yachts charters and other watercrafts anywhere in the world. Rated #1 in customer satisfaction.">
    <meta name="keywords" content="Boat Rentals, rent a boat, Boat Rental, sail boat rentals, sailboat rental, houseboat rental, boat rental and charter, boat, boating, boats, ski boat rentals, boating clubs, jet ski rentals, personal water craft rentals, pwc rentals, yacht charters, Cabin boat rentals, power boat rentals, worldwide boat rentals">
    <meta name="author" content="Kenny Hilderbrandt">
    <meta name="google-site-verification" content="o_nt02lBg_GRoNrr7bSFXxw5lo7F8ULgeHZ58KaGx10" />
    <meta name="google-site-verification" content="o_nt02lBg_GRoNrr7bSFXxw5lo7F8ULgeHZ58KaGx10" />
    <meta http-equiv="Expires" content="30" />
    <meta name=viewport content="width=device-width, initial-scale=1">
   
  <%--   <style>
        html, body {
            width: auto !important;
            overflow-x: hidden !important;
        }

        @import url(//fonts.googleapis.com/css?family=Open+Sans:400,700,800);

        .btn-primary {
            text-shadow: 0 -1px 0 rgba(0,0,0,.2);
            -webkit-box-shadow: inset 0 1px 0 rgba(255,255,255,.15),0 1px 1px rgba(0,0,0,.075);
            box-shadow: inset 0 1px 0 rgba(255,255,255,.15),0 1px 1px rgba(0,0,0,.075);
        }

        .btn-primary {
            background-image: -webkit-gradient(linear,left 0,left 100%,from(#428bca),to(#3071a9));
            background-image: -webkit-linear-gradient(top,#428bca,0%,#3071a9,100%);
            background-image: -moz-linear-gradient(top,#428bca 0,#3071a9 100%);
            background-image: linear-gradient(to bottom,#428bca 0,#3071a9 100%);
            background-repeat: repeat-x;
            border-color: #2d6ca2;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff428bca',endColorstr='#ff3071a9',GradientType=0);
        }

        .navbar-brand, .navbar-nav > li > a {
            text-shadow: 0 1px 0 rgba(255,255,255,.25);
        }

        html {
            font-family: sans-serif;
            -webkit-text-size-adjust: 100%;
            -ms-text-size-adjust: 100%;
        }

        body {
            margin: 0;
        }

        header {
            display: block;
        }

        a {
            background-color: transparent;
        }

        strong {
            font-weight: 700;
        }

        h1 {
            margin: .67em 0;
            font-size: 2em;
        }

        img {
            border: 0;
        }

        hr {
            height: 0;
            -webkit-box-sizing: content-box;
            -moz-box-sizing: content-box;
            box-sizing: content-box;
        }

        button, input {
            margin: 0;
            font: inherit;
            color: inherit;
        }

        button {
            overflow: visible;
        }

        button {
            text-transform: none;
        }

        button, html input[type=button], input[type=submit] {
            -webkit-appearance: button;
        }

            button::-moz-focus-inner, input::-moz-focus-inner {
                padding: 0;
                border: 0;
            }

        input {
            line-height: normal;
        }


      
        @font-face {
            font-family: 'Glyphicons Halflings';
            font-display: auto;
            src: url(../fonts/glyphicons-halflings-regular.eot);
            src: url(../fonts/glyphicons-halflings-regular.eot?#iefix) format('embedded-opentype'),url(../fonts/glyphicons-halflings-regular.woff) format('woff'),url(../fonts/glyphicons-halflings-regular.ttf) format('truetype'),url(../fonts/glyphicons-halflings-regular.svg#glyphicons_halflingsregular) format('svg');
        }

        .glyphicon {
            position: relative;
            top: 1px;
            display: inline-block;
            font-family: 'Glyphicons Halflings';
            font-style: normal;
            font-weight: 400;
            line-height: 1;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        .glyphicon-align-justify:before {
            content: "\e055";
        }

        * {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        :before, :after {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        html {
            font-size: 10px;
        }

        body {
            font-family: Verdana,sans-serif;
            font-size: 16px;
            line-height: 1.42857143;
            color: #333;
            background-color: #fff;
        }

        input, button {
            font-family: inherit;
            font-size: inherit;
            line-height: inherit;
        }

        a {
            color: #337ab7;
            text-decoration: none;
        }

        img {
            vertical-align: middle;
        }

        hr {
            margin-top: 20px;
            margin-bottom: 20px;
            border: 0;
            border-top: 1px solid #eee;
        }

        h1, h2, h3 {
            font-family: inherit;
            font-weight: 500;
            line-height: 1.1;
            color: inherit;
        }

        h1, h2, h3 {
            margin-top: 20px;
            margin-bottom: 10px;
        }

        h1 {
            font-size: 36px;
        }

        h2 {
            font-size: 30px;
        }

        h3 {
            font-size: 24px;
        }

        p {
            margin: 0 0 10px;
        }

        ul {
            margin-top: 0;
            margin-bottom: 10px;
        }

            ul ul {
                margin-bottom: 0;
            }

        .container {
            margin-right: auto;
            margin-left: auto;
        }

        @media (min-width:768px) {
            .container {
                width: 750px;
            }
        }

        @media (min-width:992px) {
            .container {
                width: 970px;
            }
        }

        @media (min-width:1200px) {
            .container {
                width: 1170px;
            }
        }

        .row {
            margin-right: -15px;
            margin-left: -15px;
        }

        .col-lg-2, .col-xs-4, .col-sm-4, .col-md-4, .col-sm-12, .col-lg-12 {
            position: relative;
            min-height: 1px;
            padding-right: 15px;
            padding-left: 15px;
        }

        .col-xs-4 {
            float: left;
        }

        .col-xs-4 {
            width: 33.33333333%;
        }

        @media (min-width:768px) {
            .col-sm-4, .col-sm-12 {
                float: left;
            }

            .col-sm-12 {
                width: 100%;
            }

            .col-sm-4 {
                width: 33.33333333%;
            }
        }

        @media (min-width:992px) {
            .col-md-4 {
                float: left;
            }

            .col-md-4 {
                width: 33.33333333%;
            }
        }

        @media (min-width:1200px) {
            .col-lg-2, .col-lg-12 {
                float: left;
            }

            .col-lg-12 {
                width: 100%;
            }

            .col-lg-2 {
                width: 16.66666667%;
            }
        }

        .btn {
            display: inline-block;
            padding: 6px 12px;
            margin-bottom: 0;
            font-size: 14px;
            font-weight: 400;
            line-height: 1.42857143;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            -ms-touch-action: manipulation;
            touch-action: manipulation;
            background-image: none;
            border: 1px solid transparent;
            border-radius: 4px;
        }

        .btn-primary {
            color: #fff;
            background-color: #337ab7;
            border-color: #2e6da4;
        }

        .collapse {
            display: none;
            visibility: hidden;
        }

        .nav {
            padding-left: 0;
            margin-bottom: 0;
            list-style: none;
        }

            .nav > li {
                position: relative;
                display: block;
            }

                .nav > li > a {
                    position: relative;
                    display: block;
                    padding: 10px 15px;
                }

        @media (min-width:768px) {
            .navbar-header {
                float: left;
            }
        }

        .navbar-collapse {
            padding-right: 15px;
            padding-left: 15px;
            overflow-x: visible;
            -webkit-overflow-scrolling: touch;
            border-top: 1px solid transparent;
            -webkit-box-shadow: inset 0 1px 0 rgba(255,255,255,.1);
            box-shadow: inset 0 1px 0 rgba(255,255,255,.1);
        }

        @media (min-width:768px) {
            .navbar-collapse {
                width: auto;
                border-top: 0;
                -webkit-box-shadow: none;
                box-shadow: none;
            }

                .navbar-collapse.collapse {
                    display: block !important;
                    height: auto !important;
                    padding-bottom: 0;
                    overflow: visible !important;
                    visibility: visible !important;
                }
        }

        .navbar-brand {
            float: left;
            height: 50px;
            padding: 15px 15px;
            font-size: 18px;
            line-height: 20px;
        }

        .navbar-toggle {
            position: relative;
            float: right;
            padding: 9px 10px;
            margin-top: 8px;
            margin-right: 15px;
            margin-bottom: 8px;
            background-color: transparent;
            background-image: none;
            border: 1px solid transparent;
            border-radius: 4px;
        }

        @media (min-width:768px) {
            .navbar-toggle {
                display: none;
            }
        }

        .navbar-nav {
            margin: 7.5px -15px;
        }

            .navbar-nav > li > a {
                padding-top: 10px;
                padding-bottom: 10px;
                line-height: 20px;
            }

        @media (min-width:768px) {
            .navbar-nav {
                float: left;
                margin: 0;
            }

                .navbar-nav > li {
                    float: left;
                }

                    .navbar-nav > li > a {
                        padding-top: 15px;
                        padding-bottom: 15px;
                    }
        }

        .close {
            float: right;
            font-size: 21px;
            font-weight: 700;
            line-height: 1;
            color: #000;
            text-shadow: 0 1px 0 #fff;
            filter: alpha(opacity=20);
            opacity: .2;
        }

        .clearfix:before, .clearfix:after, .container:before, .container:after, .row:before, .row:after, .nav:before, .nav:after, .navbar-header:before, .navbar-header:after, .navbar-collapse:before, .navbar-collapse:after {
            display: table;
            content: " ";
        }

        .clearfix:after, .container:after, .row:after, .nav:after, .navbar-header:after, .navbar-collapse:after {
            clear: both;
        }

        @-ms-viewport {
            width: device-width;
        }

        input[type="text"], input[type="password"] {
            -webkit-appearance: none;
            -moz-appearance: caret;
            height: 22px;
            width: 260px;
        }

        body {
            background: #FFF;
            margin: 0;
        }

        html, body {
            width: auto !important;
            overflow-x: hidden !important;
        }

        .navbar-brand2 {
            display: none;
        }

        p {
            font-family: Verdana,sans-serif;
            font-size: 16px;
            line-height: 26px;
            color: #333;
            margin: 0;
            padding: 0;
            margin-bottom: 24px;
        }

        h1 {
            font-family: Verdana,sans-serif;
            font-size: 30px;
            line-height: 40px;
            font-weight: 200;
            color: #4CAEB8;
        }

            h1.white {
                color: #fff;
                font-size: 50px;
            }

        h2 {
            font-family: Verdana,sans-serif;
            font-size: 24px;
            line-height: 30px;
            font-weight: 200;
            color: #4CAEB8;
        }

        h3 {
            font-family: Verdana,sans-serif;
            font-size: 18px;
            line-height: 22px;
            font-weight: 500;
            color: #1c818b;
        }

        .btn1 {
            position: relative;
            border: none;
            border-radius: 0;
            background: transparent;
            box-sizing: border-box;
            padding: 0;
            z-index: 10;
            line-height: 0;
        }

            .btn1 span {
                text-transform: uppercase;
                position: relative;
                display: block;
                float: left;
                font-family: Verdana,sans-serif;
                font-size: 18px;
                line-height: 32px;
                font-weight: 800;
                letter-spacing: 2px;
                background: #fe5974;
                height: 55px;
                text-decoration: none;
                text-align: center;
                width: 100%;
                background-image: -webkit-linear-gradient(top,#fe5974,#dc3d58);
                background-image: -moz-linear-gradient(top,#fe5974,#dc3d58);
                background-image: -ms-linear-gradient(top,#fe5974,#dc3d58);
                background-image: -o-linear-gradient(top,#fe5974,#dc3d58);
                background-image: linear-gradient(to bottom,#fe5974,#dc3d58);
                -webkit-border-radius: 14;
                -moz-border-radius: 14;
                border-radius: 14px;
                color: #fff;
                padding: 10px 20px 10px 20px;
                border: 3px #d33650 solid;
            }

        .btn2 {
            text-transform: uppercase;
            font-family: Verdana,sans-serif;
            font-size: 12px;
            line-height: 24px;
            font-weight: 800;
            display: block;
            color: #FFF;
            letter-spacing: 2px;
            background: #318E98;
            text-decoration: none;
            text-align: center;
            padding: 9px 10px 10px;
            width: 100%;
            border-radius: 0;
        }

        .btn3 {
            text-transform: uppercase;
            font-family: Verdana,sans-serif;
            font-size: 12px;
            line-height: 24px;
            font-weight: 800;
            display: block;
            letter-spacing: 2px;
            text-decoration: none;
            text-align: center;
            width: 100%;
            background: #fe5974;
            background-image: -webkit-linear-gradient(top,#fe5974,#dc3d58);
            background-image: -moz-linear-gradient(top,#fe5974,#dc3d58);
            background-image: -ms-linear-gradient(top,#fe5974,#dc3d58);
            background-image: -o-linear-gradient(top,#fe5974,#dc3d58);
            background-image: linear-gradient(to bottom,#fe5974,#dc3d58);
            -webkit-border-radius: 14;
            -moz-border-radius: 14;
            border-radius: 14px;
            color: #fff;
            padding: 10px 20px 10px 20px;
            border: 3px #d33650 solid;
        }

        header {
            text-align: center;
            background: #1c818b url(../../img/patternhead.jpg) top center repeat-x;
            background-size: cover;
        }

        .background-homesize {
            background: url(https://www.rentaboat.com/images/large-homepage3.jpg) no-repeat top center;
            background-size: 100% 720px;
        }

        .row_header-home2 {
            padding: 120px 0 300px 0;
        }

        .home-title {
            font-size: 30px;
        }

        .top_line {
            padding: 7px 30px 2px;
            font-size: 12px;
            color: #70d6e1;
        }

            .top_line a {
                font-size: 12px;
                color: #b6e0e5;
            }

        .navbar-brand {
            float: left;
            display: block;
            position: relative;
            margin: 0 auto 3px auto;
            top: 6px;
            left: 8px;
            height: 62px;
        }

            .navbar-brand img {
                max-width: 370px;
                width: 100%;
            }

        .indicator2 {
            background: url(../../img/indicator2.png) no-repeat 0 0;
            width: 7px;
            height: 5px;
            position: absolute;
            display: inline-block;
            top: 33px;
            margin-left: 5px;
            left: auto;
            z-index: 5;
        }

        .menu_block {
            position: relative;
            z-index: 100;
            margin: 0 -30px;
            text-align: center;
            height: 80px;
        }

        .navbar-collapse {
            float: none;
            padding-right: 0;
            padding-left: 0;
            border: 0;
            box-shadow: none;
        }

        .navbar-nav {
            float: none;
        }

            .navbar-nav li {
                float: none;
                display: inline-block;
                margin: 0;
                text-align: center;
            }

                .navbar-nav li a {
                    position: relative;
                    display: block;
                    margin: 0 46px 0 50px;
                    padding: 22px 0 24px;
                    text-transform: uppercase;
                    font-weight: 700;
                    line-height: 28px;
                    font-size: 15px;
                    color: #fff;
                    text-shadow: none;
                    border: 0;
                }

                .navbar-nav li.active a {
                    background: none;
                    color: #fff;
                }

        .sub-menu ul {
            display: none;
            position: absolute;
            z-index: 9990;
            min-width: 185px;
            left: 0;
            top: 100%;
            padding: 0 0 5px;
            margin: 3px 0 0 -3px;
            background: #fff;
            border-bottom: 2px solid #1c818b;
        }

            .sub-menu ul li {
                margin: 0;
                padding: 0;
                width: 100%;
                border-top: 0;
            }

                .sub-menu ul li a:before, .sub-menu ul li a:after, .sub-menu ul li:before {
                    display: none;
                }

                .sub-menu ul li a {
                    margin: 0 !important;
                    padding: 7px 5px 7px 20px !important;
                    text-transform: none;
                    text-align: left !important;
                    color: #1c818b !important;
                    text-shadow: none;
                    border: 0 !important;
                }

        #search {
            margin: 0;
            padding-right: 130px;
            position: relative;
        }

            #search input {
                border-radius: 0;
                font-family: Verdana,sans-serif;
                font-size: 18px;
                line-height: 22px;
                outline: none;
                margin: 0;
                color: #CCC;
                background: #FFF;
                height: 55px;
                border-top: 1px solid #B0B0B0;
                border-left: 1px solid #B0B0B0;
                box-shadow: inset 1px 1px 3px 1px #E5E5E5;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
                width: 320px;
                border-right-style: none;
                border-right-color: inherit;
                border-right-width: medium;
                border-bottom-style: none;
                border-bottom-color: inherit;
                border-bottom-width: medium;
                text-align: center;
            }

        .btn-search {
            position: absolute;
            top: 0;
        }

        .list1 {
            position: relative;
            list-style: none;
            overflow: hidden;
            padding: 0;
            margin: 0;
        }

            .list1 li {
                position: relative;
                list-style: none;
                overflow: hidden;
                margin-bottom: 15px;
            }

                .list1 li .btn2 {
                    position: relative;
                    display: block;
                    border: none;
                    border-radius: 0;
                    box-sizing: border-box;
                    padding: 0;
                    z-index: 10;
                    line-height: 0;
                    padding-left: 40px;
                    overflow: hidden;
                    background: #318E98;
                }

                    .list1 li .btn2 span {
                        text-transform: uppercase;
                        position: relative;
                        display: block;
                        float: left;
                        font-family: Verdana,sans-serif;
                        font-size: 11px;
                        line-height: 18px;
                        font-weight: 800;
                        letter-spacing: 2px;
                        padding: 18px 0 19px 18px;
                        top: 0;
                        left: 0;
                        width: 118px;
                    }

                    .list1 li .btn2 strong {
                        top: 0;
                        left: 0;
                        padding: 0;
                        position: absolute;
                        background: #18808B;
                    }

                        .list1 li .btn2 strong img {
                            position: relative;
                            width: 55px;
                            height: 55px;
                            top: 0;
                            left: 0;
                        }

                .list1 li .btn3 {
                    position: relative;
                    display: block;
                    border: none;
                    border-radius: 0;
                    box-sizing: border-box;
                    padding: 0;
                    z-index: 10;
                    line-height: 0;
                    padding-left: 55px;
                    overflow: hidden;
                    background: #318E98;
                }

                    .list1 li .btn3 span {
                        text-transform: uppercase;
                        position: relative;
                        display: block;
                        float: left;
                        font-family: Verdana,sans-serif;
                        font-size: 11px;
                        line-height: 16px;
                        font-weight: 800;
                        letter-spacing: 2px;
                        padding: 11px 0 12px 14px;
                    }

                    .list1 li .btn3 strong {
                        top: 0;
                        left: 0;
                        padding: 0;
                        position: absolute;
                        background: #18808B;
                    }

                        .list1 li .btn3 strong img {
                            position: relative;
                            width: 55px;
                            height: 55px;
                            top: 0;
                            left: 0;
                        }

        @media (min-width:1220px) and (max-width:1500px) {
            .container {
                padding: 2px 5px;
            }

            .background-homesize {
                background: url(https://www.rentaboat.com/images/large-homepage3.jpg) no-repeat top center;
                background-size: 100% 620px;
            }

            .row_header-home2 {
                padding: 90px 0 220px 0;
            }
        }

        @media (min-width:991px) and (max-width:1220px) {
            .background-homesize {
                background: url(https://www.rentaboat.com/images/large-homepage3.jpg) no-repeat top center;
                background-size: 100% 550px;
            }

            .row_header-home2 {
                padding: 90px 0 180px 0;
            }
        }

        @media (min-width:768px) and (max-width:991px) {
            .background-homesize {
                background: url(https://www.rentaboat.com/images/large-homepage3.jpg) no-repeat top center;
                background-size: cover !important;
            }

            .row_header-home2 {
                padding: 90px 0 210px 0;
            }

            .navbar-nav li a {
                margin: 0 6px 0 10px;
                padding: 27px 0 7px;
            }

            .indicator2 {
                background: url(../../img/indicator2.png) no-repeat 0 0;
                top: 25px;
            }

            .navbar-brand {
                float: left;
                display: block;
                position: relative;
                margin: 0 auto 3px auto;
                top: 6px;
                left: 3px;
                height: 40px;
            }

                .navbar-brand img {
                    max-width: 200px;
                    width: 100%;
                }
        }

        @media (max-width:767px) {
            .container {
                padding: 10px 5px;
            }

            .navbar-brand img {
                max-width: 150px;
                width: 100%;
            }

            .background-homesize {
                background: url(https://www.rentaboat.com/images/large-homepage3.jpg) no-repeat top center;
                background-size: cover !important;
            }

            .row_header-home2 {
                padding: 80px 0 140px 0;
            }

            .home-title {
                font-size: 25px;
            }
        }

        @media (max-width:580px) {
            h1.white {
                font-size: 30px;
            }

            #search input {
                width: 250px;
            }

            .list1col {
                width: 50%;
            }

            .background-homesize {
                background: url(https://www.rentaboat.com/images/large-homepage3.jpg) no-repeat top center;
                background-size: cover !important;
            }
        }

        @media (max-width:480px) {
            .background-homesize {
                background: url(https://www.rentaboat.com/images/large-homepage3.jpg) no-repeat top center;
                background-size: cover;
            }

            .row_header-home2 {
                padding: 70px 0 100px 0;
            }

            .home-title {
                font-size: 16px;
            }

            #search {
                padding-right: 0;
                position: relative;
                margin-left: 0;
            }

            .btn-search {
                position: relative;
                right: inherit;
                left: 0;
                float: none;
                margin: 10px 0 0 0;
                top: 0;
            }

            .navbar-brand {
                float: left;
                display: block;
                position: relative;
                margin: 0 auto 3px auto;
                top: 6px;
                left: 3px;
                height: 33px;
            }

                .navbar-brand img {
                    max-width: 150px;
                    width: 100%;
                }
        }

        @media (max-width:420px) {
            h1.white {
                font-size: 20px;
            }

            #search input {
                width: 250px;
            }

            .list1col {
                width: 100%;
            }
        }

        img {
            max-width: 100%;
        }

        @media (min-width:1200px) and (max-width:1399px) {
            .navbar-nav li a {
                margin: 0 26px 0 30px;
                padding: 27px 0 7px;
            }

            .indicator2 {
                background: url(../../img/indicator2.png) no-repeat 0 0;
                top: 35px;
            }

            .navbar-brand {
                height: 40px;
            }

                .navbar-brand img {
                    max-width: 300px;
                    width: 100%;
                }
        }

        @media (min-width:992px) and (max-width:1199px) {
            .navbar-nav li a {
                margin: 0 16px 0 20px;
                padding: 27px 0 7px;
            }

            .indicator2 {
                background: url(../../img/indicator2.png) no-repeat 0 0;
                top: 35px;
            }

            .navbar-brand {
                float: left;
                display: block;
                position: relative;
                margin: 0 auto 3px auto;
                top: 6px;
                left: 3px;
                height: 33px;
            }

                .navbar-brand img {
                    max-width: 250px;
                    width: 100%;
                }

            .btn {
                font-size: 12px;
            }
        }

        @media (min-width:768px) and (max-width:991px) {
            .indicator2 {
                background: url(../../img/indicator2.png) no-repeat 0 0;
                top: 35px;
            }

            .navbar-nav li a {
                font-size: 12px;
            }

            .btn {
                font-size: 10px;
            }
        }

        @media (max-width:767px) {
            .navbar-brand {
                float: left;
                display: block;
                position: relative;
                margin: 0 auto 3px auto;
                top: 6px;
                left: 3px;
                height: 53px;
            }

                .navbar-brand img {
                    max-width: 200px;
                    width: 100%;
                }

            .menu_block:before {
                display: none;
            }

            .menu_block {
                width: auto;
                margin: 0 -30px;
                padding: 0 30px;
            }

            .navbar-collapse {
                max-height: none;
            }

            .navbar-toggle {
                position: relative;
                z-index: 100;
                display: block;
                margin: 15px 0;
                padding: 0;
                width: 40px;
                height: 40px;
                border-radius: 0;
            }

                .navbar-toggle span {
                    font-size: 20px;
                    line-height: 24px;
                    color: #fff;
                }

            .navbar-nav {
                float: none;
                text-align: left;
                margin: 0 0 20px;
                background-color: #fff;
            }

                .navbar-nav li {
                    width: 100% !important;
                    margin: 0;
                    padding-bottom: 5px;
                    padding-left: 5px;
                    text-align: left;
                    border: 0;
                }

                    .navbar-nav li:before {
                        display: none;
                    }

                    .navbar-nav li a {
                        margin: 0;
                        padding: 0;
                        display: inline-block;
                        border: 0;
                        color: #74c8d1;
                    }

                        .navbar-nav li a:before, .navbar-nav li a:after {
                            display: none;
                        }

            .sub-menu ul {
                display: none !important;
                position: static;
                border: 0;
                margin: 0;
                padding-top: 4px;
                padding-left: 0;
                background-color: transparent;
            }

                .sub-menu ul li a {
                    border: 0 !important;
                    padding: 0 !important;
                    display: inline-block;
                    color: #1c818b;
                }

            .navbar-nav li a {
                background: none;
                color: #1c818b;
            }

            .indicator2 {
                background: url(../../img/indicator2.png) no-repeat 0 0;
                top: 13px;
            }
        }

        @media (max-width:479px) {
            #search input {
                width: 250px;
            }

            .navbar-brand img {
                max-width: 200px;
                width: 100%;
            }
        }





        .navbar-nav li a
        {
            margin:0 30px 0 30px!important;

        }



  
  
        
          </style>--%>


      <!-- CSS STYLES -->
	<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/form.css" rel="stylesheet" type="text/css" />

    
	<!-- SCRIPTS -->
	<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <!--[if IE]><html class="ie" lang="en"> <![endif]-->
	
	<!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>-->
	
    <script src="js/jquery.min.js" type="text/javascript"  ></script>
   
 
     <script src="js/bootstrap.min.js" type="text/javascript"  ></script>
    <script src="js/jquery-ui.min.js" type="text/javascript"  ></script>
    <script src="js/superfish.min.js" type="text/javascript"  ></script>
    <script src="js/jquery.flexslider-min.js" type="text/javascript" ></script>

    <script src="js/myscript.js" type="text/javascript" ></script>

    <!--
  <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places&Key=AIzaSyB9nCdlg4gKj7sEJ8oP1dbwP0wVZjfu09Q" async></script>
 -->

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB9nCdlg4gKj7sEJ8oP1dbwP0wVZjfu09Q&libraries=places" ></script>



    <script>
       var placeSearch, autocomplete;
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




    <!--[if lt IE 9]>
    <div style='text-align:center'><a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode"><img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." /></a></div>  
    <script src="assets/assets/js/html5shiv.js"></script> 
    <script src="assets/assets/js/respond.min.js"></script>
  <![endif]-->


    <style>
        .ar {
            float: right;
        }

        .al {
            float: left;
        }

        .clear {
            clear: both;
        }


        .form1 {
            background-color: white;
            padding: 5px;
        }

            .form1 .title {
                min-width: 100px;
                display: inline-block;
            }


        .button {
            display: inline-block;
            background: #000;
            padding: 0px 0px;
            z-index: 0;
            color: #fff;
            background-color: #FF9933;
        }

        .overlay {
            z-index: 5;
            background: rgba(0, 0, 0, .50);
            display: block;
            position: fixed;
            width: 100%;
            height: 100%;
        }

        .popup {
            padding: 20px 10px 35px;
            background: white;
            z-index: 999;
            display: none;
            position: absolute;
            right: 10px;
            margin-top: 30px;
            font-size: 12px;
            border: 1px solid #2E2828;
        }

        #footer {
            position: fixed;
            bottom: 0;
            background: #fff;
            width: 100%;
            font-size: 12px;
            text-align: center;
        }

            #footer div {
                padding: 5px;
            }

        .close {
            font-weight: bold;
            color: #337ab7 !important;
            float: right;
            background-color: white !important;
            opacity: 1 !important;
        }
    </style>

    <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-872206-2', 'auto');
  ga('send', 'pageview');

    </script>



    <script type="text/javascript">
    <!--
    function setDropDownList(elementRef, valueToSetTo) {
        var isFound = false;


        for (var i = 0; i < elementRef.options.length; i++) {
            if (elementRef.options[i].value == valueToSetTo) {
                elementRef.options[i].selected = true;
                isFound = true;
            }
        }


        if (isFound == false)
            elementRef.options[0].selected = true;
    }

    </script>

  
    </head>
<body>
    <!--==============================header=================================-->

    <!-- HEADER defaultbutton="btnSearch" -->
    <form id="frmIndex" runat="server">





        <header id="header" style="" class="background-homesize">
            <!-- TOP LINE -->



            <style>
                .ar {
                    float: right;
                }

                .al {
                    float: left;
                }

                .clear {
                    clear: both;
                }


                .form1 {
                    background-color: white;
                    padding: 5px;
                }

                    .form1 .title {
                        min-width: 100px;
                        display: inline-block;
                    }


                .button {
                    display: inline-block;
                    background: #000;
                    padding: 0px 0px;
                    z-index: 0;
                    color: #fff;
                    background-color: #FF9933;
                }

                .overlay {
                    z-index: 5;
                    background: rgba(0, 0, 0, .50);
                    display: block;
                    position: fixed;
                    width: 100%;
                    height: 100%;
                }

                .popup {
                    padding: 20px 10px 35px;
                    background: white;
                    z-index: 999;
                    display: none;
                    position: absolute;
                    right: 10px;
                    margin-top: 30px;
                    font-size: 12px;
                    border: 1px solid #2E2828;
                }

                #footer {
                    position: fixed;
                    bottom: 0;
                    background: #fff;
                    width: 100%;
                    font-size: 12px;
                    text-align: center;
                }

                    #footer div {
                        padding: 5px;
                    }

                .close {
                    font-weight: bold;
                    color: #337ab7 !important;
                    float: right;
                    background-color: white !important;
                    opacity: 1 !important;
                }
            </style>


            <script>

        function showLoginBox()
        {
          
           

            if ($('#<%=lblLoginLogout.ClientID%>').html() == "Sign in")
                {
            $("body").append(''); $(".popup").show();
            $('#lblLoginMessage').html("");
            $(".close").click(function (e) {
                $(".popup, .overlay").hide();
            });
            }
            else
            {
                //Sign Out

                 __doPostBack('<%= btnSignIn.UniqueID%>', 'btnSignIn');

            }


        }

        function CloseLoginBox()
        {

            $(".popup, .overlay").hide();

            return false;
        }

        function TryLogin()
        {
            var username = document.getElementById('<%= txtLoginName.ClientID%>').value;
            var password = document.getElementById('<%= txtPassword.ClientID%>').value;

            if (password.length == 0)
            {
               // $('#ctlTopMenu_lblLoginMessage').html("Failed to Login");

                $('#lblLoginMessage').html("Failed to Login");
                return false;
            }

        

            LoginAuth.ValidateLogin(username, password, OnSuccess);

            //PageMethods.ValidateLogin(username, password, OnSuccess);
            return false;

        }

        function OnSuccess(result)
        {
           
        
        

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
            </script>

             <style>
                .signinfixed {
    -webkit-backface-visibility: hidden;
    backface-visibility: hidden;
    z-index: 30;
    position: fixed;
    top: 6px;
 
    width: 100%;
 
  
}
</style>

     <%--       <div class="signinfixed">--%>


            <div class="full_width top_line clearfix">
                <div class="row">

                  
                    <div>
                        <div id="google_translate_element"></div>


                    </div>
                    <div align="right">
                        <a href="admin/BoatOwnerSignup.aspx">List Your Boat /</a>


                        <div class="login_popup" style="float: right;">
                            <div class="col-lg-12 col-sm-12" align="right">
                                <asp:LinkButton ID="lnkUsername" runat="server" OnClick="lnkUsername_Click" Text=""></asp:LinkButton>
                                <a onclick="showLoginBox()" runat="server">
                                    <asp:Label ID="lblLoginLogout" runat="server"></asp:Label>
                                </a>
                            </div>


                            <div class="popup" runat="server" id="loginPopupDiv">
                                <a href="#" class="close" style="float: right;" onclick="return CloseLoginBox();">[X]</a>
                                <div class="form1">
                                    <span style="color: black;">Username:</span><asp:TextBox ID="txtLoginName" runat="server" Style="background-color: white!important; color: black!important; width: 150px!important"></asp:TextBox><br />
                                    <br />
                                    <span style="color: black;">Password:</span>
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Style="background-color: white!important; color: black!important; width: 150px!important;" CssClass="clspass"></asp:TextBox>
                                    <br />
                                    <div align="right">

                                        <asp:Button ID="btnSignIn" runat="server" Text="Sign In" OnClientClick="return TryLogin();" OnClick="btnSignIn_Click" Style="margin-top: 10px; color: black!important;" />
                                        <br />
                                        <br />
                                        <p style="text-align: center; font-size: 11px;">
                                            <a href="forgotpassword.aspx" style="color: #248992!important; text-decoration: underline!important">Forgot your password?</a> &nbsp;|&nbsp; <a href="./Admin/BoatOwnerSignup.aspx" style="color: #248992!important; text-decoration: underline!important">Boat Owner Sign Up</a>
                                        </p>

                                        <asp:Label ID="lblLoginMessage" runat="server" ForeColor="Red" Font-Size="Medium"></asp:Label>

                                    </div>
                                </div>
                            </div>


                        </div>

                      
                    </div>
                    <!-- //TOP LINE -->
                </div>

            </div>

         <%--   </div>--%>


  <style>
                .NavTop {
    -webkit-backface-visibility: hidden;
    backface-visibility: hidden;
    z-index: 11;
    position: fixed;
    top: 60px;
    left: 0;
    width: 100%;
    background-color:rgb(0, 114, 160);
  
}

            
                </style>


     <%--     <nav class="NavTop">--%>

            <div class="menu_block clearfix">
                <div class="navbar-brand">
                    <asp:HyperLink ID="lnkGoHome" runat="server" NavigateUrl="~/index.aspx">
            <img src="img/logo.png" alt="Rent A Boat"/>
                    </asp:HyperLink>

                    <div class="navbar-brand2">

                        <img src="img/logo-blue.png" alt="Rent A Boat" />

                    </div>

                </div>
                <!-- RESPONSIVE BUTTON MENU -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="glyphicon glyphicon-align-justify"></span>
                    </button>
                </div>
                <!-- //RESPONSIVE BUTTON MENU -->

                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="index.aspx">HOME</a></li>
                        <li class="sub-menu"><a>RENTERS<em class="indicator2"></em></a>
                            <ul>
                                <li><a href="renter_faqs.aspx">FAQ's</a></li>
                                <li><a href="how_to_rent_a_boat.aspx">How To Rent</a></li>
                                <%--**##**<li><a class="last" href="renters-sign-in.html">Sign In</a></li>--%>
                            </ul>
                        </li>
                        <li class="sub-menu"><a>LIST YOUR BOAT<em class="indicator2"></em></a>
                            <ul>
                                <li><a href="./admin/BoatOwnerSignup.aspx">List Your Boat</a></li>

                                <li><a href="owners-faqs.html">FAQ's</a></li>
                                <li><a class="last" href="MemberSignIn.aspx">Sign in</a></li>
                            </ul>
                        </li>
                        <li><a href="about-us.html">ABOUT US</a></li>
                        <li class="sub-menu"><a href="how-It-works.html">HOW IT WORKS<em class="indicator2"></em></a>
                            <ul>
                                <li><a href="how-It-works.html">How it Works</a></li>
                                <li><a href="renting-vs-owning.html">Renting vs. Owning</a></li>
                                <li><a href="rental-tips.html">Rental Tips</a></li>
                                <li><a class="last" href="marine-liability-insurance.html">Marine Liability Insurance</a></li>
                            </ul>
                        </li>
                        <li><a href="contact_us.aspx">CONTACT US</a></li>
                    </ul>
                </div>
            </div>
              
         <%--   </nav>--%>
             <div id="stick-here"></div>

            <script type="text/javascript" defer> 
          

       
    
            </script>

      


            <!--==============================content=================================-->

         
            <script>

                function sticktothetop() {
    var window_top = $(window).scrollTop();
    var top = $('#stick-here').offset().top;
    if (window_top > top) {
        $('#stickThis').addClass('stick');
        $('#stick-here').height($('#stickThis').outerHeight());
         document.getElementById('btnSearch').style.display = "none";

    } else {
        $('#stickThis').removeClass('stick');
        $('#stick-here').height(0);
        document.getElementById('btnSearch').style.display = "inline-block";
    }
}
$(function() {
    $(window).scroll(sticktothetop);
    sticktothetop();
   

});
            </script>

          

                <style>



#stickThis {
    padding: 5px;
    /*background-color: #ccc;*/
    font-size: 1.5em;
   width: 700px;
    text-align: center;
    font-weight: bold;
    /*border: 2px solid #444;*/
    -webkit-border-radius: 10px;
    border-radius: 10px;
}
#stickThis.stick {
    margin-top: 0;
    position: fixed;
  left:50%;
  margin-left:-346px;
    top: 16px;
    z-index: 9999;
    /*-webkit-border-radius: 0 0 10px 10px;
    border-radius: 0 0 10px 10px;*/
}
</style>
        

           

            <div class="container">
                <div class="row_header-home2">
                    <div align="center">
                        <h1 class="white" style="font-size: 50px;">Boat Rentals</h1>
                        <div style="width: 65%; margin-left: auto; margin-right: auto">
                            <hr />
                        </div>

                        <h3 style="color: #fff;">Search boat rentals and yacht charters worldwide.</h3>
                       
                    
                        <div  id="search">
                                <div id="stickThis">
                            <asp:TextBox ID="txtSearch" runat="server" placeholder="Where do you want to boat?" Style="font-size: 16px;" onkeypress="clearAddressSelection()"></asp:TextBox>
                            
                            
                            <asp:LinkButton ID="btnSearch" runat="server" class="btn btn-primary btn1 btn-search" OnClick="btnSearch_Click">  
                      <span>search</span>
                            </asp:LinkButton>
                            <br />
                          </div>
                            <asp:LinkButton ID="lnkAdvancedSearch" Text="Advanced Search" Style="color: white;" runat="server" PostBackUrl="~/advancesearch.aspx"></asp:LinkButton>
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


          
        </header>
        <!--==============================content=================================-->



        <div class="container">


            <!--==============================row_1=================================-->

            <div class="row" style="padding: 0px 0px">

                <div class="row " align="center">
                    <div class="col-lg-12 col-sm-12 padbot20">
                        <h2 class="home-title"><strong>Popular boat rental locations</strong></h2>
                        <br>


                        <ul class="list1">
                            <li class="col-lg-2 col-md-4 col-sm-4 col-xs-4 list1col">
                                <a href="results.aspx?t=4&lat=25.47303326127954&lng=-77.080078125&miles=140&c=6" class="btn btn-primary btn2"><strong>
                                    <img src="images/Depositphotos_12483121_xs.jpg" alt="boat rentals family"></strong><span>Bahamas</span></a>
                            </li>
                            <li class="col-lg-2 col-md-4 col-sm-4 col-xs-4 list1col">
                                <a href="results.aspx?t=4&lat=25.684850188749582&lng=-79.984588623046885&miles=38" class="btn btn-primary btn2"><strong>
                                    <img src="images/Depositphotos_12483121_xs_54b7dbc92a2de.jpg" alt="Rent a boat Miami"></strong><span>Miami</span></a>
                            </li>
                            <li class="col-lg-2 col-md-4 col-sm-4 col-xs-4 list1col">
                                <a href="results.aspx?t=4&lat=40.094882122321195&lng=-72.86407470703125&miles=75" class="btn btn-primary btn3"><strong>
                                    <img src="images/Depositphotos_12483121_xs_54b7dc54ce48a.jpg" alt="charter boats NYC"></strong><span>New York<br>
                                        City</span></a>
                            </li>
                            <li class="col-lg-2 col-md-4 col-sm-4 col-xs-4 list1col">
                                <a href="results.aspx?t=4&lat=22.749588557614043&lng= -121.21078491210938&miles=176" class="btn btn-primary btn2"><strong>
                                    <img src="images/Depositphotos_12483121_xs_54b7dc8a5bde6.jpg" alt="Sailboat Rentals Dallas"></strong><span>Dallas</span></a>
                            </li>
                            <li class="col-lg-2 col-md-4 col-sm-4 col-xs-4 list1col">
                                <a href="results.aspx?t=4&lat=33.68778175843939&lng=-118.5369873046875&miles=38" class="btn btn-primary btn2"><strong>
                                    <img src="images/Depositphotos_12483121_xs_54b7dcc276993.jpg" alt="Daily Boat Rentals Los Angels"></strong><span>Los Angeles</span></a>
                            </li>
                            <li class="col-lg-2 col-md-4 col-sm-4 col-xs-4 list1col">
                                <a href="results.aspx?t=4&lat=22.749588557614043&lng=-121.21078491210938&miles=753" class="btn btn-primary btn2"><strong>
                                    <img src="images/Depositphotos_12483121_xs_54b7dcf79153e.jpg" alt="jetski rentals San Diego"></strong><span>San Diego</span></a>
                            </li>
                        </ul>

                        <br>
                        <div style="max-width: 900px; width: 100%;">
                            <p style="color: #318e98; font-size: 20px;">Find your dream boat rental in the best boating locations in the world.</p>
                            <p style="color: #318e98; font-size: 19px;">Rent luxury yachts, sailboats, houseboats, pontoon boats, charter boats, jet skis and more.</p>

                        </div>

                    </div>
                </div>
            </div>


            <div class="row" style="padding: 50px 0px">
                <div align="center">
                    <h2 style="color: #fe5974;"><strong>New Boat Rentals On RentABoat.com</strong></h2>
                    <br>
                </div>
                <asp:Repeater ID="rpHomePhotos" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-3 col-sm-3 padbot20" align="center">
                            <div class="item">
                                <a class='box1' href='javascript:gotoDetails(&#39;<%# DataBinder.Eval(Container.DataItem, "BoatId")%>&#39;,&#39;<%#DataBinder.Eval(Container.DataItem, "MarinaId")%>&#39;,&#39;<%# DataBinder.Eval(Container.DataItem, "Rating")%>&#39;)'>

                                    <div class="title2"><%# DataBinder.Eval(Container.DataItem, "City") %><em><%# DataBinder.Eval(Container.DataItem, "City") %></em></div>
                                    <figure>
                                        <img src="./boats/<%# DataBinder.Eval(Container.DataItem, "FileName") %>" alt="<%# DataBinder.Eval(Container.DataItem, "FilenameDescription") %>" />
                                    </figure>
                                    <div class="">
                                        <div class="info2">
                                            <div class="title3"><strong><%# DataBinder.Eval(Container.DataItem, "BodyOfWater") %>&nbsp;<%# DataBinder.Eval(Container.DataItem, "State") %></strong><span><%# DataBinder.Eval(Container.DataItem, "Make") %> &nbsp; <%# DataBinder.Eval(Container.DataItem, "Model") %>&nbsp;<%# DataBinder.Eval(Container.DataItem, "BoatSize") %></span></div>
                                            <div class="title4"><span>from</span> <strong><%# DataBinder.Eval(Container.DataItem, "CurrencySymbol") %><%# DataBinder.Eval(Container.DataItem, "Amount") %></strong></div>
                                        </div>
                                    </div>
                                    <div class="title5">More Info!<em>More Info</em></div>
                                </a>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>


            </div>
            <!--row-->


        </div>

        <asp:Button ID="btnShowDetails" runat="server" Style="visibility: hidden; display: none;" OnClick="btnGoDetails_Click" UseSubmitBehavior="false" />


        <hr>
        <!--==============================row_3=================================-->
        <div class="container">
            <div class="row">
                <div class="col-lg-2 col-sm-2 padbot20">
                    <br>
                    <br>
                </div>
                <div align="center" class="col-lg-4 col-sm-4 padbot20">
                    <div style="position: relative; background-color: #fff; width: 100px; padding: 5px; z-index: 15;">
                        <h3>Owners</h3>
                    </div>
                    <div style="position: relative; border: 1px solid #ddd; margin: 0; max-width: 320px; width: 100%; z-index: 5; margin-top: -22px; padding: 7px" align="center">
                        <div style="line-height: 18px; text-align: left">
                            <br>
                            <ul>
                                <li>Publish your listing for free. </li>
                                <li>Reach millions of Boat Renters.</li>
                                <li>Build your own page.</li>
                                <li>User-friendly interactive mobile booking calendar.</li>
                                <li>You set the price and availability. </li>
                            </ul>
                        </div>
                        <a href="owners-faqs.html">
                            <div style="background-color: #fe595e; padding: 5px 15px 5px;" align="center">
                                <h3 style="color: #fff;">Learn more</h3>
                            </div>
                        </a>
                    </div>
                </div>


                <div align="center" class="col-lg-4 col-sm-4 padbot20">
                    <div style="position: relative; background-color: #fff; width: 100px; padding: 5px; z-index: 15;">
                        <h3>Renters</h3>
                    </div>
                    <div style="position: relative; border: 1px solid #ddd; margin: 0; max-width: 320px; width: 100%; z-index: 5; margin-top: -22px; padding: 7px" align="center">
                        <div style="line-height: 18px; text-align: left;">
                            <br>
                            <ul>
                                <li>Lowest boat rental rates available.</li>
                                <li>Easy searching/Easy booking.</li>
                                <li>No membership fees.</li>
                                <li>No monthly dues.</li>
                                <li>Access your dream boat within seconds!</li>
                            </ul>
                        </div>

                        <a href="renter_faqs.aspx">
                            <div style="background-color: #fe595e; padding: 5px 15px 5px;" align="center">
                                <h3 style="color: #fff;">Learn more</h3>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-2 col-sm-2 padbot20">
                    <br>
                    <br>
                </div>
            </div>

            <!--==============================row_2=================================-->

            <div align="center" class="row" style="padding: 10px;">

                <br>
                <br>
                <h2 style="color: #000000;">Earn money by listing your boat today!</h2>
                
                <br>

                <a href="./Admin/BoatOwnerSignup.aspx">
                    <div style="background-color: #fe595e; padding: 5px; max-width: 300px; width: 100%;" align="center">
                        <h2 style="color: #fff;">List your boat!<br>
                            (Click here)</h2>
                    </div>
                </a>


            </div>


        </div>
        <br>
        <br>
        <!--==============================row_3=================================-->
        <div class="full_width" style="padding: 15px 0;">
            <div align="center" class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 ">
                        <h2>Boat rentals by state</h2>
                        <hr>
                    </div>
                    <div class="row">
                        <div class="col-lg-2 col-md-2 " style="size: 18px;">
                            <a href="results.aspx?t=3&s=AL">Alabama</a><br>
                            <a href="results.aspx?t=3&s=AK">Alaska</a><br>
                            <a href="results.aspx?t=3&s=AZ">Arizona</a><br>
                            <a href="results.aspx?t=3&s=AR">Arkansas</a><br>
                            <a href="results.aspx?t=3&s=CA">California</a><br>
                            <a href="results.aspx?t=3&s=CO">Colorado</a><br>
                            <a href="results.aspx?t=3&s=CT">Connecticut</a><br>
                            <a href="results.aspx?t=3&s=DE">Delaware</a>
                        </div>
                        <div class="col-lg-2 col-md-2 " style="size: 18px;">
                            <a href="results.aspx?t=3&s=FL">Florida</a><br>
                            <a href="results.aspx?t=3&s=GA">Georgia</a><br>
                            <a href="results.aspx?t=3&s=HI">Hawaii</a><br>
                            <a href="results.aspx?t=3&s=ID">Idaho</a><br>
                            <a href="results.aspx?t=3&s=IL">Illinois</a><br>
                            <a href="results.aspx?t=3&s=IN">Indiana</a><br>
                            <a href="results.aspx?t=3&s=IA">Iowa</a><br>
                            <a href="results.aspx?t=3&s=KS">Kansas</a>
                        </div>
                        <div class="col-lg-2 col-md-2 " style="size: 18px;">
                            <a href="results.aspx?t=3&s=KY">Kentucky</a><br>
                            <a href="results.aspx?t=3&s=LA">Louisiana</a><br>
                            <a href="results.aspx?t=3&s=ME">Maine</a><br>
                            <a href="results.aspx?t=3&s=MD">Maryland</a><br>
                            <a href="results.aspx?t=3&s=MA">Massachusetts</a><br>
                            <a href="results.aspx?t=3&s=MI">Michigan</a><br>
                            <a href="results.aspx?t=3&s=MN">Minnesota</a><br>
                            <a href="results.aspx?t=3&s=MS">Mississippi</a>
                        </div>
                        <div class="col-lg-2 col-md-2 " style="size: 18px;">
                            <a href="results.aspx?t=3&s=MO">Missouri</a><br>
                            <a href="results.aspx?t=3&s=MT">Montana</a><br>
                            <a href="results.aspx?t=3&s=NE">Nebraska</a><br>
                            <a href="results.aspx?t=3&s=NV">Nevada</a><br>
                            <a href="results.aspx?t=3&s=NH">New Hampshire</a><br>
                            <a href="results.aspx?t=3&s=NJ">New Jersey</a><br>
                            <a href="results.aspx?t=3&s=NY">New York</a><br>
                            <a href="results.aspx?t=3&s=NC">North Carolina</a><br>
                            <a href="results.aspx?t=3&s=ND">North Dakota</a>
                        </div>
                        <div class="col-lg-2 col-md-2 " style="size: 18px;">
                            <a href="results.aspx?t=3&s=OH">Ohio</a><br>
                            <a href="results.aspx?t=3&s=OK">Oklahoma</a><br>
                            <a href="results.aspx?t=3&s=OR">Oregon</a><br>
                            <a href="results.aspx?t=3&s=PA">Pennsylvania</a><br>
                            <a href="results.aspx?t=3&s=RI">Rhode Island</a><br>
                            <a href="results.aspx?t=3&s=SC">South Carolina</a><br>
                            <a href="results.aspx?t=3&s=SD">South Dakota</a><br>
                            <a href="results.aspx?t=3&s=TN">Tennessee</a>
                        </div>
                        <div class="col-lg-2 col-md-2 " style="size: 18px;">
                            <a href="results.aspx?t=3&s=TX">Texas</a><br>
                            <a href="results.aspx?t=3&s=UT">Utah</a><br>
                            <a href="results.aspx?t=3&s=VT">Vermont</a><br>
                            <a href="results.aspx?t=3&s=VA">Virginia</a><br>
                            <a href="results.aspx?t=3&s=WA">Washington</a><br>
                            <a href="results.aspx?t=3&s=WV">West Virginia</a><br>
                            <a href="results.aspx?t=3&s=WI">Wisconsin</a><br>
                            <a href="results.aspx?t=3&s=WY">Wyoming</a>
                        </div>



                    </div>
                </div>
            </div>


        </div>

     
        <script src="js/WebForms.js" type="text/javascript"></script>
        <script type="text/javascript">window.WebForm_PostBackOptions||document.write('<script type="text/javascript" src="/WebResource.axd?d=Q7FIjCOSI4nYGirglPTnR39cKji2C-9AF_9NLiSsBO_HcLb3yMSCBS1PPp0biXIcIxsq8pn4Lq1PDohK5vab9WC1VzgGc5yKf-7zKyMuhic1&amp;t=636125516399126630"><\/script>');</script>



        <script src="js/MicrosoftAjax.js" type="text/javascript"></script>
        <script type="text/javascript">(window.Sys&&Sys._Application&&Sys.Observer)||document.write('<script type="text/javascript" src="/ScriptResource.axd?d=e5Kx60LZdAXWS6f7jpt7zkMaVSGVofbZ7LNcKwY8t_0OxH-mzxRz00Ew1cELxtLgoi-TBrgEyoIzBx2H14cWG_IWdwCqr0WNhbl9G7qDVGwFbFos9EV66p3LAnJMKkTTUC7hcP61zBnO0fOsRovw2vNBzwTlSK8GG7Cb9UCzeFs1&t=4794f07b"><\/script>');</script>

        <script src="js/MicrosoftAjaxWebForms.js" type="text/javascript"></script>
        <script type="text/javascript">(window.Sys&&Sys.WebForms)||document.write('<script type="text/javascript" src="/ScriptResource.axd?d=fnKaaeIzrdD1MmPD93Afahryq-E8vyvhJLFN1RM1KXlI3g94NWR_BHEhBTad8xbN5u_JYdNj82FRZ0p5BCVYwchNAeO3dKSM1KlTasGCX7HomVu91Etz2JNnwsC9ZU2MAN7tcR6EZAGvl18O5iYQWyyd3NAYLX_OfbEz9t7IfzOVwPkUmAwTQCeGy-2dhgGt0&t=4794f07b"><\/script>');var LoginAuth=function(){LoginAuth.initializeBase(this);this._timeout=0;this._userContext=null;this._succeeded=null;this._failed=null;}
LoginAuth.prototype={_get_path:function(){var p=this.get_path();if(p)return p;else return LoginAuth._staticInstance.get_path();},ValidateLogin:function(username,password,succeededCallback,failedCallback,userContext){return this._invoke(this._get_path(),'ValidateLogin',false,{username:username,password:password},succeededCallback,failedCallback,userContext);}}
LoginAuth.registerClass('LoginAuth',Sys.Net.WebServiceProxy);LoginAuth._staticInstance=new LoginAuth();LoginAuth.set_path=function(value){LoginAuth._staticInstance.set_path(value);}
LoginAuth.get_path=function(){return LoginAuth._staticInstance.get_path();}
LoginAuth.set_timeout=function(value){LoginAuth._staticInstance.set_timeout(value);}
LoginAuth.get_timeout=function(){return LoginAuth._staticInstance.get_timeout();}
LoginAuth.set_defaultUserContext=function(value){LoginAuth._staticInstance.set_defaultUserContext(value);}
LoginAuth.get_defaultUserContext=function(){return LoginAuth._staticInstance.get_defaultUserContext();}
LoginAuth.set_defaultSucceededCallback=function(value){LoginAuth._staticInstance.set_defaultSucceededCallback(value);}
LoginAuth.get_defaultSucceededCallback=function(){return LoginAuth._staticInstance.get_defaultSucceededCallback();}
LoginAuth.set_defaultFailedCallback=function(value){LoginAuth._staticInstance.set_defaultFailedCallback(value);}
LoginAuth.get_defaultFailedCallback=function(){return LoginAuth._staticInstance.get_defaultFailedCallback();}
LoginAuth.set_enableJsonp=function(value){LoginAuth._staticInstance.set_enableJsonp(value);}
LoginAuth.get_enableJsonp=function(){return LoginAuth._staticInstance.get_enableJsonp();}
LoginAuth.set_jsonpCallbackParameter=function(value){LoginAuth._staticInstance.set_jsonpCallbackParameter(value);}
LoginAuth.get_jsonpCallbackParameter=function(){return LoginAuth._staticInstance.get_jsonpCallbackParameter();}
LoginAuth.set_path("/LoginAuth.asmx");LoginAuth.ValidateLogin=function(username,password,onSuccess,onFailed,userContext){LoginAuth._staticInstance.ValidateLogin(username,password,onSuccess,onFailed,userContext);}
var PageMethods=function(){PageMethods.initializeBase(this);this._timeout=0;this._userContext=null;this._succeeded=null;this._failed=null;}
PageMethods.prototype={_get_path:function(){var p=this.get_path();if(p)return p;else return PageMethods._staticInstance.get_path();},ValidateLogin:function(username,password,succeededCallback,failedCallback,userContext){return this._invoke(this._get_path(),'ValidateLogin',false,{username:username,password:password},succeededCallback,failedCallback,userContext);}}
PageMethods.registerClass('PageMethods',Sys.Net.WebServiceProxy);PageMethods._staticInstance=new PageMethods();PageMethods.set_path=function(value){PageMethods._staticInstance.set_path(value);}
PageMethods.get_path=function(){return PageMethods._staticInstance.get_path();}
PageMethods.set_timeout=function(value){PageMethods._staticInstance.set_timeout(value);}
PageMethods.get_timeout=function(){return PageMethods._staticInstance.get_timeout();}
PageMethods.set_defaultUserContext=function(value){PageMethods._staticInstance.set_defaultUserContext(value);}
PageMethods.get_defaultUserContext=function(){return PageMethods._staticInstance.get_defaultUserContext();}
PageMethods.set_defaultSucceededCallback=function(value){PageMethods._staticInstance.set_defaultSucceededCallback(value);}
PageMethods.get_defaultSucceededCallback=function(){return PageMethods._staticInstance.get_defaultSucceededCallback();}
PageMethods.set_defaultFailedCallback=function(value){PageMethods._staticInstance.set_defaultFailedCallback(value);}
PageMethods.get_defaultFailedCallback=function(){return PageMethods._staticInstance.get_defaultFailedCallback();}
PageMethods.set_enableJsonp=function(value){PageMethods._staticInstance.set_enableJsonp(value);}
PageMethods.get_enableJsonp=function(){return PageMethods._staticInstance.get_enableJsonp();}
PageMethods.set_jsonpCallbackParameter=function(value){PageMethods._staticInstance.set_jsonpCallbackParameter(value);}
PageMethods.get_jsonpCallbackParameter=function(){return PageMethods._staticInstance.get_jsonpCallbackParameter();}
PageMethods.set_path("indexN.aspx"); PageMethods.ValidateLogin = function (username, password, onSuccess, onFailed, userContext) { PageMethods._staticInstance.ValidateLogin(username, password, onSuccess, onFailed, userContext); }

        </script>


    </form>

 



    <!-- FOOTER -->
    <uc1:ctlFooter runat="server" ID="ctlFooter" />

    <script>

	    window.onload = function () {
	        document.getElementById("txtSearch").focus();
	        initialize();
	    };
    </script>




   

   




    <script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');
}
    </script>


    <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit" async></script>

 <%-- <link href="css/app.min.css" rel="stylesheet" type="text/css" />--%>


   
 <%--   <link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="css/style.css" rel="stylesheet" type="text/css" />--%>



    <script>
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
    </script>

    
	
<script type='text/javascript'>
window.__lo_site_id = 153732;

	(function() {
		var wa = document.createElement('script'); wa.type = 'text/javascript'; wa.async = true;
		wa.src = 'https://d10lpsik1i8c69.cloudfront.net/w.js';
		var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(wa, s);
	  })();
	</script>	
	
</body>
</html>
