﻿using System.Collections.Generic;
using Aktel.Domain;
using NHibernate;
using NHibernate.Criterion;
using NHibernate.SqlCommand;

namespace Persistance
{
    public static class Repo
    {
        public static IList<T> FindAll<T>(ISession session)
        {
            return session.CreateCriteria(typeof (T)).List<T>();
        }

        public static IList<Product> ProductsByManufacturerRepository(string manufactuerName, ISession session)
        {
            var products = (List<Product>) session.CreateCriteria(typeof (Product))
                                               .CreateAlias("Manufacturer", "m", JoinType.InnerJoin)
                                               .Add(Restrictions.Eq("m.Name", manufactuerName))
                                               .List<Product>();
            return products;
        }

        public static IList<Product> ProductsByBrandNameRepository(string brandName, ISession session)
        {
            var products = (List<Product>) session.CreateCriteria(typeof (Product))
                                               .CreateAlias("BrandName", "bn", JoinType.InnerJoin)
                                               .Add(Restrictions.Eq("bn.Name", brandName))
                                               .List<Product>();
            return products;
        }

        public static IList<Product> ProductsBySubCategoryNameRepository(string subCategoryName, ISession session)
        {
            var products = (List<Product>) session.CreateCriteria(typeof (Product))
                                               .CreateAlias("ProductSubCategory", "psc", JoinType.InnerJoin)
                                               .Add(Restrictions.Eq("psc.Name", subCategoryName))
                                               .List<Product>();
            return products;
        }

        public static IList<ProductSubCategory> GetSubCategoriesByCategoryNameRepository(string categoryName,
                                                                                         ISession session)
        {
            categoryName = "Batteries";
            var productSubCategories =
                (List<ProductSubCategory>) session.CreateCriteria(typeof (ProductSubCategory))
                                               .CreateAlias("ProductCategory", "pc", JoinType.InnerJoin)
                                               .Add(Restrictions.Eq("pc.Name", categoryName))
                                               .List<ProductSubCategory>();
            return productSubCategories;
        }

        public static IList<PhoneDevice> PhoneDevicesByCarrierNameRepository(string carrierName, ISession session)
        {
            var devices = (List<PhoneDevice>) session.CreateCriteria(typeof (PhoneDevice))
                                                  .CreateAlias("Carriers", "c", JoinType.InnerJoin)
                                                  .Add(Restrictions.Eq("c.Name", carrierName))
                                                  .List<PhoneDevice>();
            return devices;
        }

        public static IList<Product> ProductsByDeviceNameRepository(string deviceName, ISession session)
        {
            var products = (List<Product>) session.CreateCriteria(typeof (Product))
                                               .CreateAlias("PhoneDevices", "pd", JoinType.InnerJoin)
                                               .Add(Restrictions.Eq("pd.Name", deviceName))
                                               .List<Product>();
            return products;
        }

        public static List<Product> ProductsSearchRepository(string searchString, ISession session)
        {
            var products = (List<Product>) session.CreateCriteria(typeof (Product))
                                               .Add(Restrictions.Like("Name", searchString, MatchMode.Anywhere))
                                               .List<Product>();
            return products;
        }

        public static List<Product> ProductsByNameRepository(string name, ISession session)
        {
            var products = (List<Product>)session.CreateCriteria(typeof(Product))
                                               .Add(Restrictions.Like("Name", name, MatchMode.Exact))
                                               .List<Product>();
            return products;
        }
    }
}