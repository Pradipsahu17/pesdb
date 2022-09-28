using BusinessLayer;
using CommonLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BiduthKarmi
{
    public partial class EducationSaving : System.Web.UI.Page
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
            //Populating a DataTable From Database 

            DataTable dt = ServiceDetailService.GetEducationAccountLists();

            //Buildint an Html string
            StringBuilder html = new StringBuilder();

            //Table Started.
            html.Append("<tr style='background-color:#191e70;'>");
            html.Append("<h3 style='border-top-right-radius: 8px; text-align:center; border-top-left-radius: 8px;padding:7px; font-size:20px;color: white; margin:45px 0px 0px 0px; background-color: #191e70;'>");
            html.Append("Interest Rate For Education Saving");
            html.Append("</h3>");
            html.Append("</tr>");
            html.Append("<table class='table table-bordered table-hover table-condensed active table-primary border-left-primary border-bottom-primary table-dark display responsive nowrap dataTable no-footer dtr-inline' style='color: black; text-align:justify; ' role='grid' aria-describedby='TableMain_info' > ");
            html.Append("<tr style='background-color:blue;'>");
            html.Append("<td style='font-size:15px;font-weight:700; color:#ffffff; padding:10px; text-align:center; width:25%;'>");
            html.Append("Saving Head");
            html.Append("</td>");
            html.Append("<td style='font-size:15px;font-weight:700; color:#ffffff; padding:10px; text-align:center; width:15%'>");
            html.Append("Interest Rate");
            html.Append("</td>");
            html.Append("<td style='font-size:15px;font-weight:700; color:#ffffff; padding:10px; text-align:center'>");
            html.Append("Terms & Conditions");
            html.Append("</td>");
            html.Append("</tr>");
            foreach (DataRow dr in dt.Rows)
            {
                var SavingHead = dr["SavingHead"].ToText();
                var InterestRate = dr["InterestRate"].ToText();
                var TermCondition = dr["TermCondition"].ToText();

                html.Append("<tr style='background-color:#eaeaea;'>");
                html.Append("<td style='font-size:13px;font-weight:700; font-color: black; padding:10px; text-align:center'>");
                html.Append(SavingHead);
                html.Append("</td>");
                html.Append("<td style='font-size:13px;font-weight:700; font-color: black; padding:10px; text-align:center'>");
                html.Append(InterestRate);
                html.Append("%");
                html.Append("</td>");
                html.Append("<td style='font-size:13px;font-weight:700; font-color: black; padding:10px; text-align:center'>");
                html.Append(TermCondition);
                html.Append("</td>");
                html.Append("</tr>");
            }

            //Table end.
            html.Append("</table>");

            //Append the HTML string to Placeholder.
            PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
        }
    }
}