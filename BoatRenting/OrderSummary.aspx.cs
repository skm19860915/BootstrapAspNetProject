using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using AuthorizeNet.Api.Controllers;
using AuthorizeNet.Api.Contracts.V1;
using AuthorizeNet.Api.Controllers.Bases;
using System.IO;
using System.Data;
using System.Data.SqlClient;

using System.Net;

using System.Security.Authentication;


namespace BoatRenting
{

    public partial class OrderSummary : System.Web.UI.Page
    {
        public clsOrderSummary orderSummary
        {
            set
            {
                Session["session_OrderSummary"] = value;
            }

            get
            {
                if (Session["session_OrderSummary"] != null)
                    return (clsOrderSummary)Session["session_OrderSummary"];
                else
                    return null;


            }


        }



        public clsClientDetails clientDetails;


        public List<ListItem> Months = new List<ListItem>() {
    new ListItem() { Text="(1)Jan", Value="01" },
    new ListItem() { Text="(2)Feb", Value="02" },
    new ListItem() { Text="(3)Mar", Value="03" },
    new ListItem() { Text="(4)Apr", Value="04" },
    new ListItem() { Text="(5)May", Value="05" },
    new ListItem() { Text="(6)Jun", Value="06" },
    new ListItem() { Text="(7)Jul", Value="07" },
    new ListItem() { Text="(8)Aug", Value="08" },
    new ListItem() { Text="(9)Sep", Value="09" },
    new ListItem() { Text="(10)Oct", Value="10" },
    new ListItem() { Text="(11)Nov", Value="11" },
    new ListItem() { Text="(12)Dec", Value="12" },
};
        //public IEnumerable<int> Years
        //{
        //    get
        //    {
        //        return new List<ListItem>(new ListItem(){   Enumerable.Range(DateTime.Today.Year, 15)});
        //    }
        //}


    //    public static void ChargeCreditCard(String ApiLoginID, String ApiTransactionKey)

      private  string ChargeCreditCard(CreditCardDetails cd)

        {
            //  Console.WriteLine("Charge Credit Card Sample");

            ApiOperationBase<ANetApiRequest, ANetApiResponse>.RunEnvironment = AuthorizeNet.Environment.PRODUCTION;

            // define the merchant information (authentication / transaction id)
            ApiOperationBase<ANetApiRequest, ANetApiResponse>.MerchantAuthentication = new merchantAuthenticationType()
            {
                name = "67LD74ev6vSj",
                ItemElementName = ItemChoiceType.transactionKey,
                Item = "6j74c8p3VL5E7jf4",
            };

            var creditCard = new creditCardType
            {
                cardNumber = cd.CreditCardNumber,
                expirationDate = cd.ExpirationDate,
                cardCode = cd.CID

            };

            //standard api call to retrieve response
            var paymentType = new paymentType { Item = creditCard };

            // var customerType = new customerDataType {  };

            orderType ord = new orderType { description = "Boating Renting Website Purchase", invoiceNumber = cd.InvoiceNumber };

           customerAddressType addType = new customerAddressType{ firstName=cd.BillingFirstName , lastName=cd.BillingLastName,address=cd.BillingAddress, city=cd.BillingCity,state=cd.BillingState,zip=cd.BillingZip, country=cd.BillingCountry };


            var transactionRequest = new transactionRequestType
            {
                transactionType = transactionTypeEnum.authCaptureTransaction.ToString(),    // charge the card
                // Change the Amount
                amount = cd.AmountToCharge,
             //   amount = 1.00m,
                payment = paymentType,
                order = ord,
                billTo =addType

            };


            ServicePointManager.Expect100Continue = true;
            ServicePointManager.DefaultConnectionLimit = 9999;
          //  ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls12 | SecurityProtocolType.Ssl3;


            var request = new createTransactionRequest { transactionRequest = transactionRequest };



            // instantiate the contoller that will call the service
            var controller = new createTransactionController(request);
            controller.Execute();

            // get the response from the service (errors contained if any)
            var response = controller.GetApiResponse();

            string returnResponse = "Failed to Charge Credit Card: Unknown Error";


            if (response == null)
                return returnResponse;


            if (response != null && response.transactionResponse != null && response.transactionResponse.errors != null)
            {


                //if (response.transactionResponse != null && response.transactionResponse.errors.Length > 0)
                //{
                return "Failed to Charge the Credit Card: " + response.transactionResponse.errors[0].errorText;
                // Console.WriteLine("Transaction Error : " + response.transactionResponse.errors[0].errorCode + " " + response.transactionResponse.errors[0].errorText);
                //}
            }
            else if (response != null && response.messages.resultCode == messageTypeEnum.Ok)
            {
                //Console.WriteLine("Error: " + response.messages.message[0].code + "  " + response.messages.message[0].text);
                if (response.transactionResponse != null)
                {
                    // Console.WriteLine("Success, Auth Code : " + response.transactionResponse.authCode);

                    string res = response.transactionResponse.authCode;

                    returnResponse = "OK";

                }

            }


            /*      if (response.messages.resultCode == messageTypeEnum.Ok)
                  {
                      if (response.transactionResponse != null)
                      {
                          // Console.WriteLine("Success, Auth Code : " + response.transactionResponse.authCode);
                        returnResponse= "OK";

                      }
                  }
                  else
                  {
                      //Console.WriteLine("Error: " + response.messages.message[0].code + "  " + response.messages.message[0].text);

                      if (response.transactionResponse != null)
                      {
                          return   "Failed to Charge the Credit Card: "+ response.transactionResponse.errors[0].errorText;
                         // Console.WriteLine("Transaction Error : " + response.transactionResponse.errors[0].errorCode + " " + response.transactionResponse.errors[0].errorText);
                      }
                  }
                  */

            return returnResponse;

        }


        


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {

                Session[Util.Session_Client_Id] = null;


                BindCountryList();


                orderSummary = clsOrderSummary.getOrderSummary(Session[Util.Session_Cart_Id].ToString());

                // clientDetails = new clsClientDetails(Session[Util.Session_Client_Id].ToString());


                // SendEmailToRenter();

                // ChargeCreditCard("", "");

                string str = orderSummary.BoatDescription;

                if(str.Length > 250){
                    lblBoatDescription.Text = str.Substring(0, 250) + "<span id='dots'>...</span><span id='more'>" + str.Substring(251, str.Length - 251) + "</span>" +
                    //" <button type='button' onclick='readMoreFunction()' id='readMoreBtn'>Read More</button>";
                    " <button type='button' data-toggle='modal' id='readMoreBtn' data-target='#myBoatModel'>Read More</button>" + 
                    "<div class='modal fade' id='myBoatModel' tabindex='-1' role='dialog' aria-hidden='true'>" +
                    "<div class='modal-dialog' role='document'><div class='modal-content p-4' style='border-radius:20px;'><div class='modal-header'>" +
                    "<h4 class='modal-title'>Boat Description</h4><button type='button' class='mr-2 mt-3 close' data-dismiss='modal'>&times;</button></div><div class='modal-body'>" +
                    "<span>" + orderSummary.BoatDescription + "</span></div></div></div></div>";
                }
                else{
                    lblBoatDescription.Text = str;
                }

                var balance = Convert.ToInt32(orderSummary.TotalRentAmount) - Convert.ToInt32(orderSummary.MarinaOnlineReservationFee);
                lblBalance1.Text = balance.ToString();
                lblBalance2.Text = balance.ToString();

                if (orderSummary.RequestedCurrencyId == 2){
                    lblCurrencySymbol1.Text = lblCurrencySymbol1.Text = "&euro;";
                    lblCurrencySymbol2.Text = lblCurrencySymbol2.Text = "&euro;";
                    lblCurrencySymbol3.Text = lblCurrencySymbol3.Text = "&euro;";
                    lblCurrencySymbol4.Text = lblCurrencySymbol4.Text = "&euro;";
                }
                else{
                    lblCurrencySymbol1.Text = lblCurrencySymbol1.Text = "$";
                    lblCurrencySymbol2.Text = lblCurrencySymbol2.Text = "$";
                    lblCurrencySymbol3.Text = lblCurrencySymbol3.Text = "$";
                    lblCurrencySymbol4.Text = lblCurrencySymbol4.Text = "$";
                }

                ddExpMonth.DataSource = Months;
                ddExpMonth.DataTextField = "Text";
                ddExpMonth.DataValueField = "Value";

                ddExpMonth.DataBind();
                ddExpMonth.Items.Insert(0, "");

                ddExpMonth.SelectedIndex = 0;


                for (int i = DateTime.Now.Year; i < DateTime.Now.Year + 15; i++)
                    ddExpYear.Items.Add(i.ToString());

                //pnlGetUserName.Visible = false;

                //pnlCreateNewUser.Visible = true;

                ddExpYear.Items.Insert(0, "");

                ddExpYear.SelectedIndex = 0;


                pnlCreateNewUser.Style.Add("display", "block");

                pnlGetUserName.Style.Add("display", "none");


                pnlBillingAddress.Visible = false;

                // lnkPurchase.Visible = false;

                txtPassword.Attributes.Add("onblur", "LoginUserClick();");


                Session[Session[Util.Session_Cart_Id].ToString()] = false;

                if (Session["ClientID"] != null)
                {
                    chkReturningCustomer.Checked = true;
                    PopulateLoggedInUserDetails(Session["ClientID"].ToString());

                }

            }

            ScriptManager scriptManager = ScriptManager.GetCurrent(this.Page);
            scriptManager.RegisterPostBackControl(this.lnkCreateNewUser);
            scriptManager.RegisterPostBackControl(this.lnkReturingCustomer);

            //  scm.RegisterPostBackControl(btnOK);
        }


        /*

        void SendEmailToRenter()
        {

            //    Price { Price}
            //per: { SelectedTime} < br />


            //{ AmountTimePeriod}
            //x { Price}

            string body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("~/RenterEmailTemplate.html")))
            {
                body = reader.ReadToEnd();
            }


            if (txtUsername.Text.Trim() != "")
            {
                body = body.Replace("{Username}", txtUsername.Text);
                body = body.Replace("{Password}", txtPassword.Text);
            }
            else
            {
                body = body.Replace("{Username}", txtEmailNewUser.Text);
                body = body.Replace("{Password}", txtNewUserPassword.Text);
            }


            body = body.Replace("{BoatID}", orderSummary.BoatID.ToString());
            body = body.Replace("{BoatName}", orderSummary.BoatName);

            body = body.Replace("{BoatYear}", orderSummary.BoatYear);
            body = body.Replace("{BoatMake}", orderSummary.BoatMake);
            body = body.Replace("{BoatModel}", orderSummary.BoatModel);
            body = body.Replace("{BoatSize}", orderSummary.BoatSize);
            body = body.Replace("{MaximumPassengers}", orderSummary.MaximumPassengers.ToString());

            body = body.Replace("{BoatDescription}", orderSummary.BoatDescription);

            body = body.Replace("{Requirement}", orderSummary.BoatRequirements);

            body = body.Replace("{MarinaAddress}", orderSummary.AddressLine1 + " " + orderSummary.AddressLine2 + ", " + orderSummary.City + ", " + orderSummary.StateName + ", " + orderSummary.CountryName + " " + orderSummary.Zipcode);

            body = body.Replace("{OwnerName}", orderSummary.ContactName);


            body = body.Replace("{FacilityName}", orderSummary.FacilityName);

            body = body.Replace("{MarinaName}", orderSummary.MarinaName);

            body = body.Replace("{BoatAddress}", orderSummary.AddressLine1 + " " + orderSummary.AddressLine2 + ", " + orderSummary.City + ", " + orderSummary.StateName + ", " + orderSummary.CountryName + " " + orderSummary.Zipcode);


            body = body.Replace("{OwnerPhone}", orderSummary.MarinaPhone);

            body = body.Replace("{OwnerEmail}", orderSummary.MarinaEMail);

            body = body.Replace("{OwnerWebsite}", orderSummary.FacilityWebsite);

            body = body.Replace("{CancellationPolicy}", orderSummary.FacilityCancellationPolicy);

            body = body.Replace("{Direction}", orderSummary.FacilityDirection);

            body = body.Replace("{RentalStartDate}", orderSummary.RentStartDate);

            body = body.Replace("{RentalEndDate}", orderSummary.RentEndDate);

            //   body = body.Replace("{Price}", "$" + orderSummary.DailyOrHourlyPrice.ToString("F"));

            body = body.Replace("{SelectedTime}", orderSummary.RentingTimeFromTo);

            //if (orderSummary.RentTypeId == "1")
            //    body = body.Replace("{AmountTimePeriod}", orderSummary.NumberOfDays.ToString());
            //else if (orderSummary.RentTypeId == "2" || orderSummary.RentTypeId == "3")
            //    body = body.Replace("{AmountTimePeriod}", "1");

            //else if (orderSummary.RentTypeId == "4")
            //    body = body.Replace("{AmountTimePeriod}", orderSummary.NumberOfHoursRented.ToString());


            if (orderSummary.RequestedCurrencyId == 1)
            {
                body = body.Replace("{TotalPrice}", "$" + orderSummary.TotalRentAmount.ToString("F"));
                body = body.Replace("{RentalOnlineFee}", "$" + orderSummary.MarinaOnlineReservationFee.ToString("F"));

            }
            else
            {
                body = body.Replace("{TotalPrice}", "&euro;" + orderSummary.TotalRentAmount.ToString("F"));
                body = body.Replace("{RentalOnlineFee}", "&euro;" + orderSummary.MarinaOnlineReservationFee.ToString("F"));


            }


            body = body.Replace("{TaxRate}", orderSummary.TaxRate);




            body = body.Replace("{RenterFullname}", clientDetails.ClientFirstName + " " + clientDetails.ClientLastName);







            // Util.SendEMail("info@boatrenting.com", "mmathai@gmail.com", "Tentative Boat Reservation!", body);


           // Util.LogEMail("BookingRequest@rentaboat.com", clientDetails.ClientEmail + ",Enngines@aol.com,BookingRequest@rentaboat.com,Kenny@boatrenting.com,6318316033@vtext.com,mackenzie@jetskirentals.com,kdhsr@aol.com", "Boat Booking Request Sent from RentABoat!", body, "Order Summary Email to Renter");


            //  Util.SendEMail("BookingRequest@rentaboat.com", clientDetails.ClientEmail+ ",Enngines@aol.com,BookingRequest@rentaboat.com,Kenny@boatrenting.com,6318316033@vtext.com,mackenzie@jetskirentals.com,kdhsr@aol.com", "Boat Booking Request Sent from RentABoat!", body);

            Util.SendEMail("BookingRequest@rentaboat.com","mmathai@gmail.com", "Boat Booking Request Sent from RentABoat!", body + clientDetails.ClientEmail + ",Enngines@aol.com,BookingRequest@rentaboat.com,Kenny@boatrenting.com,6318316033@vtext.com,mackenzie@jetskirentals.com,kdhsr@aol.com");


         //   Util.SendEMail("BookingRequest@rentaboat.com", clientDetails.ClientEmail + ",Enngines@aol.com,BookingRequest@rentaboat.com,Kenny@boatrenting.com,6318316033@vtext.com,mackenzie@jetskirentals.com,kdhsr@aol.com", "Boat Booking Request Sent from RentABoat!", body);
           
            //  Enngines @aol.com,info @boatrenting.com,Kenny @boatrenting.com


        }

        */
        protected void lnkPurchase_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";



            if (Session[Util.Session_Client_Id] == null)
            {
                lblMessage.Text = "";

                //lblMessage.Text = "ERROR: Complete step 4: Press save. "; // MM 06/09/2017

              //  string alert = "alert('" + lblMessage.Text + "')";

                // lblMessage.ForeColor = System.Drawing.Color.Red;
                //  ScriptManager.RegisterStartupScript(upPay, upPay.GetType(), "popAlertFailed", alert, true);


                lblPopupErrorHeader.Text = "ERROR- COMPLETE STEP 4";
                lblPopupErrorMessage.Text = "ERROR: Complete step 4: Press save. ";
                mdlError.Show();


                return;

            }


                if (!UpdateOrInsertClientRecord())
            {

                return;

            }




            if (txtNameOnCard.Text == "")
            {
                lblMessage.Text = "Missing Name on the Card <br/>";


            }

         

            if (txtCardNumber.Text == "")
            {
                lblMessage.Text += "Missing Credit Card Number <br/>";

            }

            if (txtCID.Text == "")
            {
                lblMessage.Text += "Missing CID # <br/>";

            }

        
            if (ddExpMonth.SelectedIndex == 0 || ddExpMonth.SelectedItem == null)
            {


                lblMessage.Text += "Missing Expiration Month <br/>";

            }


            if (ddExpYear.SelectedIndex == 0 || ddExpYear.SelectedItem == null)
            {


                lblMessage.Text += "Missing Expiration Year <br/>";

            }


            if (lblMessage.Text != "")
            {

                lblMessage.ForeColor = System.Drawing.Color.Red;

                return;

            }








            string bAdd = txtAddress1NewUser.Text;
            string bCity = txtCityNewUser.Text;
            string bState = ddState.SelectedItem.Text;
            string bCountry = ddCountry.SelectedItem.Text;
            if (chkBillingAddressDifferent.Checked)
            {

                if (ddBillingState.SelectedIndex == 0 || ddBillingState.SelectedItem == null)
                {
                    lblMessage.Text = "Missing Billing State ";

                    lblMessage.ForeColor = System.Drawing.Color.Red;

                    return;
                }

                if (ddBillingCountry.SelectedIndex == 0 || ddBillingCountry.SelectedItem == null)
                {
                    lblMessage.Text = "Missing Billing Country ";

                    lblMessage.ForeColor = System.Drawing.Color.Red;

                    return;
                }


                bAdd = txtBilingStreetAddress.Text;

                bCity = txtBillingCity.Text;
                bState = ddBillingState.SelectedItem.Value;
                bCountry = ddBillingCountry.SelectedItem.Value;



            }


            string expDate = "";

            expDate = ddExpMonth.SelectedItem.Value + ddExpYear.SelectedItem.Text.Substring(2,2);


          string[] name =  txtNameOnCard.Text.Split(new char[0], StringSplitOptions.RemoveEmptyEntries);

            string fname = "";
            string lname = "";

            if (name.Length > 1)
            {
                fname = name[0];
                lname = name[1];

            }
            else
            {
                fname = txtNameOnCard.Text;
               

            }


            decimal amountCharge= orderSummary.MarinaOnlineReservationFee;

            if (orderSummary.RequestedCurrencyId == 2)
            {
                amountCharge = Math.Round( amountCharge * Util.getExchangeRate("2"),2);
            }


            CreditCardDetails creditCard = new CreditCardDetails { AmountToCharge=orderSummary.MarinaOnlineReservationFee, BillingAddress=bAdd,

                BillingCity = bCity, BillingState = bState, BillingCountry=bCountry,
                CreditCardNumber = txtCardNumber.Text.Trim(), CID=txtCID.Text, ExpirationDate=expDate,BillingFirstName = fname, BillingLastName= lname

            };


            if (!CheckAvailablity())

            {

                lblModelBody.Text = "One or more Dates Requested is not available. Please try another date(s).";
                lblModelHeader.Text = "SELECTED DATES ARE UNAVAILABLE";

                
                mdlPopup.Show();

                return;


            }

            string resp = "OK";
           if (Util.IsProduction)
               resp = ChargeCreditCard(creditCard);

          //  string resp = "OK";

            if (resp != "OK")
            {


                lblMessage.Text = resp;
               lblMessage.ForeColor = System.Drawing.Color.Red;


               return;
            }

            else
            {

                //   lblMessage.Text = "Successfully Charged from the Credit Card.";

                // Book the Boat

                try
                {
                    using (SqlConnection con = Util.getConnection())
                    {
                        using (SqlCommand cmd = new SqlCommand("[SP_BR_BOOKDATEXBOAT_SAVE]", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@p_in_boatID", Session[Util.Session_Selected_BoatID].ToString());
                            cmd.Parameters.AddWithValue("@p_in_MarinaId", Session[Util.Session_Selected_MarinaID].ToString());

                            cmd.Parameters.AddWithValue("@p_in_kartid", orderSummary.KartID);
                            cmd.Parameters.AddWithValue("@UserID", Session[Util.Session_Client_Id].ToString());
                            cmd.ExecuteNonQuery();
                            Session[Session[Util.Session_Cart_Id].ToString()] = true;

                            Response.Redirect("OrderSummaryConfirm.aspx", false);


                        }
                    }

                }
                catch(Exception ex)
                {


                    lblMessage.Text = "Please contact BoatRenting.com. Could not process the request.";

                    Util.SendEMail("info@boatrenting.com", "mmathai@gmail.com,info@boatrenting.com", "Exception Occured ..", "Exception occured while try to save the booking. The credit card was charged. Contact System Administrator. Kart_ID=" + orderSummary.KartID.ToString() + "<br/> Exception:" + ex.Message);


                }

            }



        }
        protected void lnkNewUser_Click(object sender, EventArgs e)
        {
            //pnlGetUserName.Visible = false;
            //pnlCreateNewUser.Visible = true;

            pnlCreateNewUser.Style.Add("display", "block");

            pnlGetUserName.Style.Add("display", "none");

        }
        protected void lnkBack_Click(object sender, EventArgs e)
        {
            //pnlGetUserName.Visible = true;

            //pnlCreateNewUser.Visible = false;

            pnlCreateNewUser.Style.Add("display", "none");

            pnlGetUserName.Style.Add("display", "block");

        }

        protected void chkReturningCustomer_CheckedChanged(object sender, EventArgs e)
        {
            Session[Util.Session_Client_Id] = null;


            ClearAllNewUserFields();
            txtUsername.Text = "";
            txtPassword.Text = "";

           

            if (chkReturningCustomer.Checked)
            {

                //pnlCreateNewUser.Visible = false;

                //pnlGetUserName.Visible = true;

                pnlCreateNewUser.Style.Add("display", "none");

                pnlGetUserName.Style.Add("display", "block");

               

                pnlPassword.Visible = false;

                lnkCreateNewUser.Text = "SAVE CHANGES";


            }
            else
            {
                //pnlGetUserName.Visible = false;
                //pnlCreateNewUser.Visible = true;
                pnlCreateNewUser.Style.Add("display", "block");

                pnlGetUserName.Style.Add("display", "none");

                pnlPassword.Visible = true;

                lnkCreateNewUser.Text = "SAVE";

                

            }


          //  lnkPurchase.Visible = false;

        }


        void ClearAllNewUserFields()
        {

            txtFirstNameNewUser.Text = "";

            txtAddress1NewUser.Text = "";
            txtAddress2NewUser.Text = "";
            txtCityNewUser.Text = "";
            txtLastNameNewUser.Text = "";
            txtZipcodeNewUser.Text = "";
            ddState.Items.Clear();
            ddCountry.SelectedIndex = 0;
            txtContactPhoneNewUser.Text = "";
            txtEmailNewUser.Text = "";
            txtComfirmEmailNewUser.Text = "";

            txtNewUserPassword.Text = "";
            txtNewUserPasswordConfirm.Text = "";



        }


        void BindCountryList()
        {


            DataTable dtC = Util.getDataSet("execute [SP_BR_COUNTRY_LIST] ").Tables[0];

      ddBillingCountry.DataSource=      ddCountry.DataSource = dtC;


        ddBillingCountry.DataTextField=    ddCountry.DataTextField = "vc_name";
       ddBillingCountry.DataValueField=     ddCountry.DataValueField = "in_countryID";

            ddCountry.DataBind();

            ddBillingCountry.DataBind();


            ddCountry.Items.Insert(0, "Select a Country");

            ddBillingCountry.Items.Insert(0, "Select a Country");


            //    ddCountry.SelectedIndex = 1;

            // ddBillingCountry.SelectedIndex = 1;

            ddCountry.ClearSelection();
            if (ddCountry.Items.FindByValue("1") != null)
                ddCountry.Items.FindByValue("1").Selected = true;

            ddBillingCountry.ClearSelection();

            if (ddBillingCountry.Items.FindByValue("1") != null)
                ddBillingCountry.Items.FindByValue("1").Selected = true;

            bindStateList();
            bindStateListBilling();


            //ddState.Items.Clear();

            //ddBillingState.Items.Clear();



        }


        void PopulateLoggedInUserDetails(string clientid)
        {

            Session[Util.Session_Client_Id] = clientid;

            DataTable dtClientDetails = Util.getDataSet("execute [usp_get_client_details] @Client_ID=" + clientid).Tables[0];

            if (dtClientDetails.Rows.Count > 0)
            {


                Session[Util.Session_Client_Id] = dtClientDetails.Rows[0]["in_ClientID"].ToString();


                txtFirstNameNewUser.Text = dtClientDetails.Rows[0]["ClientFirstName"].ToString();
                txtLastNameNewUser.Text = dtClientDetails.Rows[0]["ClientLastName"].ToString();
                txtAddress1NewUser.Text = dtClientDetails.Rows[0]["ClientAddress"].ToString();

                txtAddress2NewUser.Text = dtClientDetails.Rows[0]["ClientAddress2"].ToString();

                ddCountry.ClearSelection();

                if (ddCountry.Items.FindByValue(dtClientDetails.Rows[0]["in_countryID"].ToString()) != null)

                    ddCountry.Items.FindByValue(dtClientDetails.Rows[0]["in_countryID"].ToString()).Selected = true;

                bindStateList();


                ddState.ClearSelection();

                if (ddState.Items.FindByValue(dtClientDetails.Rows[0]["in_stateID"].ToString()) != null)

                    ddState.Items.FindByValue(dtClientDetails.Rows[0]["in_stateID"].ToString()).Selected = true;



                txtCityNewUser.Text = dtClientDetails.Rows[0]["ClientCity"].ToString();

                txtZipcodeNewUser.Text = dtClientDetails.Rows[0]["ClientZip"].ToString();

                txtContactPhoneNewUser.Text = dtClientDetails.Rows[0]["ClientContactPhone"].ToString();

                txtEmailNewUser.Text = dtClientDetails.Rows[0]["ClientEmail"].ToString();

                txtComfirmEmailNewUser.Text = dtClientDetails.Rows[0]["ClientEmail"].ToString();

                //pnlCreateNewUser.Visible = true;
                //pnlGetUserName.Visible = false;


                pnlCreateNewUser.Style.Add("display", "block");

                pnlGetUserName.Style.Add("display", "none");


                pnlPassword.Visible = false;


                lnkCreateNewUser.Text = "SAVE CHANGES";

                lnkPurchase.Visible = true;

                clsOrderSummary.LoadClientDetails(orderSummary, Session[Util.Session_Client_Id].ToString());

                StartLogin(Session[Util.Session_Client_Id].ToString());

            }

            else
            {
                lblReturingCustomerMessage.Text = "Could not find associated client details.";



            }

        }
        
        

        protected void lnkReturingCustomer_Click(object sender, EventArgs e)
        {

            lblReturingCustomerMessage.Text = "";

            Session[Util.Session_Client_Id] = null;

            // if (txtUsername.Text.Trim() == "")
            // {
            //     lblReturingCustomerMessage.Text = "Please provide valid User name.";
            //     return;
            // }
            // if (txtPassword.Text.Trim() == "")
            // {
            //     lblReturingCustomerMessage.Text = "Please provide valid Password.";
            //     return;
            // }

            Validate("LoginGroup");
            if(!Page.IsValid){
                return;
            }

            DataTable dtUser = Util.getDataSet("execute usp_client_login_with_pass @P_VC_UserName='" + txtUsername.Text + "', @P_VC_Password='" + txtPassword.Text.Trim() +"'").Tables[0];


            if (dtUser.Rows.Count > 0)
            {

               



                DataTable dtClientDetails = Util.getDataSet("execute [usp_get_client_details] @Client_ID=" + dtUser.Rows[0]["in_ClientID"].ToString()).Tables[0];

                if (dtClientDetails.Rows.Count > 0)
                {


                    Session["uName"] = txtUsername.Text;
                    Session["uPass"] = txtPassword.Text;


                    Session[Util.Session_Client_Id] = dtClientDetails.Rows[0]["in_ClientID"].ToString();


                    txtFirstNameNewUser.Text = dtClientDetails.Rows[0]["ClientFirstName"].ToString();
                    txtLastNameNewUser.Text = dtClientDetails.Rows[0]["ClientLastName"].ToString();
                    txtAddress1NewUser.Text = dtClientDetails.Rows[0]["ClientAddress"].ToString();

                    txtAddress2NewUser.Text = dtClientDetails.Rows[0]["ClientAddress2"].ToString();

                    ddCountry.ClearSelection();

                    if (ddCountry.Items.FindByValue(dtClientDetails.Rows[0]["in_countryID"].ToString()) != null)

                        ddCountry.Items.FindByValue(dtClientDetails.Rows[0]["in_countryID"].ToString()).Selected = true;

                    bindStateList();


                    ddState.ClearSelection();

                    if (ddState.Items.FindByValue(dtClientDetails.Rows[0]["in_stateID"].ToString()) != null)

                        ddState.Items.FindByValue(dtClientDetails.Rows[0]["in_stateID"].ToString()).Selected = true;



                    txtCityNewUser.Text = dtClientDetails.Rows[0]["ClientCity"].ToString();

                    txtZipcodeNewUser.Text = dtClientDetails.Rows[0]["ClientZip"].ToString();

                    txtContactPhoneNewUser.Text = dtClientDetails.Rows[0]["ClientContactPhone"].ToString();

                    txtEmailNewUser.Text = dtClientDetails.Rows[0]["ClientEmail"].ToString();

                    txtComfirmEmailNewUser.Text = dtClientDetails.Rows[0]["ClientEmail"].ToString();

                    //pnlCreateNewUser.Visible = true;
                    //pnlGetUserName.Visible = false;


                    pnlCreateNewUser.Style.Add("display","block");

                    pnlGetUserName.Style.Add("display","none");


                    pnlPassword.Visible = false;


                    lnkCreateNewUser.Text = "SAVE CHANGES";

                    lnkPurchase.Visible = true;

                    clsOrderSummary.LoadClientDetails(orderSummary, Session[Util.Session_Client_Id].ToString());

                    StartLogin(Session[Util.Session_Client_Id].ToString());


                }

                else
                {
                    lblReturingCustomerMessage.Text = "Could not find associated client details.";



                }


            }
            else

            {
                lblReturingCustomerMessage.Text = "Invalid user name and/or password.";



            }



        }


        void bindStateList()
        {

            if (ddCountry.SelectedIndex > 0)
            {

                DataTable dtState = Util.getDataSet("execute [SP_BR_STATE_LIST] @CountryID=" + ddCountry.SelectedItem.Value ).Tables[0];

                ddState.DataSource = dtState;

                ddState.DataTextField = "vc_name";
                ddState.DataValueField = "in_stateID";
                ddState.DataBind();

                ddState.Items.Insert(0, "Select a State");

                ddState.SelectedIndex = 0;




            }

        }

        void bindStateListBilling()
        {

            if (ddBillingCountry.SelectedIndex > 0)
            {

                DataTable dtState = Util.getDataSet("execute [SP_BR_STATE_LIST] @CountryID=" + ddBillingCountry.SelectedItem.Value).Tables[0];

                ddBillingState.DataSource = dtState;

                ddBillingState.DataTextField = "vc_name";
                ddBillingState.DataValueField = "in_stateID";
                ddBillingState.DataBind();

                ddBillingState.Items.Insert(0, "Select a State");

                ddBillingState.SelectedIndex = 0;




            }

        }

        protected void ddCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            bindStateList();

        }

        protected void ddBillingCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            bindStateListBilling();

        }

        private bool UpdateRecord()
        {

            lblMessageNewUserSave.Text = "";

            try
            {
                using (SqlConnection con = Util.getConnection())
                {
                    using (SqlCommand cmd = new SqlCommand("[usp_update_client]", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@in_clientID", Session[Util.Session_Client_Id].ToString());
                        cmd.Parameters.AddWithValue("@vc_firstName", txtFirstNameNewUser.Text.Trim());
                        cmd.Parameters.AddWithValue("@vc_lastName", txtLastNameNewUser.Text.Trim());
                        cmd.Parameters.AddWithValue("@vc_address",txtAddress1NewUser.Text.Trim());
                        cmd.Parameters.AddWithValue("@vc_address2", txtAddress2NewUser.Text.Trim());
                        cmd.Parameters.AddWithValue("@vc_city", txtCityNewUser.Text.Trim());
                        cmd.Parameters.AddWithValue("@ch_Zip",txtZipcodeNewUser.Text.Trim());


                  
                        cmd.Parameters.AddWithValue("@in_stateID", ddState.SelectedItem.Value);

                        cmd.Parameters.AddWithValue("@in_countryID", ddCountry.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@vc_contactPhone",txtContactPhoneNewUser.Text.Trim());

                        cmd.Parameters.AddWithValue("@vc_email", txtEmailNewUser.Text.Trim());

                        //  ------ This is need to updated once the Cleint login
                        //cmd.Parameters.AddWithValue("@in_clientID", Session[Util.Session_Client_Id].ToString());


                        cmd.ExecuteNonQuery();

                        lblMessageNewUserSave.Text = "Successfully saved";
                        lblMessageNewUserSave.ForeColor = System.Drawing.Color.Green;


                            
                    }
                }

                clsOrderSummary.LoadClientDetails(orderSummary, Session[Util.Session_Client_Id].ToString());

            }

            catch (Exception ex)
            {

                lblMessageNewUserSave.Text = "Error while adding to Cart " + ex.Message;

                lblMessageNewUserSave.ForeColor = System.Drawing.Color.Red;
                return false;

            }

            return true;


        }

        private void StartLogin(string clientid)
        {

            DataTable dtLogin = Util.getDataSet("execute usp_get_user_from_client_id @in_clientID=" + clientid).Tables[0];

         
            if (dtLogin.Rows.Count > 0)
            {
                Session.Add("userID", dtLogin.Rows[0]["in_userID"].ToString());
                Session.Add("userLevelID", dtLogin.Rows[0]["in_userLevelID"].ToString());
                Session.Add("MarinaID", dtLogin.Rows[0]["in_MarinaID"].ToString());
                Session.Add("BusinessName", dtLogin.Rows[0]["vc_BusinessName"].ToString());
                // Session.Add("defaultPage", "admin/" + Convert.ToString(dt.Rows[0]["vc_defaultHomePage"].ToString()) + dotNET);
                Session.Add("userName", dtLogin.Rows[0]["vc_username"].ToString());
                Session["loginRequested"] = true;

                Session["ClientID"] = clientid;


            }

            //ctlTopMenu.checkLogin();


          //  upLogin.Update();

        }

        private bool InsertNewRecord()
        {


            txtNewUserPasswordConfirm.BorderColor = System.Drawing.ColorTranslator.FromHtml("#ccc");


            txtNewUserPasswordConfirm.Attributes.Remove("placeholder");

            //txtUsernameNew.Attributes.Remove("placeholder");

          // Session[Util.Session_Client_Id] =

          //Check if the username exists

          lblMessageNewUserSave.Text = "";
            DataTable dtUSerExists = Util.getDataSet("execute usp_check_if_user_exists @vc_username='" + txtEmailNewUser.Text.Trim() +"'" ).Tables[0];

            if (dtUSerExists.Rows.Count > 0)
            {

                
                txtEmailNewUser.BorderColor = System.Drawing.Color.Red;
                txtEmailNewUser.Attributes.Add("placeholder", "Email already exists");


                lblMessageNewUserSave.Text = "Email  exists.";

                lblMessageNewUserSave.ForeColor = System.Drawing.Color.Red;
                return false;

            }


            if (txtEmailNewUser.Text.Trim() == "")
            {

                lblMessageNewUserSave.Text = "Email can't be empty.";

                lblMessageNewUserSave.ForeColor = System.Drawing.Color.Red;

                return false;

            }

            if (txtNewUserPassword.Text.Trim() == "")
            {

                lblMessageNewUserSave.Text = "Password can't be empty.";

                lblMessageNewUserSave.ForeColor = System.Drawing.Color.Red;

                return false;

            }


            if (txtEmailNewUser.Text.Trim() != txtComfirmEmailNewUser.Text.Trim())
            {

                lblMessageNewUserSave.Text = "Email does not match.";

                lblMessageNewUserSave.ForeColor = System.Drawing.Color.Red;

                return false;

            }


            if (txtNewUserPassword.Text.Trim() != txtNewUserPasswordConfirm.Text.Trim())
            {

                txtNewUserPasswordConfirm.BorderColor = System.Drawing.Color.Red;
                txtNewUserPasswordConfirm.Attributes.Add("placeholder", "password does not match");


                lblMessageNewUserSave.Text = "Password does not match.";

                lblMessageNewUserSave.ForeColor = System.Drawing.Color.Red;

                return false;

            }


            if (ddState.SelectedItem == null || ddState.SelectedIndex < 1)
            {

                lblMessageNewUserSave.Text = "Please select a State.";

                lblMessageNewUserSave.ForeColor = System.Drawing.Color.Red;

                return false;

            }

            if (ddCountry.SelectedItem == null || ddCountry.SelectedIndex < 1)
            {

                lblMessageNewUserSave.Text = "Please select a Country.";

                lblMessageNewUserSave.ForeColor = System.Drawing.Color.Red;

                return false;

            }



            try
            {
                using (SqlConnection con = Util.getConnection())
                {
                    using (SqlCommand cmd = new SqlCommand("[usp_insert_client]", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                    
                        cmd.Parameters.AddWithValue("@vc_firstName", txtFirstNameNewUser.Text.Trim());
                        cmd.Parameters.AddWithValue("@vc_lastName", txtLastNameNewUser.Text.Trim());
                        cmd.Parameters.AddWithValue("@vc_address", txtAddress1NewUser.Text.Trim());
                        cmd.Parameters.AddWithValue("@vc_address2", txtAddress2NewUser.Text.Trim());
                        cmd.Parameters.AddWithValue("@vc_city", txtCityNewUser.Text.Trim());
                        cmd.Parameters.AddWithValue("@ch_Zip", txtZipcodeNewUser.Text.Trim());



                        cmd.Parameters.AddWithValue("@in_stateID", ddState.SelectedItem.Value);

                        cmd.Parameters.AddWithValue("@in_countryID", ddCountry.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@vc_contactPhone", txtContactPhoneNewUser.Text.Trim());

                        cmd.Parameters.AddWithValue("@vc_email", txtEmailNewUser.Text.Trim());

                        cmd.Parameters.AddWithValue("@vc_username", txtEmailNewUser.Text.Trim());



                        cmd.Parameters.AddWithValue("@Password", txtNewUserPassword.Text.Trim());


                        //  ------ This is need to updated once the Cleint login
                        //cmd.Parameters.AddWithValue("@in_clientID", Session[Util.Session_Client_Id].ToString());


                        SqlDataReader rd =     cmd.ExecuteReader();

                        if (rd.Read())
                            Session[Util.Session_Client_Id] = rd[0].ToString();



                        Session["uName"] = txtEmailNewUser.Text;
                        Session["uPass"] = txtNewUserPassword.Text;


                        // Login Process

                        StartLogin(Session[Util.Session_Client_Id].ToString());




                        lblMessageNewUserSave.Text = "Successfully Saved. Proceed to Step 5 for Payment.";
                        lblMessageNewUserSave.ForeColor = System.Drawing.Color.Green;

                        rd.Close();

                        pnlCheckReturningUser.Visible = false;

                       // lnkPurchase.Visible = true;

                    }
                }


                clsOrderSummary.LoadClientDetails(orderSummary, Session[Util.Session_Client_Id].ToString());
            }

            catch (Exception ex)
            {

                lblMessageNewUserSave.Text = "Error while adding to Cart " + ex.Message;

                lblMessageNewUserSave.ForeColor = System.Drawing.Color.Red;

                return false;
            }



            return true;


        }


        bool UpdateOrInsertClientRecord()
        {


            if (Session[Util.Session_Client_Id] != null)
            {

             return   UpdateRecord();

            }

            else
            {

           return     InsertNewRecord();


            }


        }


        protected void lnkCreateNewUser_Click(object sender, EventArgs e)
        {




            if (Session[Util.Session_Client_Id] != null)
            {

                UpdateRecord();

            }

            else
            {

              InsertNewRecord();

               
            }




        }

        protected void lnkForgotPassword_Click(object sender, EventArgs e)
        {

            divEnterEmail.Visible = true;
            lblEnterEmailHeader.Text = "PROVIDE THE EMAIL ADDRESS OF THE ACCOUNT";
            lblMessageForgotPassword.Text = "";
            btnSendPassword.Visible = true;
            btnCancel.Text = "Cancel";

            txtEmailForgotPassword.Text = "";

           modalForgotPassword.Show();



     
        }

        protected void lnkGoback_Click(object sender, EventArgs e)
        {
            Response.Redirect("Calendar.aspx");

        }




        bool CheckAvailablity()
        {
            bool available = true;
            using (SqlConnection con = Util.getConnection())
            {
                using (SqlCommand cmd = new SqlCommand("[SP_BR_KART_ADDITION_AVAILABILITY]", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@p_in_boatID", Session[Util.Session_Selected_BoatID].ToString());
                    cmd.Parameters.AddWithValue("@p_in_MarinaId", Session[Util.Session_Selected_MarinaID].ToString());


                    //if (Session[Util.Session_Selected_RentType].ToString() == "4") // Hourly , check full day availability
                    //    cmd.Parameters.AddWithValue("@p_in_typerentID", "1");
                    //else
                        cmd.Parameters.AddWithValue("@p_in_typerentID", Session[Util.Session_Selected_RentType].ToString());


                    cmd.Parameters.AddWithValue("@p_begindate", ((DateTime)Session[Util.Session_Selected_PickupDate]).ToShortDateString());

                    RentTime rtD;



                    if (Session[Util.Session_Selected_DropOffTime] != null)
                     rtD = (RentTime) Session[Util.Session_Selected_DropOffTime];
                    else
                    {

                        string[] rentH = Util.getMarinaOpenAndCloseTime(Session[Util.Session_Selected_MarinaID].ToString(), Session[Util.Session_Selected_RentType].ToString(), Session[Util.Session_Selected_BoatID].ToString());


                        RentTime rtB = new RentTime();
                        rtB.Text = rentH[0];
                        rtB.Value = rentH[2];

                        RentTime rtE = new RentTime();
                        rtE.Text = rentH[1];
                        rtE.Value = rentH[3];


                        Session[Util.Session_Selected_DropOffTime] = rtE;


                        Session[Util.Session_Selected_PickupTime] = rtB;

                             rtD = (RentTime)Session[Util.Session_Selected_DropOffTime];

                    }

                    //rt.Text = ddEndTime.SelectedItem.Text;
                    //rt.Value = ddEndTime.SelectedItem.Value;
                   // =
                    //Session[Util.Session_Selected_DropOffTime] = rt;
                    RentTime rtP = (RentTime)Session[Util.Session_Selected_PickupTime];


                    cmd.Parameters.AddWithValue("@p_beginhour", rtP.Text);

                    cmd.Parameters.AddWithValue("@p_endhour", rtD.Text);
                    cmd.Parameters.AddWithValue("@p_hours_military_from", rtP.Value);
                    cmd.Parameters.AddWithValue("@p_hours_military_to", rtD.Value);


                  

                    if (Session[Util.Session_Selected_DropOffDate] == null)
                            Session[Util.Session_Selected_DropOffDate] = Session[Util.Session_Selected_PickupDate];

                    cmd.Parameters.AddWithValue("@p_enddate", ((DateTime)Session[Util.Session_Selected_DropOffDate]).ToShortDateString());
                    DataSet dst = new DataSet();

                    SqlDataAdapter da = new SqlDataAdapter(cmd);

                    da.Fill(dst);

                    DataTable dtA = dst.Tables[0];

                    if (dtA.Rows[0][0].ToString() == "0")
                        available = false;




                }
            }



            return available;
        }






        protected void chkBillingAddressDifferent_CheckedChanged(object sender, EventArgs e)
        {
            if (chkBillingAddressDifferent.Checked)
            {
                pnlBillingAddress.Visible = true;

            }
            else
                pnlBillingAddress.Visible = false;





        }








        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("Calendar.aspx");
        }

        protected void btnSendPassword_Click(object sender, EventArgs e)
        {
            if (txtEmailForgotPassword.Text.Trim() == "")
            {

                lblMessageForgotPassword.Text = "Please provide a email as the user name";
                lblMessageForgotPassword.ForeColor = System.Drawing.Color.Red;

                modalForgotPassword.Show();
                return;

            }

            DataTable dtPass = Util.getDataSet("execute usp_get_password_from_username @vc_username='" + txtEmailForgotPassword.Text + "'").Tables[0];

            if (dtPass.Rows.Count > 0)
            {


                // Util.SendEMail("info@boatrenting.com", "mmathai@gmail.com", "Forgot Password - " + txtEmailForgotPassword.Text, "User name/Email Address :" + txtEmailForgotPassword.Text + "<br/>" + "Password :" + dtPass.Rows[0]["vc_password"].ToString());


                //Util.LogEMail("info@boatrenting.com", txtEmailForgotPassword.Text + ",info@boatrenting.com", "Forgot Password - " + txtEmailForgotPassword.Text, "User name/Email Address :" + txtEmailForgotPassword.Text + "<br/>" + "Password :" + dtPass.Rows[0]["vc_password"].ToString(), "Order Summary Send Password" );


                Util.SendEMail("info@boatrenting.com", txtEmailForgotPassword.Text+ ",info@boatrenting.com,enngines@aol.com,6318316033@vtext.com,mackenzie@jetskirentals.com,kdhsr@aol.com", "Forgot Password - " + txtEmailForgotPassword.Text, "User name/Email Address :" + txtEmailForgotPassword.Text + "<br/>" + "Password :" + dtPass.Rows[0]["vc_password"].ToString());


                lblMessageForgotPassword.Text = "Please check the email for the password. Email sent to " + dtPass.Rows[0]["vc_email"].ToString();
                lblMessageForgotPassword.ForeColor = System.Drawing.Color.Green;

                btnSendPassword.Visible = false;

                btnCancel.Text = "OK";

                divEnterEmail.Visible = false;
                lblEnterEmailHeader.Text = "Password Sent to Email address";

                modalForgotPassword.Show();


            }
            else
            {
                lblMessageForgotPassword.Text = "Email provided does not exists. Please try again. ";
                lblMessageForgotPassword.ForeColor = System.Drawing.Color.Red;

                modalForgotPassword.Show();

            }

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            // Session["listType"] = 0;

            // lblMessage.Text = "Street : " + txtStreetName.Value + " City: "+ txtCityName.Value + "State:" + txtState.Value + " Zip : " + txtZipCode.Value + " Lat: " + txtLat.Value + "Lon: " + txtLon.Value;
            // getResultPageWise(1, txtSearch.Value);
        }
    }








    public class CreditCardDetails
    {

        public string CreditCardNumber;
        public string CID;
        public string ExpirationDate; //MMYY
    
        public string InvoiceNumber;
        public string BillingAddress;
        public string BillingFirstName;
        public string BillingLastName;
        public string BillingCity;
        public string BillingState;
        public string BillingCountry;
        public string BillingZip;
        public decimal AmountToCharge;

         


    }


}