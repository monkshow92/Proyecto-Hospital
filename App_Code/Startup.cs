using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Proyecto_2_Roman.Startup))]
namespace Proyecto_2_Roman
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
