using CommonLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BiduthKarmi
{
    public partial class LoanSubmitCommitte : System.Web.UI.Page
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
            if (Type == "Nepali")
            {
                EnglishDiv.Visible = false;
                NepaliDiv.Visible = true;
            }
            else
            {
                EnglishDiv.Visible = true;
                NepaliDiv.Visible = false;
            }
        }
    }
}