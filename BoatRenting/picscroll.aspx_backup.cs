
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

  public partial class picscroll_aspx_cs : System.Web.UI.Page
  {
      protected void Page_Load(object sender, EventArgs e)
      {
          if (!Page.IsPostBack)
          {

              DataTable dtPhotos = Util.getDataSet("execute usp_get_boat_pics @in_boatID=" + Session[Util.Session_Selected_BoatID].ToString() + ",@in_marinaID=" + Session[Util.Session_Selected_MarinaID].ToString()).Tables[0];

              Response.Write(@"<div class='list-boat-thumb'><table><tr>");

              for (int i = 0; i < dtPhotos.Rows.Count; i++)
              {
                  Response.Write("<td><img src='./boats/" + dtPhotos.Rows[i]["vc_filename"].ToString() + "' Alt='" + dtPhotos.Rows[i]["vc_nombre"].ToString() +"' ");
                  Response.Write("width='100' height='80'  onmouseover='parent.document.frmBoatDetails.mainboatpic.src=this.src;' onmouseout='parent.document.frmBoatDetails.mainboatpic.src=parent.document.frmBoatDetails.hpicmain.value;' >");

                  
                  Response.Write("</td>");

              }


              Response.Write(@"</tr></table></div>");

          }

      }

  }

} 
