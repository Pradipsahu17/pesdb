using CommonLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BiduthKarmi
{
    public partial class Default : System.Web.UI.Page
    {
        private string Type => Request.QueryString["type"].ToText();
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Type == "Nepali")
            {
                Page.MasterPageFile = "NepaliViewMaster.Master";

            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Type == "Nepali")
            {
                //LabelDOWNLOADS.Text = "डाउनलोडहरू";
                LabelCONTACTUS.Text = "हामीलाई सम्पर्क गर्नुहोस";
                LabelLOANS.Text = "कर्जा सुविधा";
                LabelNEWS.Text = "सान्चार";
                LabelOurService.Text = "हाम्रो सुविधाहरू";
                LabelDEPOSITS.Text = "निक्षेप सुविधा";
                LabelSHARES.Text = "सेयर   सुविधा";

            }
        }
        [WebMethod]
        public static JSONObject LoadPage()
        {
            try
            {
                var result = new JSONObject();
                DataTable dt = BusinessLayer.HomeSlider.GetAllPictureDisplay();

                string Message = "";


                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        Message += $@"<li data-thumb='Img/HomeSlider/{dr["PictureName"]}'>
                             <img src='Img/HomeSlider/{dr["PictureName"]}'/>
                             <p class='flex-caption'></p></li>";
                    }

                    //foreach (DataRow dr in dt.Rows)
                    //{
                    //    if (Accesse == true)
                    //    {
                    //        Accesse = false;
                    //        Message += $@"<li data-thumb='Img/HomeSlider/{dr["PictureName"]}' style='width:1158px; float:left;display:block;' class='flex-active-slide'>
                    //          <img src='Img/HomeSlider/{dr["PictureName"]}'/>
                    //         <p class='flex-caption'></p></li>";
                    //    }
                    //    else
                    //    {
                    //        Message += $@"<li data-thumb='Img/HomeSlider/{dr["PictureName"]}' style='width:1158px; float:left;display:block;' class>
                    //          <img src='Img/HomeSlider/{dr["PictureName"]}'/>
                    //         <p class='flex-caption'></p></li>";
                    //    }

                    //}

                    result.Message = Message;
                    result.Success = true;
                }
                else
                {
                    result.Success = false;
                }
                return result;
            }
            catch (Exception ex)
            {

                throw;
            }
        }
        [WebMethod]
        public static JSONObject LoadAllSetting()
        {
            try
            {
                var result = new JSONObject();
                DataTable CompanySetting = null;
                DataTable NewSetting = null;
                DataTable DownSetting = null;
                DataTable NotificationSetting = null;
                result.Datas = new object[30];
                string NewsFeeds = "";
                string AdsFeed = "";
                string DownFeeds = "";
                string Notification = "";
                DataSet ds = BusinessLayer.HomeSlider.GetAllSettings();

                CompanySetting = ds.Tables[0];
                NewSetting = ds.Tables[1];
                DownSetting = ds.Tables[2];
                NotificationSetting = ds.Tables[3];

                var a = 1;
                if (DownSetting.Rows.Count > 0)
                {
                    foreach (DataRow dr in DownSetting.Rows)
                    {
                        DownFeeds += $@"<tr><td>{a}</td>
                                    <td><b>{dr["DisplayName"].ToText()}</b></td>
                                    <td><a href='Downloads/{dr["PDFName"].ToText()}' target='_blank'><span class='btn btn-success btn-xs Read' title='Read'><i class='fa fa-eye fa-sx'></i></span></a>
                                          <a href='Downloads/{dr["PDFName"].ToText()}' target='_blank' download><span class='btn btn-primary btn-xs Delete' title='DownLoad'><i class='fa fa-download fa-xs'></i></span></a></td></tr>";
                        a++;
                    }
                }
                if (CompanySetting.Rows.Count > 0)
                {
                    foreach (DataRow dr in CompanySetting.Rows)
                    {
                        result.Datas[0] = dr["CompanyName"].ToText();
                        result.Datas[1] = dr["PhoneNo"].ToText();
                        result.Datas[2] = dr["EmailID"].ToText();
                        result.Datas[3] = dr["PostBoxNo"].ToText();
                        result.Datas[4] = dr["City"].ToText();
                        result.Datas[5] = dr["CompanyName"].ToText();
                    }
                }


                if (NotificationSetting.Rows.Count > 0)
                {
                    result.Alert = true;
                    result.Datas[6] = NotificationSetting.Rows.Count;
                    var i = 7;
                    foreach (DataRow dr in NotificationSetting.Rows)
                    {
                        if (dr["PictureName"].ToText() != "")
                        {
                            var str = "<img src='Img/Notification/" + dr["PictureName"].ToText() + "'/>";
                            if (dr["NotificationLink"].ToText() != "")
                            {
                                str += "<br/><a style='color:black;font-size:15px;font-weight:bold'  target='_blank'   href ='" + dr["NotificationLink"].ToText() + "' > Click Here For More Details</a>";
                            }

                            result.Datas[i] = str;
                        }

                        //result.Datas[i] += "<br/>  <p  style='color:black;font-size:14px'>" + dr["NotificationDetails"].ToText() + "</p>";
                        i++;
                    }

                }


                //foreach (DataRow dr in NewSetting.Rows)
                //{
                //    NewsFeeds += $@"<div class='row' style='color:white'><div class='span12'>
                //             <h4>{dr["Title"]}</h4> <p>{dr["SampleContent"]}</p> <a href='NewsPanel.aspx?id={dr["NewsID"]}' target='_blank'>Read more</a></div></div>";
                //}

                result.Success = true;
                result.AdditionalData = NewsFeeds;
                //result.Datas[6] = DownFeeds;

                return result;
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        [WebMethod]
        public static JSONObject Messages(object FacebookID, object FacebookName, object Email, object SenderName, object Subject, object Message)
        {
            var result = new JSONObject();
            var senderName = SenderName.ToText();
            var faceBookName = FacebookName.ToText();
            var faceBookID = FacebookID.ToText();
            var senderEmail = Email.ToText();
            var SenderSubject = Subject.ToText();
            var SenderMessage = Message.ToText();
            var MessageSentDate = DateTime.Now;

            var model = new ClassCollection
            {
                ContactInfo = new ContactUsInfo()
                {
                    SenderName = senderName,
                    SenderEmail = senderEmail,
                    SenderMessage = SenderMessage,
                    SenderSubject = SenderSubject,
                    FaceBookName = faceBookName,
                    FaceBookID = faceBookID,
                    MessageSentDate = MessageSentDate.ToText()

                }
            };

            int i = BusinessLayer.ContactUsServies.SaveContact(model);
            if (i > 0)
            {
                result.Success = true;
                return result;
            }
            result.Success = false;
            return result;
        }

    }
}