<%@ Page language="C#" CodeFile="purchase_boat.aspx.cs" Inherits="BoatRenting.purchase_boat_aspx_cs" %>
<%@ Import Namespace = "nce.adosql" %>
<%@ Import Namespace = "Microsoft.VisualBasic" %>
<%@ Import Namespace = "nce.scripting" %>
<%@ Import Namespace = "System.Web.Mail" %>
<!--#include file="includes/__functions.aspx"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%
    //'option explicit
    clientID = Request.Form["hdn_clientID"];
    
    con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstringDATA");
    Response.Expires = 0;
    oConn = new Connection();
    oConn.ConnectionString = con;
    oConn.ConnectionTimeout = 500;
    oConn.Open(null);

    cmd = new Command();
    rs = new Recordset();
    cmd.ActiveConnection = oConn;
    cmd.CommandText = "SP_BR_CLIENT_GET";
    cmd.CommandType = adCmdStoredProc;
    cmd.Parameters.Refresh();
    //cmd.Parameters[1] = clientID;
    cmd.Parameters.Append(cmd.CreateParameter("@P_IN_clientID", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@P_IN_clientID"].Value = Convert.ToString(Session["clientID"]);
    rs.Open(cmd);
    cmd3 = new Command();
    rs3 = new Recordset();
    cmd3.ActiveConnection = oConn;
    cmd3.CommandText = "SP_BR_KART_LIST";
    cmd3.CommandType = adCmdStoredProc;
    //cmd3.Parameters[1] = Convert.ToString(Request.Form["hdn_session"]);
    cmd3.Parameters.Append(cmd.CreateParameter("@p_vc_sessionID", adVarChar, adParamInput, 100, 0));
    cmd3.Parameters["@p_vc_sessionID"].Value = Session["Kart"];
    //'session("Kart")
    rs3.CursorType = (nce.adodb.CursorType)3;
    rs3.CursorLocation = (nce.adodb.CursorLocation)3;
    rs3.Open(cmd3);
    amount = 0.00;
    while(!(rs3.Eof))
    {
        //'amount = amount + cdbl(rs3("nu_price"))
        if (Convert.ToString(rs3.Fields["ch_feeType"].Value) == "1")
        {
            amount = amount + Convert.ToDouble(Strings.FormatNumber((Convert.ToDouble(Convert.ToDouble(rs3.Fields["nu_fee"].Value) / 100.00)) * Convert.ToDouble(NVL(rs3.Fields["nu_price"].Value, 0)), 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault));
        }
        else
        {
            amount = amount + Convert.ToDouble(Strings.FormatNumber(rs3.Fields["nu_fee"].Value, 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault));
        }
        rs3.MoveNext();
    }
    post_url = "https://secure.authorize.net/gateway/transact.dll";//PRODUCTION
    //post_url = "https://developer.authorize.net/tools/paramdump/index.php";//TEST ONLY
    post_values = new Dictionary();
    post_values.CompareMode = Convert.ToInt32(CompareMethod.Text);
    post_values.Add("x_login", "67LD74ev6vSj");
    post_values.Add("x_tran_key", "6j74c8p3VL5E7jf4");
    post_values.Add("x_delim_data", "TRUE");
    post_values.Add("x_delim_char", "|");
    post_values.Add("x_relay_response", "FALSE");
    post_values.Add("x_type", "AUTH_CAPTURE");
    post_values.Add("x_method", "CC");
    post_values.Add("x_card_num", Request.Form["txt_number"]);
    post_values.Add("x_exp_date", Convert.ToString(Request.Form["cmb_month"]) + Convert.ToString(Request.Form["cmb_year"]));
    post_values.Add("x_amount", amount);
    post_values.Add("x_description", "website boat rental");
    post_values.Add("x_first_name", rs.Fields["vc_firstname"]);
    post_values.Add("x_last_name", rs.Fields["vc_lastname"]);
    post_values.Add("x_address", rs.Fields["vc_address"]);
    post_values.Add("x_state", rs.Fields["in_stateid"]);
    post_values.Add("x_zip", rs.Fields["ch_zip"]);
    foreach(object Key in post_values)
    {
        post_string = post_string + Convert.ToString(Key) + "=" + Server.UrlEncode(Convert.ToString(post_values[Key.ToString()])) + "&";
    }
    post_string = post_string.Substring(0, post_string.Length - 1);
    //objRequest = new Microsoft.XMLHTTP();

    // create an HttpWebRequest object to communicate with Authorize.net
    System.Net.HttpWebRequest objRequest = (System.Net.HttpWebRequest)System.Net.WebRequest.Create(post_url);
    //objRequest.open("POST", post_url, false);
    objRequest.Method = "POST";
    objRequest.ContentLength = post_string.Length;
    objRequest.ContentType = "application/x-www-form-urlencoded";

    //objRequest.send(post_string);

    // post data is sent as a stream
    System.IO.StreamWriter myWriter = null;
    myWriter = new System.IO.StreamWriter(objRequest.GetRequestStream());
    myWriter.Write(post_string);
    myWriter.Close();

    // returned values are returned as a stream, then read into a string
    String post_response;
    System.Net.HttpWebResponse objResponse = (System.Net.HttpWebResponse)objRequest.GetResponse();
    using (System.IO.StreamReader responseStream = new System.IO.StreamReader(objResponse.GetResponseStream()))
    {
        post_response = responseStream.ReadToEnd();
        responseStream.Close();
    }

    // the response string is broken into an array
    // The split character specified here must match the delimiting character specified above
    Array response_array = post_response.Split('|');

    //post_reponse = objRequest.responseText;
    objRequest = null;
    //response_array = Strings.Split(Convert.ToString(post_reponse), Convert.ToString(post_values["x_delim_char"]), -1, CompareMethod.Binary);
    response_code = response_array.GetValue(0).ToString();
    response_text = response_array.GetValue(3).ToString();
    if (response_code == "1")
    {
        //transfer data to bookdate after the transaction is approved
        rs3.MoveFirst();
        //do until rs3.eof
        cmd4 = new Command();
        cmd4.ActiveConnection = oConn;
        cmd4.CommandText = "SP_BR_BOOKDATEXBOAT_SAVE";
        cmd4.CommandType = adCmdStoredProc;
        //cmd4.Parameters[1] = rs3.Fields["in_marinaID"].Value;
        cmd4.Parameters.Append(cmd.CreateParameter("@P_IN_MarinaID", adInteger, adParamInput, 4, 0));
        cmd4.Parameters["@P_IN_MarinaID"].Value = rs3.Fields["in_marinaID"].Value;
        //cmd4.Parameters[2] = rs3.Fields["in_boatID"].Value;
        cmd4.Parameters.Append(cmd.CreateParameter("@P_IN_BoatID", adInteger, adParamInput, 4, 0));
        cmd4.Parameters["@P_IN_BoatID"].Value = rs3.Fields["in_boatID"].Value;
        //cmd4.Parameters[3] = rs3.Fields["in_kartID"].Value;
        cmd4.Parameters.Append(cmd.CreateParameter("@P_IN_KartID", adInteger, adParamInput, 4, 0));
        cmd4.Parameters["@P_IN_KartID"].Value = rs3.Fields["in_kartID"].Value;
        //cmd4.Parameters[4] = 1;
        cmd4.Parameters.Append(cmd.CreateParameter("@UserID", adInteger, adParamInput, 4, 0));
        cmd4.Parameters["@UserID"].Value = 1;
        cmd4.Execute();
        //rs3.Movenext
        //loop
        //sends email to client
        strBody = "<html>";
        strBody = strBody + "<head>";
        strBody = strBody + "<title>Welcome to BoatRenting.com!</title>";
        //strBody = strBody +"<link href='http://69.18.177.23/client/br.css' rel='stylesheet' type='text/css'>"
        strBody = strBody + "<style type='text/css'>";
        strBody = strBody + "	#forgotten_password {";
        strBody = strBody + "	width: 500px;";
        strBody = strBody + "	margin-top: 20px;";
        strBody = strBody + "	text-align: center;";
        strBody = strBody + "	padding-bottom: 10px;";
        strBody = strBody + "	margin-left: auto;";
        strBody = strBody + "	margin-right: auto;";
        strBody = strBody + "	border: 1px solid #CCCCCC;";
        strBody = strBody + "	}";
        strBody = strBody + "#forgotten_password_title {";
        strBody = strBody + "	width: 100%;";
        strBody = strBody + "	clear: none;";
        strBody = strBody + "	background-color: #E9EDF1;";
        strBody = strBody + "	padding-top: 10px;";
        strBody = strBody + "	padding-bottom: 10px;";
        strBody = strBody + "	text-indent: 10px;";
        strBody = strBody + "	font-size: 10pt;";
        strBody = strBody + "	font-weight: bold;";
        strBody = strBody + "	color: #333;";
        strBody = strBody + "	}";
        strBody = strBody + "#forgotten_password_form {";
        strBody = strBody + "	width: 100%;";
        strBody = strBody + "	height: 20px;";
        strBody = strBody + "	margin-top: 10px;";
        strBody = strBody + "	margin-bottom: 20px;";
        strBody = strBody + "	}";
        strBody = strBody + "#forgotten_password a.button {";
        strBody = strBody + "	width: 100px;";
        strBody = strBody + "	text-decoration: none;";
        strBody = strBody + "	color: white;";
        strBody = strBody + "	display: block;";
        strBody = strBody + "	background-color: #FF9933;";
        strBody = strBody + "	padding-top: 1px;";
        strBody = strBody + "	padding-bottom: 1px;";
        strBody = strBody + "	padding-left: 10px;";
        strBody = strBody + "	padding-right: 10px;";
        strBody = strBody + "	font-weight: bold;";
        strBody = strBody + "	text-align: center;";
        strBody = strBody + "	margin: auto;";
        strBody = strBody + "	margin-bottom: 10px;}";
        strBody = strBody + "#forgotten_password a.button:hover {";
        strBody = strBody + "	text-decoration: underline;";
        strBody = strBody + "	}";
        strBody = strBody + "#footer_details {";
        strBody = strBody + "	padding-left: 8px;";
        strBody = strBody + "	font-size: 7pt;";
        strBody = strBody + "	color: white;";
        strBody = strBody + "	height: 10px;";
        strBody = strBody + "	line-height: 8px;";
        strBody = strBody + "	}";
        strBody = strBody + "#footer_details a{";
        strBody = strBody + "	font-size: 8pt;";
        strBody = strBody + "	color: #ccc;";
        strBody = strBody + "	text-decoration: none;";
        strBody = strBody + "	}";
        strBody = strBody + "#footer_details a:hover {";
        strBody = strBody + "	font-size: 8pt;";
        strBody = strBody + "	color: white;";
        strBody = strBody + "	font-weight: normal;";
        strBody = strBody + "	}";
        strBody = strBody + "#returning_customers_payment a.button{";
        strBody = strBody + "	float: left;";
        strBody = strBody + "	width: 100px;";
        strBody = strBody + "	text-decoration: none;";
        strBody = strBody + "	color: white;";
        strBody = strBody + "	display: block;";
        strBody = strBody + "	background-color: #FF9933;";
        strBody = strBody + "	padding-top: 1px;";
        strBody = strBody + "	padding-bottom: 1px;";
        strBody = strBody + "	padding-left: 10px;";
        strBody = strBody + "	padding-right: 10px;";
        strBody = strBody + "	font-weight: bold;";
        strBody = strBody + "	text-align: center;";
        strBody = strBody + "	margin-left: 20px;";
        strBody = strBody + "	margin-top: 7px;";
        strBody = strBody + "	}";
        strBody = strBody + "#returning_customers_payment a.button:hover {";
        strBody = strBody + "	text-decoration: underline;";
        strBody = strBody + "	}	  ";
        strBody = strBody + "#order_summary h1 {";
        strBody = strBody + "	font-size: 12pt;";
        strBody = strBody + "	font-weight: bold;";
        strBody = strBody + "	margin-top: 2px;";
        strBody = strBody + "	margin-bottom: 15px;";
        strBody = strBody + "	color: #495E70;";
        strBody = strBody + "	}";
        strBody = strBody + "#order_summary {";
        strBody = strBody + "	margin-top: 7px;";
        strBody = strBody + "	margin-left: 8px;";
        strBody = strBody + "	margin-right: 8px;";
        strBody = strBody + "	width: auto;";
        strBody = strBody + "	background-color: #E9EDF1;";
        strBody = strBody + "	border: 1px solid #ccc;";
        strBody = strBody + "	padding: 7px;";
        strBody = strBody + "	}";
        strBody = strBody + "#order_summary table{";
        strBody = strBody + "	border-width: 1px 0px 0px 1px;";
        strBody = strBody + "	border-style: solid;";
        strBody = strBody + "	border-color: #607489;";
        strBody = strBody + "	width: 100%;";
        strBody = strBody + "	}";
        strBody = strBody + "#order_summary table td{";
        strBody = strBody + "	border-style: solid;";
        strBody = strBody + "	border-width: 0px 1px 1px 0px;";
        strBody = strBody + "	border-color: #607489;";
        strBody = strBody + "	padding-left: 5px;";
        strBody = strBody + "	padding-top:5px;";
        strBody = strBody + "	padding-bottom: 5px;";
        strBody = strBody + "	padding-right: 5px;";
        strBody = strBody + "	text-align: center;";
        strBody = strBody + "	background-color: white;";
        strBody = strBody + "	}";
        strBody = strBody + "#order_summary table th {";
        strBody = strBody + "	color: white;";
        strBody = strBody + "	background-color: #607489;";
        strBody = strBody + "	text-align: center;";
        strBody = strBody + "	border-bottom: 1px solid #607489;";
        strBody = strBody + "	border-top: 0px;";
        strBody = strBody + "	border-left: 0px;";
        strBody = strBody + "	border-right: 0px;";
        strBody = strBody + "	}";
        strBody = strBody + "</style>";
        strBody = strBody + "</head>";
        strBody = strBody + "<body>";
        strBody = strBody + "<table cellpadding='0' cellspacing='0' border='0'>";
        strBody = strBody + "<tr>";
        strBody = strBody + "	<td width='550' height='78' valign='middle' align='left' bgcolor='#4D8DD5'><img src='http://www.boatrenting.com/images/banner.gif'></td>";
        strBody = strBody + "</tr>";
        strBody = strBody + "<tr>";
        strBody = strBody + "	<td width='550' height='12' background='http://www.boatrenting.com/images/sub_menu_bg.gif'>&nbsp;</td>";
        strBody = strBody + "</tr>";
        strBody = strBody + "<tr>";
        strBody = strBody + "	<td width='550' align='center'>";
        strBody = strBody + "		<div id='returning_customers_payment'>";
        strBody = strBody + "			<div id='order_summary'>";
        strBody = strBody + "				<h1>Tentative Boat Reservation</h1>";
        strBody = strBody + "				<font style='font-weight:normal'>Dear " + Convert.ToString(rs.Fields["vc_firstname"].Value) + " " + Convert.ToString(rs.Fields["vc_lastname"].Value) + ", you have tentatively reserved the following boat.</font>" + "<br>" + "Please note this IS NOT a confirmed reservation and you MUST contact the facility (Boat Owner) after receiving this email. This broker fee will be deducted from the total rental fee by the facility (Boat Owner). If for some reason the boat is not available, there will be NO charge to your credit card. <BR>This broker fee is not a deposit and the facility (Boat Owner) will contact you to collect there desired deposit.<BR><br>";
        strBody = strBody + "				<table cellpadding='0' cellspacing='0'>";
        strBody = strBody + "					<tr>";
        strBody = strBody + "						<th colspan='2'>Boat Details</th>";
        strBody = strBody + "						<th>Facility Information</th>";
        strBody = strBody + "						<th>Rental Details</th>";
        strBody = strBody + "					</tr>";
        rs3.MoveFirst();
        if (rs3.Eof)
        {
            strBody = strBody + "						<tr>";
            strBody = strBody + "							<td colspan='4' align='center'>There are no reserved Boats</td>";
            strBody = strBody + "						</tr>";
        }
        else
        {
            Cont = 0;
            while(!(rs3.Eof))
            {
                strBody = strBody + "					<tr>";
                strBody = strBody + "						<td width='90'><img src='http://www.boatrenting.com/boats/" + Convert.ToString(rs3.Fields["vc_filename"].Value) + "' alt='" + Convert.ToString(rs3.Fields["IDescrip"].Value) + "' width='80' height='50'></td>";
                strBody = strBody + "						<td width='250'>" + Convert.ToString(rs3.Fields["vc_name"].Value) + ":&nbsp;" + Convert.ToString(rs3.Fields["vc_make"].Value) + "&nbsp;" + Convert.ToString(rs3.Fields["vc_model"].Value) + "<br>";
                strBody = strBody + "						Length:&nbsp;" + Convert.ToString(rs3.Fields["vc_size"].Value) + "&nbsp;-&nbsp;Passengers:&nbsp;" + Convert.ToString(rs3.Fields["in_maxPassengers"].Value) + "<br>";
                strBody = strBody + "						Description:&nbsp;" + Convert.ToString(rs3.Fields["Bdescrip"].Value);
                strBody = strBody + "						</td>";
                strBody = strBody + "						<td width='250'>";
                strBody = strBody + "							Facility: " + Convert.ToString(rs3.Fields["vc_marinaName"].Value) + "<br>" + "Contact:" + Convert.ToString(rs3.Fields["vc_contactName"].Value) + "<br>";
                strBody = strBody + "							Location:&nbsp;" + Convert.ToString(rs3.Fields["CountryName"].Value) + "&nbsp;-&nbsp;" + Convert.ToString(rs3.Fields["StateName"].Value) + "&nbsp;-&nbsp;" + Convert.ToString(rs3.Fields["vc_city"].Value) + "<br>";
                if (!(Convert.ToString(rs3.Fields["vc_bodywater"].Value) == ""))
                {
                    strBody = strBody + Convert.ToString(rs3.Fields["vc_bodywater"].Value) + "<br>";
                }
                strBody = strBody + "							Address: " + Convert.ToString(rs3.Fields["vc_addressline1"].Value) + "<br>";
                if (!(Convert.ToString(rs3.Fields["vc_addressline2"].Value) == ""))
                {
                    strBody = strBody + Convert.ToString(rs3.Fields["vc_addressline2"].Value) + "<br>";
                }
                strBody = strBody + "							Phone/Fax: " + Convert.ToString(rs3.Fields["vc_phone"].Value);
                if (!(Convert.ToString(rs3.Fields["vc_fax"].Value) == ""))
                {
                    strBody = strBody + "	  						&nbsp;/&nbsp;" + Convert.ToString(rs3.Fields["vc_fax"].Value);
                }
                strBody = strBody + "	 						<br>";
                if (!(Convert.ToString(rs3.Fields["vc_facilityDirections"].Value) == ""))
                {
                    strBody = strBody + "						    Directions: " + Convert.ToString(rs3.Fields["vc_facilityDirections"].Value) + "<br>";
                }
                if (!(Convert.ToString(rs3.Fields["vc_facilityArea"].Value) == ""))
                {
                    strBody = strBody + "	  						Attractions: " + Convert.ToString(rs3.Fields["vc_facilityArea"].Value) + "<br>";
                }
                strBody = strBody + "							Business Hours: Open " + Convert.ToString(rs3.Fields["vc_starthour"].Value) + "<br>Closed " + Convert.ToString(rs3.Fields["vc_endhour"].Value);
                strBody = strBody + "						</td>";
                strBody = strBody + "						<td width='130'>From: " + Convert.ToString(rs3.Fields["Begindate"].Value) + "<br>To: " + Convert.ToString(rs3.Fields["Enddate"].Value) + "<br>";
                strBody = strBody + Convert.ToString(rs3.Fields["Tdescrip"].Value);
                if (!(Convert.ToString(rs3.Fields["BEHour"].Value) == ""))
                {
                    strBody = strBody + "	  							<br>" + Convert.ToString(rs3.Fields["BEHour"].Value);
                }
                strBody = strBody + "	  							<br>";
                if (Convert.ToString(rs3.Fields["ch_feeType"].Value) == "1")
                {
                    strBody = strBody + "                                              Price     : $" + Convert.ToString(Strings.FormatNumber(rs3.Fields["nu_Price"].Value, 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault)) + "<br>";
                    strBody = strBody + "								Broker fee: $" + Convert.ToString(Strings.FormatNumber((Convert.ToDouble(Convert.ToDouble(rs3.Fields["nu_fee"].Value) / 100.00)) * Convert.ToDouble(NVL(rs3.Fields["nu_price"].Value, 0)), 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault)) + "<br>";
                }
                else
                {
                    strBody = strBody + "								Broker fee: $" + Convert.ToString(Strings.FormatNumber(rs3.Fields["nu_fee"].Value, 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault)) + "<br>";
                }
                //'strBody = strBody + "Rental fee: "+cstr(formatnumber(cdbl(NVL(rs3("nu_price"),0)),2)*(cint(NVL(rs3("nu_dayDifference"),0))+0))+" <br>"
                if (Convert.ToString(rs3.Fields["ch_feeType"].Value) == "1")
                {
                    strBody = strBody + "Due at Facility: $" + Convert.ToString(Convert.ToDouble(Strings.FormatNumber(Convert.ToDouble(NVL(rs3.Fields["nu_dailyPrice"].Value, 0)), 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault)) * (Convert.ToInt32(NVL(rs3.Fields["nu_dayDifference"].Value, 0)) + 0) - Convert.ToDouble(Strings.FormatNumber((Convert.ToDouble(Convert.ToDouble(rs3.Fields["nu_fee"].Value) / 100.00)) * Convert.ToDouble(NVL(rs3.Fields["nu_price"].Value, 0)), 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault))) + " <br>";
                }
                else
                {
                    strBody = strBody + "Due at Facility: $" + Convert.ToString(Convert.ToDouble(Strings.FormatNumber(Convert.ToDouble(NVL(rs3.Fields["nu_dailyPrice"].Value, 0)), 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault)) * (Convert.ToInt32(NVL(rs3.Fields["nu_dayDifference"].Value, 0)) + 0) - Convert.ToDouble(Strings.FormatNumber(rs3.Fields["nu_fee"].Value, 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault))) + "<br>";
                }
                if (Convert.ToInt32(NVL(rs3.Fields["nu_dayDifference"].Value, 0)) > 1)
                {
                    strBody = strBody + "Daily Rental price: $" + Convert.ToString(Strings.FormatNumber(rs3.Fields["nu_dailyPrice"].Value, 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault)) + " <br>";
                    strBody = strBody + "Days:" + Convert.ToString(Convert.ToInt32(rs3.Fields["nu_dayDifference"].Value)) + " <br><br>";
                    strBody = strBody + "TOTAL: $" + Convert.ToString(Strings.FormatNumber(Convert.ToDouble(NVL(rs3.Fields["nu_price"].Value, 0)), 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault)) + "<br>";
                }
                strBody = strBody + "	</td></tr>";
                rs3.MoveNext();
            }
        }
        strBody = strBody + "				</table>";
        strBody = strBody + "			</div>";
        strBody = strBody + "		</div>";
        strBody = strBody + "	</td>";
        strBody = strBody + "</tr>";
        strBody = strBody + "<tr>";
        strBody = strBody + "	<td width='550' height='40' background='http://www.boatrenting.com/images/footer_bg.gif'>";
        strBody = strBody + "		<div id='footer_details'>";
        strBody = strBody + "			<br><br><br>BoatRenting.com &middot; 320 South Country Road &middot; Brookhaven/Bellport NY 11719 &middot; 631-286-7816 &middot; <a href='mailto:info@boatrenting.com'>info@boatrenting.com</a>";
        strBody = strBody + "		</div>	";
        strBody = strBody + "	</td>";
        strBody = strBody + "</tr>";
        strBody = strBody + "</table>";
        strBody = strBody + "</body>";
        strBody = strBody + "</html>";
        //oNewMail = new CDO.Message();
        //oNewMail.To = Convert.ToString(rs.Fields["vc_email"].Value);
        //oNewMail.CC = "info@boatrenting.com";
        //oNewMail.From = "info@boatrenting.com";
        //oNewMail.Subject = "BoatRenting.com - Tentative Reservation";
        //oNewMail.HTMLBody = strBody;
        //oNewMail.Send();
        //oNewMail = null;
        MailMessage msg = new MailMessage();
        msg.To = Convert.ToString(rs.Fields["vc_email"].Value);
        msg.Cc = "info@boatrenting.com";
        //msg.To = "paul.toto@idserve.com"; //<- For Testing ****0000
        msg.From = "info@boatrenting.com";
        msg.Subject = "BoatRenting.com - Tentative Reservation";
        msg.Body = strBody;
        msg.BodyFormat = MailFormat.Html;

        //lblStatus.Text = "Sending...";
        SmtpMail.SmtpServer = "localhost";
        SmtpMail.Send(msg);
        msg = null;
        //sends email to facilities
        rs3.MoveFirst();
        numElem = -1;
        while(!(rs3.Eof))
        {
            flgFind = "0";
            for(k = 0; k <= numElem; k += 1)
            {
                if (rs3.Fields["MarinaMail"].Value == ArrEmails[k])
                {
                    flgFind = "1";
                    ArrBodies[k] = ArrBodies[k] + " <tr>";
                    ArrBodies[k] = ArrBodies[k] + " <td width='90'><img src='http://www.boatrenting.com/boats/" + Convert.ToString(rs3.Fields["vc_filename"].Value) + "' alt='" + Convert.ToString(rs3.Fields["IDescrip"].Value) + "' width='80' height='50'></td>";
                    ArrBodies[k] = ArrBodies[k] + " <td width='250'>" + Convert.ToString(rs3.Fields["vc_name"].Value) + ":&nbsp;" + Convert.ToString(rs3.Fields["vc_make"].Value) + "&nbsp;" + Convert.ToString(rs3.Fields["vc_model"].Value) + "<br>";
                    ArrBodies[k] = ArrBodies[k] + "    Length:&nbsp;" + Convert.ToString(rs3.Fields["vc_size"].Value) + "&nbsp;-&nbsp;Passengers:&nbsp;" + Convert.ToString(rs3.Fields["in_maxPassengers"].Value) + "<br>";
                    ArrBodies[k] = ArrBodies[k] + "    Description:&nbsp;" + Convert.ToString(rs3.Fields["Bdescrip"].Value);
                    ArrBodies[k] = ArrBodies[k] + " </td>";
                    ArrBodies[k] = ArrBodies[k] + " <td width='130'>From: " + Convert.ToString(rs3.Fields["Begindate"].Value) + "<br>To: " + Convert.ToString(rs3.Fields["Enddate"].Value) + "<br>";
                    ArrBodies[k] = ArrBodies[k] + Convert.ToString(rs3.Fields["Tdescrip"].Value);
                    if (!(Convert.ToString(rs3.Fields["BEHour"].Value) == ""))
                    {
                        ArrBodies[k] = ArrBodies[k] + "    <br>" + Convert.ToString(rs3.Fields["BEHour"].Value);
                    }
                    ArrBodies[k] = ArrBodies[k] + "    <br>";
                    if (Convert.ToString(rs3.Fields["ch_feeType"].Value) == "1")
                    {
                        ArrBodies[k] = ArrBodies[k] + "    Broker fee: $" + Convert.ToString(Strings.FormatNumber((Convert.ToDouble(Convert.ToDouble(rs3.Fields["nu_fee"].Value) / 100.00)) * Convert.ToDouble(NVL(rs3.Fields["nu_price"].Value, 0)), 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault)) + "<br>";
                    }
                    else
                    {
                        ArrBodies[k] = ArrBodies[k] + "	  Broker fee: $" + Convert.ToString(Strings.FormatNumber(rs3.Fields["nu_fee"].Value, 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault)) + "<br>";
                    }
                    ArrBodies[k] = ArrBodies[k] + "Rental fee: $" + Convert.ToString(Convert.ToDouble(Strings.FormatNumber(Convert.ToDouble(NVL(rs3.Fields["nu_price"].Value, 0)), 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault)) * (Convert.ToInt32(NVL(rs3.Fields["nu_dayDifference"].Value, 0)) + 0)) + " <br>";
                    if (Convert.ToString(rs3.Fields["ch_feeType"].Value) == "1")
                    {
                        ArrBodies[k] = ArrBodies[k] + "Due at Facility: $" + Convert.ToString(Convert.ToDouble(Strings.FormatNumber(Convert.ToDouble(NVL(rs3.Fields["nu_price"].Value, 0)), 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault)) * (Convert.ToInt32(NVL(rs3.Fields["nu_dayDifference"].Value, 0)) + 0) - Convert.ToDouble(Strings.FormatNumber((Convert.ToDouble(Convert.ToDouble(rs3.Fields["nu_fee"].Value) / 100.00)) * Convert.ToDouble(NVL(rs3.Fields["nu_price"].Value, 0)), 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault))) + " <br>";
                    }
                    else
                    {
                        ArrBodies[k] = ArrBodies[k] + "Due at Facility: $" + Convert.ToString(Convert.ToDouble(Strings.FormatNumber(Convert.ToDouble(NVL(rs3.Fields["nu_price"].Value, 0)), 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault)) * (Convert.ToInt32(NVL(rs3.Fields["nu_dayDifference"].Value, 0)) + 0) - Convert.ToDouble(Strings.FormatNumber(rs3.Fields["nu_fee"].Value, 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault))) + "<br>";
                    }
                    if (Convert.ToInt32(NVL(rs3.Fields["nu_dayDifference"].Value, 0)) > 1)
                    {
                        ArrBodies[k] = ArrBodies[k] + "Daily Rental price: $" + Convert.ToString(Strings.FormatNumber(rs3.Fields["nu_dailyPrice"].Value, 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault)) + "<br>";
                        ArrBodies[k] = ArrBodies[k] + "Days:" + Convert.ToString(Convert.ToInt32(rs3.Fields["nu_dayDifference"].Value)) + " <br><br>";
                        ArrBodies[k] = ArrBodies[k] + "TOTAL: $" + Convert.ToString(Strings.FormatNumber(Convert.ToDouble(NVL(rs3.Fields["nu_price"].Value, 0)), 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault)) + "<br>";
                    }
                    ArrBodies[k] = ArrBodies[k] + " </td></tr>";
                }
            }
            if (flgFind == "0")
            {
                numElem = numElem + 1;
                //TODO Redim Preserve not supported.
                ArrEmails = new object[numElem + 1];
                //TODO Redim Preserve not supported.
                ArrBodies = new string[numElem + 1];
                //TODO Redim Preserve not supported.
                ArrNames = new object[numElem + 1];
                ArrEmails[numElem] = rs3.Fields["MarinaMail"].Value;
                ArrNames[numElem] = rs3.Fields["vc_contactName"].Value;
                ArrBodies[numElem] = ArrBodies[numElem] + " <tr>";
                ArrBodies[numElem] = ArrBodies[numElem] + " <td width='90'><img src='http://www.boatrenting.com/boats/" + Convert.ToString(rs3.Fields["vc_filename"].Value) + "' alt='" + Convert.ToString(rs3.Fields["IDescrip"].Value) + "' width='80' height='50'></td>";
                ArrBodies[numElem] = ArrBodies[numElem] + " <td width='250'>" + Convert.ToString(rs3.Fields["vc_name"].Value) + ":&nbsp;" + Convert.ToString(rs3.Fields["vc_make"].Value) + "&nbsp;" + Convert.ToString(rs3.Fields["vc_model"].Value) + "<br>";
                ArrBodies[numElem] = ArrBodies[numElem] + "    Length:&nbsp;" + Convert.ToString(rs3.Fields["vc_size"].Value) + "&nbsp;-&nbsp;Passengers:&nbsp;" + Convert.ToString(rs3.Fields["in_maxPassengers"].Value) + "<br>";
                ArrBodies[numElem] = ArrBodies[numElem] + "    Description:&nbsp;" + Convert.ToString(rs3.Fields["Bdescrip"].Value);
                ArrBodies[numElem] = ArrBodies[numElem] + " </td>";
                ArrBodies[numElem] = ArrBodies[numElem] + " <td width='130'>From: " + Convert.ToString(rs3.Fields["Begindate"].Value) + "<br>To: " + Convert.ToString(rs3.Fields["Enddate"].Value) + "<br>";
                ArrBodies[numElem] = ArrBodies[numElem] + Convert.ToString(rs3.Fields["Tdescrip"].Value);
                if (!(Convert.ToString(rs3.Fields["BEHour"].Value) == ""))
                {
                    ArrBodies[numElem] = ArrBodies[numElem] + "    <br>" + Convert.ToString(rs3.Fields["BEHour"].Value);
                }
                ArrBodies[numElem] = ArrBodies[numElem] + "    <br>";
                if (Convert.ToString(rs3.Fields["ch_feeType"].Value) == "1")
                {
                    ArrBodies[numElem] = ArrBodies[numElem] + "    Broker fee: $" + Convert.ToString(Strings.FormatNumber((Convert.ToDouble(Convert.ToDouble(rs3.Fields["nu_fee"].Value) / 100.00)) * Convert.ToDouble(NVL(rs3.Fields["nu_price"].Value, 0)), 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault)) + "</td>";
                }
                else
                {
                    ArrBodies[numElem] = ArrBodies[numElem] + "	  Broker fee: $" + Convert.ToString(Strings.FormatNumber(rs3.Fields["nu_fee"].Value, 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault)) + "</td>";
                }
                ArrBodies[numElem] = ArrBodies[numElem] + " </tr>";
            }
            rs3.MoveNext();
        }
        for(k = 0; k <= numElem; k += 1)
        {
            strBody = "<html>";
            strBody = strBody + "<head>";
            strBody = strBody + "<title>Welcome to BoatRenting.com!</title>";
            strBody = strBody + "<style type='text/css'>";
            strBody = strBody + "	#forgotten_password {";
            strBody = strBody + "	width: 500px;";
            strBody = strBody + "	margin-top: 20px;";
            strBody = strBody + "	text-align: center;";
            strBody = strBody + "	padding-bottom: 10px;";
            strBody = strBody + "	margin-left: auto;";
            strBody = strBody + "	margin-right: auto;";
            strBody = strBody + "	border: 1px solid #CCCCCC;";
            strBody = strBody + "	}";
            strBody = strBody + "#forgotten_password_title {";
            strBody = strBody + "	width: 100%;";
            strBody = strBody + "	clear: none;";
            strBody = strBody + "	background-color: #E9EDF1;";
            strBody = strBody + "	padding-top: 10px;";
            strBody = strBody + "	padding-bottom: 10px;";
            strBody = strBody + "	text-indent: 10px;";
            strBody = strBody + "	font-size: 10pt;";
            strBody = strBody + "	font-weight: bold;";
            strBody = strBody + "	color: #333;";
            strBody = strBody + "	}";
            strBody = strBody + "#forgotten_password_form {";
            strBody = strBody + "	width: 100%;";
            strBody = strBody + "	height: 20px;";
            strBody = strBody + "	margin-top: 10px;";
            strBody = strBody + "	margin-bottom: 20px;";
            strBody = strBody + "	}";
            strBody = strBody + "#forgotten_password a.button {";
            strBody = strBody + "	width: 100px;";
            strBody = strBody + "	text-decoration: none;";
            strBody = strBody + "	color: white;";
            strBody = strBody + "	display: block;";
            strBody = strBody + "	background-color: #FF9933;";
            strBody = strBody + "	padding-top: 1px;";
            strBody = strBody + "	padding-bottom: 1px;";
            strBody = strBody + "	padding-left: 10px;";
            strBody = strBody + "	padding-right: 10px;";
            strBody = strBody + "	font-weight: bold;";
            strBody = strBody + "	text-align: center;";
            strBody = strBody + "	margin: auto;";
            strBody = strBody + "	margin-bottom: 10px;}";
            strBody = strBody + "#forgotten_password a.button:hover {";
            strBody = strBody + "	text-decoration: underline;";
            strBody = strBody + "	}";
            strBody = strBody + "#footer_details {";
            strBody = strBody + "	padding-left: 8px;";
            strBody = strBody + "	font-size: 7pt;";
            strBody = strBody + "	color: white;";
            strBody = strBody + "	height: 10px;";
            strBody = strBody + "	line-height: 8px;";
            strBody = strBody + "	}";
            strBody = strBody + "#footer_details a{";
            strBody = strBody + "	font-size: 8pt;";
            strBody = strBody + "	color: #ccc;";
            strBody = strBody + "	text-decoration: none;";
            strBody = strBody + "	}";
            strBody = strBody + "#footer_details a:hover {";
            strBody = strBody + "	font-size: 8pt;";
            strBody = strBody + "	color: white;";
            strBody = strBody + "	font-weight: normal;";
            strBody = strBody + "	}";
            strBody = strBody + "#returning_customers_payment a.button{";
            strBody = strBody + "	float: left;";
            strBody = strBody + "	width: 100px;";
            strBody = strBody + "	text-decoration: none;";
            strBody = strBody + "	color: white;";
            strBody = strBody + "	display: block;";
            strBody = strBody + "	background-color: #FF9933;";
            strBody = strBody + "	padding-top: 1px;";
            strBody = strBody + "	padding-bottom: 1px;";
            strBody = strBody + "	padding-left: 10px;";
            strBody = strBody + "	padding-right: 10px;";
            strBody = strBody + "	font-weight: bold;";
            strBody = strBody + "	text-align: center;";
            strBody = strBody + "	margin-left: 20px;";
            strBody = strBody + "	margin-top: 7px;";
            strBody = strBody + "	}";
            strBody = strBody + "#returning_customers_payment a.button:hover {";
            strBody = strBody + "	text-decoration: underline;";
            strBody = strBody + "	}	  ";
            strBody = strBody + "#order_summary h1 {";
            strBody = strBody + "	font-size: 12pt;";
            strBody = strBody + "	font-weight: bold;";
            strBody = strBody + "	margin-top: 2px;";
            strBody = strBody + "	margin-bottom: 15px;";
            strBody = strBody + "	color: #495E70;";
            strBody = strBody + "	}";
            strBody = strBody + "#order_summary {";
            strBody = strBody + "	margin-top: 7px;";
            strBody = strBody + "	margin-left: 8px;";
            strBody = strBody + "	margin-right: 8px;";
            strBody = strBody + "	width: auto;";
            strBody = strBody + "	background-color: #E9EDF1;";
            strBody = strBody + "	border: 1px solid #ccc;";
            strBody = strBody + "	padding: 7px;";
            strBody = strBody + "	}";
            strBody = strBody + "#order_summary table{";
            strBody = strBody + "	border-width: 1px 0px 0px 1px;";
            strBody = strBody + "	border-style: solid;";
            strBody = strBody + "	border-color: #607489;";
            strBody = strBody + "	width: 100%;";
            strBody = strBody + "	}";
            strBody = strBody + "#order_summary table td{";
            strBody = strBody + "	border-style: solid;";
            strBody = strBody + "	border-width: 0px 1px 1px 0px;";
            strBody = strBody + "	border-color: #607489;";
            strBody = strBody + "	padding-left: 5px;";
            strBody = strBody + "	padding-top:5px;";
            strBody = strBody + "	padding-bottom: 5px;";
            strBody = strBody + "	padding-right: 5px;";
            strBody = strBody + "	text-align: center;";
            strBody = strBody + "	background-color: white;";
            strBody = strBody + "	}";
            strBody = strBody + "#order_summary table th {";
            strBody = strBody + "	color: white;";
            strBody = strBody + "	background-color: #607489;";
            strBody = strBody + "	text-align: center;";
            strBody = strBody + "	border-bottom: 1px solid #607489;";
            strBody = strBody + "	border-top: 0px;";
            strBody = strBody + "	border-left: 0px;";
            strBody = strBody + "	border-right: 0px;";
            strBody = strBody + "	}";
            strBody = strBody + "</style>";
            strBody = strBody + "</head>";
            strBody = strBody + "<body>";
            strBody = strBody + "<table cellpadding='0' cellspacing='0' border='0'>";
            strBody = strBody + "<tr>";
            strBody = strBody + "	<td width='550' height='78' valign='middle' align='left' bgcolor='#4D8DD5'><img src='http://www.boatrenting.com/images/banner.gif'></td>";
            strBody = strBody + "</tr>";
            strBody = strBody + "<tr>";
            strBody = strBody + "	<td width='550' height='12' background='http://www.boatrenting.com/images/sub_menu_bg.gif'>&nbsp;</td>";
            strBody = strBody + "</tr>";
            strBody = strBody + "<tr>";
            strBody = strBody + "	<td width='550' align='center'>";
            strBody = strBody + "		<div id='returning_customers_payment'>";
            strBody = strBody + "			<div id='order_summary'>";
            strBody = strBody + "				<h1>Tentative Reservation</h1>";
            strBody = strBody + "				<font style='font-weight:normal'>Dear " + Convert.ToString(ArrNames[k]) + ", you have a new Tentative Reservation!!:<br><br>";
            strBody = strBody + "				Costumer: " + Convert.ToString(rs.Fields["vc_firstname"].Value) + "&nbsp;" + Convert.ToString(rs.Fields["vc_lastname"].Value) + "<br>";
            strBody = strBody + "				Email: " + Convert.ToString(rs.Fields["vc_email"].Value) + "<br>";
            strBody = strBody + "				Phone: " + Convert.ToString(rs.Fields["vc_contactphone"].Value) + "<br>";
            strBody = strBody + "				Address: " + Convert.ToString(rs.Fields["vc_address"].Value) + " - " + Convert.ToString(rs.Fields["vc_city"].Value) + " - " + Convert.ToString(rs.Fields["vc_state"].Value) + " " + Convert.ToString(rs.Fields["ch_zip"].Value) + " - " + Convert.ToString(rs.Fields["vc_country"].Value) + "<br><br>Please contact the following customer to collect your desired deposit and to confirm this reservation.<br>As per our booking agreement, please deduct this broker fee off the advertised boat rental price.<br><br>Please be advised your facility & boat will be rated by this customer.<br> This rating will be screened by BoatRenting.com then posted to your BoatRenting.com web site ad.<br>Thank you.<br><br></font>";
            strBody = strBody + "				<table cellpadding='0' cellspacing='0'>";
            strBody = strBody + "					<tr>";
            strBody = strBody + "						<th colspan='2'>Boat Details</th>";
            strBody = strBody + "						<th>Rental Details</th>";
            strBody = strBody + "					</tr>";
            strBody = strBody + ArrBodies[k];
            strBody = strBody + "				</table>";
            strBody = strBody + "			</div>";
            strBody = strBody + "		</div>";
            strBody = strBody + "	</td>";
            strBody = strBody + "</tr>";
            strBody = strBody + "<tr>";
            strBody = strBody + "	<td width='550' height='40' background='http://www.boatrenting.com/images/footer_bg.gif'>";
            strBody = strBody + "		<div id='footer_details'>";
            strBody = strBody + "			<br><br><br>BoatRenting.com &middot; 320 South Country Road &middot; Brookhaven/Bellport NY 11719 &middot; 631-286-7816 &middot; <a href='mailto:info@boatrenting.com'>info@boatrenting.com</a>";
            strBody = strBody + "		</div>	";
            strBody = strBody + "	</td>";
            strBody = strBody + "</tr>";
            strBody = strBody + "</table>";
            strBody = strBody + "</body>";
            strBody = strBody + "</html>";
            //oNewMail = new CDO.Message();
            //oNewMail.To = Convert.ToString(ArrEmails[k]);
            //oNewMail.CC = "info@boatrenting.com";
            //oNewMail.From = "info@boatrenting.com";
            //oNewMail.Subject = "BoatRenting.com - You have new Tentative Reservation!";
            //oNewMail.HTMLBody = strBody;
            //oNewMail.Send();
            //oNewMail = null;
            MailMessage msg2 = new MailMessage();
            msg2.To = Convert.ToString(rs.Fields["vc_email"].Value);
            msg2.Cc = "info@boatrenting.com";
            //msg.To = "paul.toto@idserve.com"; //<- For Testing ****0000
            msg2.From = "info@boatrenting.com";
            msg2.Subject = "BoatRenting.com - You have new Tentative Reservation!";
            msg2.Body = strBody;
            msg2.BodyFormat = MailFormat.Html;

            //lblStatus.Text = "Sending...";
            SmtpMail.SmtpServer = "localhost";
            SmtpMail.Send(msg2);
            msg2 = null;
        }
    }
%>
<html>
<head>
<title>Welcome to BoatRenting.com!</title>
<style type="text/css" media="screen">

#container {
	width: 782px;
	/*border-width: 0px 1px 0px 1px;
	border-style: solid;
	border-color: #999;*/
	background: url('https://boatrenting.com/images/container_bg.gif') repeat-y;
	padding: 0px;
	margin-top: 15px;
      height:auto; margin-left:auto; margin-right:auto; margin-bottom:auto

	}

#banner {
	margin-left: 1px;
	width: 780px;
	height: 78px;
	background: #4D8DD5 url('https://boatrenting.com/images/banner.gif') no-repeat 10px 8px;
	}
#menu {
	margin-left: 1px;
	padding-left: 1px;
	width: 779px;
	height: 17px;
	background: #4D8DD5;
	overflow: hidden;
	}

#menu ul {
	margin:0;
	padding:0;
	list-style:none;
	}

#menu ul li {
	float: left;
	margin: 0px;
	padding: 0px;
	background: url('https://boatrenting.com/images/tab_right.gif') no-repeat top right;
	}

#menu a {
	float: left;
	display: block;
	font-size: 11px;
	font-weight: bold;
	line-height: 17px;
	background: url('https://boatrenting.com/images/tab_left.gif') no-repeat top left;
	color: #CCCCCC; padding-left:8px; padding-right:6px; padding-top:0px; padding-bottom:0px
	}



/* Commented Backslash Hack hides rule from IE5-Mac \*/
#menu a {float:none;}
/* End IE5-Mac hack */

#menu a:hover {
	color: white;
	}

#menu #current {
	background: url('https://boatrenting.com/images/tab_current_right.gif') no-repeat top right;
	}

#menu #current a{
	background: url('https://boatrenting.com/images/tab_current_left.gif') no-repeat top left;
	color: #666;
	text-decoration: none
	}

#menu #current a:hover{
	color: #333;
	}

#sub_menu {
	margin-left: 1px;
	width: 720px;
	text-align: left;
	margin-top: 10px;
	padding-left: 30px;
	padding-right: 30px;
	color: #666;
	height: 16px;
	line-height: 8px;
	background: url('https://boatrenting.com/images/sub_menu_bg.gif') repeat-x bottom left;
	}



#returning_customers_payment a.button{
	float: left;
	width: 100px;
	text-decoration: none;
	color: white;
	display: block;
	background-color: #FF9933;
	padding-top: 1px;
	padding-bottom: 1px;
	padding-left: 10px;
	padding-right: 10px;
	font-weight: bold;
	text-align: center;
	margin-left: 20px;
	margin-top: 7px;
	}

#order_summary table th {
	color: white;
	background-color: #607489;
	text-align: center;
	border-bottom: 1px solid #607489;
	border-top: 0px;
	border-left: 0px;
	border-right: 0px;
	}

#footer {
	padding-top: 28px;
	line-height: 10px;
	height: 12px;
	clear: both;
	margin-left: 1px;
	width: 780px;
	background: url('https://boatrenting.com/images/footer_bg.gif') repeat-x;
	}


#footer_details {
	padding-left: 8px;
	font-size: 7pt;
	color: white;
	height: 10px;
	line-height: 8px;
	}

#footer_details a{
	font-size: 8pt;
	color: #ccc;
	text-decoration: none;
	}

#footer_details a:hover {
	font-size: 8pt;
	color: white;
	font-weight: normal;
	}



</style>


<meta http-equiv="Content-type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Content-Language" content="en-us" />
<meta name="ROBOTS" content="ALL" />
</head>
<body>
<form name="frm_newuser" method="post">
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
				<li id="current"><a href="http://www.boatrenting.com/default.aspx">Home</a></li>
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
		</div>
		<div id="sub_menu"></div>
		<div id="returning_customers_payment">
			<div id="order_summary">
				<h1 align="left">Tentative Reservation</h1>
<%
    if (response_code == "1")
    {
%>
					<font style="font-weight:normal">Dear <b><%= rs.Fields["vc_firstname"].Value %>&nbsp;<%= rs.Fields["vc_lastname"].Value %></b>,  </font>
					<font style="FONT-WEIGHT: normal">you have tentatively 
                reserved the following boat. </font>Please note this IS NOT a 
                confirmed reservation and you MUST contact the facility or boat 
                owner listed bellow.&nbsp; The broker fee will be deducted from 
                the total rental fee by the facility (Boat Owner). If for some reason 
                the boat is not available, there will be NO charge to your 
                credit card. <br>
                This broker fee is not a deposit and the facility (Boat Owner) will contact 
                you to collect there desired deposit.<br>
					<font style="font-weight:normal"><br><br>
					Here are your purchase details.  </font>
					<font size="4" style="font-weight: 700" face="Tahoma">Please print this as your receipt.</font><font style="font-weight:normal">
					 <!--you have successfuly reserved the following boat(s):--></font>
					<table cellpadding="0" cellspacing="0">
						<tr>
							<th colspan="2">Boat Details</th>
							<th>Facility Information</th>
							<th>Rental Details</th>
						</tr>
<%
        rs3.MoveFirst();
        if (rs3.Eof)
        {
%>
							<tr>
								<td colspan="4" align="center">There are no reserved Boats</td>
							</tr>
<%
        }
        else
        {
            Cont = 0;
            while(!(rs3.Eof))
            {
%>
						<tr>
							<td width="90"><img src="boats/<%= rs3.Fields["vc_filename"].Value %>" alt="<%= rs3.Fields["IDescrip"].Value %>" width="80" height="50"></td>
							<td width="250">
<%= rs3.Fields["vc_name"].Value %>:&nbsp;<%= rs3.Fields["vc_make"].Value %>&nbsp;<%= rs3.Fields["vc_model"].Value %><br>
							Length:&nbsp;<%= rs3.Fields["vc_size"].Value %>&nbsp;-&nbsp;Passengers:&nbsp;<%= rs3.Fields["in_maxPassengers"].Value %><br>
							Description:&nbsp;<%= rs3.Fields["Bdescrip"].Value %>
							</td>
							<td width="250">
								Facility: <%= rs3.Fields["vc_marinaName"].Value %><br> Contact: <%= rs3.Fields["vc_contactName"].Value %> <br>
								Location:&nbsp;<%= rs3.Fields["CountryName"].Value %>&nbsp;-&nbsp;<%= rs3.Fields["StateName"].Value %>&nbsp;-&nbsp;<%= rs3.Fields["vc_city"].Value %><br>
<%
                if (!(Convert.ToString(rs3.Fields["vc_bodywater"].Value) == ""))
                {
%>
<%= rs3.Fields["vc_bodywater"].Value %><br><%
                }
%>
								Address: <%= rs3.Fields["vc_addressline1"].Value %><br><%
                if (!(Convert.ToString(rs3.Fields["vc_addressline2"].Value) == ""))
                {
%>
<%= rs3.Fields["vc_addressline2"].Value %><br><%
                }
%>
								Phone/Fax: <%= rs3.Fields["vc_phone"].Value %><%
                if (!(Convert.ToString(rs3.Fields["vc_fax"].Value) == ""))
                {
%>
&nbsp;/&nbsp;<%= rs3.Fields["vc_fax"].Value %><%
                }
%>
<br>
<%
                if (!(Convert.ToString(rs3.Fields["vc_facilityDirections"].Value) == ""))
                {
%>
Directions: <%= rs3.Fields["vc_facilityDirections"].Value %><br><%
                }
                if (!(Convert.ToString(rs3.Fields["vc_facilityArea"].Value) == ""))
                {
%>
Attractions: <%= rs3.Fields["vc_facilityArea"].Value %><br><%
                }
%>
								Business Hours: Open <%= rs3.Fields["vc_starthour"].Value %><br>Closed <%= rs3.Fields["vc_endhour"].Value %>
							</td>
							<td width="130">From: <%= rs3.Fields["Begindate"].Value %><br>To: <%= rs3.Fields["Enddate"].Value %><br>
<%= rs3.Fields["Tdescrip"].Value %><%
                if (!(Convert.ToString(rs3.Fields["BEHour"].Value) == ""))
                {
%>
<br><%= rs3.Fields["BEHour"].Value %><%
                }
%>
<br>
									Broker fee:
<%
                if (Convert.ToString(rs3.Fields["ch_feeType"].Value) == "1")
                {
%>
										$<%= Strings.FormatNumber((Convert.ToDouble(Convert.ToDouble(rs3.Fields["nu_fee"].Value) / 100.00)) * Convert.ToDouble(NVL(rs3.Fields["nu_price"].Value, 0)), 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault) %>
<%
                }
                else
                {
%>
										$<%= Strings.FormatNumber(rs3.Fields["nu_fee"].Value, 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault) %>
<%
                }
%>
<br>
<%
                broker_fee = (Convert.ToDouble(Convert.ToDouble(rs3.Fields["nu_fee"].Value) / 100.00)) * Convert.ToDouble(NVL(rs3.Fields["nu_price"].Value, 0));
%>

									Due at facility:
<%
                if (Convert.ToString(rs3.Fields["ch_feeType"].Value) == "1")
                {
%>
										$<%= Strings.FormatNumber(Convert.ToDouble(NVL(rs3.Fields["nu_price"].Value, 0)) - broker_fee, 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault) %>
<%
                }
                else
                {
%>
										$<%= Strings.FormatNumber(rs3.Fields["nu_fee"].Value, 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault) %>
<%
                }
%>
<br>
									
									
<%
                if (Convert.ToInt32(NVL(rs3.Fields["nu_dayDifference"].Value, 0)) > 1)
                {
%>
									Daily Rental price:
									$<%= Strings.FormatNumber(rs3.Fields["nu_dailyPrice"].Value, 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault) %> <br>
									Days:
<%= Convert.ToInt32(rs3.Fields["nu_dayDifference"].Value) %> <br><br>
									TOTAL:
									$<%= Strings.FormatNumber(Convert.ToDouble(NVL(rs3.Fields["nu_price"].Value, 0)), 2, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault) %><br>
<%
                }
%>
							</td>
						</tr>
<%
                rs3.MoveNext();
            }
        }
%>
					</table>
					<br>
<%
    }
    else
    {
%>
					<font style="font-weight:normal">Dear <b><%= rs.Fields["vc_firstname"].Value %>&nbsp;<%= rs.Fields["vc_lastname"].Value %></b>, your transaction failed due to the following reason(s):</font>
					<table cellpadding="0" cellspacing="0" style="width:600px">
						<tr>
							<th width="50">&nbsp;</th>
							<th>Failure reason(s)</th>
							<th width="50">&nbsp;</th>
						</tr>
						<tr>
							<td width="50">&nbsp;</td>
							<td width="500" style="text-align:left">
								<b>Error</b>:
<%= response_text %>

							</td>
							<td width="50">&nbsp;</td>
						</tr>
					</table>
<%
    }
%>
			</div>
<%
    if (response_code == "1")
    {
%>
				<a href="http://www.boatrenting.com/default.aspx" class="button">Accept &raquo;</a><br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				You will receive an email confirmation of this transaction.
<%
    }
    else
    {
%>
				<a href="javascript:window.history.back()" class="button">&laquo; Please try again</a>
<%
    }
%>
		</div>
		<div id="footer">
			<div id="footer_details">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:Contact();">Contact Us</a>
			</div>
		</div>
	</div> <!-- Container Ends Here --><%
    rs3.Close();
    rs3 = null;
%>
</form>


</body>
<script language="JavaScript">

function QuickSearch(x){
	document.frm_newuser.cmb_boat.value = x;
	document.frm_newuser.cmb_country.value = 0;
	document.frm_newuser.cmb_body.value = 0;
	document.frm_newuser.cmb_facility.value = 0;
	document.frm_newuser.cmb_state.value = 0;
	document.frm_newuser.cmb_zip.value = 0;
	document.frm_newuser.action = "http://www.boatrenting.com/results.aspx";
	document.frm_newuser.submit();
}
function Contact(){
	document.frm_newuser.action = "http://www.boatrenting.com/contactus.aspx";
	document.frm_newuser.submit();
}
</script>


</html>
