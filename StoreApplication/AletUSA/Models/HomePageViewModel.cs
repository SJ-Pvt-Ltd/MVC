using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Aktel.Domain;

namespace Aktel.Mvc.Models
{
    public class HomePageViewModel
    {
        public List<Manufacturer> Manufacturers = new List<Manufacturer>();
        public List<Carrier> Carriers = new List<Carrier>();
        public List<ProductCategory> ProductCategories = new List<ProductCategory>();
        public List<BrandName> BrandNames = new List<BrandName>();
        public HeaderAndFooterViewModel HeaderandFooter = new HeaderAndFooterViewModel();
    }
}