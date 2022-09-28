using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BiduthKarmi
{
    public partial class LogOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                foreach (var cookie in HttpContext.Current.Request.Cookies.AllKeys)
                {
                    HttpContext.Current.Request.Cookies.Remove(cookie);
                }

                if (Context.Response.Cookies[FormsAuthentication.FormsCookieName] != null)
                {
                    Context.Response.Cookies[FormsAuthentication.FormsCookieName].Expires = DateTime.Now;
                }
                HttpContext.Current.Session.RemoveAll();
                FormsAuthentication.SignOut();
                HttpContext.Current.Session.Abandon();
                FormsAuthentication.SignOut();
                Response.Redirect("Default.aspx");
            }
        }
    }
}