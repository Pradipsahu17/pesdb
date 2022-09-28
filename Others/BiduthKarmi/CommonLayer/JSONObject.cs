using System.Collections.Generic;

namespace CommonLayer
{
    public class JSONObject
    {
        public bool Success { get; set; }
        public string Message { get; set; }
        public string AlertMessage { get; set; }
        public bool Alert { get; set; }
        public string AdditionalMessage { get; set; }
        public object Data { get; set; }
        public object AdditionalData { get; set; }
        public object[] Datas { get; set; }




        
    }
}
