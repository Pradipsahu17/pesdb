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
    public class ServiceDetailService
    {
        public static int SaveServiceDetails(ClassCollection model)
        {
            try
            {
                var info = model.ServiceDetailsInfo;
                SqlParameter[] param = new SqlParameter[]
                       {
                     new SqlParameter("@SavingHead",info.SavingHead),
                     new SqlParameter("@InterestRate",info.InterestRate),
                     new SqlParameter("@TermCondition",info.TermCondition),
                     new SqlParameter("@ServiceId",info.ServiceId),
                       };
                return DAL.ExecuteNonQuery("[SaveServiceDetails]", param);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


        public static DataTable GetServiceDetailsList()
        {
            try
            {
                return DAL.DataTable("select * from ServiceDetails as SD inner join ServiceCategory as SC on SD.ServiceId=SC.ServiceID", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static DataTable GetActiveServiceDetailsList()
        {
            try
            {
                return DAL.DataTable("select * from ServiceDetails Where IsActive=1", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static DataTable GetServiceDetailById(int CID)
        {
            try
            {
                var sql = $@"Select * from ServiceDetails Where Id = {CID}";
                return DAL.DataTable(sql, CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static DataTable MakeActiveOrInActive(int CID)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                    {
                        new SqlParameter("@Id",CID)
                    };
                return DAL.DataTable("CheckActiveOrInActiveServiceDetails", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static int UpdateServiceDetail(ClassCollection model)
        {
            try
            {
                var info = model.ServiceDetailsInfo;
                SqlParameter[] param = new SqlParameter[]
                    {
                        new SqlParameter("@Id",info.Id),
                        new SqlParameter("@SavingHead",info.SavingHead),
                        new SqlParameter("@InterestRate",info.InterestRate),
                        new SqlParameter("@TermCondition",info.TermCondition),
                    };
                return DAL.ExecuteNonQuery("UpdateServiceDetail", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static int DeleteServiceDetail(int CID)
        {
            try 
            {
                SqlParameter[] param = new SqlParameter[]
                    {
                        new SqlParameter("@Id", CID)
                    };
                return DAL.ExecuteNonQuery("DeleteServiceDetails", param);
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static DataTable GetFixAccountLists()
        {
            try
            {
                return DAL.DataTable("select * from ServiceDetails where ServiceId=1 And IsActive=1 ", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static DataTable GetEducationAccountLists()
        {
            try
            {
                return DAL.DataTable("select * from ServiceDetails where ServiceId=2 And IsActive=1", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static DataTable GetNormalSavingLists()
        {
            try
            {
                return DAL.DataTable("select * from ServiceDetails where ServiceId=3 And IsActive=1", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static DataTable GetGeneralSavingLists()
        {
            try
            {
                return DAL.DataTable("select * from ServiceDetails where ServiceId=4 And IsActive=1", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static DataTable GetGoldSavingLists()
        {
            try
            {
                return DAL.DataTable("select * from ServiceDetails where ServiceId=5 And IsActive=1", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static DataTable GetSilverSavingLists()
        {
            try
            {
                return DAL.DataTable("select * from ServiceDetails where ServiceId=6 And IsActive=1", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static DataTable GetPersonalLoanLists()
        {
            try
            {
                return DAL.DataTable("select * from ServiceDetails where ServiceId=7 And IsActive=1", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static DataTable GetShareAgainstLoanLists()
        {
            try
            {
                return DAL.DataTable("select * from ServiceDetails where ServiceId=8 And IsActive=1", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static DataTable GetHirePurchaseLoanLists()
        {
            try
            {
                return DAL.DataTable("select * from ServiceDetails where ServiceId=9 And IsActive=1", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static DataTable GetNormalShareLists()
        {
            try
            {
                return DAL.DataTable("select * from ServiceDetails where ServiceId=10 And IsActive=1", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static DataTable GetShareAccountLists()
        {
            try
            {
                return DAL.DataTable("select * from ServiceDetails where ServiceId=10 And IsActive=1", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static DataTable GetALLLoanLists()
        {
            try
            {
                return DAL.DataTable("select * from ServiceDetails AS SD INNER JOIN  ServiceCategory AS SC ON SD.ServiceId =SC.ServiceID Where SchemaID = 2 And  IsActive =1", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
