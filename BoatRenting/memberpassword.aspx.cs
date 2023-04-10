using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class memberspassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        if (txtEmail.Text.Trim() == "")
        {

            lblMessage.Text = "Please provide a email as the user name";
            lblMessage.ForeColor = System.Drawing.Color.Red;

          
            return;

        }

        DataTable dtPass = Util.getDataSet("execute usp_get_password_from_username @vc_username='" + txtEmail.Text + "'").Tables[0];

        if (dtPass.Rows.Count > 0)
        {


            // Util.SendEMail("info@boatrenting.com", "mmathai@gmail.com", "Forgot Password - " + txtEmailForgotPassword.Text, "User name/Email Address :" + txtEmailForgotPassword.Text + "<br/>" + "Password :" + dtPass.Rows[0]["vc_password"].ToString());

            Util.SendEMail("info@boatrenting.com", txtEmail.Text + ",info@boatrenting.com,enngines@aol.com,6318316033@vtext.com,mackenzie@jetskirentals.com,kdhsr@aol.com", "Forgot Password - " + txtEmail.Text, "User name/Email Address :" + txtEmail.Text + "<br/>" + "Password :" + dtPass.Rows[0]["vc_password"].ToString());

            lblMessage.Text = "Please check the email for the password. Email send to " + dtPass.Rows[0]["vc_email"].ToString();
            lblMessage.ForeColor = System.Drawing.Color.Green;

         

         


        }
        else
        {
            lblMessage.Text = "Email provided does not exists. Please try again. ";
            lblMessage.ForeColor = System.Drawing.Color.Red;

           

        }

    }
}