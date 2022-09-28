using BusinessLayer;
using CommonLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static CommonLayer.MessageExtension;

namespace BiduthKarmi
{
    public partial class CareerSetting : DJBaseClass
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var model = new ClassCollection
            {
                CareerInfo = new CareerDetails()
                {
                    Title = txtBox.Text.Trim().ToText(),
                    Content = tinymce.InnerText.Trim().ToText(),
                    FileName = FileUpload1.FileName.ToText(),
                    CreatedDate = DateTime.Now.ToShortDateString(),
                }
            };

            int i = CareerServices.SaveCareer(model);
            if (i > 0)
            {
                if (FileUpload1.FileName.ToText() != string.Empty)
                {
                    FileUpload1.SaveAs(Server.MapPath("Img/Career/" + FileUpload1.FileName));
                }
                txtBox.Text = string.Empty;
                tinymce.InnerText = string.Empty;
                ShowMessage("Save Successful", new Success());
                Response.Redirect("CareerSetting.aspx");
            }
        }

        [WebMethod]
        public static JSONObject LoadCareerDetails()
        {
            var result = new JSONObject();
            var NewsList = "";
            var dt = CareerServices.GetCareerList();
            if (dt.Rows.Count > 0)
            {
                result.Success = true;
                foreach (DataRow dr in dt.Rows)
                {
                    NewsList += "<tr id='a" + dr["CID"] + "'><td>" + dr["CID"] + "</td><td>" + dr["Title"] + "</td><td>" + dr["CreatedDate"] + "</td><td>" + dr["IsActive"] + "</td>"
                       + "<td><button id='c" + dr["CID"] + "' onclick=Active(this)   class='btn btn-success' type='button'><i class='fa fa-eye fa-xs'></i></button>&nbsp;<button id='b" + dr["CID"] + "' onclick=Edit(this) class='btn btn-primary' type='button'>Edit</i></button>&nbsp;<button id='b" + dr["CID"] + "' onclick=Delete(this) class='btn btn-primary' type='button'><i class='fa fa-trash fa-xs'></i></button></td></tr>";
                }
                result.Data = NewsList;
            }
            return result;
        }
        [WebMethod]
        public static JSONObject MakeInactive(string CID)
        {
            var result = new JSONObject();
            string NewsList = "";
            var dt = CareerServices.MakeInactive(CID.ToInt());
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
        public static JSONObject EditCareerSetting(string CID)
        {
            var result = new JSONObject();
            result.Datas = new object[7];
            var dt = CareerServices.GetCareerById(CID.ToInt());
            if (dt.Rows.Count > 0)
            {
                result.Success = true;
                result.Datas[0] = dt.Rows[0]["Title"].ToText();
                result.Datas[1] = dt.Rows[0]["CareerContent"].ToText();
            }
            else
            {
                result.Success = false;
            }
            return result;
        }

        [WebMethod]
        public static JSONObject DeleteCareer(string CID)
        {
            var result = new JSONObject();
            var dt = CareerServices.DeleteCareer(CID.ToInt());
            if (dt > 0)
            {
                result.Success = true;
            }
            else
            {
                result.Success = false;
            }
            

            return result;
        }


    }
}