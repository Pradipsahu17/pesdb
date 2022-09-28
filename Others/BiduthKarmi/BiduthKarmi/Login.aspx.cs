using BusinessLayer;
using CommonLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using static CommonLayer.MessageExtension;

namespace BiduthKarmi
{
    public partial class Login : DJBaseClass
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (CheckActiveSession())
                {
                    Response.Redirect("AdminIndex.aspx");
                }
                //    foreach (var cookie in HttpContext.Current.Request.Cookies.AllKeys)
                //    {
                //        HttpContext.Current.Request.Cookies.Remove(cookie);
                //    }

                //    if (Context.Response.Cookies[FormsAuthentication.FormsCookieName] != null)
                //    {
                //        Context.Response.Cookies[FormsAuthentication.FormsCookieName].Expires = DateTime.Now;
                //    }
                //    HttpContext.Current.Session.RemoveAll();
                //    FormsAuthentication.SignOut();
                //    HttpContext.Current.Session.Abandon();
                //    FormsAuthentication.SignOut();
            }
        }
        private string GetSHA1HashData(string data)
        {

            try
            {
                SHA1 sha1 = SHA1.Create();
                byte[] hashData = sha1.ComputeHash(Encoding.Default.GetBytes(data));
                StringBuilder returnValue = new StringBuilder();
                for (int i = 0; i < hashData.Length; i++)
                {
                    returnValue.Append(hashData[i].ToString());
                }
                return returnValue.ToString();
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                string password = GetSHA1HashData(InputPassword.Value.ToText());
                string UserName = InputUserDetails.Value.ToText();
                var model = new ClassCollection()
                {
                    LoginInfo = new UserInfo()
                    {
                        UserName = UserName,
                        Password = password
                    }
                };
                DataTable dt = LoginService.CheckSignIn(model);

                if (dt.Rows.Count > 0)
                {
                    var ticket = new FormsAuthenticationTicket(0, UserName, DateTime.Now,
                        DateTime.Now.AddHours(1), false, String.Empty, FormsAuthentication.FormsCookiePath);
                    string encryptedCookie = FormsAuthentication.Encrypt(ticket);
                    var cookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedCookie);
                    cookie.Expires = DateTime.Now.AddHours(1);
                    Page.Response.Cookies.Add(cookie);
                    System.Web.Security.FormsAuthentication.RedirectFromLoginPage(UserName, true, "Login.aspx");
                    var result = SetSession(this.Page, dt);
                    if (result)
                    {
                        ShowMessage("Login Successful", new Success());
                        Response.Redirect("AdminIndex.aspx");
                    }
                }
                else
                {
                    ShowMessage("Wrong UserName or Password", new Error());
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
}