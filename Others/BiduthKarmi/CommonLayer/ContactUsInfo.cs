using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CommonLayer
{
    public class ContactUsInfo
    {
        #region "DbFields"
       
        public string SenderName { get; set; }
        public string FaceBookName { get; set; }
        public string FaceBookID { get; set; }
        public string SenderEmail { get; set; }
        public string SenderMessage { get; set; }
        public string MessageDeleted { get; set; }
        public string MessageRead { get; set; }
        public string MessageSentDate { get; set; }
        public string MessageReadBy { get; set; }
        public string SenderSubject { get; set; }

        #endregion
    }
}
