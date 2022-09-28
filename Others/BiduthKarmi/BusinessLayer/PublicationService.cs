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
    public class PublicationService
    {
        public static int SavePublication(ClassCollection model)
        {
            try
            {
                var info = model.PublicationInfo;
                SqlParameter[] param = new SqlParameter[]
                       {
                     new SqlParameter("@PublicationName",info.PublicationName),
                     new SqlParameter("@SampleContain",info.SampleContain),
                     new SqlParameter("@Contain",info.Contain),
                     new SqlParameter("@CreatedDate",info.CreatedDate),
                     new SqlParameter("@ImageName",info.ImageName),
                     new SqlParameter("@PDFName",info.PDFName),
                    
                     new SqlParameter("@Dec",2)
                       };
                return DAL.ExecuteNonQuery("SavePublication", param);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static DataTable GetPublication()
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                           {
                     new SqlParameter("@Dec",3)
                           };
                return DAL.DataTable("SavePublication", param);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static DataTable GetIndividualPublication(int PId)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                           {
                     new SqlParameter("@PID",PId),
                     new SqlParameter("@Dec",4)
                           };
                return DAL.DataTable("SavePublication", param);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static DataTable GetPublicationList()
        {
            try
            {
                return DAL.DataTable("select * from PublicationSetting", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static DataTable MakeInactive(int PId)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                  { new SqlParameter("@PID",PId),
               new SqlParameter("@Dec",7)
                  };
                return DAL.DataTable("SavePublication", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static int DeletePublication(int PId)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                    { new SqlParameter("@PID",PId),
               new SqlParameter("@Dec",8)
                    };
                return DAL.ExecuteNonQuery("SavePublication", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
