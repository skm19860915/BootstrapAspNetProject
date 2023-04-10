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

namespace BoatRenting {

  public partial class index_aspx_cs : System.Web.UI.Page
  {
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
                  int StateNameIndex =idr.GetOrdinal("StateName");
                    int CityIndex =idr.GetOrdinal("vc_city");
                    int YearIndex =idr.GetOrdinal("vc_year");
                     int MakeIndex =idr.GetOrdinal("vc_make");
                     int ModelIndex =idr.GetOrdinal("vc_model");

                     int BodyOfWaterIndex =idr.GetOrdinal("BodyOfWater");
                    
                  int BoatSizeIndex = idr.GetOrdinal("vc_size");
                  // This need to be changed
                  
                  int AmountIndex =idr.GetOrdinal("RentAmount");
                     int FileNameIndex =idr.GetOrdinal("vc_filename");

                   

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
                           getSafeString(idr,CityIndex), getSafeInt(idr,YearIndex), getSafeString(idr,MakeIndex),
                           getSafeString(idr,ModelIndex), "", getSafeString(idr,BoatSizeIndex),
                           getSafeDecimal(idr,AmountIndex), getSafeString(idr,FileNameIndex),getSafeString(idr,FilenameDescriptionIndex),getSafeInt(idr,BoatIdIndex),getSafeInt(idr,MarinaIdIndex),getSafeInt(idr,ratingIndex),currency);



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
                if (int.TryParse(txtSearch.Text.Trim(), out zcode))
                    Session["zipcode"] = zcode;

                else
                    Session["zipcode"] = txtZipCode.Value;

                Session["city"] = txtCityName.Value;

                Session["state"] = txtState.Value;

               

                Session["searchterm"] = txtSearch.Text;
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
        public static string ValidateLogin(string username,string password)
        {

            DataTable dt = Util.getDataSet("execute SP_BR_USER_LOGIN @p_vc_userName='" + username + "' , @p_vc_password='" + password + "'").Tables[0];
            if (dt.Rows.Count > 0)
                return "Success";
            else
                return "Failed";




        }


    protected void Page_Load(object sender,EventArgs e)
    {

            string CtrlID = Request.Form["__EVENTTARGET"];

        if (!Page.IsPostBack)
        {
            bindHomePagePhotos();

             //   Util.SendSMSMessage("");
                
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "CloseLoginBox", "Javascript:CloseLoginBox();", true);
            }
        //else if (CtrlID == "btnSignIn")
        //    {

        //        btnSignIn_Click(this, null);


        //    }

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





    }





    public class HomePagePhotos
  {

      private string boatname;
      private string bodyOfWater;
      private string state;
      private string city;
      private string year;
      private string make;
      private string model;
      private string category;
      private string boatSize;
      private string amount;

      private string filename;

      private string filenameDescription;

      private string boatId;
      private string marinaId;

      private string rating;

        private string currencySymbol;



      public HomePagePhotos(string boatname, string BodyOfWater, string state, string city, string year, string make, string model,
          string category, string boatSize, string amount, string filename, string filenameDescription, string boatId, string marinaId, string rating, string currencysymbol)
      {
          this.boatname = boatname;
          this.BodyOfWater = BodyOfWater;
          this.state = state;
          this.city = city;
          this.year = year;
          this.make = make;
          this.model = model;
          this.category = category;
          this.boatSize = boatSize;

         
          this.amount = amount;
          this.filename = filename;
          this.filenameDescription = filenameDescription;

          this.boatId = boatId;
          this.marinaId = marinaId;
            this.currencySymbol = currencysymbol;


      }

        public string CurrencySymbol
        {
            get
            {
                return currencySymbol;
            }

            set
            {
                currencySymbol = value;
            }

        }
      public string BoatId
      {
          get
          {
              return boatId;
          }
          set
          {
              boatId = value;

          }

      }

      public string MarinaId
      {
          get
          {
              return marinaId;
          }
          set
          {
              marinaId = value;

          }

      }

      public string Rating
      {
          get
          {
              return rating;
          }
          set
          {
              rating = value;

          }

      }

      public string FilenameDescription
      {
          get
          {
              return filenameDescription;
          }
          set
          {
              filenameDescription = value;

          }

      }

      public string BoatName
      {
          get
          {
              return boatname;
          }
          set
          {
              boatname = value;

          }

      }
      public string FileName
      {
          get
          {
              return filename;
          }
          set
          {
              filename = value;

          }

      }


      public string BodyOfWater
      {
          get
          {
              return bodyOfWater;
          }
          set
          {
              bodyOfWater = value;

          }

      }

      public string State
      {
          get
          {
              return state;
          }
          set
          {
              state = value;

          }

      }

      public string City
      {
          get
          {
              return city;
          }
          set
          {
              city = value;

          }

      }

      public string Year
      {
          get
          {
              return year;
          }
          set
          {
              year = value;

          }

      }


      public string Make
      {
          get
          {
              return make;
          }
          set
          {
              make = value;

          }

      }


      public string Model
      {
          get
          {
              return model;
          }
          set
          {
              model = value;

          }

      }


      public string Category
      {
          get
          {
              return category;
          }
          set
          {
              category = value;

          }

      }


      public string BoatSize
      {
          get
          {
              return boatSize;
          }
          set
          {
              boatSize = value;

          }

      }

      public string Amount
      {
          get
          {
              return amount;
          }
          set
          {
              amount = value;

          }

      }


  }
} 
