using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.MobileControls;
using Aktel.Domain;
using Aktel.Mvc.Models;
using NHibernate;
using Persistance;

namespace Aktel.Mvc.Controllers
{
    public class FilterController : Controller
    {
        protected new ISession Session;

        public FilterController()
        {
            Session = MvcApplication.SessionFactory.GetCurrentSession();
        }

        public ActionResult ByProductSubCategory(string id, string subId, string brand, string category, string device,
                                                 string manufacturer)
        {
            var dataService = new ProductService(Session);
            var products = dataService.GetProductsBySubCategoryService(subId);
            var facetViewModel = new FacetViewModel
                                     {
                                         Name = subId,
                                         CategoryName = id,
                                         HeaderandFooter = GetHeaderAndFooterInformation()
                                     };
            var filteredProducts = products;

            if (brand != null)
                filteredProducts = products.Where(x => x.BrandName.Name.Equals(brand)).ToList();
            if (category != null)
                filteredProducts = products.Where(x => x.ProductSubCategory.Name.Equals(category)).ToList();
            if (manufacturer != null)
                filteredProducts = products.Where(x => x.Manufacturer.Name.Equals(manufacturer)).ToList();
            facetViewModel.AddProducts(filteredProducts);

            foreach (var product in products)
            {
                var tempProd = product;
                if (!facetViewModel.ProductCategories.Any(c => c == tempProd.ProductSubCategory))
                {
                    facetViewModel.ProductCategories.Add(product.ProductSubCategory);
                }
                if (!facetViewModel.BrandNames.Any(c => c == tempProd.BrandName))
                {
                    facetViewModel.BrandNames.Add(product.BrandName);
                }
                if (!facetViewModel.Manufacturers.Any(c => c == tempProd.Manufacturer))
                {
                    facetViewModel.Manufacturers.Add(product.Manufacturer);
                }
                var tempDevices = tempProd.PhoneDevices.ToList();
                facetViewModel.AssociatedDevices = tempDevices.GroupBy(x => x.Name).Select(x => x.First()).ToList();
            }

            var filters = new StringBuilder();
            if (brand != null)
                filters.Append(" And Brand &rsaquo; " + brand);
            if (category != null)
                filters.Append(" And Category &rsaquo; " + category);
            facetViewModel.Name = subId;
            facetViewModel.FilterName = filters.ToString();
            var result = new ViewResult
                             {
                                 ViewData = {Model = facetViewModel}
                             };
            return result;
        }

        public ActionResult ByProductCategory(string id)
        {
            var dataService = new ProductCategoryService(Session);
            var subCategories = dataService.GetSubCategoriesByCategoryService(id);
            var facetViewModel = new FacetViewModel()
                                     {
                                         SubCategoryViewModel = new SubCategoryViewModel
                                                 {
                                                     Name = id,
                                                     ProductSubCategories = subCategories,
                                                     ProductCategories = dataService.GetProductCategories()
                                                 },
                                         HeaderandFooter = GetHeaderAndFooterInformation()
                                     };
            var result = new ViewResult
                             {
                                 ViewData = {Model = facetViewModel}
                             };
            return result;
        }

        //-------------------------------------- Contollers for ByManufactuer-----------------------------------------------------------


        public ActionResult ByManufacturer(string id, string brand, string category, string device)
        {
            var productService = new ProductService(Session);

            var products = productService.GetProductsByManufacturerService(id);
            var facetViewModel = new FacetViewModel() {HeaderandFooter = GetHeaderAndFooterInformation()};
            var filteredProducts = products;

            if (brand != null)
                filteredProducts = products.Where(x => x.BrandName.Name.Equals(brand)).ToList();
            if (category != null)
                filteredProducts = products.Where(x => x.ProductSubCategory.Name.Equals(category)).ToList();
            facetViewModel.AddProducts(filteredProducts);

            foreach (var product in products)
            {
                var tempProd = product;
                if (!facetViewModel.ProductCategories.Any(c => c == tempProd.ProductSubCategory))
                {
                    //if (!product.ProductSubCategory.Name.Equals(category))
                    facetViewModel.ProductCategories.Add(product.ProductSubCategory);
                }
                if (!facetViewModel.BrandNames.Any(c => c == tempProd.BrandName))
                {
                    //if (!product.BrandName.Name.Equals(brand))
                    facetViewModel.BrandNames.Add(product.BrandName);
                }

                var tempDevices = tempProd.PhoneDevices.ToList();

                //PhoneDevice prod1 = prod;
                //if (!tempDevices.Any(x => x == prod1))
                facetViewModel.AssociatedDevices = tempDevices.GroupBy(x => x.Name).Select(x => x.First()).ToList();
            }

            var filters = new StringBuilder();
            if (brand != null)
                filters.Append(" And Brand &rsaquo; " + brand);
            if (category != null)
                filters.Append(" And Category &rsaquo; " + category);
            facetViewModel.Name = id;
            facetViewModel.FilterName = filters.ToString();
            facetViewModel.ByManufacturer = true;

            var result = new ViewResult
                             {
                                 ViewData = {Model = facetViewModel}
                             };
            return result;
        }

        #region By Carrier

        //---------------------------------Controllers for ByCarrier------------------------------------------
        public ActionResult ByCarrier(string id)
        {
            var dataService = new CarrierService(Session);
            var devices = dataService.GetPhoneDevicesByCarrierNameService(id);
            var facetViewModel = new FacetViewModel
                                     {
                                         Name = id,
                                         AssociatedDevices = devices,
                                         Carriers = dataService.GetCarriers(),
                                         HeaderandFooter = GetHeaderAndFooterInformation()
                                     };
            var result = new ViewResult
                             {
                                 ViewData = {Model = facetViewModel}
                             };
            return result;
        }

        public ActionResult ByPhoneDevice(string id, string deviceID, string brand, string category, string manufacturer)
        {
            var dataService = new ProductService(Session);
            var products = dataService.GetProductsByDeviceNameService(deviceID);
            var facetViewModel = new FacetViewModel()
                                     {
                                         Name = deviceID,
                                         CarrierName = id,
                                         HeaderandFooter = GetHeaderAndFooterInformation()
                                     };
            var filteredProducts = products;

            if (brand != null)
                filteredProducts = products.Where(x => x.BrandName.Name.Equals(brand)).ToList();
            if (category != null)
                filteredProducts = products.Where(x => x.ProductSubCategory.Name.Equals(category)).ToList();
            if (manufacturer != null)
                filteredProducts = products.Where(x => x.Manufacturer.Name.Equals(manufacturer)).ToList();
            facetViewModel.AddProducts(filteredProducts);

            foreach (var product in products)
            {
                var tempProd = product;
                if (!facetViewModel.ProductCategories.Any(c => c == tempProd.ProductSubCategory))
                {
                    facetViewModel.ProductCategories.Add(product.ProductSubCategory);
                }
                if (!facetViewModel.BrandNames.Any(c => c == tempProd.BrandName))
                {
                    facetViewModel.BrandNames.Add(product.BrandName);
                }
                if (!facetViewModel.Manufacturers.Any(c => c == tempProd.Manufacturer))
                {
                    facetViewModel.Manufacturers.Add(product.Manufacturer);
                }
            }
            var filters = new StringBuilder();
            if (brand != null)
                filters.Append(" And Brand &rsaquo; " + brand);
            if (category != null)
                filters.Append(" And Category &rsaquo; " + category);
            facetViewModel.Name = deviceID;
            facetViewModel.FilterName = filters.ToString();
            var result = new ViewResult
                             {
                                 ViewData = {Model = facetViewModel}
                             };
            return result;
        }


        public ActionResult RenderDevices(List<PhoneDevice> devices)
        {
            var result = new PartialViewResult
                             {
                                 ViewData = {Model = devices}
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

        private List<ProductSubCategory> Get_A_List_of_ProductCategories()
        {
            return new List<ProductSubCategory>();
        }

        #endregion

        private HeaderAndFooterViewModel GetHeaderAndFooterInformation()
        {
            return new HeaderAndFooterViewModel()
                       {
                           Manufacturers = new ManufacturerService(Session).GetManufacturers(),
                           Carriers = new CarrierService(Session).GetCarriers(),
                           BrandNames = new BrandService(Session).GetBrands(),
                           ProductCategories = new ProductCategoryService(Session).GetProductCategories()
                       };
        }
    }
}