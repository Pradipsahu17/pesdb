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
    public  class ContactUsServies
    {
        public static int SaveContact(ClassCollection model)
        {
            try
            {
                var info = model.ContactInfo;
                SqlParameter[] param = new SqlParameter[]
                       {
                     new SqlParameter("@SenderName", info.SenderName),
                     new SqlParameter("@FaceBookName", info.FaceBookName),
                     new SqlParameter("@FaceBookID", info.FaceBookID),
                     new SqlParameter("@SenderEmail", info.SenderEmail),
                     new SqlParameter("@SenderSubject", info.SenderSubject),
                     new SqlParameter("@SenderMessage", info.SenderMessage),
                     new SqlParameter("@MessageSentDate", info.MessageSentDate),
                     new SqlParameter("@Dec",2)
                       };
                return DAL.ExecuteNonQuery("SaveContact", param);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static DataTable GetContactMessage()
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                           {
                     new SqlParameter("@Dec",3)
                           };
                return DAL.DataTable("SaveContact", param);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static DataTable GetIndividualContactMessage(int NewsID)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                           {
                     new SqlParameter("@MessageId",NewsID),
                     new SqlParameter("@Dec",4)
                           };
                return DAL.DataTable("SaveContact", param);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static DataTable GetContactMessageList()
        {
            try
            {
                return DAL.DataTable("select	*	from    ContactUs	where	MessageRead=0	and	MessageDeleted=0	order	by MessageRead", CommandType.Text, null);
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
               new SqlParameter("@Dec",5)
                  };
                return DAL.DataTable("SaveContact", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static int DeleteContactMessage(int NewsId)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                    { new SqlParameter("@NewsID",NewsId),
               new SqlParameter("@Dec",6)
                    };
                return DAL.ExecuteNonQuery("SaveContact", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
