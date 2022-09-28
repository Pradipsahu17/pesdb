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
    public partial class DownloadCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
       
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                var categoryName = txtDisplayName.Text;

                BusinessLayer.DownloadService.SaveCategory(categoryName);
                txtDisplayName.Text = "";
            }
            catch (Exception ex)
            {

                throw;
            }
        }


        [WebMethod]
        public static string LoadDownloadCategory()
        {
            try
            {
                DataTable dt = BusinessLayer.DownloadService.GetDownLoadCategory();
                string Gallery = "";
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        Gallery += "<tr id='a" + dr["CID"] + "' class='hover'><td>" + dr["CID"] + "</td>"
                            + "<td>" + dr["DloadCatagory"] + "</td>"
                             + "<td>" + dr["IsActive"] + "</td>"
                            + "<td><span class='btn btn-light btn-xs Read' id='a" + dr["CID"] + "' onclick=Active(this) title='Active'><i class='fa fa-eye fa-sx'></i></span>   "
                            + "<span class='btn btn-light btn-xs Delete' id='a" + dr["CID"] + "' onclick=Delete(this) title='Delete'><i class='fa fa-trash fa-xs'></i></span></td></tr>";

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
        public static JSONObject MakeInactive(string CID)
        {
            var result = new JSONObject();
            try
            {
                var status = BusinessLayer.DownloadService.MakeCategoryInactive(CID.ToInt());
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
        public static JSONObject DeletePicture(string CID)
        {
            try
            {
                var result = new JSONObject();
                var newCId = CID.ToInt();
                var getDloadDetails = BusinessLayer.DownloadService.GetCategoryToDelete(newCId);
                return result;
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
   
}