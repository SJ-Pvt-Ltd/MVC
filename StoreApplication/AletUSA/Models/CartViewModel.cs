using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Aktel.Domain;

namespace Aktel.Mvc.Models
{
    public class CartViewModel
    {
        public HeaderAndFooterViewModel HeaderandFooter = new HeaderAndFooterViewModel();
        public Breadcrumb Breadcrumb = new Breadcrumb();
        public Cart Cart = new Cart();
    } 
}