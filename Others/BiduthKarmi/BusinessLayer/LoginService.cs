using CommonLayer;
using DataBaseLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer
{
    public class LoginService
    {

        public static int CreateAccount(ClassCollection model)
        {
            try
            {
                var invInfo = model.LoginInfo;
                SqlParameter[] param = new SqlParameter[]
                     {
                new SqlParameter("@FullName",invInfo.FullName),
                new SqlParameter("@UserName",invInfo.UserName),
                new SqlParameter("@Password",invInfo.Password),
                new SqlParameter("@PhoneNo",invInfo.PhoneNo),
                new SqlParameter("@CreatedDate",invInfo.CreatedDate),
                new SqlParameter("@Dec",2)
                    };

                return DAL.ExecuteNonQuery("CreateUserAccount", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static DataTable CheckSignIn(ClassCollection model)
        {
            try
            {
                var invInfo = model.LoginInfo;
                SqlParameter[] param = new SqlParameter[]
                           {
               new SqlParameter("@UserName",invInfo.UserName),
               new SqlParameter("@Password",invInfo.Password),
               new SqlParameter("@Dec",3)
                          };
                return DAL.DataTable("CreateUserAccount", param);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static DataSet GetActivityLog()
        {

            try
            {
                return DAL.DataSet("select	*	from	ActivityLog;select  COUNT(*)as	Counts    from HomeSliderSetting   where IsActive = 1;select COUNT(*)as	Counts    from NewsFeedSetting where IsActive = 1;select	top(4)*	from	contactUs	order	by messagesentdate	desc;select	COUNT(*)as	messagecount	from	contactus	where	messageread=0;select	COUNT(*)as	Notification	from	NotificationSetting	where	IsActive=1", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public  static int ResetPassword(string Password,string UserName)
        {
            try
            {
               
                SqlParameter[] param = new SqlParameter[]
                           {
               new SqlParameter("@UserName",UserName),
               new SqlParameter("@Password",Password),
               new SqlParameter("@Dec",5)
                          };
                return DAL.ExecuteNonQuery("CreateUserAccount", param);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
