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
using System.Xml;
using System.Data.SqlClient;
using System.Web.Services;
using System.Text;

namespace BoatRenting
{

    public partial class indexN_aspx_cs : System.Web.UI.Page
    {

        //HtmlInputControl txtSearch;

        private string getSafeString(IDataReader idr, int index)
        {

            return (idr.IsDBNull(index) ? "" : idr.GetString(index));


        }
        private string getSafeInt(IDataReader idr, int index)
        {

            return (idr.IsDBNull(index) ? "" : idr.GetInt32(index).ToString());


        }

        private string getSafeDecimal(IDataReader idr, int index)
        {

            return (idr.IsDBNull(index) ? "" : idr.GetDecimal(index).ToString());


        }
        //*************
        void bindHomePagePhotos()
        {
            using (SqlConnection con = Util.getConnection())
            {
                using (SqlCommand cmd = new SqlCommand("[usp_display_home_page_photos]", con))
                {
                    IDataReader idr = cmd.ExecuteReader();

                    ArrayList values = new ArrayList();

                    //SearchResult r = new SearchResult(dt.Rows[i]["BName"].ToString(),"",
                    //   dt.Rows[i]["StateName"].ToString(),
                    //   dt.Rows[i]["vc_city"].ToString(), dt.Rows[i]["vc_year"].ToString(), dt.Rows[i]["vc_make"].ToString(),
                    //   dt.Rows[i]["vc_model"].ToString(), dt.Rows[i]["BoatCategory"].ToString(), 
                    //   dt.Rows[i]["Captain"].ToString(), dt.Rows[i]["vc_year"].ToString(), dt.Rows[i]["vc_filename"].ToString());

                    int BNameIndex = idr.GetOrdinal("BName");
                    int StateNameIndex = idr.GetOrdinal("StateName");
                    int CityIndex = idr.GetOrdinal("vc_city");
                    int YearIndex = idr.GetOrdinal("vc_year");
                    int MakeIndex = idr.GetOrdinal("vc_make");
                    int ModelIndex = idr.GetOrdinal("vc_model");

                    int BodyOfWaterIndex = idr.GetOrdinal("BodyOfWater");

                    int BoatSizeIndex = idr.GetOrdinal("vc_size");
                    // This need to be changed

                    int AmountIndex = idr.GetOrdinal("RentAmount");
                    int FileNameIndex = idr.GetOrdinal("vc_filename");



                    int FilenameDescriptionIndex = idr.GetOrdinal("vc_nombre");
                    //idr.GetString(BNameIndex), "", idr.GetString(StateNameIndex),
                    //         idr.GetString(CityIndex), idr.IsDBNull(YearIndex) idr.GetString(YearIndex), idr.GetString(MakeIndex),
                    //         idr.GetString(ModelIndex), idr.GetString(BoatCategoryIndex), idr.GetString(CaptainIndex),
                    //         idr.GetString(AmountIndex), idr.GetString(FileNameIndex)


                    int BoatIdIndex = idr.GetOrdinal("in_boatID");
                    int MarinaIdIndex = idr.GetOrdinal("in_MarinaID");

                    int ratingIndex = idr.GetOrdinal("in_rating");




                    while (idr.Read())
                    {
                        string currency = "$";

                        if (getSafeInt(idr, idr.GetOrdinal("Currency_Id")).ToString() == "2")
                            currency = "&euro;";
                        HomePagePhotos rec = new HomePagePhotos(getSafeString(idr, BNameIndex), getSafeString(idr, BodyOfWaterIndex), getSafeString(idr, StateNameIndex),
                           getSafeString(idr, CityIndex), getSafeInt(idr, YearIndex), getSafeString(idr, MakeIndex),
                           getSafeString(idr, ModelIndex), "", getSafeString(idr, BoatSizeIndex),
                           getSafeDecimal(idr, AmountIndex), getSafeString(idr, FileNameIndex), getSafeString(idr, FilenameDescriptionIndex), getSafeInt(idr, BoatIdIndex), getSafeInt(idr, MarinaIdIndex), getSafeInt(idr, ratingIndex), currency);



                        values.Add(rec);


                    }


                    rpHomePhotos.DataSource = values;
                    rpHomePhotos.DataBind();



                    idr.Close();
                    con.Close();

                }
            }
        }
        protected void btnGoDetails_Click(object sender, EventArgs e)
        {
            Session[Util.Session_Selected_MarinaID] = txtSelectedMarinaId.Value;
            Session[Util.Session_Selected_BoatID] = txtSelectedBoatId.Value;

            Session[Util.Session_Selected_Rating] = txtSelectedRating.Value;


            Response.Redirect("Calendar.aspx");


        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Session["Lat"] = txtLat.Value;
            Session["Lon"] = txtLon.Value;

            Session["country"] = txtCountry.Value;

            int zcode;

            if (txtLat.Value != "24.55573589999999" && txtLon.Value != "-81.78265369999997")
            {
                if (int.TryParse(txtSearch.Value.ToString(), out zcode))
                    Session["zipcode"] = zcode;

                else
                    Session["zipcode"] = txtZipCode.Value;

                Session["city"] = txtCityName.Value;

                Session["state"] = txtState.Value;


                Session["searchterm"] = txtSearch.Value.ToString();
                // Session["searchterm"] = txtSearch.Text;
            }
            else
            {
                Session["Lat"] = "";
                Session["Lon"] = "";
                Session["zipcode"] = "";

                Session["city"] = "";

                Session["state"] = "";
                Session["searchterm"] = "Florida Keys";

            }
            Response.Redirect("Results.aspx?t=2");





        }
        [WebMethod]
        public static string ValidateLogin(string username, string password)
        {

            DataTable dt = Util.getDataSet("execute SP_BR_USER_LOGIN @p_vc_userName='" + username + "' , @p_vc_password='" + password + "'").Tables[0];
            if (dt.Rows.Count > 0)
                return "Success";
            else
                return "Failed";




        }


        protected void Page_Load(object sender, EventArgs e)
        {

            string CtrlID = Request.Form["__EVENTTARGET"];

            if (!Page.IsPostBack)
            {
                bindHomePagePhotos();



                /*    if (Session["userID"] != null && Session["userID"].ToString() != "")
                    {
                        lblLoginLogout.Text = "Sign out";
                        if (Session["userName"] != null)
                            // lnkUsername.Text = Session["userName"].ToString() + "&nbsp;&nbsp;";

                    }
                    else
                    {
                        lblLoginLogout.Text = "Sign in";

                    }

                    */


                //string CtrlID = Request.Form["__EVENTTARGET"];


                /*    if (CtrlID != null && CtrlID.Contains("btnSignIn"))
                    {

                        if (lblLoginLogout.Text == "Sign in")
                            btnSignIn_Click(this, null);
                        else
                        {
                            //Sign out 

                            Session.Clear();
                            lblLoginLogout.Text = "Sign in";
                            Response.Redirect("index.aspx");




                        }

                    }
                    */


            }
            else
            {
                //  string CtrlID = Request.Form["__EVENTTARGET"];


                /*     if (CtrlID != null && CtrlID.Contains("btnSignIn"))
                     {

                         if (lblLoginLogout.Text == "Sign in")
                             btnSignIn_Click(this, null);
                         else
                         {
                             //Sign out 

                             Session.Clear();
                             lblLoginLogout.Text = "Sign in";
                             Response.Redirect("index.aspx");




                         }

                     }
                     */
            }
            if (Session["userName"] != null)
            {
                //  lnkUsername.Text = Session["userName"].ToString() + "&nbsp;&nbsp;";
                //    lblLoginLogout.Text = "Sign out";
                Session["loginRequested"] = null;

            }


            ScriptManager.RegisterStartupScript(this, this.GetType(), "PageLoad", "Javascript:initialize();", true);

        }

        protected void lnkAdvancedSearch_Click(object sender, EventArgs e)
        {

        }

        //protected void btnSignIn_Click(object sender, EventArgs e)
        //{
        //    DataTable dt = Util.getDataSet("execute SP_BR_USER_LOGIN @p_vc_userName='" + txtLoginName.Text.Trim() + "' , @p_vc_password='" + txtPassword.Text.Trim() + "'").Tables[0];


        //    if (dt.Rows.Count > 0)
        //    {
        //        String currentPage = HttpContext.Current.Request.Url.AbsolutePath;
        //        String dotNET = Strings.Right(currentPage, 1);
        //        String dotNETdb = Strings.Right(Convert.ToString(dt.Rows[0]["vc_defaultHomePage"].ToString()), 1);
        //        if (dotNET == dotNETdb) { dotNET = ""; }
        //        Session.Add("userID", dt.Rows[0]["in_userID"].ToString());
        //        Session.Add("userLevelID", dt.Rows[0]["in_userLevelID"].ToString());
        //        Session.Add("MarinaID", dt.Rows[0]["in_MarinaID"].ToString());
        //        Session.Add("BusinessName", dt.Rows[0]["vc_BusinessName"].ToString());
        //        Session.Add("defaultPage", "admin/" + Convert.ToString(dt.Rows[0]["vc_defaultHomePage"].ToString())+ dotNET);

        //        if (dt.Rows[0]["in_userLevelID"].ToString() == "2")
        //        {

        //            Session["ClientID"] = Util.getClientIDFromUserID(dt.Rows[0]["in_userID"].ToString());



        //            Response.Redirect("UpdateClientInfo.aspx");
        //        }

        //        else
        //        Response.Redirect(Convert.ToString(Session["defaultPage"]));


        //    }


        //}


        /*

                [WebMethod]
                public static string ValidateLogin(string username, string password)
                {

                    DataTable dt = Util.getDataSet("execute SP_BR_USER_LOGIN @p_vc_userName='" + username + "' , @p_vc_password='" + password + "'").Tables[0];
                    if (dt.Rows.Count > 0)
                        return "Success";
                    else
                        return "Failed";




                } */

        private void RegisterStartupScript(string url)
        {
            //  String csname1 = "PopupScript";
            String csname2 = "ButtonClickScript";
            Type cstype = this.GetType();
            StringBuilder cstext2 = new StringBuilder();
            cstext2.Append("<script type=\"text/javascript\">  {");
            cstext2.Append("window.location =" + url + " } </");
            cstext2.Append("script>");
            Page.ClientScript.RegisterClientScriptBlock(cstype, csname2, cstext2.ToString(), false);
        }


        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            DataTable dt = Util.getDataSet("execute SP_BR_USER_LOGIN @p_vc_userName='" + txtLoginName.Text.Trim() + "' , @p_vc_password='" + txtPassword.Text.Trim() + "'").Tables[0];

            try
            {
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

                    // lnkUsername.Text = Session["userName"].ToString() + "&nbsp;&nbsp;";

                    //    lblLoginLogout.Text = "Sign out";

                    if (dt.Rows[0]["in_userLevelID"].ToString() == "4")
                    {

                        Session["ClientID"] = Util.getClientIDFromUserID(dt.Rows[0]["in_userID"].ToString());



                        Response.Redirect("UpdateClientInfo.aspx", true);

                    }

                    // else
                    // Response.Redirect(Convert.ToString(Session["defaultPage"]));
                    else if (Session["userLevelID"].ToString() == "1")
                        Response.Redirect("~/admin/facilities_list.aspx");

                    else if (Session["userLevelID"].ToString() == "2" || Session["userLevelID"].ToString() == "3")
                    {
                        //  Session["marinaID"].ToString()
                        if (IsProfileComplete())
                        {

                            //   Server.Transfer(ResolveUrl("~/admin/FacilityCalendarView.aspx"));
                            Page.Response.Redirect(ResolveUrl("~/admin/FacilityCalendarView.aspx"), false);
                            //  Context.ApplicationInstance.CompleteRequest();
                            Response.End();
                            //  Context.ApplicationInstance.CompleteRequest();


                            //  RegisterStartupScript(ResolveUrl("~/admin/FacilityCalendarView.aspx"));


                            return;

                        }
                        else
                        {
                            Response.Redirect("~/admin/Facilities_mant.aspx", false);
                            //     Context.ApplicationInstance.CompleteRequest();
                            //  Response.End();
                            return;
                        }

                    }




                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "SigninError", "Javascript:alert('Invalid username or password ')", true);

                }
            }
            catch (Exception ex)
            {

            }



        }

        private bool IsProfileComplete()
        {
            bool complete = true;

            DataTable dtC = Util.getDataSet("execute usp_is_profile_complete @marinaID=" + Session["MarinaID"].ToString()).Tables[0];

            if (dtC.Rows.Count == 0)
                complete = false;



            return complete;

        }
        /*
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                if (Session["userID"] != null && Session["userID"].ToString() != "")
                {
                    lblLoginLogout.Text = "Sign out";
                    if (Session["userName"] != null)
                        lnkUsername.Text = Session["userName"].ToString() + "&nbsp;&nbsp;";

                }
                else
                {
                    lblLoginLogout.Text = "Sign in";

                }




                string CtrlID = Request.Form["__EVENTTARGET"];


                if (CtrlID != null && CtrlID.Contains("btnSignIn"))
                {

                    if (lblLoginLogout.Text == "Sign in")
                        btnSignIn_Click(this, null);
                    else
                    {
                        //Sign out 

                        Session.Clear();
                        lblLoginLogout.Text = "Sign in";
                        Response.Redirect("index.aspx");




                    }

                }

            }
           

            else
            {
                string CtrlID = Request.Form["__EVENTTARGET"];


                if (CtrlID != null && CtrlID.Contains("btnSignIn"))
                {

                    if (lblLoginLogout.Text == "Sign in")
                        btnSignIn_Click(this, null);
                    else
                    {
                        //Sign out 

                        Session.Clear();
                        lblLoginLogout.Text = "Sign in";
                        Response.Redirect("index.aspx");




                    }

                }

            }
            if (Session["userName"] != null)
            {
                lnkUsername.Text = Session["userName"].ToString() + "&nbsp;&nbsp;";
                lblLoginLogout.Text = "Sign out";
                Session["loginRequested"] = null;

            }




            //    }








        }
        */

        public void checkLogin()
        {

            if (Session["userName"] != null)
            {
                // lnkUsername.Text = Session["userName"].ToString() + "&nbsp;&nbsp;";
                // lblLoginLogout.Text = "Sign out";
                Session["loginRequested"] = null;

            }

            // uplLogin.Update();

        }


        protected void lnkUsername_Click(object sender, EventArgs e)
        {
            if (Session["userLevelID"].ToString() == "4")
            {
                Response.Redirect("~/UpdateClientInfo.aspx");



                /// Response.Redirect("UpdateClientInfo.aspx");
            }

            else if (Session["userLevelID"].ToString() == "1")
                Response.Redirect("~/admin/facilities_list.aspx");

            else if (Session["userLevelID"].ToString() == "2" || Session["userLevelID"].ToString() == "3")
            {
                //  Session["marinaID"].ToString()
                if (IsProfileComplete())
                    Response.Redirect("~/admin/FacilityCalendarView.aspx");
                else
                    Response.Redirect("~/admin/Facilities_mant.aspx");

            }
        }


        //protected void ddLanguage_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    if (ddLanguage.SelectedIndex == 0)
        //    {
        //        Response.Redirect("http://translate.google.com/translate?js=n&sl=auto&tl=it&u=http://http://www.wateruber.com/index111.aspx", false);
        //    }
        //    else if (ddLanguage.SelectedIndex == 1)
        //    {
        //        Response.Redirect("http://translate.google.com/translate?js=n&sl=auto&tl=en&u=http://http://www.wateruber.com/index111.aspx", false);
        //    }
        //    else if (ddLanguage.SelectedIndex == 2)
        //    {
        //        Response.Redirect("http://translate.google.com/translate?js=n&sl=auto&tl=fr&u=http://http://www.wateruber.com/index111.aspx", false);
        //    }
        //}


        protected void btn_forgotPassword_Click(object sender, EventArgs e)
        {
            string emailId = txtLoginName.Text;
            txtLoginName.Text = "";
            if (emailId == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Please provide the email." + "');", true);
                return;
            }

            DataTable dtPass = Util.getDataSet("execute usp_get_password_from_username @vc_username='" + emailId + "'").Tables[0];

            if (dtPass.Rows.Count > 0)
            {
                Util.LogEMail("password@rentaboat.com", emailId + ",password@rentaboat.com,enngines@aol.com,6318316033@vtext.com,mackenzie@jetskirentals.com,kdhsr@aol.com", "Forgot Password - " + emailId, "User name/Email Address :" + emailId + "<br/>" + "Password :" + dtPass.Rows[0]["vc_password"].ToString(), "Forgot Password");

                Util.SendEMail("password@rentaboat.com", emailId + ",password@rentaboat.com,enngines@aol.com,6318316033@vtext.com,mackenzie@jetskirentals.com,kdhsr@aol.com", "Forgot Password - " + emailId, "User name/Email Address :" + emailId + "<br/>" + "Password :" + dtPass.Rows[0]["vc_password"].ToString());

                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Please check the email for the password. Email sent to " + dtPass.Rows[0]["vc_email"].ToString() + "');", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Email provided does not exists. Please try again." + "');", true);
            }
        }
    }






}
