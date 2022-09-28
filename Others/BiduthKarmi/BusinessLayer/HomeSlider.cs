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
    public class HomeSlider
    {

        public static int SavePicture(string PictureDescription, string PictureName, int createdby, DateTime CreatedDate)
        {
            try
            {

                SqlParameter[] param = new SqlParameter[]
                     {
               new SqlParameter("@PictureName",PictureName),
               new SqlParameter("@PictureSubHeading",PictureDescription),
               new SqlParameter("@Createdby",createdby),
                new SqlParameter("@CreatedDate",CreatedDate),
               new SqlParameter("@Dec",5)
                    };
                return DAL.ExecuteNonQuery("HomeSlider", param);
            }
            catch (System.Exception ex)
            {
                throw ex;
            }
        }
        public static DataTable GetAllPicture()
        {
            try
            {
                return DAL.DataTable("select * from HomeSliderSetting", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public static DataTable GetAllPictureDisplay()
        {
            try
            {
                return DAL.DataTable("select * from HomeSliderSetting   where   IsActive=1", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static DataSet GetAllSettings()
        {
            try
            {
                return DAL.DataSet("select	*	from	CompanySetting; select  top(4)* from NewsFeedSetting    where   isActive=1;select * from DownLoadSetting where   IsActive=1;select * from NotificationSetting where IsActive=1;", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static bool MakeInactive(int PictureId)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                 { new SqlParameter("@PictureId",PictureId),
               new SqlParameter("@Dec",7)
                 };
                DAL.ExecuteNonQuery("HomeSlider", param);
                return true;
            }
            catch
            {
                return false;
            }
        }
        public static DataTable GetPictureToDelete(int PictureId)
        {
            try
            {
                var sql = "select * from HomeSliderSetting where ID=" + PictureId + "";
                return DAL.DataTable(sql, CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static void DeletePicture(int PictureId)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                   { new SqlParameter("@PictureId",PictureId),
               new SqlParameter("@Dec",8)
                   };
                DAL.ExecuteNonQuery("HomeSlider", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
