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
    public class AboutUsService
    {
        public static int SaveAboutUs(ClassCollection model)
        {
            try
            {
                var info = model.AboutUsInfo;
                SqlParameter[] param = new SqlParameter[]
                    {
                        new SqlParameter("@InstitutionName",info.InstitutionName),
                        new SqlParameter("@InstitutionEstablishment",info.InstitutionEstablishment),
                        new SqlParameter("@InstitutionWorkPlace",info.InstitutionWorkPlace),
                        new SqlParameter("@Address",info.Address),
                        new SqlParameter("@MemberNumberAndShareCapital",info.MemberNumberAndShareCapital),
                        new SqlParameter("@OrganizationPurpose",info.OrganizationPurpose),
                    };
                return DAL.ExecuteNonQuery("SaveAboutUs", param);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static DataTable GetActiveAboutUsLists()
        {
            try
            {
                return DAL.DataTable("Select * from AboutUs WHERE IsActive=1", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static DataTable GetAboutUsLists()
        {
            try
            {
                return DAL.DataTable("Select * from AboutUs", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static DataTable GetAboutUsById(int CID)
        {
            try
            {
                var sql = $@"Select * from AboutUs Where Id = {CID}";
                return DAL.DataTable(sql, CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static int UpdateAboutUs(ClassCollection model)
        {
            try
            {
                var info = model.AboutUsInfo;
                SqlParameter[] param = new SqlParameter[]
                    {
                        new SqlParameter("@Id",info.Id),
                        new SqlParameter("@InstitutionName",info.InstitutionName),
                        new SqlParameter("@InstitutionEstablishment",info.InstitutionEstablishment),
                        new SqlParameter("@InstitutionWorkPlace",info.InstitutionWorkPlace),
                        new SqlParameter("@Address",info.Address),
                        new SqlParameter("@MemberNumberAndShareCapital",info.MemberNumberAndShareCapital),
                        new SqlParameter("@OrganizationPurpose",info.OrganizationPurpose)

                    };
                return DAL.ExecuteNonQuery("UpdateAboutUs", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static int DeleteAboutUs(int CID)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                    { new SqlParameter("@Id",CID),
                    };
                return DAL.ExecuteNonQuery("DeleteAboutUs", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static DataTable MakeActiveAndInActive(int CID)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                    {
                        new SqlParameter("@Id",CID),

                    };
                return DAL.DataTable("CheckActiveOrInActiveAboutUs", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
