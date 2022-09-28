using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CommonLayer
{
   public class MessageBox
    {
        public MessageBox()
        {
          
        }
        public void Box(string success, string title, string msg)
        {

            //System.Web.UI.Page mypage = (System.Web.UI.Page)HttpContext.Current.Handler;
            //mypage.RegisterStartupScript("MessageBox", "<script language=javascript>MessageBox('" + success + "','" + title + "','" + msg + "');</script>");
           

        }
    }
}
