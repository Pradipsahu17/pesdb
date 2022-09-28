using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CommonLayer
{
   public class MessageExtension
    {

        public interface MyMessage
        {
            string MessageType { get; }
        }

        public class Success : MyMessage
        {
            public string MessageType
            {
                get
                {
                    return "success";
                }
            }
        }
        public class Info : MyMessage
        {
            public string MessageType
            {
                get
                {
                    return "info";
                }
            }
        }
        public class Error : MyMessage
        {
            public string MessageType
            {
                get
                {
                    return "danger";
                }
            }
        }
        public class Black : MyMessage
        {
            public string MessageType
            {
                get
                {
                    return "black";
                }
            }
        }

    }
}
