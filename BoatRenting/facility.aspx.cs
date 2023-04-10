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
using System.Data.SqlClient;
using Microsoft.VisualBasic;

namespace BoatRenting
{

    public partial class facility_aspx_cs : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            // if (!Page.IsPostBack)
            // {

            //     if (Request.QueryString["id"] == null || Request.QueryString["id"] == "")
            //     {
            //         Response.Redirect("index.aspx");
            //         return;

            //     }
            //     else
            //     {
            //         int fid;
            //         string fids = Request.QueryString["id"];

                    

            //         if (!int.TryParse(fids, out fid))
            //         {
            //             Response.Redirect("index.aspx");
            //             return;
            //         }


                  



            //         using (SqlConnection con = Util.getConnection())
            //         {
            //             using (SqlCommand cmd = new SqlCommand("usp_advanced_search", con))
            //             {
            //                 cmd.CommandType = CommandType.StoredProcedure;

            //                 cmd.Parameters.AddWithValue("@p_in_marinaID",fids);
            //                 SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            //                 DataSet dst = new DataSet();
            //                 adapter.Fill(dst);

            //                 DataTable dt = dst.Tables[0];

            //                 // lblMessageBoatLocation.Text = "Total Records : " + dt.Rows.Count.ToString();

            //                 Session["advancedSearchResult"] = dt;

            //                 Response.Redirect("resultsAdvanced.aspx");


            //             }
            //         }


            //     }



            // }
            
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
    }
}
