
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

  public partial class picscroll_aspx_cs_small : System.Web.UI.Page
  {
      protected void Page_Load(object sender, EventArgs e)
      {
          if (!Page.IsPostBack)
          {
              var boatId = Request.QueryString["BoatId"];
              var marinaId = Request.QueryString["MarinaId"];

              DataTable dtPhotos = Util.getDataSet("execute usp_get_boat_pics @in_boatID=" + boatId + ",@in_marinaID=" + marinaId).Tables[0];

              Response.Write(@"<div class='list-boat-thumb'><table><tr>");

              for (int i = 0; i < dtPhotos.Rows.Count; i++)
              {
                  Response.Write("<td><img src='./boats/" + dtPhotos.Rows[i]["vc_filename"].ToString() + "' Alt='" + dtPhotos.Rows[i]["vc_nombre"].ToString() +"' ");
                  Response.Write("width='50' height='40'  onmouseover='parent.document.frmSearch.image" + boatId + marinaId + ".src=this.src;'>");
                  Response.Write("</td>");
              }
              Response.Write(@"</tr></table></div>");
          }
      }
  }
} 
