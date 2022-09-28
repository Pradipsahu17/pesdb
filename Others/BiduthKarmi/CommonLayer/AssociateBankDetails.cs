using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CommonLayer
{
    public class AssociateBankDetails
    {
        public int Id { get; set; }
        public string BankName { get; set; }
        public string AccountNumber { get; set; }
        public string AccountHolderName { get; set; }
        public string  BranchName { get; set; }
        public string Logo { get; set; }
        public bool IsActive { get; set; } = false;
    }
}
