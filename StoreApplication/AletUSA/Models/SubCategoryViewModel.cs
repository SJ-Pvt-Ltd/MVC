using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Aktel.Domain;

namespace Aktel.Mvc.Models
{
    public class SubCategoryViewModel
    {
        public HeaderAndFooterViewModel HeaderandFooter = new HeaderAndFooterViewModel();
        public String Name { get; set; }
        public List<ProductSubCategory> ProductSubCategories =  new List<ProductSubCategory>();
        public List<ProductCategory> ProductCategories = new List<ProductCategory>();
    }
}
