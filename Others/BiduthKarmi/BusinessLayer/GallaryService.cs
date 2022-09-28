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
    public class GallaryService
    {
        public static int SaveGallary(ClassCollection model)
        {
            try
            {
                var info = model.GallaryInfo;
                SqlParameter[] param = new SqlParameter[]
                     {
               new SqlParameter("@PictureName",info.PictureName),
               new SqlParameter("@PictureTitle",info.PictureTitle),
               new SqlParameter("@PictureDescription",info.PictureDescription),
               new SqlParameter("@CreatedDate",info.CreatedDate),
               new SqlParameter("@Dec",5)
                    };
                return DAL.ExecuteNonQuery("GallaryService", param);
            }
            catch (System.Exception ex)
            {
                throw ex;
            }
        }

        public static DataTable GetAllGallary()
        {
            try
            {
                return DAL.DataTable("select * from GallarySetting", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public static DataTable GetAllGallaryDisplay()
        {
            try
            {
                return DAL.DataTable("select * from GallarySetting where IsActive=1;", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        
        public static bool MakeInactive(int DID)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                 { new SqlParameter("@PID",DID),
               new SqlParameter("@Dec",7)
                 };
                DAL.ExecuteNonQuery("GallaryService", param);
                return true;
            }
            catch
            {
                return false;
            }
        }
        public static DataTable GetGallaryToDelete(int DID)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                 {
               new SqlParameter("@PID",DID),
               new SqlParameter("@Dec",2)
                 };
                return DAL.DataTable("GallaryService", param);

            }
            catch
            {
                throw;
            }
        }

        public static int DeleteGallary(int PID)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                   { new SqlParameter("@PID",PID),
               new SqlParameter("@Dec",8)
                   };
                return DAL.ExecuteNonQuery("GallaryService", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
