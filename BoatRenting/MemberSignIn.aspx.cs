using Microsoft.VisualBasic;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MemberSignIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!Page.IsPostBack)
        {
           if (Request.QueryString["askq"] != null && Request.QueryString["askq"] == "1")
            {
                ViewState["askq"] = "1";
            }
           else if (Request.QueryString["askq"] != null && Request.QueryString["askq"] == "2")
            {
                ViewState["askq"] = "2";
                ViewState["qid"] = Request.QueryString["qid"];

            }

        }


    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        DataTable dt = Util.getDataSet("execute SP_BR_USER_LOGIN @p_vc_userName='" + inputEmail.Text + "' , @p_vc_password='" + inputPassword.Text + "'").Tables[0];
        if (dt.Rows.Count > 0)
        {
            String currentPage = HttpContext.Current.Request.Url.AbsolutePath;
            String dotNET = Strings.Right(currentPage, 1);
            String dotNETdb = Strings.Right(Convert.ToString(dt.Rows[0]["vc_defaultHomePage"].ToString()), 1);
            if (dotNET == dotNETdb) { dotNET = ""; }
            Session.Add("userID", dt.Rows[0]["in_userID"].ToString());
            Session.Add("userLevelID", dt.Rows[0]["in_userLevelID"].ToString());
            Session.Add("MarinaID", dt.Rows[0]["in_MarinaID"].ToString());
            Session.Add("BusinessName", dt.Rows[0]["vc_BusinessName"].ToString());
            Session.Add("defaultPage", "admin/" + Convert.ToString(dt.Rows[0]["vc_defaultHomePage"].ToString()) + dotNET);
            Session.Add("userName", dt.Rows[0]["vc_username"].ToString());
            if (ViewState["askq"] != null && ViewState["askq"].ToString() == "1")
            { 
                Response.Redirect("AskQuestionBoat.aspx");
                return;

             }
            else if (ViewState["askq"] != null && ViewState["askq"].ToString() == "2")
            {
                Response.Redirect("AnswerQuestionBoat.aspx?qid=" + ViewState["qid"].ToString());
                return;

            }
            else

            if (dt.Rows[0]["in_userLevelID"].ToString() == "4") // If it is Client
        {

            Session["ClientID"] = Util.getClientIDFromUserID(dt.Rows[0]["in_userID"].ToString());



            Response.Redirect("UpdateClientInfo.aspx");
        }

        else
            Response.Redirect(Convert.ToString(Session["defaultPage"]));

        }
        else
        {
            lblMessage.Text = "Failed to Login. Invalid user name or password.";
        }


    }
}