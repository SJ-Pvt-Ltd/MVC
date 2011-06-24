using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Aktel.Domain;

namespace Aktel.Mvc.Controllers
{
    public class HomePageController : Controller
    {
        //
        // GET: /HomePage/

        public ActionResult Index()
        {
            var listManufacturers = new List<string>
                                     {
                                         "apple", "ericsson", "blackberry",
                                         "garmin", "casio", "dell"
                                     };

            var listCarriers = new List<string>
                                     {
                                         "ATT", "Verizon", "T-Mobile", 
                                         "Sprint", "US Cellular", "Cricket",
                                         "MetroPCS", "BoostMobile"
                                     };
            var listProductCategories = new List<string>
                                     {
                                         "Data Cables", "Battery Charger", "Bluetooth Headset",
                                         "Cell Armour", "Licenced Product", "Protector Case",
                                         "Batteries", "Memory Card", "Screen Protector"
                                     };
            var manufacturers = listManufacturers.Select(item => new Manufacturer(item)).ToList();
            var carriers = listCarriers.Select(item => new Carrier(1,item)).ToList();
            var productCategories = listProductCategories.Select(item => new ProductCategory(item)).ToList();
            ViewData.Add("Manufacturers", manufacturers);
            ViewData.Add("Carriers", carriers);
            ViewData.Add("ProductCategories", productCategories);
            return View();
        }

        public ActionResult Index1()
        {
            var listManufacturers = new List<string>
                                     {
                                         "apple", "ericsson", "blackberry",
                                         "garmin", "casio", "dell"
                                     };

            var listCarriers = new List<string>
                                     {
                                         "ATT", "Verizon", "T-Mobile", 
                                         "Sprint", "US Cellular", "Cricket",
                                         "MetroPCS", "BoostMobile"
                                     };
            var listProductCategories = new List<string>
                                     {
                                         "Data Cables", "Battery Charger", "Bluetooth Headset",
                                         "Cell Armour", "Licenced Product", "Protector Case",
                                         "Batteries", "Memory Card", "Screen Protector"
                                     };
            var manufacturers = listManufacturers.Select(item => new Manufacturer(item)).ToList();
            var carriers = listCarriers.Select(item => new Carrier(1, item)).ToList();
            var productCategories = listProductCategories.Select(item => new ProductCategory(item)).ToList();
            ViewData.Add("Manufacturers", manufacturers);
            ViewData.Add("Carriers", carriers);
            ViewData.Add("ProductCategories", productCategories);
            return View();
        }

        public ActionResult RenderManufacturers(List<Manufacturer> manufacturers)
        {
            var result = new PartialViewResult()
                             {
                                 ViewData = {Model = manufacturers}
                             };
            return result;
        }

        public ActionResult RenderCarriers(List<Carrier> carriers)
        {
            var result = new PartialViewResult()
            {
                ViewData = { Model = carriers }
            };
            return result;
        }

        public ActionResult RenderProductCategories(List<ProductCategory> productCategories)
        {
            var result = new PartialViewResult()
            {
                ViewData = { Model = productCategories }
            };
            return result;
        }

    }
}
