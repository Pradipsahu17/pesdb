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
    public class DownloadService
    {
        public static int SaveDownLoad(ClassCollection model)
        {
            try
            {
                var info = model.DownLoadInfo;
                SqlParameter[] param = new SqlParameter[]
                     {
               new SqlParameter("@PDFName",info.FileName),
               new SqlParameter("@DisplayName",info.DisplayName),
                new SqlParameter("@CategoryID",info.CategoryID),
               new SqlParameter("@UploadedDate",info.UploadDate),
               new SqlParameter("@Dec",5)
                    };
                return DAL.ExecuteNonQuery("SaveDownLoad", param);
            }
            catch (System.Exception ex)
            {
                throw ex;
            }
        }
        public static bool MakeCategoryInactive(int CID)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                 { new SqlParameter("@CID",CID),
               new SqlParameter("@Dec",7)
                 };
                DAL.ExecuteNonQuery("SaveCategory", param);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static int SaveCategory(string CategoryName)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                     {
               new SqlParameter("@CateGoryName",CategoryName),
               new SqlParameter("@Dec",5)
                    };
                return DAL.ExecuteNonQuery("SaveCategory", param);
            }
            catch (System.Exception ex)
            {
                throw ex;
            }
        }

        public static DataTable GetCategoryToDelete(int CID)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                 {
               new SqlParameter("@CID",CID),
               new SqlParameter("@Dec",8)
                 };
                return DAL.DataTable("SaveCategory", param);

            }
            catch
            {
                throw;
            }
        }
        public static DataTable GetDownLoadCategory()
        {
            try
            {
                return DAL.DataTable("select * from DownloadCatagory", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static DataTable GetAllDownLoads()
        {
            try
            {
                return DAL.DataTable("select * from DownLoadSetting where IsActive=1", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static DataTable GetAllDownLoadForAdmin()
        {
            try
            {
                return DAL.DataTable("select * from DownLoadSetting", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static DataTable GetDownLoadDetails()
        {
            try
            {
                return DAL.DataTable("select * from DownLoadSetting where IsActive=1", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static DataTable GetAllDownLoadsToShow()
        {
            try
            {
                return DAL.DataTable("select * from DownLoadSetting where IsActive=1", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static DataTable GetAllDownLoadCategory()
        {
            try
            {
                return DAL.DataTable("select * from DownloadCatagory where IsActive=1;", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static DataTable GetDownLoadsCategory(string CID)
        {
            try
            {
                var sql = $@"select * from DownLoadSetting where   IsActive=1  and CID={CID}";
                return DAL.DataTable(sql, CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public static DataTable GetAllDownLoadDisplay()
        {
            try
            {
                return DAL.DataTable("select * from DownLoadSetting where IsActive=1;", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static DataSet GetAllDownLoad()
        {
            try
            {
                return DAL.DataSet("", CommandType.Text, null);
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
                 { new SqlParameter("@DID",DID),
               new SqlParameter("@Dec",7)
                 };
                DAL.ExecuteNonQuery("SaveDownLoad", param);
                return true;
            }
            catch
            {
                return false;
            }
        }
        public static DataTable GetDownLoadToDelete(int DID)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                 {
               new SqlParameter("@DID",DID),
               new SqlParameter("@Dec",2)
                 };
                return DAL.DataTable("SaveDownLoad", param);

            }
            catch
            {
                throw;
            }
        }

        public static int DeleteDownLoad(int DID)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                   { new SqlParameter("@DID",DID),
               new SqlParameter("@Dec",8)
                   };
                return DAL.ExecuteNonQuery("SaveDownLoad", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
