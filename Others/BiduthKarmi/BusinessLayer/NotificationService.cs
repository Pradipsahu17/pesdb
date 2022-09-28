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
    public class NotificationService
    {
        public static int SaveNotification(ClassCollection model)
        {
            try
            {
                var info = model.NotificationInfo;
                SqlParameter[] param = new SqlParameter[]
                     {
               new SqlParameter("@PictureName",info.PictureName),
               new SqlParameter("@NotificationName",info.NotificationName),
                new SqlParameter("@NotificationLink",info.NotificationLink),
               new SqlParameter("@NotificationDetails",info.NotificationDetail),
                new SqlParameter("@CreatedDate",info.CreatedDate),
               new SqlParameter("@Dec",5)
                    };
                return DAL.ExecuteNonQuery("Notification", param);
            }
            catch (System.Exception ex)
            {
                throw ex;
            }
        }
        public static DataTable GetAllNotification()
        {
            try
            {
                return DAL.DataTable("select * from NotificationSetting", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public static DataTable GetAllNotificationDisplay()
        {
            try
            {
                return DAL.DataTable("select * from NotificationSetting   where   IsActive=1", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public static bool MakeInactive(int NID)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                 { new SqlParameter("@NID",NID),
               new SqlParameter("@Dec",7)
                 };
                DAL.ExecuteNonQuery("Notification", param);
                return true;
            }
            catch
            {
                return false;
            }
        }
        public static DataTable GetNotificationToDelete(int NID)
        {
            try
            {
                var sql = "select * from NotificationSetting where NID=" + NID + "";
                return DAL.DataTable(sql, CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static int DeleteNotification(int NID)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                   { new SqlParameter("@NID",NID),
               new SqlParameter("@Dec",8)
                   };
                return DAL.ExecuteNonQuery("Notification", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
