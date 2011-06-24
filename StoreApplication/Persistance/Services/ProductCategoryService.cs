using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Aktel.Domain;
using NHibernate;

namespace Persistance
{
    public class ProductCategoryService
    {
        public ISession Session { get; set; }

        public ProductCategoryService(ISession session)
        {
            Session = session;
        }

        public List<ProductCategory> GetProductCategories()
        {
            return (List<ProductCategory>)Repo.FindAll<ProductCategory>(Session);
        }

        public List<ProductSubCategory> GetSubCategoriesByCategoryService(string categoryName)
        {
            return (List<ProductSubCategory>)Repo.GetSubCategoriesByCategoryNameRepository(categoryName, Session);
        }
    }
}
