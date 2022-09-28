using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CommonLayer
{
    public class CompanyInfo
    {
        #region "DbFields"
        
        public string CompanyName { get; set; }
        public string PhoneNo { get; set; }
        public string Email { get; set; }
        public string CompanyLogo { get; set; }
        public string CompanyAddress { get; set; }
        public string FacebookLink { get; set; }
        public string TwitterLink { get; set; }
        public string GoogleLink { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string WelcomeMessage { get; set; }
        public string LandLineNo { get; set; }
        public string PostBoxNo { get; set; }
        public string RecentWork { get; set; }

        #endregion
    }
}
