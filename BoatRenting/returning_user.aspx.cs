using nce.adosql;
using Microsoft.VisualBasic;
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

  public partial class returning_user_aspx_cs : System.Web.UI.Page
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
    public string flgData = "";
    public int Cont = 0;
    public double broker_fee = 0;
    public Command cmd = null;
    public Recordset rs = null;
    public Command cmd3 = null;
    public Recordset rs3 = null;
    public string returning_user2URL = "";
    //*************
    public string debugTEST_Kart = "";
    public string debugTEST_clientID = "";
    //*************
    public int NVL(object InputValue, int NullReplaceValue)
    {
        int NVL = 0;
        if (Convert.IsDBNull(InputValue))
        {
            NVL = NullReplaceValue;
        }
        else
        {
            if ((Convert.ToString(InputValue).Trim()).Length == 0)
            {
                NVL = NullReplaceValue;
            }
            else
            {
                NVL = Convert.ToInt32(InputValue);
            }
        }
        return NVL;
    }

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

    public void Delete() 
    {
        int inContador = 0;
        string inCodigo = "";
        int i = 0;
        object query = null;
        Command cmdE = null;
        // On Error Resume Next (UNSUPPORT) 
        inContador = Convert.ToInt32((Request.Form["txtCount"]).Trim());
        if (inContador > 0)
        {
            for(i = 1; i <= inContador; i += 1)
            {
                inCodigo = (Request.Form["chkElim" + Convert.ToString(i)]).Trim();
                if (inCodigo != "")
                {
                    cmdE = new Command();
                    cmdE.ActiveConnection = oConn;
                    cmdE.CommandText = "SP_BR_KARTDETAIL_REMOVE";
                    cmdE.CommandType = adCmdStoredProc;
                    //cmdE.Parameters[1] = inCodigo;
                    cmdE.Parameters.Append(cmd.CreateParameter("@p_in_code", adVarChar, adParamInput, 100, 0));
                    cmdE.Parameters["@p_in_code"].Value = inCodigo;
                    cmdE.Execute();
                    if (Information.Err().Number != 0)
                    {
                        Session.Add("strErr", "Error: " + Information.Err().Description);
                    }
                }
            }
        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        returning_user2URL = "https://boatrenting.com/returning_user2.aspx";
        returning_user2URL = returning_user2URL + "?c=" + Convert.ToString(Session["clientID"]) + "&k=" + Convert.ToString(Session["Kart"]);
        Response.Redirect(returning_user2URL, true);// PRODUCTION
        //Response.Redirect("http://www.boatrenting.idserve.com/returning_user2.aspx", true);//TEST ONLY
        //Response.Redirect("http://localhost:50331/client.net/returning_user2.aspx", true);//TEST ONLY

    }
}

} 
