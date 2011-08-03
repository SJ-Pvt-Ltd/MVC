using System;
using System.Configuration;
using System.Web.Mvc;
using System.Web.Routing;
using Aktel.Domain;
using Aktel.Mvc.Helpers;
using Aktel.Mvc.Models;
using NHibernate;
using NHibernate.Context;
using Persistance;
using Persistance.Mappings;

namespace Aktel.Mvc
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static ISessionFactory SessionFactory { get; private set; }
        public CartViewModel cartViewModel { get; set; }
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute(
               "AddToCart",
               "Cart/AddToCart/{Id}",
               new { controller = "Cart", action = "AddToCart", Id="Id"  }
               );

            routes.MapRoute(
                "FilterByPhoneDevice",
                "Filter/ByCarrier/{Id}/ByPhoneDevice/{deviceId}",
                new { controller = "Filter", action = "ByPhoneDevice" }
                );

            routes.MapRoute(
                "FilterByProductSubCategory",
                "Filter/ByProductCategory/{Id}/ByProductSubCategory/{subId}",
                new {controller = "Filter", action = "ByProductSubCategory"}
                );

            routes.MapRoute(
                "FilterByProductCategory",
                "Filter/ByProductCategory/{ID}",
                new {controller = "Filter", action = "ByProductCategory"}
                );

            routes.MapRoute(
                "FilterByManufacturerPost",
                "Filter/ByManufacturerPost/{ID}",
                new {controller = "Filter", action = "ByManufacturerPost"}
                );
            routes.MapRoute(
                "FilterByManufacturer",
                "Filter/ByManufacturer/{ID}",
                new {controller = "Filter", action = "ByManufacturer"}
                );

            routes.MapRoute(
                "FilterByCarrier",
                "Filter/ByCarrier/{ID}",
                new {controller = "Filter", action = "ByCarrier"}
                );
            routes.MapRoute(
                "SearchRoute",
                "Search/Search",
                new { controller = "Search", action = "Search" }
                );
            routes.MapRoute(
                "HomeRoute",
                "HomePage/{Index}",
                new {controller = "HomePage", action = "Index1"}
                );
            routes.MapRoute(
                "Default", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new {controller = "HomePage", action = "Index1", id = UrlParameter.Optional} // Parameter defaults
                );
        }
        


        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            RegisterRoutes(RouteTable.Routes);
            SessionFactory = SessionHelper.OpenSessionFactory();
            cartViewModel = new CartViewModel();
            Application.Add("Cart", cartViewModel); 
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            var session = SessionFactory.OpenSession();
            CurrentSessionContext.Bind(session);
        }

        protected void Application_EndRequest(object sender, EventArgs e)
        {
            var session = CurrentSessionContext.Unbind(SessionFactory);
            session.Dispose();

        }
    }
}