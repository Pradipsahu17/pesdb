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
    public partial class HomeSlider : DJBaseClass
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                var createddate = DateTime.Now;
                int i = BusinessLayer.HomeSlider.SavePicture(txtPictureDeciption.Text, FileUpload1.FileName, 1, createddate);
                if (i > 0)
                {
                    FileUpload1.SaveAs(Server.MapPath("/Img/HomeSlider/" + FileUpload1.FileName));
                    Response.Redirect("HomeSlider.aspx");
                }
            }
            catch (Exception ex)
            {

                throw;
            }
        }
        [WebMethod]
        public static string LoadHomeSliderDetails()
        {
            try
            {
                DataTable dt = BusinessLayer.HomeSlider.GetAllPicture();
                string Gallery = "";
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        Gallery += "<tr id='a" + dr["ID"] + "' class='hover'><td>" + dr["ID"] + "</td>"
                            + "<td> <img src='Img/HomeSlider/" + dr["PictureName"] + "' height='50' style='cursor:pointer' class='img-responsive'/> </td>"
                              + "<td>" + dr["CreatedDate"] + "</td>"
                            + "<td>" + dr["IsActive"] + "</td>"
                            + "<td><span class='btn btn-light btn-xs Read' id='a" + dr["ID"] + "' onclick=Active(this) title='Active'><i class='fa fa-eye fa-sx'></i></span>   "
                            + "<span class='btn btn-light btn-xs Delete' id='a" + dr["ID"] + "' onclick=Delete(this) title='Delete'><i class='fa fa-trash fa-xs'></i></span></td></tr>";

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
        public static JSONObject MakeInactive(string PictureId)
        {
            var result = new JSONObject();
            try
            {

                var status = BusinessLayer.HomeSlider.MakeInactive(PictureId.ToInt());
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
        public static JSONObject DeletePicture(string PictureId)
        {
            try
            {
                var result = new JSONObject();
                var newPictureId = PictureId.ToInt();
                var getPictureDetails = BusinessLayer.HomeSlider.GetPictureToDelete(newPictureId);
                if (getPictureDetails.Rows.Count > 0)
                {
                    File.Delete(HttpContext.Current.Server.MapPath("/Img/HomeSlider" + getPictureDetails.Rows[0]["PictureName"].ToText()));
                    BusinessLayer.HomeSlider.DeletePicture(PictureId.ToInt());
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