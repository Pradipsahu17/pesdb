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
    public partial class Gallary : System.Web.UI.Page
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

        }

        [WebMethod]
        public static string LoadGalleryDetails()
        {
            try
            {
                DataTable dt = BusinessLayer.GallaryService.GetAllGallaryDisplay();
                string Gallery = "";
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        Gallery += $@"<li class='span3'>
                    <div class='work'>
                        <a href ='Img/Gallary/{dr["PictureName"]}'>
                            <img src='Img/Gallary/{dr["PictureName"]}' alt=''   style='border-radius: 10px;' /></a><h4>{dr["PictureTitle"]}</h4><p></p></div></li>";
                    }
                }
                return Gallery;
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}