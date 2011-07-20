using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Aktel.Domain;
using NHibernate;

namespace Persistance
{
    public class ProductService
    {
        public ISession Session { get; set; }

        public ProductService(ISession session)
        {
            Session = session;
        }

        public List<Product> GetProductsByManufacturerService(string manufacturerName)
        {
            return (List<Product>)Repo.ProductsByManufacturerRepository(manufacturerName, Session);
        }

        public List<Product> GetProductsByBrandNameService(string brandName)
        {
            return (List<Product>)Repo.ProductsByBrandNameRepository(brandName, Session);
        }

        public List<Product> GetProductsByDeviceNameService(string deviceName)
        {
            return (List<Product>)Repo.ProductsByDeviceNameRepository(deviceName, Session);
        }

        public List<Product> GetProductsBySubCategoryService(string subCategoryName)
        {
            return (List<Product>)Repo.ProductsBySubCategoryNameRepository(subCategoryName, Session);
        }

        public List<Product> SearchProductsBy(string searchString)
        {
            return Repo.ProductsSearchRepository(searchString, Session);
        }

        public List<Product> GetProductsByName(string name)
        {
            return Repo.ProductsByNameRepository(name, Session);
        }
    }
}
