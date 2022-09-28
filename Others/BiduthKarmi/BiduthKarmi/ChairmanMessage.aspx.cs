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
    public partial class ChairmanMessage : System.Web.UI.Page
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
            DataTable dt = BusinessLayer.ChairManMessageService.GetChairManMessageActiveLists();

            //Building an HTML string
            StringBuilder html = new StringBuilder();

            //Table start.
            html.Append("<table class='table table-bordered table-hover table-condensed active table-primary border-left-primary border-bottom-primary table-dark display responsive nowrap dataTable no-footer dtr-inline' style='color: black; text-align:justify; ' role='grid' aria-describedby='TableMain_info' > ");

            foreach (DataRow dr in dt.Rows)
            {


                html.Append("<tr>");

                var Message = dr["Message"].ToText();


                html.Append("<td style='font-size:15px;font-weight:800; font-color: black; padding:15px; text-align:justify;'> ");
                html.Append(Message);
                html.Append("</tr>");
            }

            //Table end.
            html.Append("</table>");

            //Append the HTML string to Placeholder.
            PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
        }
    }
}