
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
              string imgs = "";

              if(dtPhotos.Rows.Count >= 4){
                    for (int i = 0; i < dtPhotos.Rows.Count; i++)
                    {
                        imgs += dtPhotos.Rows[i]["vc_filename"].ToString() + "|";
                    }

                    Response.Write("<td style='padding-right:18px; padding-bottom:18px;'><img style='width:244px; height:174px; border: 1px solid #72c7cf;' class='img-responsive' src='./boats/" + dtPhotos.Rows[0]["vc_filename"].ToString() + "' Alt='" + dtPhotos.Rows[0]["vc_nombre"].ToString() +"' ");
                    Response.Write(" onmouseover='parent.document.frmBoatDetails.mainboatpic.src=this.src;' onmouseout='parent.document.frmBoatDetails.mainboatpic.src=parent.document.frmBoatDetails.hpicmain.value;' >");
                    Response.Write("</td>");
                    Response.Write("<td style='padding-left:18px; padding-bottom:18px;'><img style='width:244px; height:174px; border: 1px solid #72c7cf;' class='img-responsive' src='./boats/" + dtPhotos.Rows[1]["vc_filename"].ToString() + "' Alt='" + dtPhotos.Rows[1]["vc_nombre"].ToString() +"' ");
                    Response.Write(" onmouseover='parent.document.frmBoatDetails.mainboatpic.src=this.src;' onmouseout='parent.document.frmBoatDetails.mainboatpic.src=parent.document.frmBoatDetails.hpicmain.value;' >");
                    Response.Write("</td>");
                    Response.Write("</tr><tr>");
                    Response.Write("<td style='padding-right:18px; padding-top:18px;'><img style='width:244px; height:174px; border: 1px solid #72c7cf;' class='img-responsive' src='./boats/" + dtPhotos.Rows[2]["vc_filename"].ToString() + "' Alt='" + dtPhotos.Rows[2]["vc_nombre"].ToString() +"' ");
                    Response.Write(" onmouseover='parent.document.frmBoatDetails.mainboatpic.src=this.src;' onmouseout='parent.document.frmBoatDetails.mainboatpic.src=parent.document.frmBoatDetails.hpicmain.value;' >");
                    Response.Write("</td>");
                    Response.Write("<td style='padding-left:18px; padding-top:18px;'><img style='width:244px; height:174px; border: 1px solid #72c7cf;' class='img-responsive' src='./boats/" + dtPhotos.Rows[3]["vc_filename"].ToString() + "' Alt='" + dtPhotos.Rows[3]["vc_nombre"].ToString() +"' ");
                    Response.Write(" onmouseover='parent.document.frmBoatDetails.mainboatpic.src=this.src;' onmouseout='parent.document.frmBoatDetails.mainboatpic.src=parent.document.frmBoatDetails.hpicmain.value;' ><button onclick='showAllPhotos(\"" + imgs + "\")' class='btn btn-custom' style='background-color: white; color: #FE5974 !important; position: absolute; top:86%; left:80%; padding:10px; border: 1px solid #fe5974; cursor: pointer;'>All Photos</button>");
                    Response.Write("</td>");
              }  
              else
              {
                  if(dtPhotos.Rows.Count == 1){
                    Response.Write("<td style='padding-right:20px; padding-bottom:20px;'><img style='width:244px; height:174px; border: 1px solid #72c7cf;' class='img-responsive' src='./boats/" + dtPhotos.Rows[0]["vc_filename"].ToString() + "' Alt='" + dtPhotos.Rows[0]["vc_nombre"].ToString() +"' ");
                    Response.Write(" onmouseover='parent.document.frmBoatDetails.mainboatpic.src=this.src;' onmouseout='parent.document.frmBoatDetails.mainboatpic.src=parent.document.frmBoatDetails.hpicmain.value;' >");
                    Response.Write("</td>"); 
                  }
                  else if(dtPhotos.Rows.Count == 2){
                    Response.Write("<td style='padding-right:20px; padding-bottom:20px;'><img style='width:244px; height:174px; border: 1px solid #72c7cf;' class='img-responsive' src='./boats/" + dtPhotos.Rows[0]["vc_filename"].ToString() + "' Alt='" + dtPhotos.Rows[0]["vc_nombre"].ToString() +"' ");
                    Response.Write(" onmouseover='parent.document.frmBoatDetails.mainboatpic.src=this.src;' onmouseout='parent.document.frmBoatDetails.mainboatpic.src=parent.document.frmBoatDetails.hpicmain.value;' >");
                    Response.Write("</td>");
                    Response.Write("<td style='padding-left:20px; padding-bottom:20px;'><img style='width:244px; height:174px; border: 1px solid #72c7cf;' class='img-responsive' src='./boats/" + dtPhotos.Rows[1]["vc_filename"].ToString() + "' Alt='" + dtPhotos.Rows[1]["vc_nombre"].ToString() +"' ");
                    Response.Write(" onmouseover='parent.document.frmBoatDetails.mainboatpic.src=this.src;' onmouseout='parent.document.frmBoatDetails.mainboatpic.src=parent.document.frmBoatDetails.hpicmain.value;' >");
                    Response.Write("</td>");
                  }
                  else if(dtPhotos.Rows.Count == 3){
                    Response.Write("<td style='padding-right:20px; padding-bottom:20px;'><img style='width:244px; height:174px; border: 1px solid #72c7cf;' class='img-responsive' src='./boats/" + dtPhotos.Rows[0]["vc_filename"].ToString() + "' Alt='" + dtPhotos.Rows[0]["vc_nombre"].ToString() +"' ");
                    Response.Write(" onmouseover='parent.document.frmBoatDetails.mainboatpic.src=this.src;' onmouseout='parent.document.frmBoatDetails.mainboatpic.src=parent.document.frmBoatDetails.hpicmain.value;' >");
                    Response.Write("</td>");
                    Response.Write("<td style='padding-left:20px; padding-bottom:20px;'><img style='width:244px; height:174px; border: 1px solid #72c7cf;' class='img-responsive' src='./boats/" + dtPhotos.Rows[1]["vc_filename"].ToString() + "' Alt='" + dtPhotos.Rows[1]["vc_nombre"].ToString() +"' ");
                    Response.Write(" onmouseover='parent.document.frmBoatDetails.mainboatpic.src=this.src;' onmouseout='parent.document.frmBoatDetails.mainboatpic.src=parent.document.frmBoatDetails.hpicmain.value;' >");
                    Response.Write("</td>");
                    Response.Write("</tr><tr>");
                    Response.Write("<td style='padding-right:20px; padding-top:20px;'><img style='width:244px; height:174px; border: 1px solid #72c7cf;' class='img-responsive' src='./boats/" + dtPhotos.Rows[2]["vc_filename"].ToString() + "' Alt='" + dtPhotos.Rows[2]["vc_nombre"].ToString() +"' ");
                    Response.Write(" onmouseover='parent.document.frmBoatDetails.mainboatpic.src=this.src;' onmouseout='parent.document.frmBoatDetails.mainboatpic.src=parent.document.frmBoatDetails.hpicmain.value;' >");
                    Response.Write("</td>");
                  }
                  else if(dtPhotos.Rows.Count == 4){
                    Response.Write("<td style='padding-right:18px; padding-bottom:18px;'><img style='width:244px; height:174px; border: 1px solid #72c7cf;' class='img-responsive' src='./boats/" + dtPhotos.Rows[0]["vc_filename"].ToString() + "' Alt='" + dtPhotos.Rows[0]["vc_nombre"].ToString() +"' ");
                    Response.Write(" onmouseover='parent.document.frmBoatDetails.mainboatpic.src=this.src;' onmouseout='parent.document.frmBoatDetails.mainboatpic.src=parent.document.frmBoatDetails.hpicmain.value;' >");
                    Response.Write("</td>");
                    Response.Write("<td style='padding-left:18px; padding-bottom:18px;'><img style='width:244px; height:174px; border: 1px solid #72c7cf;' class='img-responsive' src='./boats/" + dtPhotos.Rows[1]["vc_filename"].ToString() + "' Alt='" + dtPhotos.Rows[1]["vc_nombre"].ToString() +"' ");
                    Response.Write(" onmouseover='parent.document.frmBoatDetails.mainboatpic.src=this.src;' onmouseout='parent.document.frmBoatDetails.mainboatpic.src=parent.document.frmBoatDetails.hpicmain.value;' >");
                    Response.Write("</td>");
                    Response.Write("</tr><tr>");
                    Response.Write("<td style='padding-right:18px; padding-top:18px;'><img style='width:244px; height:174px; border: 1px solid #72c7cf;' class='img-responsive' src='./boats/" + dtPhotos.Rows[2]["vc_filename"].ToString() + "' Alt='" + dtPhotos.Rows[2]["vc_nombre"].ToString() +"' ");
                    Response.Write(" onmouseover='parent.document.frmBoatDetails.mainboatpic.src=this.src;' onmouseout='parent.document.frmBoatDetails.mainboatpic.src=parent.document.frmBoatDetails.hpicmain.value;' >");
                    Response.Write("</td>");
                    Response.Write("<td style='padding-left:18px; padding-top:18px;'><img style='width:244px; height:174px; border: 1px solid #72c7cf;' class='img-responsive' src='./boats/" + dtPhotos.Rows[3]["vc_filename"].ToString() + "' Alt='" + dtPhotos.Rows[3]["vc_nombre"].ToString() +"' ");
                    Response.Write(" onmouseover='parent.document.frmBoatDetails.mainboatpic.src=this.src;' onmouseout='parent.document.frmBoatDetails.mainboatpic.src=parent.document.frmBoatDetails.hpicmain.value;' >");
                    Response.Write("</td>");
                  }
              }
              Response.Write(@"</tr></table></div>");
          }
      }
  }
} 
