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
    public partial class NewsPanel : System.Web.UI.Page
    {
        private int NewsID => Request.QueryString["id"].ToInt();
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
                if (NewsID > 0)
                {
                    var NewsDetails = BusinessLayer.NewsSettings.GetIndividualNews(NewsID);
                    newsTitle.Text = NewsDetails.Rows[0]["Title"].ToText();
                    newsBody.Text = NewsDetails.Rows[0]["NewsContent"].ToText();

                    NewsCollection2.Visible = false;
                }
                else
                {
                    NewsCollection1.Visible = false;
                }
            }

        }

        [WebMethod]
        public static JSONObject LoadAllNews(string URL)
        {
            try
            {
                var L = URL.Split('=');
                var result = new JSONObject();
                DataTable NewSetting = BusinessLayer.NewsSettings.GetNews();
                string NewsFeeds = "";
                foreach (DataRow dr in NewSetting.Rows)
                {
                    if (L.Length > 1)
                    {
                        if (L[1].ToText() == "Nepali")
                        {
                            NewsFeeds += $@"<div class='row'><div class='span12'>
                             <h4>{dr["Title"]}</h4> <p>{dr["SampleContent"]}</p> <a href='NewsPanel.aspx?type=Nepali&id={dr["NewsID"]}'>Read more</a></div></div>";
                        }
                        else
                        {
                            NewsFeeds += $@"<div class='row'><div class='span12'>
                             <h4>{dr["Title"]}</h4> <p>{dr["SampleContent"]}</p> <a href='NewsPanel.aspx?id={dr["NewsID"]}'>Read more</a></div></div>";
                        }
                    }
                    else
                    {
                        NewsFeeds += $@"<div class='row'><div class='span12'>
                             <h4>{dr["Title"]}</h4> <p>{dr["SampleContent"]}</p> <a href='NewsPanel.aspx?id={dr["NewsID"]}'>Read more</a></div></div>";
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