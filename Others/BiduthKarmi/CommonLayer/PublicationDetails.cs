using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CommonLayer
{
    public class PublicationDetails
    {
        public int PID { get; set; }
        public string ImageName { get; set; }
        public string PDFName { get; set; }
        public string PublicationName { get; set; }
        public string SampleContain { get; set; }
        public string Contain { get; set; }
        public string CreatedDate { get; set; }
        public bool IsActive { get; set; }
    }
}
