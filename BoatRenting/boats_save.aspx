<%@ Page language="C#" CodeFile="boats_save.aspx.cs" Inherits="BoatRenting.boats_save_aspx_cs" %>
<%@ Import Namespace = "nce.scripting" %>
<%@ Import Namespace = "nce.adosql" %>
<%--<%@ Import Namespace = "BoatRenting.clsUpload" %>--%>
<%@ Import Namespace = "Microsoft.VisualBasic" %>
<%@ Import Namespace = "System" %>
<%@ Import Namespace = "System.Web" %>
<%@ Import Namespace = "System.Web.SessionState" %>
<!--#include file="__functions.aspx"-->
<%
    if (Convert.ToString(Session["userID"]) == "")
    {
        Session.Abandon();
        Response.Redirect("/members.aspx");
    }
    
    txt_MarinaID = Session["MarinaID"];
    Session.Add("userID", 1);
    //''
    //dim x
    //x=Request.Form("txt")
    //Instantiate Upload Class
    //BoatRenting.clsUpload objUpload = new BoatRenting.clsUpload();
    //Grab the file name
    //strFileName = objUpload.Fields("File1").FileName;
    //dim cnt,fld1
    //cnt=objUpload.Count
    //fld1=objUpload("txt").value
    //fld1=objUpload.Fields("txt").value
    //Compile path to save file to
    //strPath = Server.MapPath("Uploads") & "\" & strFileName
    //Save the binary data to the file system
    //objUpload("File1").SaveAs strPath
    //''
    //Dim objUpload
    //on error resume next
    //Set objUpload = Server.CreateObject("ASPUploadComponent.cUpload")
    //response.Write("er:"&err.description&"/")
    //******************* This should be added in order to work on my machine Manoj ***********
    //strUploadPath = Server.MapPath("\BoatRenting\client\boats\")
    strUploadPath = Server.MapPath(".\\boats\\");
    //strUploadPath = Server.MapPath("BoatImages\")
    //strUploadPath = Server.MapPath("..\client\boats\")
    fso = new FileSystemObject();
    txt_BoatID = NVL(Convert.ToString(txt_BoatID), 0);
    hdn_Action = NVL(Convert.ToString(hdn_Action), "");
    txt_Name = NVL(Convert.ToString(txt_Name), "");
    txt_Description = NVL(Convert.ToString(txt_Description), "");
    txt_Make = NVL(Convert.ToString(txt_Make), "");
    txt_Model = NVL(Convert.ToString(txt_Model), "");
    txt_Year = NVL(Convert.ToString(txt_Year), "");
    txt_size = NVL(Convert.ToString(txt_size), "");
    cbo_BoatType = NVL(Convert.ToString(cbo_BoatType), 0);
    cbo_SubBoatType = NVL(Convert.ToString(cbo_SubBoatType), 0);
    txt_MaxPassengers = NVL(Convert.ToString(txt_MaxPassengers), 0);
    txt_deposit = NVL(Convert.ToString(txt_deposit), "");
    txt_reservation = NVL(Convert.ToString(txt_reservation), 0);
    txt_requirements = NVL(Convert.ToString(txt_requirements), " ");
    txt_boat_sale_amount = NVL(Convert.ToString(txt_boat_sale_amount), 0);
    if (((Convert.ToString(chk_captain)).Trim()).Length > 0)
    {
        chk_captain = Convert.ToInt32(chk_captain);
    }
    else
    {
        chk_captain = 0;
    }
    if (((Convert.ToString(chk_Is_boat_sale)).Trim()).Length > 0)
    {
        chk_Is_boat_sale = 1;
    }
    else
    {
        chk_Is_boat_sale = 0;
    }
    con = System.Configuration.ConfigurationManager.AppSettings.Get("connectionstringDATA");
    Response.Expires = 0;
    oConn = new Connection();
    oConn.ConnectionString = con;
    oConn.ConnectionTimeout = 500;
    oConn.Open(null);

    cmd = new Command();
    cmd.ActiveConnection = oConn;
    cmd.CommandText = "SP_BR_BOAT_SAVE";
    cmd.CommandType = adCmdStoredProc;
    //cmd.Parameters[1].Value = hdn_Action;
    cmd.Parameters.Append(cmd.CreateParameter("@P_Action", adChar, adParamInput, 4, 0));
    cmd.Parameters["@P_Action"].Value = hdn_Action;
    //cmd.Parameters[2].Value = txt_MarinaID;
    cmd.Parameters.Append(cmd.CreateParameter("@p_in_marinaID", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@p_in_marinaID"].Value = Convert.ToInt32(txt_MarinaID);
    //cmd.Parameters[3].Value = txt_BoatID;
    cmd.Parameters.Append(cmd.CreateParameter("@p_in_boatID", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@p_in_boatID"].Value = Convert.ToInt32(txt_BoatID);
    //cmd.Parameters[4].Value = txt_Name;
    cmd.Parameters.Append(cmd.CreateParameter("@P_VC_NANE", adVarChar, adParamInput, 4, 0));
    cmd.Parameters["@P_VC_NAME"].Value = txt_Name;
    //cmd.Parameters[5].Value = txt_Description;
    cmd.Parameters.Append(cmd.CreateParameter("@P_VC_Description", adVarChar, adParamInput, 4, 0));
    cmd.Parameters["@P_VC_Description"].Value = txt_Description;
    //cmd.Parameters[6].Value = txt_Make;
    cmd.Parameters.Append(cmd.CreateParameter("@P_VC_MAKE", adVarChar, adParamInput, 4, 0));
    cmd.Parameters["@P_VC_MAKE"].Value = txt_Make;
    //cmd.Parameters[7].Value = txt_Model;
    cmd.Parameters.Append(cmd.CreateParameter("@P_VC_MODEL", adVarChar, adParamInput, 4, 0));
    cmd.Parameters["@P_VC_MODEL"].Value = txt_Model;
    //cmd.Parameters[8].Value = txt_size;
    cmd.Parameters.Append(cmd.CreateParameter("@P_VC_SIZE", adVarChar, adParamInput, 4, 0));
    cmd.Parameters["@P_VC_SIZE"].Value = txt_size;
    //cmd.Parameters[9].Value = Convert.ToInt32(cbo_BoatType);
    cmd.Parameters.Append(cmd.CreateParameter("@P_IN_BoatTypeID", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@P_IN_BoatTypeID"].Value = Convert.ToInt32(cbo_BoatType);
    //cmd.Parameters[10].Value = Convert.ToInt32(cbo_SubBoatType);
    cmd.Parameters.Append(cmd.CreateParameter("@P_IN_SubBoatTypeID", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@P_IN_SubBoatTypeID"].Value = Convert.ToInt32(cbo_SubBoatType);
    //cmd.Parameters[11].Value = txt_MaxPassengers;
    cmd.Parameters.Append(cmd.CreateParameter("@P_in_MaxPassengers", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@P_in_MaxPassengers"].Value = Convert.ToInt32(txt_MaxPassengers);
    //cmd.Parameters[12].Value = txt_deposit;
    cmd.Parameters.Append(cmd.CreateParameter("@P_nu_deposit", adVarChar, adParamInput, 4, 0));
    cmd.Parameters["@P_nu_deposit"].Value = txt_deposit;
    //cmd.Parameters[13].Value = txt_reservation;
    cmd.Parameters.Append(cmd.CreateParameter("@P_nu_reservation", adVarChar, adParamInput, 4, 0));
    cmd.Parameters["@P_nu_reservation"].Value = txt_reservation;
    //cmd.Parameters[14].Value = txt_requirements;
    cmd.Parameters.Append(cmd.CreateParameter("@P_VC_requirements", adVarChar, adParamInput, 4, 0));
    cmd.Parameters["@P_VC_requirements"].Value = txt_requirements;
    //cmd.Parameters[15].Value = chk_captain;
    cmd.Parameters.Append(cmd.CreateParameter("@P_TI_captain", adTinyInt, adParamInput, 4, 0));
    cmd.Parameters["@P_TI_captain"].Value = Convert.ToInt16(chk_captain);
    //cmd.Parameters[16].Value = Convert.ToInt32(Session["userID"]);
    cmd.Parameters.Append(cmd.CreateParameter("@UserID", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@UserID"].Value = Convert.ToInt32(Session["userID"]);
    //cmd.Parameters[17].Value = txt_Year;
    cmd.Parameters.Append(cmd.CreateParameter("@P_VC_Year", adVarChar, adParamInput, 4, 0));
    cmd.Parameters["@P_VC_Year"].Value = txt_Year;
    //cmd.Parameters[18].Value = chk_Is_boat_sale;
    cmd.Parameters.Append(cmd.CreateParameter("@P_Is_Boat_Sale", adTinyInt, adParamInput, 4, 0));
    cmd.Parameters["@P_Is_Boat_Sale"].Value = Convert.ToInt16(chk_Is_boat_sale);
    //cmd.Parameters[19].Value = txt_boat_sale_amount;
    cmd.Parameters.Append(cmd.CreateParameter("@P_Boat_Sale_Amount", adDecimal, adParamInput, 4, 0));
    cmd.Parameters["@P_Boat_Sale_Amount"].Value = Convert.ToInt16(txt_boat_sale_amount);
    cmd.Execute();
    if (hdn_Action == "N")
    {
        txt_BoatID = Convert.ToInt32(cmd.Parameters[3].Value);
    }
    cmd.CommandText = "SP_BR_PRICExBOATxTYPERENT_DEL";
    cmd.CommandType = adCmdStoredProc;
    //cmd.Parameters[2].Value = txt_MarinaID;
    cmd.Parameters.Append(cmd.CreateParameter("@p_in_marinaID", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@p_in_marinaID"].Value = Convert.ToInt32(txt_MarinaID);
    //cmd.Parameters[3].Value = txt_BoatID;
    cmd.Parameters.Append(cmd.CreateParameter("@p_in_boatID", adInteger, adParamInput, 4, 0));
    cmd.Parameters["@p_in_boatID"].Value = Convert.ToInt32(txt_BoatID);
    cmd.Execute();
    for(i = 1; i <= 4; i += 1)
    {
        txt_TypeRentID = i;
        if (((Convert.ToString(txt_weekday)).Trim()).Length > 0)
        {
            txt_weekday = NVL(Convert.ToString(txt_weekday), 0);
        }
        else
        {
            txt_weekday = "0";
        }
        if (((Convert.ToString(txt_weekend)).Trim()).Length > 0)
        {
            txt_weekend = NVL(Convert.ToString(txt_weekend), 0);
        }
        else
        {
            txt_weekend = "0";
        }
        if (((Convert.ToString(txt_holiday)).Trim()).Length > 0)
        {
            txt_holiday = NVL(Convert.ToString(txt_holiday), 0);
        }
        else
        {
            txt_holiday = "0";
        }
        txt_hoursfrom = Convert.ToInt32(txt_hoursfrom);
        txt_hoursto = Convert.ToInt32(txt_hoursto);
        if (!((txt_weekday == "0" && txt_weekend == "0" && txt_holiday == "0")))
        {
            cmd.CommandText = "SP_BR_PRICExBOATxTYPERENT_SAVE";
            cmd.CommandType = adCmdStoredProc;
            cmd.Parameters[1].Value = "N";
            //hdn_Action
            cmd.Parameters[2].Value = txt_MarinaID;
            cmd.Parameters[3].Value = txt_BoatID;
            cmd.Parameters[4].Value = txt_TypeRentID;
            cmd.Parameters[5].Value = txt_weekday;
            cmd.Parameters[6].Value = txt_weekend;
            cmd.Parameters[7].Value = txt_holiday;
            cmd.Parameters[8].Value = txt_hoursfrom;
            cmd.Parameters[9].Value = txt_hoursto;
            cmd.Parameters[10].Value = Convert.ToInt32(Session["userID"]);
            cmd.Execute();
        }
    }
    //if (((Convert.ToString(objUpload.Fields.FileName)).Substring((Convert.ToString(objUpload.Fields.FileName)).Length - 4) != ".bin"))
    //{
    //    //if len(trim(objUpload.Fields("txt_resultImage").FileName))>0 then
    //    cmd.ActiveConnection = oConn;
    //    cmd.CommandText = "SP_BR_IMAGE_DEL_PARAM";
    //    cmd.CommandType = adCmdStoredProc;
    //    cmd.Parameters[1].Value = txt_MarinaID;
    //    cmd.Parameters[2].Value = txt_BoatID;
    //    cmd.Parameters[3].Value = 0;
    //    cmd.Execute();
    //}
    strFileExtensions = ".exe;.dll";
    //if (((Convert.ToString(objUpload.Fields.FileName)).Substring((Convert.ToString(objUpload.Fields.FileName)).Length - 4) != ".bin"))
    //{
    //    //if len(trim(objUpload.Fields("txt_resultImage").FileName))>0 then
    //    txt_resultImage = Convert.ToString(objUpload.Fields.FileName);
    //    if ((txt_resultImage.Substring(txt_resultImage.Length - 4)).ToLower() != ".gif" && (txt_resultImage.Substring(txt_resultImage.Length - 4)).ToLower() != ".jpg" && (txt_resultImage.Substring(txt_resultImage.Length - 4)).ToLower() != ".bmp")
    //    {
    //        StrMensaje = txt_resultImage + " <BR> This is not a GIF or JPG file";
    //    }
    //    else
    //    {
    //        NuevoNombre = "result_" + Convert.ToString(txt_BoatID) + txt_resultImage.Substring(txt_resultImage.Length - 4);
    //        if (fso.FileExists(strUploadPath + "\\" + NuevoNombre))
    //        {
    //            fso.DeleteFile(strUploadPath + "\\" + NuevoNombre);
    //        }
    //        //***.SaveAs(strUploadPath + "\\" + NuevoNombre);
    //        //objUpload("txt_resultImage").SaveFile strUploadPath , nuevonombre, strFileExtensions
    //    }
    //    txt_resultImage = "result_" + Convert.ToString(txt_BoatID) + txt_resultImage.Substring(txt_resultImage.Length - 4);
    //}
    //else
    //{
    //    if (((Convert.ToString(objUpload.Fields.FileName)).Substring((Convert.ToString(objUpload.Fields.FileName)).Length - 4) != ".bin"))
    //    {
    //        //if len(trim(objUpload.Fields("txt_resultOld").FileName))>0 then
    //        txt_resultImage = Convert.ToString(objUpload.Fields.FileName);
    //    }
    //    else
    //    {
    //        txt_resultImage = "";
    //    }
    //}
    //response.Write(txt_resultImage)
    //if (((Convert.ToString(objUpload.Fields.FileName)).Substring((Convert.ToString(objUpload.Fields.FileName)).Length - 4) != ".bin"))
    //{
    //    //if len(trim(objUpload.Fields("txt_resultImage").FileName))>0 then
    //    txt_resultName = NVL(Convert.ToString(txt_resultName), "");
    //    txt_resultDesc = NVL(Convert.ToString(txt_resultDesc), "");
    //    cmd.ActiveConnection = oConn;
    //    cmd.CommandText = "SP_BR_IMAGE_SAVE";
    //    cmd.CommandType = adCmdStoredProc;
    //    cmd.Parameters[1].Value = txt_MarinaID;
    //    cmd.Parameters[2].Value = txt_BoatID;
    //    cmd.Parameters[3].Value = txt_resultName;
    //    cmd.Parameters[4].Value = txt_resultDesc;
    //    cmd.Parameters[5].Value = txt_resultImage;
    //    cmd.Parameters[6].Value = 0;
    //    cmd.Parameters[7].Value = Session["UserID"];
    //    cmd.Execute();
    //}
    txt_detailImage = txt_resultImage;
    //if (((Convert.ToString(objUpload.Fields.FileName)).Substring((Convert.ToString(objUpload.Fields.FileName)).Length - 4) != ".bin"))
    //{
    //    //if len(trim(objUpload.Fields("txt_other1Image").FileName))>0 then
    //    cmd.ActiveConnection = oConn;
    //    cmd.CommandText = "SP_BR_IMAGE_DEL_PARAM";
    //    cmd.CommandType = adCmdStoredProc;
    //    cmd.Parameters[1].Value = txt_MarinaID;
    //    cmd.Parameters[2].Value = txt_BoatID;
    //    cmd.Parameters[3].Value = 2;
    //    cmd.Execute();
    //}
    strFileExtensions = ".exe;.dll";
    //if (((Convert.ToString(objUpload.Fields.FileName)).Substring((Convert.ToString(objUpload.Fields.FileName)).Length - 4) != ".bin"))
    //{
    //    //if len(trim(objUpload.Fields("txt_other1Image").FileName))>0  then
    //    txt_other1Image = Convert.ToString(objUpload.Fields.FileName);
    //    if ((txt_other1Image.Substring(txt_other1Image.Length - 4)).ToLower() != ".gif" && (txt_other1Image.Substring(txt_other1Image.Length - 4)).ToLower() != ".jpg" && (txt_resultImage.Substring(txt_resultImage.Length - 4)).ToLower() != ".bmp")
    //    {
    //        StrMensaje = txt_other1Image + " <BR> This is not a GIF or JPG file";
    //    }
    //    else
    //    {
    //        NuevoNombre = "other1_" + Convert.ToString(txt_BoatID) + txt_other1Image.Substring(txt_other1Image.Length - 4);
    //        if (fso.FileExists(strUploadPath + "\\" + NuevoNombre))
    //        {
    //            fso.DeleteFile(strUploadPath + "\\" + NuevoNombre);
    //        }
    //        //***.SaveAs(strUploadPath + "\\" + NuevoNombre);
    //        //objUpload("txt_other1Image").SaveFile strUploadPath , nuevonombre, strFileExtensions
    //    }
    //    txt_other1Image = "other1_" + Convert.ToString(txt_BoatID) + txt_other1Image.Substring(txt_other1Image.Length - 4);
    //}
    //else
    //{
    //    if (((Convert.ToString(objUpload.Fields.FileName)).Substring((Convert.ToString(objUpload.Fields.FileName)).Length - 4) != ".bin"))
    //    {
    //        //if len(trim(objUpload.Fields("txt_other1Old").FileName))>0 then
    //        txt_other1Image = Convert.ToString(objUpload.Fields.FileName);
    //    }
    //    else
    //    {
    //        txt_other1Image = "";
    //    }
    //}
    ////response.Write(txt_other1Image)
    //if (((Convert.ToString(objUpload.Fields.FileName)).Substring((Convert.ToString(objUpload.Fields.FileName)).Length - 4) != ".bin"))
    //{
    //    //if len(trim(objUpload.Fields("txt_other1Image").FileName))>0 then
    //    txt_other1Name = NVL(Convert.ToString(txt_other1Name), "");
    //    txt_other1Desc = NVL(Convert.ToString(txt_other1Desc), "");
    //    cmd.ActiveConnection = oConn;
    //    cmd.CommandText = "SP_BR_IMAGE_SAVE";
    //    cmd.CommandType = adCmdStoredProc;
    //    cmd.Parameters[1].Value = txt_MarinaID;
    //    cmd.Parameters[2].Value = txt_BoatID;
    //    cmd.Parameters[3].Value = txt_other1Name;
    //    cmd.Parameters[4].Value = txt_other1Desc;
    //    cmd.Parameters[5].Value = txt_other1Image;
    //    cmd.Parameters[6].Value = 2;
    //    cmd.Parameters[7].Value = Session["UserID"];
    //    cmd.Execute();
    //}
    ////other pic2
    //if (((Convert.ToString(objUpload.Fields.FileName)).Substring((Convert.ToString(objUpload.Fields.FileName)).Length - 4) != ".bin"))
    //{
    //    //if len(trim(objUpload.Fields("txt_other2Image").FileName))>0 then
    //    cmd.ActiveConnection = oConn;
    //    cmd.CommandText = "SP_BR_IMAGE_DEL_PARAM";
    //    cmd.CommandType = adCmdStoredProc;
    //    cmd.Parameters[1].Value = txt_MarinaID;
    //    cmd.Parameters[2].Value = txt_BoatID;
    //    cmd.Parameters[3].Value = 3;
    //    cmd.Execute();
    //}
    //strFileExtensions = ".exe;.dll";
    //if (((Convert.ToString(objUpload.Fields.FileName)).Substring((Convert.ToString(objUpload.Fields.FileName)).Length - 4) != ".bin"))
    //{
    //    //if len(trim(objUpload.Fields("txt_other2Image").FileName))>0  then
    //    txt_other2Image = Convert.ToString(objUpload.Fields.FileName);
    //    if ((txt_other2Image.Substring(txt_other2Image.Length - 4)).ToLower() != ".gif" && (txt_other2Image.Substring(txt_other2Image.Length - 4)).ToLower() != ".jpg" && (txt_resultImage.Substring(txt_resultImage.Length - 4)).ToLower() != ".bmp")
    //    {
    //        StrMensaje = txt_other2Image + " <BR> This is not a GIF or JPG file";
    //    }
    //    else
    //    {
    //        NuevoNombre = "other2_" + Convert.ToString(txt_BoatID) + txt_other2Image.Substring(txt_other2Image.Length - 4);
    //        if (fso.FileExists(strUploadPath + "\\" + NuevoNombre))
    //        {
    //            fso.DeleteFile(strUploadPath + "\\" + NuevoNombre);
    //        }
    //        //on Error resume next
    //        //***.SaveAs(strUploadPath + "\\" + NuevoNombre);
    //        //objUpload("txt_other2Image").SaveFile strUploadPath , nuevonombre, strFileExtensions
    //    }
    //    txt_other2Image = "other2_" + Convert.ToString(txt_BoatID) + txt_other2Image.Substring(txt_other2Image.Length - 4);
    //}
    //else
    //{
    //    if (((Convert.ToString(objUpload.Fields.FileName)).Substring((Convert.ToString(objUpload.Fields.FileName)).Length - 4) != ".bin"))
    //    {
    //        //if len(trim(objUpload.Fields("txt_other2Old").FileName))>0 then
    //        txt_other2Image = Convert.ToString(objUpload.Fields.FileName);
    //    }
    //    else
    //    {
    //        txt_other2Image = "";
    //    }
    //}
    ////response.Write(Error.description)
    ////response.Write(txt_other2Image)
    //if (((Convert.ToString(objUpload.Fields.FileName)).Substring((Convert.ToString(objUpload.Fields.FileName)).Length - 4) != ".bin"))
    //{
    //    //if len(trim(objUpload.Fields("txt_other2Image").FileName))>0 then
    //    txt_other2Name = NVL(Convert.ToString(txt_other2Name), "");
    //    txt_other2Desc = NVL(Convert.ToString(txt_other2Desc), "");
    //    cmd.ActiveConnection = oConn;
    //    cmd.CommandText = "SP_BR_IMAGE_SAVE";
    //    cmd.CommandType = adCmdStoredProc;
    //    cmd.Parameters[1].Value = txt_MarinaID;
    //    cmd.Parameters[2].Value = txt_BoatID;
    //    cmd.Parameters[3].Value = txt_other2Name;
    //    cmd.Parameters[4].Value = txt_other2Desc;
    //    cmd.Parameters[5].Value = txt_other2Image;
    //    cmd.Parameters[6].Value = 3;
    //    cmd.Parameters[7].Value = Session["UserID"];
    //    cmd.Execute();
    //}
    ////other pic3
    //if (((Convert.ToString(objUpload.Fields.FileName)).Substring((Convert.ToString(objUpload.Fields.FileName)).Length - 4) != ".bin"))
    //{
    //    //if len(trim(objUpload.Fields("txt_other3Image").FileName))>0 then
    //    cmd.ActiveConnection = oConn;
    //    cmd.CommandText = "SP_BR_IMAGE_DEL_PARAM";
    //    cmd.CommandType = adCmdStoredProc;
    //    cmd.Parameters[1].Value = txt_MarinaID;
    //    cmd.Parameters[2].Value = txt_BoatID;
    //    cmd.Parameters[3].Value = 4;
    //    cmd.Execute();
    //}
    strFileExtensions = ".exe;.dll";
    //if (((Convert.ToString(objUpload.Fields.FileName)).Substring((Convert.ToString(objUpload.Fields.FileName)).Length - 4) != ".bin"))
    //{
    //    //if len(trim(objUpload.Fields("txt_other3Image").FileName))>0  then
    //    txt_other3Image = Convert.ToString(objUpload.Fields.FileName);
    //    if ((txt_other3Image.Substring(txt_other3Image.Length - 4)).ToLower() != ".gif" && (txt_other3Image.Substring(txt_other3Image.Length - 4)).ToLower() != ".jpg" && (txt_other3Image.Substring(txt_other3Image.Length - 4)).ToLower() != ".bmp")
    //    {
    //        StrMensaje = txt_other3Image + " <BR> This is not a GIF or JPG file";
    //    }
    //    else
    //    {
    //        NuevoNombre = "other3_" + Convert.ToString(txt_BoatID) + txt_other3Image.Substring(txt_other3Image.Length - 4);
    //        if (fso.FileExists(strUploadPath + "\\" + NuevoNombre))
    //        {
    //            fso.DeleteFile(strUploadPath + "\\" + NuevoNombre);
    //        }
    //        //on Error resume next
    //        //***.SaveAs(strUploadPath + "\\" + NuevoNombre);
    //        //objUpload("txt_other2Image").SaveFile strUploadPath , nuevonombre, strFileExtensions
    //    }
    //    txt_other3Image = "other3_" + Convert.ToString(txt_BoatID) + txt_other3Image.Substring(txt_other3Image.Length - 4);
    //}
    //else
    //{
    //    if (((Convert.ToString(objUpload.Fields.FileName)).Substring((Convert.ToString(objUpload.Fields.FileName)).Length - 4) != ".bin"))
    //    {
    //        //if len(trim(objUpload.Fields("txt_other3Old").FileName))>0 then
    //        txt_other3Image = Convert.ToString(objUpload.Fields.FileName);
    //    }
    //    else
    //    {
    //        txt_other3Image = "";
    //    }
    //}
    ////response.Write(Error.description)
    ////response.Write(txt_other2Image)
    //if (((Convert.ToString(objUpload.Fields.FileName)).Substring((Convert.ToString(objUpload.Fields.FileName)).Length - 4) != ".bin"))
    //{
    //    //if len(trim(objUpload.Fields("txt_other3Image").FileName))>0 then
    //    txt_other3Name = NVL(Convert.ToString(txt_other3Name), "");
    //    txt_other3Desc = NVL(Convert.ToString(txt_other3Desc), "");
    //    cmd.ActiveConnection = oConn;
    //    cmd.CommandText = "SP_BR_IMAGE_SAVE";
    //    cmd.CommandType = adCmdStoredProc;
    //    cmd.Parameters[1].Value = txt_MarinaID;
    //    cmd.Parameters[2].Value = txt_BoatID;
    //    cmd.Parameters[3].Value = txt_other3Name;
    //    cmd.Parameters[4].Value = txt_other3Desc;
    //    cmd.Parameters[5].Value = txt_other3Image;
    //    cmd.Parameters[6].Value = 4;
    //    cmd.Parameters[7].Value = Session["UserID"];
    //    cmd.Execute();
    //}
    ////other pic4
    //if (((Convert.ToString(objUpload.Fields.FileName)).Substring((Convert.ToString(objUpload.Fields.FileName)).Length - 4) != ".bin"))
    //{
    //    //if len(trim(objUpload.Fields("txt_other4Image").FileName))>0 then
    //    cmd.ActiveConnection = oConn;
    //    cmd.CommandText = "SP_BR_IMAGE_DEL_PARAM";
    //    cmd.CommandType = adCmdStoredProc;
    //    cmd.Parameters[1].Value = txt_MarinaID;
    //    cmd.Parameters[2].Value = txt_BoatID;
    //    cmd.Parameters[3].Value = 5;
    //    cmd.Execute();
    //}
    strFileExtensions = ".exe;.dll";
    //if (((Convert.ToString(objUpload.Fields.FileName)).Substring((Convert.ToString(objUpload.Fields.FileName)).Length - 4) != ".bin"))
    //{
    //    //if len(trim(objUpload.Fields("txt_other4Image").FileName))>0  then
    //    txt_other4Image = Convert.ToString(objUpload.Fields.FileName);
    //    if ((txt_other4Image.Substring(txt_other4Image.Length - 4)).ToLower() != ".gif" && (txt_other4Image.Substring(txt_other4Image.Length - 4)).ToLower() != ".jpg" && (txt_other4Image.Substring(txt_other4Image.Length - 4)).ToLower() != ".bmp")
    //    {
    //        StrMensaje = txt_other4Image + " <BR> This is not a GIF or JPG file";
    //    }
    //    else
    //    {
    //        NuevoNombre = "other4_" + Convert.ToString(txt_BoatID) + txt_other4Image.Substring(txt_other4Image.Length - 4);
    //        if (fso.FileExists(strUploadPath + "\\" + NuevoNombre))
    //        {
    //            fso.DeleteFile(strUploadPath + "\\" + NuevoNombre);
    //        }
    //        //on Error resume next
    //        //***.SaveAs(strUploadPath + "\\" + NuevoNombre);
    //        //objUpload("txt_other2Image").SaveFile strUploadPath , nuevonombre, strFileExtensions
    //    }
    //    txt_other4Image = "other4_" + Convert.ToString(txt_BoatID) + txt_other4Image.Substring(txt_other4Image.Length - 4);
    //}
    //else
    //{
    //    if (((Convert.ToString(objUpload.Fields.FileName)).Substring((Convert.ToString(objUpload.Fields.FileName)).Length - 4) != ".bin"))
    //    {
    //        //if len(trim(objUpload.Fields("txt_other4Old").FileName))>0 then
    //        txt_other4Image = Convert.ToString(objUpload.Fields.FileName);
    //    }
    //    else
    //    {
    //        txt_other4Image = "";
    //    }
    //}
    //if (((Convert.ToString(objUpload.Fields.FileName)).Substring((Convert.ToString(objUpload.Fields.FileName)).Length - 4) != ".bin"))
    //{
    //    //if len(trim(objUpload.Fields("txt_other4Image").FileName))>0 then
    //    txt_other4Name = NVL(Convert.ToString(txt_other4Name), "");
    //    txt_other4Desc = NVL(Convert.ToString(txt_other4Desc), "");
    //    cmd.ActiveConnection = oConn;
    //    cmd.CommandText = "SP_BR_IMAGE_SAVE";
    //    cmd.CommandType = adCmdStoredProc;
    //    cmd.Parameters[1].Value = txt_MarinaID;
    //    cmd.Parameters[2].Value = txt_BoatID;
    //    cmd.Parameters[3].Value = txt_other4Name;
    //    cmd.Parameters[4].Value = txt_other4Desc;
    //    cmd.Parameters[5].Value = txt_other4Image;
    //    cmd.Parameters[6].Value = 5;
    //    cmd.Parameters[7].Value = Session["UserID"];
    //    cmd.Execute();
    //}
    ////Response.Write len(trim(objUpload.Fields("txt_BoatVideoImage").FileName))
    ////if (right(objUpload.Fields("txt_BoatVideoImage").FileName,4) <> ".bin") then
    ////Response.Write right(objUpload.Fields("txt_BoatVideoImage").FileName,4)
    ////end if
    //if (((Convert.ToString(objUpload.Fields.FileName)).Substring((Convert.ToString(objUpload.Fields.FileName)).Length - 4) != ".bin"))
    //{
    //    cmd.ActiveConnection = oConn;
    //    cmd.CommandText = "SP_BR_IMAGE_DEL_PARAM";
    //    cmd.CommandType = adCmdStoredProc;
    //    cmd.Parameters[1].Value = txt_MarinaID;
    //    cmd.Parameters[2].Value = txt_BoatID;
    //    cmd.Parameters[3].Value = 100;
    //    cmd.Execute();
    //}
    //if (((Convert.ToString(objUpload.Fields.FileName)).Substring((Convert.ToString(objUpload.Fields.FileName)).Length - 4) != ".bin"))
    //{
    //    txt_BoatVideoImage = Convert.ToString(objUpload.Fields.FileName);
    //    NuevoNombre = "BoatVideo1_" + Convert.ToString(txt_BoatID) + txt_BoatVideoImage.Substring(txt_BoatVideoImage.Length - 4);
    //    if (fso.FileExists(strUploadPath + "\\" + NuevoNombre))
    //    {
    //        fso.DeleteFile(strUploadPath + "\\" + NuevoNombre);
    //    }
    //    //***.SaveAs(strUploadPath + "\\" + NuevoNombre);
    //    txt_BoatVideoImage = "BoatVideo1_" + Convert.ToString(txt_BoatID) + txt_BoatVideoImage.Substring(txt_BoatVideoImage.Length - 4);
    //}
    //else
    //{
    //    if (((Convert.ToString(objUpload.Fields.FileName)).Trim()).Length > 0)
    //    {
    //        txt_BoatVideoImage = Convert.ToString(objUpload.Fields.FileName);
    //    }
    //    else
    //    {
    //        txt_BoatVideoImage = "";
    //    }
    //}
    //if (((Convert.ToString(objUpload.Fields.FileName)).Substring((Convert.ToString(objUpload.Fields.FileName)).Length - 4) != ".bin"))
    //{
    //    txt_BoatVideoName = NVL(txt_BoatVideoName, "");
    //    txt_BoatVideoDesc = NVL(txt_BoatVideoDesc, "");
    //    cmd.ActiveConnection = oConn;
    //    cmd.CommandText = "SP_BR_IMAGE_SAVE";
    //    cmd.CommandType = adCmdStoredProc;
    //    cmd.Parameters[1].Value = txt_MarinaID;
    //    cmd.Parameters[2].Value = txt_BoatID;
    //    cmd.Parameters[3].Value = txt_BoatVideoName;
    //    cmd.Parameters[4].Value = txt_BoatVideoDesc;
    //    cmd.Parameters[5].Value = txt_BoatVideoImage;
    //    cmd.Parameters[6].Value = 100;
    //    cmd.Parameters[7].Value = Session["UserID"];
    //    cmd.Execute();
    //}
%>
<script>
function redirect()
{
alert("The information was saved ");
document.frm.action="boats_list.aspx";
history.go(-2);
document.frm.submit();
}


</script>
<form name="frm" method="post">

<script language="javascript">
 redirect();
</script>


</form>
