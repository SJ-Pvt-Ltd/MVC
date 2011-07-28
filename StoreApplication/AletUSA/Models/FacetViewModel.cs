using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Aktel.Domain;
using Aktel.Mvc.Controllers;

namespace Aktel.Mvc.Models
{
    public class FacetViewModel
    {
        public HeaderAndFooterViewModel HeaderandFooter = new HeaderAndFooterViewModel();
        private List<Product> _products = new List<Product>();
        public Breadcrumb Breadcrumb = new Breadcrumb();
        public FilterListing filterListings = new FilterListing();
        public CartViewModel cart = new CartViewModel();

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