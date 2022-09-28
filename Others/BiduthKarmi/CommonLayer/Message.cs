
using static CommonLayer.MessageExtension;

namespace CommonLayer
{
    public class Message
    {
        public string MessageText { get; set; }

        public string MessageType { get; set; }

        public MyMessage MyMessage { get; set; }
    }
}
