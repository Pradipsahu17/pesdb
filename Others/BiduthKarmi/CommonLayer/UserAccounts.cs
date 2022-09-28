using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CommonLayer
{
    public class UserInfo
    {
        #region "DbFields"
        public  string FullName { get; set; }
        public  string UserName { get; set; }
        public  string Password { get; set; }
        public  string Createdby { get; set; }
        public  string CreatedDate { get; set; }
        public  string PhoneNo { get; set; }
        #endregion
    }
}
