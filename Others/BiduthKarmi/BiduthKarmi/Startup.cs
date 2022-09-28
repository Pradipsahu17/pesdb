using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(BiduthKarmi.Startup))]
namespace BiduthKarmi
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
