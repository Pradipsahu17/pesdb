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
    public partial class MaintainDownloads : DJBaseClass
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var details = BusinessLayer.DownloadService.GetAllDownLoadCategory();
                DropDownList.DataSource = details;
                DropDownList.DataBind();
                DropDownList.DataTextField = "DloadCatagory";
                DropDownList.DataValueField = "CID";
                DropDownList.DataBind();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {

                var uploadeddate = DateTime.Now;
                var model = new ClassCollection
                {
                    DownLoadInfo = new DownloadSetting()
                    {
                        DisplayName = txtDisplayName.Text.Trim(),
                        FileName = FileUpload1.FileName,
                        UploadDate = uploadeddate.ToText(),
                        CategoryID = DropDownList.SelectedItem.Value
                    }

                };
                int i = BusinessLayer.DownloadService.SaveDownLoad(model);
                //int i = BusinessLayer.HomeSlider.SavePicture(txtPictureDeciption.Text, FileUpload1.FileName, 1, createddate);
                if (i > 0)
                {
                    FileUpload1.SaveAs(Server.MapPath("/Downloads/" + FileUpload1.FileName));
                    Response.Redirect("MaintainDownloads.aspx");
                }
                else
                {
                    ErrorLabel.Visible = true;
                }
            }
            catch (Exception ex)
            {

                throw;
            }
        }


        [WebMethod]
        public static string LoadDownloadDetails()
        {
            try
            {
                DataTable dt = BusinessLayer.DownloadService.GetAllDownLoadForAdmin();
                string Gallery = "";
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        Gallery += "<tr id='a" + dr["DID"] + "' class='hover'><td>" + dr["DID"] + "</td>"
                            + "<td>" + dr["DisplayName"] + "</td>"
                            + "<td>" + dr["UploadedDate"] + "</td>"
                            + "<td>" + dr["IsActive"] + "</td>"
                            + "<td><span class='btn btn-light btn-xs Read' id='a" + dr["DID"] + "' onclick=Active(this) title='Active'><i class='fa fa-eye fa-sx'></i></span>   "
                            + "<span class='btn btn-light btn-xs Delete' id='a" + dr["DID"] + "' onclick=Delete(this) title='Delete'><i class='fa fa-trash fa-xs'></i></span></td></tr>";

                    }
                }
                return Gallery;
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        [WebMethod]
        public static JSONObject MakeInactive(string DId)
        {
            var result = new JSONObject();
            try
            {
                var status = BusinessLayer.DownloadService.MakeInactive(DId.ToInt());
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
        public static JSONObject DeletePicture(string DId)
        {
            try
            {
                var result = new JSONObject();
                var newDId = DId.ToInt();
                var getDloadDetails = BusinessLayer.DownloadService.GetDownLoadToDelete(newDId);
                if (getDloadDetails.Rows.Count > 0)
                {
                    File.Delete(HttpContext.Current.Server.MapPath("/Downloads/" + getDloadDetails.Rows[0]["PDFName"].ToText()));
                    BusinessLayer.DownloadService.DeleteDownLoad(newDId);
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