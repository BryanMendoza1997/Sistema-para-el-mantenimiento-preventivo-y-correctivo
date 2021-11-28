using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(PI5.Startup))]
namespace PI5
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
