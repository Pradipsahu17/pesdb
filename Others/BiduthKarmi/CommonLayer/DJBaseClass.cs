using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI;
using static CommonLayer.MessageExtension;

namespace CommonLayer
{
    public class DJBaseClass : System.Web.UI.Page
    {
        public void CheckLoginStatus()
        {
            if (Session["UserName"].ToText() == null && Session["FullName"].ToText() == null)
            {
                Response.Redirect("Default.aspx");
            }
        }

        public void ShowMessage(string message, MyMessage messageType, string redirectUrl = "")
        {
            if (String.IsNullOrEmpty(redirectUrl))
            {
                RegisterMesasgeShow(message, messageType.MessageType.ToLower());
            }
            else
            {
                var messageC = new Message
                {
                    MessageText = message,
                    MessageType = messageType.MessageType.ToLower(),
                };

            }
        }

        private void RegisterMesasgeShow(string message, string messageType)
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "message",
                "setTimeout(function(){showMessage('" + message + "','" + messageType.ToString().ToLower() + "');}, 50);",
                true);

            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "message",
            //   "setTimeout(function(){showMessage('" + message + "','" + messageType.ToString().ToLower() + "');}, 50);",
            //   true);

        }

        public bool SetSession(System.Web.UI.Page page, DataTable dt)
        {

           
                page.Session["UserId"] = dt.Rows[0]["ID"].ToInt(); ;
                page.Session["UserName"] = dt.Rows[0]["UserName"];
                page.Session["FullName"] = dt.Rows[0]["FullName"];
                page.Session["BranchName"] = dt.Rows[0]["BranchName"];
                //page.Session["IsAdmin"] = dt.Rows[0]["ID"];
                //page.Session["OfficeCode"] = dt.Rows[0]["ID"];
                //page.Session["OfficeName"] = dt.Rows[0]["ID"];
                //page.Session["Phone"] = dt.Rows[0]["ID"];
                //page.Session["Fax"] = dt.Rows[0]["ID"];
                //page.Session["Email"] = dt.Rows[0]["ID"];
                //page.Session["Url"] = dt.Rows[0]["ID"];
          



            return true;


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
