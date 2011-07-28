using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Aktel.Domain;

namespace Aktel.Mvc.Models
{
    public class FilterListing
    {
        public SubCategoryViewModel SubCategoryViewModel = new SubCategoryViewModel();
        public List<BrandName> BrandNames = new List<BrandName>();
        public List<ProductSubCategory> ProductCategories = new List<ProductSubCategory>();
        public List<PhoneDevice> AssociatedDevices = new List<PhoneDevice>();
        public List<Manufacturer> Manufacturers = new List<Manufacturer>();
        public List<Carrier> Carriers = new List<Carrier>();
        public ListingOperators listingOperator { get; set; }
    }

    public class ListingOperators
    {
        public string ID { get; set; }
        public string Brand { get; set; }
        public string Category { get; set; }
        public string Device { get; set; }
        public string Manufactuer { get; set; }
        public string sortOrder { get; set; }
        public string pageNumber { get; set; }
    }
}