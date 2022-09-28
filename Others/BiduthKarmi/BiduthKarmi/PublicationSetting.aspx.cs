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

namespace BiduthKarmi
{
    public partial class PublicationSetting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                var model = new ClassCollection
                {
                    PublicationInfo = new PublicationDetails()
                    {
                        PublicationName = txtDisplayName.Text.Trim(),
                        SampleContain = txtSampleContain.Text.Trim(),
                        Contain = tinymce.InnerText.Trim().ToText(),
                        ImageName = FileUpload1.FileName,
                        CreatedDate = DateTime.Now.ToShortDateString(),
                        PDFName = FileUpload2.FileName,
                    }
                };
                int i = BusinessLayer.PublicationService.SavePublication(model);
                if (i > 0)
                {
                    if (FileUpload1.FileName != "")
                    {
                        FileUpload1.SaveAs(Server.MapPath("/Img/Publication/" + FileUpload1.FileName));

                    }
                    if (FileUpload2.FileName != "")
                    {
                        FileUpload2.SaveAs(Server.MapPath("/Img/Publication/" + FileUpload2.FileName));
                    }

                    Response.Redirect("PublicationSetting.aspx");

                }
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        [WebMethod]
        public static JSONObject LoadPublicationDetails()
        {
            var result = new JSONObject();
            var NewsList = "";
            var dt = PublicationService.GetPublicationList();
            if (dt.Rows.Count > 0)
            {
                result.Success = true;
                foreach (DataRow dr in dt.Rows)
                {
                    NewsList += "<tr id='a" + dr["PID"] + "'><td>" + dr["PID"] + "</td><td>" + dr["PublicationName"] + "</td><td>" + dr["CreatedDate"] + "</td><td>" + dr["IsActive"] + "</td>"
                       + "<td><button id='c" + dr["PID"] + "' onclick=Active(this)   class='btn btn-success' type='button'><i class='fa fa-eye fa-xs'></i></button>&nbsp;<button id='b" + dr["PID"] + "' onclick=Delete(this) class='btn btn-primary' type='button'><i class='fa fa-trash fa-xs'></i></button></td></tr>";
                }
                result.Data = NewsList;
            }
            return result;
        }
        [WebMethod]
        public static JSONObject MakeInactive(string PID)
        {
            var result = new JSONObject();
            string NewsList = "";
            var dt = PublicationService.MakeInactive(PID.ToInt());
            if (dt.Rows.Count > 0)
            {

                result.Success = true;
                result.Data = NewsList;
            }
            else
            {
                result.Success = false;
            }

            return result;
        }

        [WebMethod]
        public static JSONObject DeletePublication(string PId)
        {
            var result = new JSONObject();
            var details = PublicationService.GetIndividualPublication(PId.ToInt());
            if (details.Rows.Count > 0)
            {
                var dt = PublicationService.DeletePublication(PId.ToInt());
                if (dt > 0)
                {
                    if (details.Rows[0]["PDFName"].ToText() != "")
                    {
                        File.Delete(HttpContext.Current.Server.MapPath("/Img/Publication/" + details.Rows[0]["PDFName"].ToText()));
                    }
                    if (details.Rows[0]["ImageName"].ToText() != "")
                    {
                        File.Delete(HttpContext.Current.Server.MapPath("/Img/Publication/" + details.Rows[0]["ImageName"].ToText()));
                    }

                    result.Success = true;
                }
                else
                {
                    result.Success = false;
                }
            }


            return result;
        }


    }
}