using Microsoft.VisualBasic;
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
namespace BoatRenting {

  public partial class members_aspx_cs : System.Web.UI.Page
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
    //---- ParameterDirectionEnum Values ----'
    public const int adParamInput = 0x0001;
    public const int adParamOutput = 0x0002;
    public string sMes = "";
    public string varSession = "";
    public int i = 0;
    public string Message = "";
    public string Username = "";
    public string Password = "";
    public string dPage = "";
    public static object NVL(object oExp1, object oExp2){
        //if oExp1 is not null then return oExp1
        if (oExp1 != null)
        {
            return oExp1;
        }
        else if ((oExp1 == null) && (oExp2 != null))
        {
            //If oExp1 is null return oExp2
            return oExp2;
        }
        else
            //If both of them are null return nothing
            return null;
    }

    //public string NVL(string InputValue, string NullReplaceValue) 
    //{
    //    string NVL = "";
    //    if (Convert.IsDBNull(InputValue))
    //    {
    //        NVL = NullReplaceValue;
    //    }
    //    else
    //    {
    //        if ((InputValue.Trim()).Length == 0)
    //        {
    //            NVL = NullReplaceValue;
    //        }
    //        else
    //        {
    //            NVL = InputValue;
    //        }
    //    }
    //    return NVL;
    //}

    public string ConvierteFecha(ref string sStartDate) 
    {
        string ConvierteFecha = "";
        object sPaola = null;
        if (Convert.IsDBNull(sStartDate))
        {
            ConvierteFecha = "";
        }
        else
        {
            if (sStartDate == "")
            {
                ConvierteFecha = "";
            }
            else
            {
                if (sStartDate.Length != 11)
                {
                    ConvierteFecha = "";
                }
                else
                {
                    sStartDate = sStartDate.ToUpper();
                    sMes = sStartDate.Substring(4 - 1, 3);
                    if (sMes == "JAN")
                    {
                        sMes = "01";
                    }
                    if (sMes == "FEB")
                    {
                        sMes = "02";
                    }
                    if (sMes == "MAR")
                    {
                        sMes = "03";
                    }
                    if (sMes == "APR")
                    {
                        sMes = "04";
                    }
                    if (sMes == "MAY")
                    {
                        sMes = "05";
                    }
                    if (sMes == "JUN")
                    {
                        sMes = "06";
                    }
                    if (sMes == "JUL")
                    {
                        sMes = "07";
                    }
                    if (sMes == "AUG")
                    {
                        sMes = "08";
                    }
                    if (sMes == "SEP")
                    {
                        sMes = "09";
                    }
                    if (sMes == "OCT")
                    {
                        sMes = "10";
                    }
                    if (sMes == "NOV")
                    {
                        sMes = "11";
                    }
                    if (sMes == "DEC")
                    {
                        sMes = "12";
                    }
                    ConvierteFecha = sStartDate.Substring(1 - 1, 2) + "/" + sMes + "/" + sStartDate.Substring(8 - 1, 4);
                }
            }
        }
        return ConvierteFecha;
    }

    public object Login(string Username, string Password) 
    {
        con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstringDATA");
        Response.Expires = 0;
        oConn = new Connection();
        oConn.ConnectionString = con;
        oConn.ConnectionTimeout = 500;
        oConn.Open(null);

        Recordset rs = null;
        Command cmd = null;
        cmd = new Command();
        cmd.ActiveConnection = oConn;
        cmd.CommandText = "SP_BR_USER_LOGIN";
        cmd.CommandType = adCmdStoredProc;
        cmd.Parameters.Append(cmd.CreateParameter("@p_vc_userName", adVarChar, adParamInput, 120, Username));
        cmd.Parameters.Append(cmd.CreateParameter("@p_vc_password", adVarChar, adParamInput, 120, Password));
        rs = cmd.Execute();
        if (!(rs.Eof))
        {
            String currentPage = HttpContext.Current.Request.Url.AbsolutePath;
            String dotNET = Strings.Right(currentPage, 1);
            String dotNETdb = Strings.Right(Convert.ToString(rs.Fields["vc_defaultHomePage"].Value),1);
            if (dotNET == dotNETdb) { dotNET = ""; }
            Session.Add("userID", rs.Fields["in_userID"].Value);
            Session.Add("userLevelID", rs.Fields["in_userLevelID"].Value);
            Session.Add("MarinaID", rs.Fields["in_MarinaID"].Value);
            Session.Add("BusinessName", rs.Fields["vc_BusinessName"].Value);
            Session.Add("defaultPage", "admin/" + NVL(Convert.ToString(rs.Fields["vc_defaultHomePage"].Value), "") + dotNET );
        }
        return null;
    }
    public int GetRandomNumber(int maxNumber)
    {
        if (maxNumber < 1)
            throw new System.Exception("The maxNumber value should be greater than 1");
        byte[] b = new byte[4];
        new System.Security.Cryptography.RNGCryptoServiceProvider().GetBytes(b);
        int seed = (b[0] & 0x7f) << 24 | b[1] << 16 | b[2] << 8 | b[3];
        System.Random r = new System.Random(seed);
        return r.Next(1, maxNumber);
    }
    //public void createAlertScript(string errorMsg)
    //{
    //    System.Text.StringBuilder buf = new System.Text.StringBuilder();

    //    //StreamReader streamReader = new StreamReader("C:\\Inetpub\\wwwroot\\BoatRenting\\client.net\\admin\\validar.js");
    //    //string text = streamReader.ReadToEnd();
    //    //streamReader.Close(); buf.AppendLine("<script type=\"text/javascript\">");

    //    buf.AppendLine("<script type=\"text/javascript\">");
    //    buf.AppendFormat("alert('{0}');", errorMsg);
    //    buf.AppendLine("");
    //    buf.AppendLine("</script>");

    //    ClientScript.RegisterStartupScript(this.GetType(), "err", buf.ToString());
    //    //ClientScript.RegisterStartupScript(this.GetType(), "err", text, false);
    //}


  }

} 
