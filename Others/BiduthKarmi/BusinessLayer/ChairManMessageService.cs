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
     public class ChairManMessageService
    {
        public static int SaveChairManMessage(ClassCollection model)
        {
            try
            {
                var info = model.ChairManMessageInfo;
                SqlParameter[] param = new SqlParameter[]
                    {
                        new SqlParameter("@Message", info.Message)
                    };
                return DAL.ExecuteNonQuery("SaveChairManMessage", param);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static int UpdateChairManMessage(ClassCollection model)
        {
            try
            {
                var info = model.ChairManMessageInfo;
                SqlParameter[] param = new SqlParameter[]
                    {
                        new SqlParameter("@Id", info.Id),
                        new SqlParameter("@Message", info.Message)
                    };
                return DAL.ExecuteNonQuery("UpdateChairManMessage", param);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static DataTable GetChairManMessageActiveLists()
        {
            try
            {
                return DAL.DataTable("SELECT * FROM ChairManMessage WHERE IsActive=1 ", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static DataTable GetChairManMessageLists()
        {
            try
            {
                return DAL.DataTable("SELECT * FROM ChairManMessage  ", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static DataTable GetChairManMessageById(int CID)
        {
           try
            {
                var sql = $@"Select * from ChairManMessage Where Id = {CID}";
                return DAL.DataTable(sql, CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static int DeleteChairManMessage(int CID)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                    { new SqlParameter("@Id",CID),
                    };
                return DAL.ExecuteNonQuery("DeleteChairManMessage", param);
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
                  { new SqlParameter("@Id",CID),
                  };
                return DAL.DataTable("CheckActiveOrInActiveChairManMessage", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
