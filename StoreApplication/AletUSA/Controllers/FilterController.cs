using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
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
        protected CartViewModel Cart;
        public FilterController()
        {

            Cart = (CartViewModel)System.Web.HttpContext.Current.Application["Cart"];
            Session = MvcApplication.SessionFactory.GetCurrentSession();
        }
        
        public ActionResult ProductListing(string filterIdentifier, string id, string brand, string category, string device, string manufactuer, string sortOrder, string pageNumber)
        {
            var selectedFilterListings = new ListingOperators { Brand = brand??"All", Category = category??"All", Device = device??"All", sortOrder = sortOrder??"1", pageNumber = pageNumber??"1"  };
            
            var productService = new ProductService(Session);
            //TODO: Modify this service to use filterIdentifier and Id to return products
            var products = productService.GetProductsByManufacturerService(id);

            var facetViewModel = new FacetViewModel
                                     {
                                         HeaderandFooter = GetHeaderAndFooterInformation(),
                                         Breadcrumb = UpdateBreadcrumb(filterIdentifier, string.Empty, string.Empty),
                                         cart = {Cart = new Domain.Cart {Items = new List<CartItem>()}}
                                     };
            if (Cart.Cart != null && Cart.Cart.Items != null)
                facetViewModel.cart = Cart;

            facetViewModel = filterProducts(facetViewModel, products, selectedFilterListings);
            facetViewModel = UpdateFilterListing(facetViewModel, products);
            facetViewModel.filterListings.listingOperator = selectedFilterListings;

            var result = new ViewResult
            {
                ViewName = "ByManufacturer",
                ViewData = { Model = facetViewModel }
            };
            return result;
        }

       

        public ActionResult ByProductSubCategory(string id, string subId, string brand, string category, string device,
                                                 string manufacturer)
        {
            var dataService = new ProductService(Session);
            var products = dataService.GetProductsBySubCategoryService(subId);
            var facetViewModel = new FacetViewModel
                                     {
                                         Breadcrumb = UpdateBreadcrumb(id, string.Empty, subId),
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
                if (!facetViewModel.filterListings.ProductCategories.Any(c => c == tempProd.ProductSubCategory))
                {
                    facetViewModel.filterListings.ProductCategories.Add(product.ProductSubCategory);
                }
                if (!facetViewModel.filterListings.BrandNames.Any(c => c == tempProd.BrandName))
                {
                    facetViewModel.filterListings.BrandNames.Add(product.BrandName);
                }
                if (!facetViewModel.filterListings.Manufacturers.Any(c => c == tempProd.Manufacturer))
                {
                    facetViewModel.filterListings.Manufacturers.Add(product.Manufacturer);
                }
                var tempDevices = tempProd.PhoneDevices.ToList();
                facetViewModel.filterListings.AssociatedDevices = tempDevices.GroupBy(x => x.Name).Select(x => x.First()).ToList();
            }
           
            facetViewModel.Breadcrumb.Name = subId;
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
                                         filterListings = new FilterListing()
                                                              {
                                                                  SubCategoryViewModel = new SubCategoryViewModel
                                                                                             {
                                                                                                 Name = id,
                                                                                                 ProductSubCategories =
                                                                                                     subCategories,
                                                                                                 ProductCategories =
                                                                                                     dataService.
                                                                                                     GetProductCategories
                                                                                                     ()
                                                                                             }
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
            return RedirectToAction("ProductListing", new RouteValueDictionary()
                                                          {
                                                              {"filterIdentifier", "Manufacturer"},
                                                              {"id", id},
                                                              {"brand", brand},
                                                              {"category", category},
                                                              {"device", device},
                                                              {"manufacturer", id},
                                                              {"sortOrder", "1"},
                                                              {"pageNumber", "1"}
                                                          });

            #region

            //var productService = new ProductService(Session);

            //var products = productService.GetProductsByManufacturerService(id);
            //var facetViewModel = new FacetViewModel() {HeaderandFooter = GetHeaderAndFooterInformation()};
            //facetViewModel.cart.Cart = new Domain.Cart();
            //facetViewModel.cart.Cart.Items = new List<CartItem>();
            //if(Cart.Cart != null  && Cart.Cart.Items != null)
            //    facetViewModel.cart = Cart;
            //var filteredProducts = products;

            //if (brand != null)
            //    filteredProducts = products.Where(x => x.BrandName.Name.Equals(brand)).ToList();
            //if (category != null)
            //    filteredProducts = products.Where(x => x.ProductSubCategory.Name.Equals(category)).ToList();
            //facetViewModel.AddProducts(filteredProducts);

            //foreach (var product in products)
            //{
            //    var tempProd = product;
            //    if (!facetViewModel.filterListings.ProductCategories.Any(c => c == tempProd.ProductSubCategory))
            //    {
            //        //if (!product.ProductSubCategory.Name.Equals(category))
            //        facetViewModel.filterListings.ProductCategories.Add(product.ProductSubCategory);
            //    }
            //    if (!facetViewModel.filterListings.BrandNames.Any(c => c == tempProd.BrandName))
            //    {
            //        //if (!product.BrandName.Name.Equals(brand))
            //        facetViewModel.filterListings.BrandNames.Add(product.BrandName);
            //    }

            //    var tempDevices = tempProd.PhoneDevices.ToList();

            //    //PhoneDevice prod1 = prod;
            //    //if (!tempDevices.Any(x => x == prod1))
            //    facetViewModel.filterListings.AssociatedDevices = tempDevices.GroupBy(x => x.Name).Select(x => x.First()).ToList();
            //}


            //facetViewModel.Name = id;

            //var result = new ViewResult
            //                 {
            //                     ViewData = {Model = facetViewModel}
            //                 };
            //return result;

            #endregion
        }

        #region By Carrier

        //---------------------------------Controllers for ByCarrier------------------------------------------
        public ActionResult ByCarrier(string id)
        {
            var dataService = new CarrierService(Session);
            var devices = dataService.GetPhoneDevicesByCarrierNameService(id);
            var facetViewModel = new FacetViewModel
                                     {
                                         Breadcrumb = UpdateBreadcrumb(id, string.Empty, string.Empty),
                                         filterListings = new FilterListing()
                                                              {
                                                                  AssociatedDevices = devices,
                                                                  Carriers = dataService.GetCarriers()
                                                              },
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
                                         Breadcrumb = UpdateBreadcrumb(deviceID, id, string.Empty),
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
                if (!facetViewModel.filterListings.ProductCategories.Any(c => c == tempProd.ProductSubCategory))
                {
                    facetViewModel.filterListings.ProductCategories.Add(product.ProductSubCategory);
                }
                if (!facetViewModel.filterListings.BrandNames.Any(c => c == tempProd.BrandName))
                {
                    facetViewModel.filterListings.BrandNames.Add(product.BrandName);
                }
                if (!facetViewModel.filterListings.Manufacturers.Any(c => c == tempProd.Manufacturer))
                {
                    facetViewModel.filterListings.Manufacturers.Add(product.Manufacturer);
                }
            }

            facetViewModel.Breadcrumb.Name = deviceID;
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
        private static Breadcrumb UpdateBreadcrumb(string name, string carrierName, string categoryName)
        {
            return new Breadcrumb() { Name = name };
        }
        private FacetViewModel filterProducts(FacetViewModel facetViewModel, List<Product> products, ListingOperators listingOperators)
        {
            var filteredProducts = products;

            if (!listingOperators.Brand.Equals("All"))
                filteredProducts = products.Where(x => x.BrandName.Name.Equals(listingOperators.Brand)).ToList();
            if (!listingOperators.Category.Equals("All"))
                filteredProducts = filteredProducts.Where(x => x.ProductSubCategory.Name.Equals(listingOperators.Category)).ToList();
            if (!listingOperators.Device.Equals("All"))
            {
                var tempProducts = new List<Product>();
                filteredProducts.ForEach(x =>
                {
                    if (x.PhoneDevices.ToList().Any(p => p.Name.Equals(listingOperators.Device)))
                        tempProducts.Add(x);
                });
                filteredProducts = tempProducts;
            }


            return facetViewModel.AddProducts(filteredProducts);

        }
        private FacetViewModel UpdateFilterListing(FacetViewModel facetViewModel, List<Product> products)
        {
            foreach (var product in products)
            {
                var tempProd = product;
                if (!facetViewModel.filterListings.ProductCategories.Any(c => c == tempProd.ProductSubCategory))
                {
                    //if (!product.ProductSubCategory.Name.Equals(category))
                    facetViewModel.filterListings.ProductCategories.Add(product.ProductSubCategory);
                }
                if (!facetViewModel.filterListings.BrandNames.Any(c => c == tempProd.BrandName))
                {
                    //if (!product.BrandName.Name.Equals(brand))
                    facetViewModel.filterListings.BrandNames.Add(product.BrandName);
                }

                var tempDevices = tempProd.PhoneDevices.ToList();

                //PhoneDevice prod1 = prod;
                //if (!tempDevices.Any(x => x == prod1))
                facetViewModel.filterListings.AssociatedDevices = tempDevices.GroupBy(x => x.Name).Select(x => x.First()).ToList();
            }
            return facetViewModel;
        }
    }


}