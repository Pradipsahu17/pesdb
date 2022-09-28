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
    public partial class Career : System.Web.UI.Page
    {
        private int CID => Request.QueryString["id"].ToInt();
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
            if (!IsPostBack)
            {
                if (CID > 0)
                {
                    var CareerDetails = BusinessLayer.CareerServices.GetIndividualCareer(CID);
                    CareerTitle.Text = CareerDetails.Rows[0]["Title"].ToText();
                    CareerBody.Text = CareerDetails.Rows[0]["CareerContent"].ToText();
                    if (CareerDetails.Rows[0]["FileName"].ToText() != "" && CareerDetails.Rows[0]["FileName"].ToText() != null)
                    {
                        target.HRef = "Img/Career/" + CareerDetails.Rows[0]["FileName"].ToText();
                    }
                    else
                    {
                        target.Visible = false;
                    }


                    CareerCollection2.Visible = false;
                }
                else
                {
                    CareerCollection1.Visible = false;
                }
            }

        }

        [WebMethod]
        public static JSONObject LoadAllCareerDetails(string URL)
        {
            try
            {
                var L = URL.Split('=');
                var result = new JSONObject();
                DataTable CareerSetting = BusinessLayer.CareerServices.GetCareer();
                string NewsFeeds = "";
                foreach (DataRow dr in CareerSetting.Rows)
                {
                    if (L.Length > 1)
                    {
                        if (L[1].ToText() == "Nepali")
                        {
                            NewsFeeds += $@"<div class='row'><div class='span12'>
                             <h4>{dr["Title"]}</h4><a href='Career.aspx?type=Nepali&id={dr["CID"]}'>Read more</a></div></div>";
                        }
                        else
                        {
                            NewsFeeds += $@"<div class='row'><div class='span12'>
                             <h4>{dr["Title"]}</h4><a href='Career.aspx?id={dr["CID"]}'>Read more</a></div></div>";
                        }
                    }
                    else
                    {
                        NewsFeeds += $@"<div class='row'><div class='span12'>
                             <h4>{dr["Title"]}</h4><a href='Career.aspx?id={dr["CID"]}'>Read more</a></div></div>";
                    }



                }

                result.Success = true;
                result.AdditionalData = NewsFeeds;

                return result;
            }
            catch (Exception ex)
            {

                throw;
            }
        }
    }
}