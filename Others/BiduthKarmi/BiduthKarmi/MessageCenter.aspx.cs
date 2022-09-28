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
    public partial class MessageCenter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string LoadMail()
        {
            DataTable dt = BusinessLayer.ContactUsServies.GetContactMessage();
            string mails = "";
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr["MessageRead"].ToInt() == 0)
                    {
                        mails += "<tr id='" + dr["MessageID"] + "a' class='hover'><th><input type='checkbox' class='check'></th>"
                        + "<th>" + dr["SenderSubject"] + "</th>"
                        + "<th>" + dr["MessageSentDate"] + "</th>"
                        + "<th><span class='btn btn-light btn-xs Read' data-toggle='modal' data-target='#myModal' onclick=Read(this) title='Read'><i class='fa fa-eye fa-sx'></i></span>"
                        + "<span class='btn btn-light btn-xs Delete' onclick=Delete(this) title='Delete'><i class='fa fa-trash fa-xs'></i></span>"
                        + "<span class='btn btn-light btn-xs Reply' onclick=Reply(this) title='Reply'><i class='fa fa-reply fa-xs'></i></span></th></tr>";
                    }
                    else
                    {
                        mails += "<tr id='" + dr["MessageID"] + "a' class='hover'><td><input type='checkbox' class='check'></td>"
                        + "<td>" + dr["SenderSubject"] + "</td>"
                        + "<td>" + dr["MessageSentDate"] + "</td>"
                        + "<td><span class='btn btn-light btn-xs Read' data-toggle='modal' data-target='#myModal' onclick=Read(this) title='Read'><i class='fa fa-eye fa-sx'></i></span>"
                        + "<span class='btn btn-light btn-xs Delete' onclick=Delete(this) title='Delete'><i class='fa fa-trash fa-xs'></i></span>"
                        + "<span class='btn btn-light btn-xs Reply' onclick=Reply(this) title='Reply'><i class='fa fa-reply fa-xs'></i></span></td></tr>";
                    }
                }
            }
            return mails;
        }


        [WebMethod]
        public static JSONObject ReadMail(string MailID)
        {
            try
            {
                var result = new JSONObject();
                string[] id = MailID.Split('a');
                int MailId = id[0].ToInt();
                string mails = "";
                DataTable dt = BusinessLayer.ContactUsServies.GetIndividualContactMessage(MailId);
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        mails += " <tr id='" + MailID + "' class='hover'><td><input type='checkbox' class='check'></td>"
                               + "<td>" + dr["SenderSubject"] + "</td>"
                               + "<td>" + dr["MessageSentDate"] + "</td>"
                               + "<td><span class='btn btn-light btn-xs Read' data-toggle='modal' data-target='#myModal' onclick=Read(this) title='Read'><i class='fa fa-eye fa-sx'></i></span>"
                               + "<span class='btn btn-light btn-xs Delete' onclick=Delete(this) title='Delete'><i class='fa fa-trash fa-xs'></i></span>"
                               + "<span class='btn btn-light btn-xs Reply' onclick=Reply(this) title='Reply'><i class='fa fa-reply fa-xs'></i></span></td></tr>";
                    }

                    result.Success = true;
                    result.Message = dt.Rows[0]["SenderMessage"].ToText();
                    result.Data = dt.Rows[0]["SenderName"].ToText();
                    result.AdditionalMessage= dt.Rows[0]["SenderEmail"].ToText();
                    result.AdditionalData = dt.Rows[0]["MessageSentDate"].ToText();
                    result.AlertMessage = mails;
                }
                return result;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        [WebMethod]
        public static void MarkAsRead(int MailID)
        {
            //MessageService.MarkAsRead(MailID);
        }

        [WebMethod]
        public static void DeleteMessage(string MailID)
        {
            string[] id = MailID.Split('a');
            int MailId = id[0].ToInt();
            BusinessLayer.ContactUsServies.DeleteContactMessage(MailId);
        }

        [WebMethod]
        public static void MarkAllRead()
        {
            //MessageService.MarkAllRead();
        }

        [WebMethod]
        public static void DeleteAllMessage()
        {
            //MessageService.DeleteAllMessage();
        }
    }
}