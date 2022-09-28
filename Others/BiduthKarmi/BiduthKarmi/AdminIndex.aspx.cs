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
    public partial class AdminIndex : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                WelcomeTitle.Text = "Welcome " + Session["UserName"].ToText();
            }
        }

        [WebMethod]
        public static JSONObject LoadPageDetails()
        {
            try
            {
                var result = new JSONObject();
                DataSet NewSetting = BusinessLayer.LoginService.GetActivityLog();

                DataTable HomeSliderCount = NewSetting.Tables[1];
                DataTable NewsCount = NewSetting.Tables[2];
                DataTable ActivityDetails = NewSetting.Tables[0];
                DataTable MessageDetails = NewSetting.Tables[3];
                DataTable MessageCount = NewSetting.Tables[4];
                DataTable NotificationCount = NewSetting.Tables[5];


                var ActiveNewsCount = NewsCount.Rows[0]["Counts"].ToText();
                var ActiveHomeSliderCount = HomeSliderCount.Rows[0]["Counts"].ToText();
                var ActivityLog = ActivityDetails.Rows[0]["HomePageVisitorCount"].ToText();

                result.Success = true;
                result.Datas = new object[8];
                result.Datas[0] = ActiveNewsCount;
                result.Datas[1] = ActiveHomeSliderCount;
                result.Datas[2] = ActivityLog;
                result.Datas[4] = MessageCount.Rows[0]["messagecount"].ToText();
                result.Datas[5] = NotificationCount.Rows[0]["Notification"].ToText();

                var message = "";

                foreach (DataRow dr in MessageDetails.Rows)
                {
                    message += $@"<a class='dropdown-item d-flex align-items-center' href='#'>
                                        <div class='font-weight-bold'>
                                            <div class='text-truncate'>
                                                {dr["SenderSubject"].ToText()}
                                            </div>
                                            <div class='small text-gray-500'>{
                                                (DateTime.Now - dr["MessageSentDate"].ToDateTime()).TotalHours}</div></div></a>";

                }
                result.Datas[3] = message;
                //result.Datas[0] = ActiveNewsCount;


                return result;
            }
            catch (Exception ex)
            {

                throw;
            }
        }
    }
}