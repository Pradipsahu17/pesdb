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
    public partial class Downloads : System.Web.UI.Page
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
        public static JSONObject LoadAllSetting(string DID)
        {
            try
            {
                var result = new JSONObject();
                string DownSetting = "";
                DataTable DownloadsSetting = null;
                if (DID == "55")
                {
                    DownloadsSetting = BusinessLayer.DownloadService.GetDownLoadDetails();
                }
                else
                {
                    DownloadsSetting = BusinessLayer.DownloadService.GetDownLoadsCategory(DID);
                }
                var a = 1;
                foreach (DataRow dr in DownloadsSetting.Rows)
                {

                    DownSetting += $@"<tr><td>{a}</td>
                                    <td><b>{dr["DisplayName"].ToText()}</b></td>
                                    <td><a href='Downloads/{dr["PDFName"].ToText()}' target='_blank'><span class='btn btn-success btn-xs Read' title='Read'><i class='fa fa-eye fa-sx'></i></span></a>
                                          <a href='Downloads/{dr["PDFName"].ToText()}' target='_blank' download><span class='btn btn-primary btn-xs Delete' title='DownLoad'><i class='fa fa-download fa-xs'></i></span></a></td></tr>";
                    a++;
                }

                result.Success = true;
                result.AdditionalData = DownSetting;

                return result;
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        [WebMethod]
        public static JSONObject LoadAavailableDownloads()
        {
            try
            {
                var result = new JSONObject();
                string DownSetting = "";
                DataTable DownloadsSetting = null;
                DownloadsSetting = BusinessLayer.DownloadService.GetAllDownLoadCategory();
                foreach (DataRow dr in DownloadsSetting.Rows)
                {
                    DownSetting += $@"<li><a href='Downloads.aspx?id={dr["CID"]}'><b>{dr["DloadCatagory"]} </b></a></li>";
                }
                DownSetting += $@"<li><a href='Downloads.aspx?id=55'><b>All Forms</b></a></li>";
                result.Success = true;
                result.AdditionalData = DownSetting;
                return result;
            }
            catch (Exception ex)
            {

                throw;
            }
        }

    }
}