using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Aktel.Domain;
using Aktel.Mvc.Models;
using NHibernate;
using Persistance;

namespace Aktel.Mvc.Controllers
{
    public class SearchController : Controller
    {
        protected new ISession Session;
        public SearchController()
        {
            Session = MvcApplication.SessionFactory.GetCurrentSession();
        }
        public ActionResult Search(SearchViewModel model)
        {
            return RedirectToAction("SearchResults", model);
        }

        public ActionResult SearchResults(SearchViewModel searchInput)
        {
            var model = new SearchResultsViewModel
                            {
                                searchString = searchInput.searchString,
                                Products = new List<Product>()
                            };

            if(model.searchString != null)
                model.Products = new ProductService(Session)
                                        .SearchProductsBy(model.searchString);
            var result = new ViewResult
            {
                ViewData = { Model = model }
            };
            return result;
        }
    }
}
