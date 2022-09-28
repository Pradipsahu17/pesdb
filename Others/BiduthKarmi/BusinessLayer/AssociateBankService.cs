using CommonLayer;
using DataBaseLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace BusinessLayer
{
     public class AssociateBankService
    {
        public static int SaveAssociateBank (ClassCollection model)
        {
            try
            {
                var info = model.AssociateInfo;
                SqlParameter[] param = new SqlParameter[]
                       {
                     new SqlParameter("@BankName",info.BankName),
                     new SqlParameter("@AccountNumber",info.AccountNumber),
                     new SqlParameter("@AccountHolderName",info.AccountHolderName),
                     new SqlParameter("@BranchName",info.BranchName),
                     new SqlParameter("@Logo",info.Logo),
                     new SqlParameter("@IsActive",info.IsActive),
                     new SqlParameter("@Dec",2)
                       };
                return DAL.ExecuteNonQuery("SaveAssociateBank", param);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static DataTable GetAssociateBank()
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                           {
                     new SqlParameter("@Dec",3)
                           };
                return DAL.DataTable("SaveAssociateBank", param);
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
               new SqlParameter("@Dec",7)
                  };
                return DAL.DataTable("SaveAssociateBank", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static DataTable GetActiveAssociateBankLists()
        {
            try
            {
                return DAL.DataTable("select * from AssociateBank WHERE IsActive = 1", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static DataTable GetAssociateBankLists()
        {
            try
            {
                return DAL.DataTable("select * from AssociateBank",CommandType.Text,null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static DataTable GetAssociateBankById(int CID)
        {
            try
            {
                var sql = $@"Select * from AssociateBank Where Id = {CID}";
                return DAL.DataTable(sql, CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static int UpdateAssociateBank(ClassCollection model)
        {
            try
            {
                var info = model.AssociateInfo;
                SqlParameter[] param = new SqlParameter[]
                    {
                        new SqlParameter("@Id",info.Id),
                        new SqlParameter("@BankName",info.BankName),
                        new SqlParameter("@AccountNumber",info.AccountNumber),
                        new SqlParameter("@AccountHolderName",info.AccountHolderName),
                        new SqlParameter("@BranchName",info.BranchName),
                        new SqlParameter("@Logo",info.Logo),
                    };
                return DAL.ExecuteNonQuery("UpdateAssociateBank", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static int DeleteAssociateBank(int CID)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                    { new SqlParameter("@Id",CID),
               new SqlParameter("@Dec",8)
                    };
                return DAL.ExecuteNonQuery("SaveAssociateBank", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
