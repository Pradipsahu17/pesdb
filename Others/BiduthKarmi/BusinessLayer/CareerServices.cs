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
    public class CareerServices
    {
        public static int SaveCareer(ClassCollection model)
        {
            try
            {
                var info = model.CareerInfo;
                SqlParameter[] param = new SqlParameter[]
                       {
                     new SqlParameter("@Title",info.Title),
                     new SqlParameter("@Content",info.Content),
                     new SqlParameter("@Createddate",info.CreatedDate),
                     new SqlParameter("@FileName",info.FileName),
                     new SqlParameter("@Dec",2)
                       };
                return DAL.ExecuteNonQuery("SaveCareerSetting", param);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static DataTable GetCareer()
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                           {
                     new SqlParameter("@Dec",3)
                           };
                return DAL.DataTable("SaveCareerSetting", param);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static DataTable GetCareerById(int CID)
        {
            try
            {
                var sql = $@"Select * from CareerSetting Where CID = {CID}";
                return DAL.DataTable(sql, CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static DataTable GetIndividualCareer(int CID)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                           {
                     new SqlParameter("@CID",CID),
                     new SqlParameter("@Dec",4)
                           };
                return DAL.DataTable("SaveCareerSetting", param);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static DataTable GetCareerList()
        {
            try
            {
                return DAL.DataTable("select * from CareerSetting", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static DataTable MakeInactive(int CID)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                  { new SqlParameter("@CID",CID),
               new SqlParameter("@Dec",7)
                  };
                return DAL.DataTable("SaveCareerSetting", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static int DeleteCareer(int CID)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                    { new SqlParameter("@CID",CID),
               new SqlParameter("@Dec",8)
                    };
                return DAL.ExecuteNonQuery("SaveCareerSetting", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
