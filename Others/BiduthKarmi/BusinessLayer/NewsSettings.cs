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
    public class NewsSettings
    {
        public static int SaveNews(ClassCollection model)
        {
            try
            {
                var info = model.NewsInfo;
                SqlParameter[] param = new SqlParameter[]
                       {
                     new SqlParameter("@Title",info.Title),
                     new SqlParameter("@Content",info.content),
                     new SqlParameter("@Createddate",info.CreatedDate),
                     new SqlParameter("@NewsSample",info.SampleContent),
                     new SqlParameter("@NewsDate",info.NewsDate),
                     new SqlParameter("@PictureName",info.PictureName),
                     new SqlParameter("@LinkPictureName",info.LinkPicture),
                     new SqlParameter("@Dec",2)
                       };
                return DAL.ExecuteNonQuery("SaveNews", param);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static DataTable GetNews()
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                           {
                     new SqlParameter("@Dec",3)
                           };
                return DAL.DataTable("SaveNews", param);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static DataTable GetIndividualNews(int NewsID)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                           {
                     new SqlParameter("@NewsID",NewsID),
                     new SqlParameter("@Dec",4)
                           };
                return DAL.DataTable("SaveNews", param);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static DataTable GetNewsList()
        {
            try
            {
                return DAL.DataTable("select * from NewsFeedSetting", CommandType.Text, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static DataTable MakeInactive(int NewsId)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                  { new SqlParameter("@NewsID",NewsId),
               new SqlParameter("@Dec",7)
                  };
                return DAL.DataTable("SaveNews", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static int DeleteNews(int NewsId)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                    { new SqlParameter("@NewsID",NewsId),
               new SqlParameter("@Dec",8)
                    };
                return DAL.ExecuteNonQuery("SaveNews", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
