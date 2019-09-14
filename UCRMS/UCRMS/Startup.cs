using Microsoft.Owin;
using Owin;


[assembly: OwinStartupAttribute("UCRMSConfig", typeof(UCRMS.Startup))]
namespace UCRMS
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
