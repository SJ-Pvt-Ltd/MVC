using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Aktel.Domain;
using Product = Aktel.Domain.Product;

namespace Aktel.Mvc.Controllers
{
    public class FilterController : Controller
    {//
        // GET: /Product/

        //-------------------------------------- Contollers for ByManufactuer-----------------------------------------------------------
        public ActionResult FilterCategories(List<string> filterCategories)
        {
            var result = new PartialViewResult
                             {
                                 ViewData = {Model = filterCategories}
                             };
            return result;
        }

        public ActionResult RenderProduct(List<Product> products)
        {
            var result = new PartialViewResult
            {
                ViewData = { Model = products }
            };

            return result;
        }

        public ActionResult ByManufacturer(string id)
        {
            var products = new List<Product>
                               {
                                   new Product(1, "TestProduct1", new ProductCategory("TestCategory")),
                                   new Product(1, "TestProduct2", new ProductCategory("TestCategory")),
                                   new Product(1, "TestProduct3", new ProductCategory("TestCategory")),
                                   new Product(1, "TestProduct4", new ProductCategory("TestCategory"))
                               };
            var manufacturer = new Manufacturer(id.ToUpper());
            foreach (var product in products)
            {
                manufacturer.AddToProducts(product);
            }
            return View(manufacturer);
        }

        //---------------------------------Controllers for ByCarrier------------------------------------------


        public ActionResult ByCarrier(string id)
        {
            var devices = new List<PhoneDevice>
                              {
                                  new PhoneDevice("Test Product"),
                                  new PhoneDevice("Test Product1"),
                                  new PhoneDevice("Test Product2"),
                                  new PhoneDevice("Test Product3")
                              };
            var carrier = new Carrier(1,id.ToUpper());
            foreach (var device in devices)
            {
                carrier.AddPhoneDevices(device);
            }
            return View(carrier);
        }

        public ActionResult RenderDevices(List<PhoneDevice> devices)
        {
            var result = new PartialViewResult
            {
                ViewData = { Model = devices }
            };

            return result;
        }

        public ActionResult RenderDefaultSidebar()
        {
            var productCategories = Get_A_List_of_ProductCategories();

            var result = new PartialViewResult
                             {
                                 ViewData = {Model = productCategories}
                             };
            return result;
        }

        private List<ProductCategory> Get_A_List_of_ProductCategories()
        {
            return new List<ProductCategory>();
        }
    }
}
