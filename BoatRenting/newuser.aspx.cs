using nce.adosql;
using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Text.RegularExpressions;
using System.Data.SqlClient;
namespace BoatRenting
{

  public partial class newuser_aspx_cs : System.Web.UI.Page
  {
    public string con = "";
    public Connection oConn = null;
    //------Constantes----'
    //---- DataTypeEnum Values ----'
    public const int adEmpty = 0;
    public const int adTinyInt = 16;
    public const int adSmallInt = 2;
    public const int adInteger = 3;
    public const int adBigInt = 20;
    public const int adUnsignedTinyInt = 17;
    public const int adUnsignedSmallInt = 18;
    public const int adUnsignedInt = 19;
    public const int adUnsignedBigInt = 21;
    public const int adSingle = 4;
    public const int adDouble = 5;
    public const int adCurrency = 6;
    public const int adDecimal = 14;
    public const int adNumeric = 131;
    public const int adBoolean = 11;
    public const int adError = 10;
    public const int adUserDefined = 132;
    public const int adVariant = 12;
    public const int adIDispatch = 9;
    public const int adIUnknown = 13;
    public const int adGUID = 72;
    public const int adDate = 7;
    public const int adDBDate = 133;
    public const int adDBTime = 134;
    public const int adDBTimeStamp = 135;
    public const int adBSTR = 8;
    public const int adChar = 129;
    public const int adVarChar = 200;
    public const int adLongVarChar = 201;
    public const int adWChar = 130;
    public const int adVarWChar = 202;
    public const int adLongVarWChar = 203;
    public const int adBinary = 128;
    public const int adVarBinary = 204;
    public const int adLongVarBinary = 205;
    public const int adChapter = 136;
    public const int adFileTime = 64;
    public const int adPropVariant = 138;
    public const int adVarNumeric = 139;
    public const int adArray = 0x2000;
    //---- CommandTypeEnum Values ------------'
    public const int adCmdStoredProc = 0x0004;
    public Command cmd = null;
    public Command cmd2 = null;
    public Command cmd3 = null;
    public Recordset rs = null;
    public Recordset rs2 = null;
    public Recordset rs3 = null;
    //---- ParameterDirectionEnum Values ----'
    public const int adParamInput = 0x0001;
    public const int adParamOutput = 0x0002;
    public string city = "";
    public string firstName = "";
    public string lastName = "";
    public object password = null;
    public object password2 = null;
    public string email = "";
    public string email2 = "";
    public string adress = "";
    public string phone = "";
    public string phone2 = "";
    public string mobilephone = "";
    public string fax = "";
    public string zip = "";
    public object countryID = null;
    public string returning_user2URL = "";
    //*************
    public string debugTEST_Kart = "";
    public string debugTEST_clientID = "";
    //*************

    void Page_Load(object source, EventArgs e)
    {
        con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstringDATA");
        Response.Expires = 0;
        oConn = new Connection();
        oConn.ConnectionString = con;
        oConn.ConnectionTimeout = 500;
        oConn.Open(null);
        countryID = 0;
        firstName = Request["firstName"];
        lastName = Request["lastName"];
        //password = Request("password")
        //password2 = Request("password2")
        email = Request["email"];
        email2 = Request["email2"];
        adress = Request["adress"];
        phone = Request["phone"];
        phone2 = Request["phone2"];
        mobilephone = Request["mobilephone"];
        fax = Request["fax"];
        zip = Request["zip"];
        city = Request["city"];
        if (!(Request["new_user_country"] == ""))
        {
            countryID = Request["new_user_country"];
        }
        if (!IsPostBack)
        {
            loadCountry();
        }
        oConn.Close();
    }
    public string NVL(string InputValue, string NullReplaceValue)
    {
        string NVL = "";
        //if (Convert.IsDBNull(InputValue))
        if (string.IsNullOrEmpty(InputValue))
        {
            NVL = NullReplaceValue;
        }
        else
        {
            if ((InputValue.Trim()).Length == 0)
            {
                NVL = NullReplaceValue;
            }
            else
            {
                NVL = InputValue;
            }
        }
        return NVL;
    }
    private void loadCountry()
    {
        con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstring");
        cmd = new Command();
        cmd.ActiveConnection = oConn;
        cmd.CommandText = "SP_BR_COUNTRY_LIST";
        cmd.CommandType = adCmdStoredProc;
        SqlDataAdapter adp = new SqlDataAdapter(cmd.CommandText, con);
        DataTable dt = new DataTable();
        DataRow dr = dt.NewRow();
        try
        {
            adp.Fill(dt);
            if (dt.Rows.Count > 0)
                dr = dt.NewRow();
            dr["in_countryID"] = 0;
            dr["vc_name"] = "- select Country -";

            {
                new_user_country.DataSource = dt;
                new_user_country.DataValueField = "in_countryID";
                new_user_country.DataTextField = "vc_name";
                dt.Rows.Add(dr);
                new_user_country.DataBind();
                new_user_country.SelectedIndex = 0;
                new_user_country.SelectedIndex = new_user_country.Items.IndexOf(new_user_country.Items.FindByText("- select Country -"));
            }
        }
        catch (Exception ex)
        {
            createAlertScript(ex.Message);
        }
    }
    public object Country() 
    {
        Recordset rs = null;
        Command cmd = null;
        cmd = new Command();
        cmd.ActiveConnection = oConn;
        cmd.CommandText = "SP_BR_COUNTRY_LIST";
        rs = cmd.Execute();
        Response.Write("	<select name=\"new_user_country\" id=\"new_user_country\" class=\"form_country\" style=\"width:150px\" onchange=\"javascript:LoadStates()\">\r\n");
        Response.Write("	<option value=\"0\">- select Country -</option>\r\n");
        while(!(rs.Eof))
        {
            Response.Write("	         <option value=\"");
            Response.Write(rs.Fields["in_countryID"].Value);
            Response.Write("\">");
            Response.Write(rs.Fields["vc_name"].Value);
            Response.Write("</option>\r\n");
            rs.MoveNext();
        }
        Response.Write("  	</select>\r\n");
        Response.Write("	<script> document.frm_newuser.new_user_country.selectedIndex = document.frm_newuser.cmb_country.value </script>\r\n");
        return null;
    }

    private void loadStates()
    {
        con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstring");
        cmd = new Command();
        cmd.ActiveConnection = oConn;
        cmd.CommandText = "SP_BR_STATE_LIST @CountryID=" + new_user_country.SelectedItem.Value;
        cmd.CommandType = adCmdStoredProc;
        SqlDataAdapter adp = new SqlDataAdapter(cmd.CommandText, con);
        DataTable dt = new DataTable();
        DataRow dr = dt.NewRow();
        try
        {
            adp.Fill(dt);
            if (dt.Rows.Count > 0)
                dr = dt.NewRow();
            dr["in_stateID"] = 0;
            dr["vc_name"] = "- select State -";

            {
                new_user_state.DataSource = dt;
                new_user_state.DataValueField = "in_stateID";
                new_user_state.DataTextField = "vc_name";
                dt.Rows.Add(dr);
                new_user_state.DataBind();
                new_user_state.SelectedIndex = 0;
                new_user_state.SelectedIndex = new_user_state.Items.IndexOf(new_user_state.Items.FindByText("- select State -"));
            }
        }
        catch (Exception ex)
        {
            createAlertScript(ex.Message);
        }
    }
    public object States() 
    {
        Recordset rs = null;
        Command cmd = null;
        cmd = new Command();
        cmd.ActiveConnection = oConn;
        cmd.CommandText = "SP_BR_STATE_LIST";
        cmd.CommandType = adCmdStoredProc;
        cmd.Parameters.Refresh();
        //cmd.Parameters["@CountryID"] = countryID;
        cmd.Parameters["@CountryID"].Value = Convert.ToInt32(countryID);
        rs = cmd.Execute();
        Response.Write("	<select name=\"new_user_state\" id=\"new_user_state\" class=\"form_state\" style=\"width:150px\">\r\n");
        Response.Write("	<option value=\"0\">- select State -</option>\r\n");
        while(!(rs.Eof))
        {
            Response.Write("	         <option value=\"");
            Response.Write(rs.Fields["in_stateID"].Value);
            Response.Write("\">");
            Response.Write(rs.Fields["vc_name"].Value);
            Response.Write("</option>\r\n");
            rs.MoveNext();
        }
        Response.Write("  	</select>\r\n");
        return null;
    }

    private void createAlertScript(string errorMsg)
    {
        System.Text.StringBuilder buf = new System.Text.StringBuilder();

        buf.AppendLine("<script type=\"text/javascript\">");
        buf.AppendFormat("alert('{0}');", errorMsg);
        buf.AppendLine("");
        if (errorMsg == "The information was saved")
        buf.AppendLine("window.location='boats_list.aspx';");
        buf.AppendLine("</script>");

        ClientScript.RegisterStartupScript(this.GetType(), "err", buf.ToString());
    }
    private String validr()
    {
        Boolean chk = false;

        //Initialise variables
        string errorMsg = "";
        string msg = "";
        String s = "Phone numbers, email or web address Character Sequences are not allowed in text form.Please remove any Phone numbers, email or web address Character Sequences";



        //Check for a Name
        if (NVL(Request.Form["new_user_first_name"], "") == "")
        {
            errorMsg += "\\n\\t First Name \\t\\t                  - Enter your First Name";
        }

        if (NVL(Request.Form["new_user_last_name"], "") == "")
        {
            errorMsg += "\\n\\t Last Name \\t\\t                  - Enter your Last Name";
        }

        if (NVL(Request.Form["new_user_email"], "") == "")
        {
            errorMsg += "\\n\\t E-Mail \\t\\t                  - Enter your E-mail";
        }

        if (checkUser())
        {
            errorMsg += "\\n\\t E-Mail \\t\\t                  - Already exists in www.boatrenting.com";
        }

        if (!IsFieldContainsEmail(NVL(Request.Form["new_user_email"], "")))
        {
        errorMsg += "\\n\\t E-mail \\t\\t   - Your E-mail address is invalid" + s;
        }

        if (NVL(Request.Form["new_user_email"], "") != NVL(Request.Form["new_user_confirm_email"], ""))
        {
            errorMsg += "\\n\\t E-Mail \\t\\t                  - Your confirmation E-mail is not correct";
        }

	

	//if (document.getElementById("new_user_password").value == ""){
	//	errorMsg += "\n\t Password \t                  - Write your password";
	//}




	//if (document.getElementById("new_user_password").value != document.getElementById("new_user_confirm_password").value){
	//	errorMsg += "\n\t Password \t                  - Your confirmation password is not correct";
	//}

        if (NVL(Request.Form["new_user_address"], "") == "")
        {
            errorMsg += "\\n\\t Address \\t\\t                  - Enter your Address";
        }

        if (NVL(Request.Form["new_user_city"], "") == "")
        {
            errorMsg += "\\n\\t City \\t\\t                  - Enter your City";
        }


    if (new_user_state.SelectedItem.Value == "0" &&
        (new_user_country.SelectedItem.Value == "1" ||
        new_user_country.SelectedItem.Value == "5"))
    //if (Request.Form["new_user_state"].ToString() == "0" &&
    //    (Request.Form["new_user_country"].ToString() == "1" ||
    //    Request.Form["new_user_country"].ToString() == "5"))
    {
		errorMsg += "\\n\\t State \\t\\t                  - Select your State";
	}

	//if (document.getElementById("new_user_zipcode").value == ""){
	//	errorMsg += "\n\t Zip code \t\t                  - Write your Zip code";
	//}

    if (new_user_country.SelectedItem.Value == "0")
        //if (Request.Form["new_user_country"].ToString() == "1")
    {
		errorMsg += "\\n\\t Country \\t\\t                  - Select your Country";
	}

    if (NVL(Request.Form["new_user_phone_number"], "") == "")
    {
        errorMsg += "\\n\\t Phone Number \\t\\t                  - Enter your Phone number";
    }
        
        
        if (errorMsg != "")
        {
            msg = "______________________________________________________________\\n\\n";
            msg += "Your enquiry has not been sent because there are problem(s) with the form.\\n";
            msg += "Please correct the problem(s) and re-submit the form.\\n";
            msg += "______________________________________________________________\\n\\n";
            msg += "The following field(s) need to be corrected:\\n";

            errorMsg = msg + errorMsg + "\\n\\n";
        }

        return errorMsg;
    }
  private Boolean IsFieldContainsEmail(String em)
  {
    String rex = "([a-zA-Z0-9])+([.a-zA-Z0-9_-])*@([a-zA-Z0-9])+(.[a-zA-Z0-9_-]+)+";
      if (Regex.IsMatch(em, rex))
    return true;
      else
    return false;
   }
  protected void Button1_Click(object sender, EventArgs e)
  {
      string errorMessage;
      errorMessage = validr();
      if (errorMessage.Length > 0)
      {
          createAlertScript(errorMessage);
      }
      else
      {
          saveUser();
          //createAlertScript("The information was saved");
          returning_user2URL = "https://boatrenting.com/returning_user2.aspx";
          returning_user2URL = returning_user2URL + "?c=" + Convert.ToString(Session["clientID"]) + "&k=" + Convert.ToString(Session["Kart"]);
          Response.Redirect(returning_user2URL, true);// PRODUCTION
          //Response.Redirect("http://www.boatrenting.idserve.com/returning_user2.aspx", true);//TEST ONLY
          //Response.Redirect("http://localhost:50331/client.net/returning_user2.aspx", true);//TEST ONLY
      }

  }
  private bool checkUser()
  {
      oConn = new Connection();
      oConn.ConnectionString = con;
      oConn.ConnectionTimeout = 500;
      oConn.Open(null);

      cmd2 = new Command();
      rs2 = new Recordset();
      cmd2.ActiveConnection = oConn;
      cmd2.CommandText = "SP_BR_CLIENT_USERNAME_EXISTS";
      cmd2.CommandType = adCmdStoredProc;
      //cmd2.Parameters[1] = Request.Form["new_user_email"];
      cmd2.Parameters.Append(cmd2.CreateParameter("@p_vc_username", adVarChar, adParamInput, 100, 0));
      cmd2.Parameters["@p_vc_username"].Value = Request.Form["new_user_email"];
      rs2.Open(cmd2);
      Session["clientID"] = "";
      if (Convert.ToString(rs2.Fields[0].Value) == "0")
      {
          return (false);
      }
      else
      {
          return (true);
      }
      oConn.Close();
  }


  private void saveUser()
  {
      oConn = new Connection();
      oConn.ConnectionString = con;
      oConn.ConnectionTimeout = 500;
      oConn.Open(null);

      cmd2 = new Command();
      rs2 = new Recordset();
      cmd2.ActiveConnection = oConn;
      cmd2.CommandText = "SP_BR_CLIENT_USERNAME_EXISTS";
      cmd2.CommandType = adCmdStoredProc;
      //cmd2.Parameters[1] = Request.Form["new_user_email"];
      cmd2.Parameters.Append(cmd2.CreateParameter("@p_vc_username", adVarChar, adParamInput, 100, 0));
      cmd2.Parameters["@p_vc_username"].Value = Request.Form["new_user_email"];
      rs2.Open(cmd2);
      Session["clientID"] = "";
      if (Convert.ToString(rs2.Fields[0].Value) == "0")
      {
          cmd = new Command();
          rs = new Recordset();
          cmd.ActiveConnection = oConn;
          cmd.CommandText = "SP_BR_CLIENT_REGISTRATION";
          cmd.CommandType = adCmdStoredProc;
          //cmd.Parameters[1] = Request.Form["new_user_first_name"];
          cmd.Parameters.Append(cmd.CreateParameter("@p_vc_firstName", adVarChar, adParamInput, 50, 0));
          cmd.Parameters["@p_vc_firstName"].Value = Request.Form["new_user_first_name"];
          //cmd.Parameters[2] = Request.Form["new_user_last_name"];
          cmd.Parameters.Append(cmd.CreateParameter("@p_vc_lastName", adVarChar, adParamInput, 50, 0));
          cmd.Parameters["@p_vc_lastName"].Value = Request.Form["new_user_last_name"];
          //cmd.Parameters[3] = Request.Form["new_user_email"];
          cmd.Parameters.Append(cmd.CreateParameter("@p_vc_username", adVarChar, adParamInput, 100, 0));
          cmd.Parameters["@p_vc_username"].Value = Request.Form["new_user_email"];
          //.Parameters(4)=request.Form("new_user_password")
          //cmd.Parameters[4] = "";
          cmd.Parameters.Append(cmd.CreateParameter("@p_vc_password", adVarChar, adParamInput, 30, 0));
          cmd.Parameters["@p_vc_password"].Value = "";
          //cmd.Parameters[5] = Request.Form["new_user_address"];
          cmd.Parameters.Append(cmd.CreateParameter("@p_vc_address", adVarChar, adParamInput, 100, 0));
          cmd.Parameters["@p_vc_address"].Value = Request.Form["new_user_address"];
          //cmd.Parameters[6] = Request.Form["new_user_city"];
          cmd.Parameters.Append(cmd.CreateParameter("@p_vc_city", adVarChar, adParamInput, 50, 0));
          cmd.Parameters["@p_vc_city"].Value = Request.Form["new_user_city"];
          //cmd.Parameters[7] = Request.Form["new_user_zipcode"];
          cmd.Parameters.Append(cmd.CreateParameter("@p_ch_ZIP", adVarChar, adParamInput, 5, 0));
          cmd.Parameters["@p_ch_ZIP"].Value = Request.Form["new_user_zipcode"];
          //cmd.Parameters[8] = Request.Form["new_user_state"];
          cmd.Parameters.Append(cmd.CreateParameter("@p_in_stateID", adInteger, adParamInput, 4, 0));
          cmd.Parameters["@p_in_stateID"].Value = Request.Form["new_user_state"];
          //cmd.Parameters[9] = Request.Form["new_user_state"];
          cmd.Parameters.Append(cmd.CreateParameter("@p_in_countryID", adInteger, adParamInput, 4, 0));
          cmd.Parameters["@p_in_countryID"].Value = Request.Form["new_user_country"];
          //cmd.Parameters[10] = Request.Form["new_user_phone_number"];
          cmd.Parameters.Append(cmd.CreateParameter("@p_vc_contactPhone", adVarChar, adParamInput, 20, 0));
          cmd.Parameters["@p_vc_contactPhone"].Value = Request.Form["new_user_phone_number"];
          //cmd.Parameters[11] = Request.Form["new_user_secondary_number"];
          cmd.Parameters.Append(cmd.CreateParameter("@p_vc_additionalPhone", adVarChar, adParamInput, 20, 0));
          cmd.Parameters["@p_vc_additionalPhone"].Value = Request.Form["new_user_secondary_number"];
          //cmd.Parameters[12] = Request.Form["new_user_cell_phone"];
          cmd.Parameters.Append(cmd.CreateParameter("@p_vc_mobile", adVarChar, adParamInput, 20, 0));
          cmd.Parameters["@p_vc_mobile"].Value = Request.Form["new_user_cell_phone"];
          //cmd.Parameters[13] = Request.Form["new_user_cell_phone"];
          cmd.Parameters.Append(cmd.CreateParameter("@p_vc_fax", adVarChar, adParamInput, 20, 0));
          cmd.Parameters["@p_vc_fax"].Value = Request.Form["new_user_fax_number"];
          rs.Open(cmd);
          cmd3 = new Command();
          rs3 = new Recordset();
          cmd3.ActiveConnection = oConn;
          cmd3.CommandText = "SP_BR_CLIENT_LOGIN";
          cmd3.CommandType = adCmdStoredProc;
          //cmd3.Parameters[1] = Request.Form["new_user_email"];
          cmd3.Parameters.Append(cmd.CreateParameter("@P_VC_UserName", adVarChar, adParamInput, 100, 0));
          cmd3.Parameters["@P_VC_UserName"].Value = Request.Form["new_user_email"];
          //.Parameters(2)=request.Form("new_user_password")
          //cmd3.Parameters[2] = "";
          cmd3.Parameters.Append(cmd.CreateParameter("@P_VC_Password", adVarChar, adParamInput, 30, 0));
          cmd3.Parameters["@P_VC_Password"].Value = "";
          rs3.Open(cmd3);
          Session["clientID"] = rs3.Fields["in_clientID"].Value;
      }
      oConn.Close();
  }
  protected void Button2_Click(object sender, EventArgs e)
  {
      new_user_first_name.Value = "";
      new_user_last_name.Value = "";
      new_user_email.Value = "";
      new_user_confirm_email.Value = "";
      new_user_address.Value = "";
      new_user_city.Value = "";
      new_user_zipcode.Value = "";
      new_user_phone_number.Value = "";
      new_user_secondary_number.Value = "";
      new_user_cell_phone.Value = "";
      new_user_fax_number.Value = "";
      new_user_country.SelectedValue = "0";
      new_user_state.SelectedValue = "0";
  }
  protected void cboCountry_SelectedIndexChanged(object sender, EventArgs e)
  {
      loadStates();
  }
}

} 
