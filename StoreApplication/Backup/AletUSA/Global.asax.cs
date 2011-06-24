using System.Web.Mvc;
using System.Web.Routing;

namespace Aktel.Mvc
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute(
                "FilterByManufacturer",
                "Filter/ByManufacturer/{ID}",
                new { controller = "Filter", action = "ByManufacturer" }
                );
            routes.MapRoute(
                "FilterByCarrier",
                "Filter/ByCarrier/{ID}",
                new { controller = "Filter", action = "ByCarrier" }
                );
            routes.MapRoute(
                "HomeRoute",
                "HomePage/{Index}",
                new { controller = "HomePage", action = "Index1"}
                );
            routes.MapRoute(
                "Default", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new { controller = "HomePage", action = "Index1", id = UrlParameter.Optional } // Parameter defaults
            );

        }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            RegisterRoutes(RouteTable.Routes);
        }
    }
}