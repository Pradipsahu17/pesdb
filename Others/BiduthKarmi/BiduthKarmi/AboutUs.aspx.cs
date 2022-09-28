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
    public partial class AboutUs : System.Web.UI.Page
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
            //Populating a DataTable from database.
            DataTable dt = AboutUsService.GetActiveAboutUsLists();

            //Building an HTML string
            StringBuilder html = new StringBuilder();

            //Table start.
            html.Append("<table class='table table-bordered table-hover table-condensed active table-primary border-left-primary border-bottom-primary table-dark display responsive nowrap dataTable no-footer dtr-inline' style='color: black; text-align:justify; ' role='grid' aria-describedby='TableMain_info' > ");

            foreach (DataRow dr in dt.Rows)
            {


                

                var Name = dr["InstitutionName"].ToText();
                var Establishment = dr["InstitutionEstablishment"].ToText();
                var WorkPlace = dr["InstitutionWorkPlace"].ToText();
                var Address = dr["Address"].ToText();
                var MemberNumberAndShareCapital = dr["MemberNumberAndShareCapital"].ToText();
                var Purpose = dr["OrganizationPurpose"].ToText();

                html.Append("<tr>");
                html.Append("<td style='font-size:13px; width:15px;font-weight:700; font-color: black; padding:10px; text-align:center'>1</td>");
                html.Append("<td style='font-size:13px; width:175px;font-weight:700; font-color: black; padding:10px; text-align:left;'> संस्थाको नाम :</td>");
                html.Append("<td style='font-size:13px;font-weight:700; font-color: black; padding:10px; text-align:justify;'> ");
                html.Append(Name);
                html.Append("</td>");
                html.Append("</tr>");

                html.Append("<tr>");
                html.Append("<td style='font-size:13px; width:15px;font-weight:700; font-color: black; padding:10px; text-align:center'>2</td>");
                html.Append("<td style='font-size:13px; width:175px;font-weight:700; font-color: black; padding:10px; text-align:left;'> संस्थाको स्थापना : </td>");
                html.Append("<td style='font-size:13px;font-weight:700; font-color: black; padding:10px; text-align:justify;'> ");
                html.Append(Establishment);
                html.Append("</td>");
                html.Append("</tr>");

                html.Append("<tr>");
                html.Append("<td style='font-size:13px; width:15px;font-weight:700; font-color: black; padding:10px; text-align:center'>3</td>");
                html.Append("<td style='font-size:13px; width:175px;font-weight:700; font-color: black; padding:10px; text-align:left;'>संस्थाको कार्यक्षेत्र : </td>");
                html.Append("<td style='font-size:13px;font-weight:700; font-color: black; padding:10px; text-align:justify;'> ");
                html.Append(WorkPlace);
                html.Append("</td>");
                html.Append("</tr>");

                html.Append("<tr>");
                html.Append("<td style='font-size:13px; width:15px;font-weight:700; font-color: black; padding:10px; text-align:center'>4</td>");
                html.Append("<td style='font-size:13px; width:175px;font-weight:700; font-color: black; padding:10px; text-align:left;'>कार्यालय रहेको स्थान :</td>");
                html.Append("<td style='font-size:13px;font-weight:700; font-color: black; padding:10px; text-align:justify;'> ");
                html.Append(Address);
                html.Append("</td>");
                html.Append("</tr>");

                html.Append("<tr>");
                html.Append("<td style='font-size:13px; width:15px;font-weight:700; font-color: black; padding:10px; text-align:center'>5</td>");
                html.Append("<td style='font-size:13px; width:175px;font-weight:700; font-color: black; padding:10px; text-align:left;'> सदस्य संख्या तथा शेयर पुंजी :</td>");
                html.Append("<td style='font-size:13px;font-weight:700; font-color: black; padding:10px; text-align:justify;'> ");
                html.Append(MemberNumberAndShareCapital);
                html.Append("</td>");
                html.Append("</tr>");

                html.Append("<tr>");
                html.Append("<td style='font-size:13px; width:15px;font-weight:700; font-color: black; padding:10px; text-align:center'>6</td>");
                html.Append("<td style='font-size:13px; width:175px;font-weight:700; font-color: black; padding:10px; text-align:left;'>संस्थाको उ२ेश्य :</td>");
                html.Append("<td style='font-size:13px;font-weight:700; font-color: black; padding:10px; text-align:justify;'> ");
                html.Append(Purpose);
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