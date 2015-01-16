using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(conociendoregionvalles.Startup))]
namespace conociendoregionvalles
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
