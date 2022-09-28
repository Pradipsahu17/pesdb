using CommonLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BiduthKarmi
{
    public partial class AdminMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!CheckActiveSession())
            {
                Response.Redirect("Login.aspx");
            }
        }

        public bool CheckActiveSession()
        {
            //var UserName = Session["UserName"].ToText();
            //if (UserName != "" && UserName != string.Empty && UserName != null)
            //{
            //    return true;
            //}
            //return  false;

            if (Session.Contents.Count == 0)
            {
                return false;
            }
            return true;

        }
    }
}