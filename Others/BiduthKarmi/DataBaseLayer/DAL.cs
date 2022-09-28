using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace DataBaseLayer
{
    public static class DAL
    {
        public static AppSettingsReader aps = new AppSettingsReader();
        public static SqlConnection GetDataBase()
        {
            SqlConnection con = new SqlConnection(aps.GetValue("myconnection", typeof(string)).ToString());
            con.Close();
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            return con;
        }
        public static int ExecuteNonQuery(string sql, CommandType cmdType, SqlParameter[] param)
        {
            using (SqlConnection con = GetDataBase())
            {
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.CommandType = cmdType;
                    if (param != null)
                    {
                        cmd.Parameters.AddRange(param);
                    }
                    return cmd.ExecuteNonQuery();

                }
            }
        }
        public static int ExecuteNonQuery(string StoreProceduer, SqlParameter[] param)
        {
            using (SqlCommand cmd = new SqlCommand(StoreProceduer, GetDataBase()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                if (param != null)
                {
                    cmd.Parameters.AddRange(param);
                }
                return cmd.ExecuteNonQuery();
            }
        }
        public static DataTable DataTable(string sql, CommandType cmdType, SqlParameter[] param)
        {

            using (SqlConnection con = GetDataBase())
            {
                DataTable dt = new DataTable();
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.CommandType = cmdType;
                    if (param != null)
                    {
                        cmd.Parameters.AddRange(param);
                    }
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }
                return dt;
            }
        }


        public static DataTable DataTableforDt(string StoreProceduer, SqlParameter[] param)
        {
            SqlParameter totalRows = new SqlParameter
            {
                ParameterName = "TotalRows",
                SqlDbType = SqlDbType.Int,
                Direction = ParameterDirection.Output
            };

            using (SqlConnection con = GetDataBase())
            {
                DataTable dt = new DataTable();
                using (SqlCommand cmd = new SqlCommand(StoreProceduer, con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (param != null)
                    {
                        cmd.Parameters.Add(totalRows);
                        cmd.Parameters.AddRange(param);
                    }
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }
                return dt;
            }
        }
        public static DataTable DataTable(string StoreProceduer, SqlParameter[] param)
        {


            using (SqlConnection con = GetDataBase())
            {
                DataTable dt = new DataTable();
                using (SqlCommand cmd = new SqlCommand(StoreProceduer, con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (param != null)
                    {
                        cmd.Parameters.AddRange(param);
                    }
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }
                return dt;
            }
        }
        public static DataSet DataSet(string sql, CommandType cmdType, SqlParameter[] param)
        {

            using (SqlConnection con = GetDataBase())
            {
                DataSet ds = new DataSet();
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.CommandType = cmdType; ;
                    if (param != null)
                    {
                        cmd.Parameters.AddRange(param);
                    }
                    DataTable t;
                    using (DbDataReader reader = cmd.ExecuteReader())
                    {
                        while (!reader.IsClosed)
                        {
                            t = new DataTable();
                            t.Load(reader);
                            ds.Tables.Add(t);
                        }
                    }
                }
                return ds;
            }
        }
        public static DataSet DataSet(string StoreProceduer, SqlParameter[] param)
        {

            using (SqlConnection con = GetDataBase())
            {
                DataSet ds = new DataSet();
                using (SqlCommand cmd = new SqlCommand(StoreProceduer, con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (param != null)
                    {
                        cmd.Parameters.AddRange(param);
                    }
                    DataTable t;
                    using (DbDataReader reader = cmd.ExecuteReader())
                    {
                        while (!reader.IsClosed)
                        {
                            t = new DataTable();
                            t.Load(reader);
                            ds.Tables.Add(t);
                        }
                    }
                }
                return ds;
            }
        }
        public static bool LoadList(DropDownList ddl, string TableName, string FieldName, string IdField, string OrderBy,
            bool AddSelect, string CriteriaWithoutAnd)
        {
            string sql = string.Empty;
            sql = string.Format("SELECT {0}{1} FROM {2} WHERE  ISNULL({3},'')<>'' ", FieldName,
                IdField != FieldName ? "," + IdField : "", TableName, FieldName);
            if (CriteriaWithoutAnd != string.Empty)
            {
                sql += string.Format(" AND {0}", CriteriaWithoutAnd);
            }
            if (OrderBy != string.Empty)
            {
                sql += string.Format(" ORDER BY {0}", OrderBy);
            }
            DataTable db = DAL.DataTable(sql, CommandType.Text, null);
            ddl.DataSource = db;
            ddl.DataValueField = IdField;
            ddl.DataTextField = FieldName;
            ddl.DataBind();
            if (AddSelect)
            {
                ddl.Items.Insert(0, new ListItem("-----Select One------", "0"));
            }
            return true;
        }

    }
}
