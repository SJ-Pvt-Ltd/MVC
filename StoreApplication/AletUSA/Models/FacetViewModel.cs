using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Aktel.Domain;

namespace Aktel.Mvc.Models
{
    public class FacetViewModel
    {
        public HeaderAndFooterViewModel HeaderandFooter = new HeaderAndFooterViewModel();
        private List<Product> _products = new List<Product>();
        public bool ByManufacturer { get; set;}
        public bool ByBrandName { get; set; }
        public bool ByCarrier { get; set; }
        public string Name { get; set;}
        public string FilterName { get; set; }
        public string CategoryName { get; set; }
        public string CarrierName { get; set; }
        public SubCategoryViewModel SubCategoryViewModel = new SubCategoryViewModel();
        public List<BrandName> BrandNames = new List<BrandName>();
        public List<ProductSubCategory> ProductCategories = new List<ProductSubCategory>();
        public List<PhoneDevice> AssociatedDevices = new List<PhoneDevice>();
        public List<Manufacturer> Manufacturers = new List<Manufacturer>();
        public List<Carrier> Carriers = new List<Carrier>();
        

        public FacetViewModel AddProducts(List<Product> products)
        {
            _products = products;
            return this;
        }

        public List<Product> GetAllProducts()
        {
            return _products;
        }

    }
}