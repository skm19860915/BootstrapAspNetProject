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
using System.Threading;

namespace BoatRenting
{

    public partial class OrderSummaryConfirm : System.Web.UI.Page
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


     
     


        


        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session[Util.Session_Cart_Id] == null)
            {
                Response.Redirect("index.aspx");
                return;
            }
            if (Session[Session[Util.Session_Cart_Id].ToString()] == null)
            {
                Response.Redirect("index.aspx");
                return;

            }

            if ((bool)Session[Session[Util.Session_Cart_Id].ToString()] == false)
            {
                Response.Redirect("index.aspx");
                return;

            }


            if (!Page.IsPostBack)
            {



                if (orderSummary.RequestedCurrencyId == 2)
               lblCurrencySymbol1.Text = lblCurrencySymbol2.Text=     lblCurrencySymbol.Text =  "&euro;";
                else
                    lblCurrencySymbol1.Text = lblCurrencySymbol2.Text = lblCurrencySymbol.Text  = "$";




                //SendEmailToRenter();

                //  SendEMailToOwner();

                /*
                ThreadStart th = new ThreadStart(EmailSendThread);
                Thread ch = new Thread(th);

                ch.IsBackground = true;

                ch.Start();

              */

                SendEmailToRenter();

                SendEMailToOwner();

            }

           
        }


        public void EmailSendThread()
        {
            SendEmailToRenter();

            SendEMailToOwner();

        }

        void SendEMailToOwner()
        {

            //    Price { Price}
            //per: { SelectedTime} < br />


            //{ AmountTimePeriod}
            //x { Price}

            string body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("~/OwnerEmailTemplate.html")))
            {
                body = reader.ReadToEnd();
            }
            body = body.Replace("{FacilityName}", orderSummary.FacilityName);
            body = body.Replace("{CustomerName}", orderSummary.ClientFirstName + " " + orderSummary.ClientLastName);

            body = body.Replace("{CustomerAddress}", orderSummary.ClientAddress + ", " + orderSummary.ClientCity +", " + orderSummary.ClientState+" " + orderSummary.ClientCountry);
            body = body.Replace("{CustomerPhone}", orderSummary.ClientContactPhone);
            body = body.Replace("{CustomerEMail}", orderSummary.ClientEmail);
            body = body.Replace("{BoatName}", orderSummary.BoatName);
            body = body.Replace("{BoatMake}", orderSummary.BoatMake);

            body = body.Replace("{BoatModel}", orderSummary.BoatModel);

            body = body.Replace("{BoatYear}", orderSummary.BoatYear);

            body = body.Replace("{BoatSize}", orderSummary.BoatSize );

            body = body.Replace("{RentType}", orderSummary.RentTypeDescription);

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

            if (orderSummary.RequestedCurrencyId == 2)
            {

                body = body.Replace("{TotalPrice}", "&euro;" + orderSummary.TotalRentAmount.ToString("F"));
                body = body.Replace("{RentalOnlineFee}", "&euro;" + orderSummary.MarinaOnlineReservationFee.ToString("F"));
                body = body.Replace("{DueCustomer}", "&euro;" + (orderSummary.TotalRentAmount - orderSummary.MarinaOnlineReservationFee).ToString("F"));


            }
            else
            {
                body = body.Replace("{TotalPrice}", "$" + orderSummary.TotalRentAmount.ToString("F"));
                body = body.Replace("{RentalOnlineFee}", "$" + orderSummary.MarinaOnlineReservationFee.ToString("F"));
                body = body.Replace("{DueCustomer}", "$" + (orderSummary.TotalRentAmount - orderSummary.MarinaOnlineReservationFee).ToString("F"));


            }




            body = body.Replace("{TaxRate}", orderSummary.TaxRate);











            // Util.SendEMail("info@boatrenting.com", "mmathai@gmail.com", "Tentative Boat Reservation!", body);


          Util.LogEMail("BookingRequest@rentaboat.com", orderSummary.MarinaEMail + ",BookingRequest@rentaboat.com,enngines@aol.com,6318316033@vtext.com,mackenzie@jetskirentals.com,kdhsr@aol.com", "Boat Booking Request from RentABoat!", body, "Order Email to Owner");


            Util.SendEMail("BookingRequest@rentaboat.com", orderSummary.MarinaEMail+ ",BookingRequest@rentaboat.com,enngines@aol.com,6318316033@vtext.com,mackenzie@jetskirentals.com,kdhsr@aol.com", "Boat Booking Request from RentABoat!", body);


        }

        void WriteOrderSummaryToFile(clsOrderSummary o, string body)
        {

            string p = Server.MapPath("~");

            File.AppendAllText(p + "Test.txt", "body =" + body);



            File.AppendAllText(p + "Test.txt", "orderSummary.BoatID.ToString() =" + orderSummary.BoatID.ToString());

            File.AppendAllText(p + "Test.txt", "{BoatID}" + orderSummary.BoatID.ToString());
            File.AppendAllText(p + "Test.txt", "{BoatName}" + orderSummary.BoatName);

            File.AppendAllText(p + "Test.txt", "{BoatYear}" + orderSummary.BoatYear);
            File.AppendAllText(p + "Test.txt", "{BoatMake}" + orderSummary.BoatMake);
            File.AppendAllText(p + "Test.txt", "{BoatModel}" + orderSummary.BoatModel);
            File.AppendAllText(p + "Test.txt", "{BoatSize}" + orderSummary.BoatSize);
            File.AppendAllText(p + "Test.txt", "{MaximumPassengers}" + orderSummary.MaximumPassengers.ToString());

            File.AppendAllText(p + "Test.txt", "{BoatDescription}" + orderSummary.BoatDescription);

            File.AppendAllText(p + "Test.txt", "{Requirement}" + orderSummary.BoatRequirements);

            File.AppendAllText(p + "Test.txt", "{MarinaAddress}" + orderSummary.AddressLine1 + " " + orderSummary.AddressLine2 + "+ " + orderSummary.City + "+ " + orderSummary.StateName + "+ " + orderSummary.CountryName + " " + orderSummary.Zipcode);

            File.AppendAllText(p + "Test.txt", "{OwnerName}" + orderSummary.ContactName);


            File.AppendAllText(p + "Test.txt", "{FacilityNumber}" + orderSummary.MarinaID.ToString());


            File.AppendAllText(p + "Test.txt", "{TaxRate}" + orderSummary.TaxRate.ToString() + "%");



            File.AppendAllText(p + "Test.txt", "{FacilityName}" + orderSummary.FacilityName);

            File.AppendAllText(p + "Test.txt", "{MarinaName}" + orderSummary.MarinaName);

            File.AppendAllText(p + "Test.txt", "{BoatAddress}" + orderSummary.AddressLine1 + " " + orderSummary.AddressLine2 + "+ " + orderSummary.City + "+ " + orderSummary.StateName + "+ " + orderSummary.CountryName + " " + orderSummary.Zipcode);


            File.AppendAllText(p + "Test.txt", "{OwnerPhone}" + orderSummary.MarinaPhone);

            File.AppendAllText(p + "Test.txt", "{OwnerEmail}" + orderSummary.MarinaEMail);

            File.AppendAllText(p + "Test.txt", "{OwnerWebsite}" + orderSummary.FacilityWebsite);

            File.AppendAllText(p + "Test.txt", "{CancellationPolicy}" + orderSummary.FacilityCancellationPolicy);

            File.AppendAllText(p + "Test.txt", "{Direction}" + orderSummary.FacilityDirection);

            File.AppendAllText(p + "Test.txt", "{RentalStartDate}" + orderSummary.RentStartDate);

            File.AppendAllText(p + "Test.txt", "{RentalEndDate}" + orderSummary.RentEndDate);

            //   File.AppendAllText(p+"Test.txt","{Price}"+ "$" + orderSummary.DailyOrHourlyPrice.ToString("F"));

            File.AppendAllText(p + "Test.txt", "{SelectedTime}" + orderSummary.RentingTimeFromTo);

            File.AppendAllText(p + "Test.txt", "{Email Address Client}" + orderSummary.ClientEmail);

        }

        void SendEmailToRenter()
        {

            //    Price { Price}
            //per: { SelectedTime} < br />


            //{ AmountTimePeriod}
            //x { Price}


            try
            {
               
                string body = string.Empty;
                using (StreamReader reader = new StreamReader(Server.MapPath("~/RenterEmailTemplate.html")))
                {
                    body = reader.ReadToEnd();
                }


               


                body = body.Replace("{Username}", Session["uName"].ToString());

                string pass = Session["uPass"].ToString();
                int len = pass.Length;
                if (len > 3)
                {
                    pass = pass.Substring(0, 3) + String.Concat(Enumerable.Repeat("_", (len - 3)));

                }

              

            
                body = body.Replace("{Password}", pass);



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


                body = body.Replace("{FacilityNumber}", orderSummary.MarinaID.ToString());


                body = body.Replace("{TaxRate}", orderSummary.TaxRate.ToString() + "%");



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

             //   WriteOrderSummaryToFile(orderSummary,body);

               // Util.SendEMail("info@rentaboat.com", "mmathai@gmail.com", "Boat Booking Request Sent from RentABoat!",  orderSummary.ClientEmail + ",Enngines@aol.com,BookingRequest@rentaboat.com,Kenny@boatrenting.com,6318316033@vtext.com,mackenzie@jetskirentals.com,kdhsr@aol.com");



                if (orderSummary.RequestedCurrencyId == 2)
                {
                    body = body.Replace("{TotalPrice}", "&euro;" + orderSummary.TotalRentAmount.ToString("F"));
                    body = body.Replace("{RentalOnlineFee}", "&euro;" + orderSummary.MarinaOnlineReservationFee.ToString("F"));

                    body = body.Replace("{TotalPriceminusRentalOnlineFee}", "&euro;" + (orderSummary.TotalRentAmount - orderSummary.MarinaOnlineReservationFee).ToString("F"));


                    body = body.Replace("{DueAtDock}", "&euro;" + (orderSummary.TotalRentAmount - orderSummary.MarinaOnlineReservationFee).ToString("F"));

                    body = body.Replace("{ReservationDeposit}", "&euro;" + orderSummary.ReservationDeposit.ToString());
                    body = body.Replace("{SecurityDeposit}", "&euro;" + orderSummary.FacilitySecurityDeposit.ToString());



                }
                else
                {
                    body = body.Replace("{TotalPrice}", "$" + orderSummary.TotalRentAmount.ToString("F"));
                    body = body.Replace("{RentalOnlineFee}", "$" + orderSummary.MarinaOnlineReservationFee.ToString("F"));

                    body = body.Replace("{TotalPriceminusRentalOnlineFee}", "$" + (orderSummary.TotalRentAmount - orderSummary.MarinaOnlineReservationFee).ToString("F"));

                    body = body.Replace("{DueAtDock}", "$" + (orderSummary.TotalRentAmount - orderSummary.MarinaOnlineReservationFee).ToString("F"));


                    body = body.Replace("{ReservationDeposit}", "$" + orderSummary.ReservationDeposit.ToString());
                    body = body.Replace("{SecurityDeposit}", "$" + orderSummary.FacilitySecurityDeposit.ToString());

                }

              


                body = body.Replace("{TaxRate}", orderSummary.TaxRate);




                body = body.Replace("{RenterFullname}", orderSummary.ClientFirstName + " " + orderSummary.ClientLastName);




            

                Util.LogEMail("BookingRequest@rentaboat.com", orderSummary.ClientEmail + ",BookingRequest@rentaboat.com,enngines@aol.com,6318316033@vtext.com,mackenzie@jetskirentals.com,kdhsr@aol.com", "Boat Booking Request Sent from RentABoat!", body, "Order Email to Renter");

                Util.SendEMail("BookingRequest@rentaboat.com", orderSummary.ClientEmail + ",BookingRequest@rentaboat.com,enngines@aol.com,6318316033@vtext.com,mackenzie@jetskirentals.com,kdhsr@aol.com", "Boat Booking Request Sent from RentABoat!", body);

                //    Util.SendEMail("info@boatrenting.com", "mmathai@gmail.com", "Tentative Boat Reservation!", body);

            }
            catch(Exception ex)
            {
                Util.SendEMail("info@rentaboat.com", "mmathai@gmail.com", "Error ", "Error:" + ex.Message);

                lblMessage.Text = "Error:" + ex.Message;

                
            }


        }








        protected void lnkShowBoatProfile_Click(object sender, EventArgs e)
        {
            //using (SqlConnection con = Util.getConnection())
            //{
            //    using (SqlCommand cmd = new SqlCommand("usp_advanced_search", con))
            //    {
            //        cmd.CommandType = CommandType.StoredProcedure;






            //            cmd.Parameters.AddWithValue("@p_in_boatid", orderSummary.BoatID);




            //        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            //        DataSet dst = new DataSet();
            //        adapter.Fill(dst);

            //        DataTable dt = dst.Tables[0];

            //        // lblMessageBoatLocation.Text = "Total Records : " + dt.Rows.Count.ToString();

            //        Session["advancedSearchResult"] = dt;


            //            Response.Redirect("resultsAdvanced.aspx");


            //    }
            //}

            Session[Session[Util.Session_Cart_Id].ToString()] = false;

            Response.Redirect("Calendar.aspx");

            
        }
    }











}