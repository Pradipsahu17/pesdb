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
   public class PolicyServices
    {
        public static int SavePolicy(ClassCollection model)
        {
            return 0;
        }
        public static DataTable GetPolicy()
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
        public static DataTable GetPolicyWithID(int CID)
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
        
       
       
    }
}
