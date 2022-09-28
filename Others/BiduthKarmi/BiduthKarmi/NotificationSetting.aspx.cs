using BusinessLayer;
using CommonLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static CommonLayer.MessageExtension;

namespace BiduthKarmi
{
    public partial class NotificationSetting : DJBaseClass
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var model = new ClassCollection
            {
                NotificationInfo = new NotificationDetails()
                {
                    PictureName = FileUpload1.FileName.ToText(),
                    CreatedDate = DateTime.Now.ToShortDateString(),
                    NotificationName = txtNotificationName.Text.Trim(),
                    NotificationLink=txtNotificationLink.Text.Trim(),
                    NotificationDetail = txtNotificationName.Text.Trim()
                }
            };

            int i = NotificationService.SaveNotification(model);
            if (i > 0)
            {
                if (FileUpload1.FileName.ToText() != string.Empty)
                {
                    FileUpload1.SaveAs(Server.MapPath("Img/Notification/" + FileUpload1.FileName));
                }

                ShowMessage("Save Successful", new Success());
                //Session["SaveSuccessful"] = 4;
                Response.Redirect("NotificationSetting.aspx");

            }
        }
        [WebMethod]
        public static string LoadNotificationDetails()
        {
            try
            {
                DataTable dt = BusinessLayer.NotificationService.GetAllNotification();
                string Notification = "";
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        Notification += "<tr id='a" + dr["NID"] + "' class='hover'><td>" + dr["NID"] + "</td>"
                            + "<td> <img src='Img/Notification/" + dr["PictureName"] + "' height='50' style='cursor:pointer' class='img-responsive'/> </td>"
                             + "<td>" + dr["NotificationName"] + "</td>"
                              + "<td>" + dr["NotificationLink"] + "</td>"
                            + "<td>" + dr["CreatedDate"] + "</td>"
                            + "<td>" + dr["IsActive"] + "</td>"
                            + "<td><span class='btn btn-light btn-xs Read' id='a" + dr["NID"] + "' onclick=Active(this) title='Active'><i class='fa fa-eye fa-sx'></i></span>"
                            + "<span class='btn btn-light btn-xs Delete' id='a" + dr["NID"] + "' onclick=Delete(this) title='Delete'><i class='fa fa-trash fa-xs'></i></span></td></tr>";
                    }
                }
                return Notification;
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        [WebMethod]
        public static JSONObject MakeInactive(string NID)
        {
            var result = new JSONObject();
            try
            {

                var status = BusinessLayer.NotificationService.MakeInactive(NID.ToInt());
                if (status)
                {
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
                result.Success = false;
                return result;
            }
        }

        [WebMethod]
        public static JSONObject DeleteNotification(string NID)
        {
            try
            {
                var result = new JSONObject();
                var newNID = NID.ToInt();
                var getPictureDetails = BusinessLayer.NotificationService.GetNotificationToDelete(newNID);
                if (getPictureDetails.Rows.Count > 0)
                {
                    File.Delete(HttpContext.Current.Server.MapPath("/Img/Notification" + getPictureDetails.Rows[0]["PictureName"].ToText()));
                    BusinessLayer.NotificationService.DeleteNotification(newNID.ToInt());
                    result.Success = true;
                }

                return result;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

    }
}