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
    public partial class MaintainGallary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {

                var uploadeddate = DateTime.Now;
                var model = new ClassCollection
                {
                    GallaryInfo = new GallaryDetails()
                    {
                        PictureName = FileUpload1.FileName,
                        PictureTitle = txtDisplayName.Text.Trim(),
                        PictureDescription = txtDescription.Text.Trim(),
                        CreatedDate = uploadeddate.ToText(),
                    }
                };
                int i = BusinessLayer.GallaryService.SaveGallary(model);
                if (i > 0)
                {
                    FileUpload1.SaveAs(Server.MapPath("/Img/Gallary/" + FileUpload1.FileName));

                    Response.Redirect("MaintainGallary.aspx");

                }
            }
            catch (Exception ex)
            {

                throw;
            }
        }


        [WebMethod]
        public static string LoadGalleryDetails()
        {
            try
            {
                DataTable dt = BusinessLayer.GallaryService.GetAllGallary();
                string Gallery = "";
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        Gallery += $@"<li class='span3  card'>
                                   <div class='work'>
                                   <a href='Img/Gallary/{dr["PictureName"]}'>
                            <img src='Img/Gallary/{dr["PictureName"]}' alt='' style='height: 200px; width: 250px; border-radius: 10px' />
                        </a>
                        <h4>{dr["PictureTitle"]}</h4>
                        <p></p>
                    </div>
                    <div class='btn-group form-inline'>
                        <span  class='btn btn-primary btn-xs'   onclick=Active({dr["PID"]}) title='Active'><i class='fa fa-eye fa-xs'></i></span>
                        &nbsp;&nbsp;&nbsp;
                        <span  class='btn btn-danger  btn-xs'   onclick=Delete({dr["PID"]}) title='Delete'><i class='fa fa-trash fa-xs'></i></span>
                    </div>
                </li>";
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
        public static JSONObject MakeInactive(string GId)
        {
            var result = new JSONObject();
            try
            {
                var status = BusinessLayer.GallaryService.MakeInactive(GId.ToInt());
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
        public static JSONObject DeletePicture(string GId)
        {
            try
            {
                var result = new JSONObject();
                var newGId = GId.ToInt();
                var getDloadDetails = BusinessLayer.GallaryService.GetGallaryToDelete(newGId);
                if (getDloadDetails.Rows.Count > 0)
                {
                    File.Delete(HttpContext.Current.Server.MapPath("/Img/Gallary/" + getDloadDetails.Rows[0]["PictureName"].ToText()));
                    BusinessLayer.GallaryService.DeleteGallary(newGId);
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