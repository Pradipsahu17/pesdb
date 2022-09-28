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
    public partial class NewsSetting : DJBaseClass
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static JSONObject LoadNewsDetails()
        {
            var result = new JSONObject();
            var NewsList = "";
            var dt = NewsSettings.GetNewsList();
            if (dt.Rows.Count > 0)
            {
                result.Success = true;
                foreach (DataRow dr in dt.Rows)
                {
                    NewsList += "<tr id='a" + dr["NewsID"] + "'><td>" + dr["NewsID"] + "</td><td>" + dr["Title"] + "</td><td>" + dr["NewsDate"] + "</td><td>" + dr["CreatedDate"] + "</td><td>" + dr["IsActive"] + "</td>"
                       + "<td><button id='c" + dr["NewsID"] + "' onclick=Active(this)   class='btn btn-success' type='button'><i class='fa fa-eye fa-xs'></i></button>&nbsp;<button id='b" + dr["NewsID"] + "' onclick=Delete(this) class='btn btn-primary' type='button'><i class='fa fa-trash fa-xs'></i></button></td></tr>";
                }
                result.Data = NewsList;
            }
            return result;
        }
        [WebMethod]
        public static JSONObject MakeInactive(string NewsID)
        {
            var result = new JSONObject();
            string NewsList = "";
            var dt = NewsSettings.MakeInactive(NewsID.ToInt());
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
        public static JSONObject DeleteNews(string NewsId)
        {
            var result = new JSONObject();
            var details = NewsSettings.GetIndividualNews(NewsId.ToInt());

            if(details.Rows.Count>0)
            {
                var dt = NewsSettings.DeleteNews(NewsId.ToInt());

                if (dt > 0)
                {
                    if (details.Rows[0]["PictureName"].ToText() != "")
                    {
                        File.Delete(HttpContext.Current.Server.MapPath("/Img/NewsPicture/" + details.Rows[0]["PDFName"].ToText()));
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var model = new ClassCollection
            {
                NewsInfo = new NewsDetails()
                {
                    Title = txtBox.Text.Trim().ToText(),
                    SampleContent = txtSampleContent.Text.Trim().ToText(),
                    NewsDate = txtNewsDate.Text.Trim().ToText(),
                    content = tinymce.InnerText.Trim().ToText(),
                    PictureName = FileUpload1.FileName.ToText(),
                    CreatedDate = DateTime.Now.ToShortDateString(),
                    LinkPicture = txtpicturname.Text.Trim().ToText()

                }
            };

            int i = NewsSettings.SaveNews(model);
            if (i > 0)
            {
                if (FileUpload1.FileName.ToText() != string.Empty)
                {
                    FileUpload1.SaveAs(Server.MapPath("Img/NewsPicture/" + FileUpload1.FileName));
                }
                txtBox.Text = string.Empty;
                tinymce.InnerText = string.Empty;
                txtNewsDate.Text = string.Empty;
                txtSampleContent.Text = string.Empty;
                ShowMessage("Save Successful", new Success());
                //Session["SaveSuccessful"] = 4;
                Response.Redirect("NewsSetting.aspx");

                //Response.Redirect("NewsPanelSetting");

            }
        }
    }
}