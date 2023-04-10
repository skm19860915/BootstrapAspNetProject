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
using System.Web.Mail;
using System.IO;

namespace BoatRenting
{

  public partial class facilities_activate_aspx_cs : System.Web.UI.Page
  {
    public string con = "";
    public Connection oConn = null;
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
    public const int adCmdStoredProc = 0x0004;
    public const int adParamInput = 0x0001;
    public const int adParamOutput = 0x0002;
    public string sMes = "";
    public string Marina_ID = "";
    public Command cmd = null;
    public Recordset rs = null;
    public Recordset rs2 = null;
    public string strBody = "";
    public CDO.Message oNewMail = null;
    public object NVL(object InputValue, object NullReplaceValue) 
    {
        object NVL = null;
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
                NVL = InputValue;
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
        //public void sendEmail(String emailTo, String emailBody)
        //{

        //        MailMessage msg = new MailMessage();
        //    msg.To = emailTo;
        //    msg.From = "info@boatrenting.com";
        //    msg.Subject = "You have been approved at http://www.boatrenting.com !!";
        //    msg.Body = emailBody;
        //    msg.BodyFormat = MailFormat.Html;

        //    //lblStatus.Text = "Sending...";
        //    SmtpMail.SmtpServer = "localhost";
        //    SmtpMail.Send(msg);
        //        //lblStatus.Text = "Sent email (" + txtSubject.Text + ") to " + txtTo.Text;




        //    }


        public void sendEmail(String marinaID)
        {

            DataTable dt = Util.getDataSet("select vc_contact_name, vc_email from TBL_BR_MARINA where in_MarinaID=" + marinaID ).Tables[0];

          

            if (dt.Rows.Count > 0)
            {
                DataTable dtUser = Util.getDataSet("select vc_username, vc_password from TBL_BR_User where vc_username='" + dt.Rows[0]["vc_email"].ToString() +"' and in_marinaID=" + marinaID).Tables[0];

                string body = string.Empty;
                using (StreamReader reader = new StreamReader(Server.MapPath("~/admin/AccountActivatedEmailTemplate.html")))
                {
                    body = reader.ReadToEnd();
                }

                body = body.Replace("{BoatOwnerName}", dt.Rows[0]["vc_name"].ToString());

                body = body.Replace("{Username}", dtUser.Rows[0]["vc_username"].ToString());

                body = body.Replace("{Password}", dtUser.Rows[0]["vc_password"].ToString());


                Util.SendEMail("info@rentaboat.com", dt.Rows[0]["vc_email"].ToString() + ",info@rentaboat.com", "Welcome to RentABoat.com !", body);




            }






        }


    }

} 
