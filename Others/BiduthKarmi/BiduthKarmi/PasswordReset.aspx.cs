using BusinessLayer;
using CommonLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static CommonLayer.MessageExtension;

namespace BiduthKarmi
{
    public partial class PasswordReset : DJBaseClass
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            var password = InputPassword.Value.Trim();
            var password2 = RepeatPassword.Value.Trim();
            if (password.Length < 5)
            {
                ShowMessage("Password should be atleast 6 Character Long", new Error());
            }
            if (password == password2)
            {
                var fpassword = GetSHA1HashData(password);
                var User = Session["UserName"].ToText();
                var reset = LoginService.ResetPassword(fpassword, User);
                if (reset == 1)
                {
                    ShowMessage("Successfully   Reset", new Success());
                }
            }
            else
            {
                ShowMessage("Password   Mismatch", new Error());
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
    }
}