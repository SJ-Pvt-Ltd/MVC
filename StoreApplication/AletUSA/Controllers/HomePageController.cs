using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Aktel.Domain;
using Aktel.Mvc.Models;
using NHibernate;
using Persistance;

namespace Aktel.Mvc.Controllers
{
    public class HomePageController : Controller
    {
        protected new ISession Session;
        public HomePageController()
        {
            Session = MvcApplication.SessionFactory.GetCurrentSession();
        }

        public ActionResult Index1()
        {
            var homePageData = new HomePageViewModel();
            //dataService.CreateProductsinDb();
            homePageData.Manufacturers = new ManufacturerService(Session).GetManufacturers();
            homePageData.Carriers = new CarrierService(Session).GetCarriers();
            homePageData.BrandNames = new BrandService(Session).GetBrands();
            homePageData.ProductCategories = new ProductCategoryService(Session).GetProductCategories();
            var result = new ViewResult
                             {
                                 ViewData = {Model = homePageData}
                             };
            return result;
        }
    }
}
