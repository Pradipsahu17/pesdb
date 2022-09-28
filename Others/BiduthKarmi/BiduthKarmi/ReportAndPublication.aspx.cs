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
    public partial class ReportAndPublication : System.Web.UI.Page
    {
        private int PID => Request.QueryString["id"].ToInt();
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
                if (PID > 0)
                {
                    var NewsDetails = BusinessLayer.PublicationService.GetIndividualPublication(PID);
                    newsTitle.Text = NewsDetails.Rows[0]["PublicationName"].ToText();
                    newsBody.Text = NewsDetails.Rows[0]["Contain"].ToText();
                    if (NewsDetails.Rows[0]["ImageName"].ToText() != "")
                    {
                        ImgSrc.Visible = true;

                        ImageUrl.ImageUrl = "Img/Publication/" + NewsDetails.Rows[0]["ImageName"].ToText();
                    }
                    else
                    {
                        ImgSrc.Visible = false;
                    }
                    PublicationCollection2.Visible = false;
                }
                else
                {
                    PublicationCollection1.Visible = false;
                }
            }
        }
        [WebMethod]
        public static JSONObject LoadAllPublication(string URL)
        {
            try
            {
                var L = URL.Split('=');
                var result = new JSONObject();
                DataTable PublicationSetting = BusinessLayer.PublicationService.GetPublication();
                string PublicationFeeds = "";
                foreach (DataRow dr in PublicationSetting.Rows)
                {
                    if (L.Length > 1)
                    {
                        if (L[1].ToText() == "Nepali")
                        {


                            if (dr["ImageName"].ToText() != "" && dr["PDFName"].ToText() != "")
                            {
                                PublicationFeeds += $@"<div class='row'><div class='span12'>
                            <div class='row'>
                                <div class='span4'>
                                    <h4>{dr["PublicationName"]}</h4>
                                    <p>{dr["SampleContain"]}</p>
                                    <table><tr><td><img src='Img/Publication/{dr["ImageName"]}' width='200' height='200'/></td><td>
                                                <a href='ReportAndPublication.aspx?type=Nepali&id={dr["PId"]}' class='btn btn-primary'>Read more</a>
                                                <br/><br/><a href='Img/Publication/{dr["PDFName"]}' target='_blank' class='btn btn-danger'>GET PDF</a></td></tr></table></div></div></div></div>";
                            }
                            else if (dr["ImageName"].ToText() != "" && dr["PDFName"].ToText() == "")
                            {
                                PublicationFeeds += $@"<div class='row'><div class='span12'>
                            <div class='row'>
                                <div class='span4'>
                                    <h4>{dr["PublicationName"]}</h4>
                                    <p>{dr["SampleContain"]}</p>
                                    <table><tr><td><img src='Img/Publication/{dr["ImageName"]}' width='200' height='200'/></td><td>
                                                <a href='ReportAndPublication.aspx?type=Nepali&id={dr["PId"]}' class='btn btn-primary'>Read more</a>
                                                </td></tr></table></div></div></div></div>";
                            }
                            else if (dr["ImageName"].ToText() == "" && dr["PDFName"].ToText() != "")
                            {
                                PublicationFeeds += $@"<div class='row'><div class='span12'>
                            <div class='row'>
                                <div class='span4'>
                                    <h4>{dr["PublicationName"]}</h4>
                                    <p>{dr["SampleContain"]}</p>
                                    <table><tr><td>
                                                <a href='ReportAndPublication.aspx?type=Nepali&id={dr["PId"]}' class='btn btn-primary'>Read more</a>
                                                <a href='Img/Publication/{dr["PDFName"]}' target='_blank' class='btn btn-danger'>GET PDF</a></td></tr></table></div></div></div></div>";
                            }
                            else if (dr["ImageName"].ToText() == "" && dr["PDFName"].ToText() == "")
                            {
                                PublicationFeeds += $@"<div class='row'><div class='span12'>
                            <div class='row'>
                                <div class='span4'>
                                    <h4>{dr["PublicationName"]}</h4>
                                    <p>{dr["SampleContain"]}</p>
                                    <table><tr><td><a href='ReportAndPublication.aspx?type=Nepali&id={dr["PId"]}' class='btn btn-primary'>Read more</a>";
                            }
                            else
                            {
                                PublicationFeeds += $@"<div class='row'><div class='span12'>
                            <div class='row'>
                                <div class='span4'>
                                    <h4>{dr["PublicationName"]}</h4>
                                    <p>{dr["SampleContain"]}</p>
                                    <table><tr><td><a href='ReportAndPublication.aspx?type=Nepali&id={dr["PId"]}' class='btn btn-primary'>Read more</a>";
                            }
                        }
                        else
                        {


                            if (dr["ImageName"].ToText() != "" && dr["PDFName"].ToText() != "")
                            {
                                PublicationFeeds += $@"<div class='row'><div class='span12'>
                            <div class='row'>
                                <div class='span4'>
                                    <h4>{dr["PublicationName"]}</h4>
                                    <p>{dr["SampleContain"]}</p>
                                    <table><tr><td><img src='Img/Publication/{dr["ImageName"]}' width='200' height='200'/></td><td>
                                                <a href='ReportAndPublication.aspx?id={dr["PId"]}' class='btn btn-primary'>Read more</a>
                                                <br/><br/><a href='Img/Publication/{dr["PDFName"]}' target='_blank' class='btn btn-danger'>GET PDF</a></td></tr></table></div></div></div></div>";
                            }
                            else if (dr["ImageName"].ToText() != "" && dr["PDFName"].ToText() == "")
                            {
                                PublicationFeeds += $@"<div class='row'><div class='span12'>
                            <div class='row'>
                                <div class='span4'>
                                    <h4>{dr["PublicationName"]}</h4>
                                    <p>{dr["SampleContain"]}</p>
                                    <table><tr><td><img src='Img/Publication/{dr["ImageName"]}' width='200' height='200'/></td><td>
                                                <a href='ReportAndPublication.aspx?id={dr["PId"]}' class='btn btn-primary'>Read more</a>
                                                </td></tr></table></div></div></div></div>";
                            }
                            else if (dr["ImageName"].ToText() == "" && dr["PDFName"].ToText() != "")
                            {
                                PublicationFeeds += $@"<div class='row'><div class='span12'>
                            <div class='row'>
                                <div class='span4'>
                                    <h4>{dr["PublicationName"]}</h4>
                                    <p>{dr["SampleContain"]}</p>
                                    <table><tr><td>
                                                <a href='ReportAndPublication.aspx?id={dr["PId"]}' class='btn btn-primary'>Read more</a>
                                                <a href='Img/Publication/{dr["PDFName"]}' target='_blank' class='btn btn-danger'>GET PDF</a></td></tr></table></div></div></div></div>";
                            }
                            else if (dr["ImageName"].ToText() == "" && dr["PDFName"].ToText() == "")
                            {
                                PublicationFeeds += $@"<div class='row'><div class='span12'>
                            <div class='row'>
                                <div class='span4'>
                                    <h4>{dr["PublicationName"]}</h4>
                                    <p>{dr["SampleContain"]}</p>
                                    <table><tr><td><a href='ReportAndPublication.aspx?id={dr["PId"]}' class='btn btn-primary'>Read more</a>";
                            }
                            else
                            {
                                PublicationFeeds += $@"<div class='row'><div class='span12'>
                            <div class='row'>
                                <div class='span4'>
                                    <h4>{dr["PublicationName"]}</h4>
                                    <p>{dr["SampleContain"]}</p>
                                    <table><tr><td><a href='ReportAndPublication.aspx?id={dr["PId"]}' class='btn btn-primary'>Read more</a>";
                            }
                        }
                    }
                    else
                    {

                        if (dr["ImageName"].ToText() != "" && dr["PDFName"].ToText() != "")
                        {
                            PublicationFeeds += $@"<div class='row'><div class='span12'>
                            <div class='row'>
                                <div class='span4'>
                                    <h4>{dr["PublicationName"]}</h4>
                                    <p>{dr["SampleContain"]}</p>
                                    <table><tr><td><img src='Img/Publication/{dr["ImageName"]}' width='200' height='200'/></td><td>
                                                <a href='ReportAndPublication.aspx?id={dr["PId"]}' class='btn btn-primary'>Read more</a>
                                                <br/><br/><a href='Img/Publication/{dr["PDFName"]}' target='_blank' class='btn btn-danger'>GET PDF</a></td></tr></table></div></div></div></div>";
                        }
                        else if (dr["ImageName"].ToText() != "" && dr["PDFName"].ToText() == "")
                        {
                            PublicationFeeds += $@"<div class='row'><div class='span12'>
                            <div class='row'>
                                <div class='span4'>
                                    <h4>{dr["PublicationName"]}</h4>
                                    <p>{dr["SampleContain"]}</p>
                                    <table><tr><td><img src='Img/Publication/{dr["ImageName"]}' width='200' height='200'/></td><td>
                                                <a href='ReportAndPublication.aspx?id={dr["PId"]}' class='btn btn-primary'>Read more</a>
                                                </td></tr></table></div></div></div></div>";
                        }
                        else if (dr["ImageName"].ToText() == "" && dr["PDFName"].ToText() != "")
                        {
                            PublicationFeeds += $@"<div class='row'><div class='span12'>
                            <div class='row'>
                                <div class='span4'>
                                    <h4>{dr["PublicationName"]}</h4>
                                    <p>{dr["SampleContain"]}</p>
                                    <table><tr><td>
                                                <a href='ReportAndPublication.aspx?id={dr["PId"]}' class='btn btn-primary'>Read more</a>
                                                <a href='Img/Publication/{dr["PDFName"]}' target='_blank' class='btn btn-danger'>GET PDF</a></td></tr></table></div></div></div></div>";
                        }
                        else if (dr["ImageName"].ToText() == "" && dr["PDFName"].ToText() == "")
                        {
                            PublicationFeeds += $@"<div class='row'><div class='span12'>
                            <div class='row'>
                                <div class='span4'>
                                    <h4>{dr["PublicationName"]}</h4>
                                    <p>{dr["SampleContain"]}</p>
                                    <table><tr><td><a href='ReportAndPublication.aspx?id={dr["PId"]}' class='btn btn-primary'>Read more</a>";
                        }
                        else
                        {
                            PublicationFeeds += $@"<div class='row'><div class='span12'>
                            <div class='row'>
                                <div class='span4'>
                                    <h4>{dr["PublicationName"]}</h4>
                                    <p>{dr["SampleContain"]}</p>
                                    <table><tr><td><a href='ReportAndPublication.aspx?id={dr["PId"]}' class='btn btn-primary'>Read more</a>";
                        }
                    }
                }

                result.Success = true;
                result.AdditionalData = PublicationFeeds;

                return result;
            }
            catch (Exception ex)
            {

                throw;
            }
        }
    }
}