using BusinessLayer;
using CommonLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BiduthKarmi
{
    public partial class BranchOffice : System.Web.UI.Page
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
            DataTable dt = AssociateBankService.GetActiveAssociateBankLists();

            //Building an HTML string
            StringBuilder html = new StringBuilder();

            //Table start.
            html.Append("<table class='table table-bordered table-hover table-condensed active table-primary border-left-primary border-bottom-primary table-dark display responsive nowrap dataTable no-footer dtr-inline' style='color: black; ' role='grid' aria-describedby='TableMain_info' > ");

            //Building the Header row.

            html.Append("<tr>");
            html.Append("<td style='background-color: #191e70; color: white; font-weight: bolder; font-size: x-large; padding:18px; text-align:center' colspan='3'>Our Associate Bank Details</td>");
            html.Append("</tr>");

            foreach (DataRow dr in dt.Rows)
            {

                html.Append("<tr>");
              
                var BankName = dr["BankName"].ToText();
                var AccountNumber = dr["AccountNumber"].ToText();
                var AccountHolderName = dr["AccountHolderName"].ToText();
                var BranchName = dr["BranchName"].ToText();
                var Logo   = dr["Logo"].ToText();
                var Id = dr["Id"].ToText();
                html.Append("<td style='padding-top:45px; font-size:14px; font-weight:700;' > ");
                html.Append(Id);
                html.Append("</td>");
                html.Append("<td style='font-size:14px;font-weight:700; font-color: black; padding:15px;'> ");
                html.Append("BankName: ");
                html.Append(BankName);
                html.Append("<br>");
                html.Append("A/C no: ");
                html.Append(AccountNumber);
                html.Append("<br>");
                html.Append("Account Holder Name: ");
                html.Append(AccountHolderName);
                html.Append("<br>");
                html.Append("Branch Name: ");
                html.Append(BranchName);

                html.Append("</td>");
                html.Append("<td  style='font-size:14px;font-weight:700; font-color: black; padding:15px 20px;' >");
                html.Append("<img src='Img/AssociateBankLogo/"+Logo+"' style='height:100px;'");
                html.Append("</td");

                html.Append("</tr>");
            }
          
            //Table end.
            html.Append("</table>");

            //Append the HTML string to Placeholder.
            PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
        }
    }
}