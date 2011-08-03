using System;
using System.Collections.Generic;
using System.Linq;
using Aktel.Domain;
using NHibernate;
using NHibernate.Criterion;

namespace Persistance
{
    public class DataService
    {
        public ISession Session;

        public DataService(ISession session)
        {
            Session = session;
        }

        //public void CreateProductsinDb()
        //{
        //    ISessionFactory sessionFactory = SessionHelper.CreateSessionFactory();

        //    using (ISession session = sessionFactory.OpenSession())
        //    {
        //        using (ITransaction transaction = session.BeginTransaction())
        //        {
        //            #region list Data Entered in Database

        //            var listManufacturers = new List<string>
        //                                        {
        //                                            "apple",
        //                                            "ericsson",
        //                                            "blackberry",
        //                                            "garmin",
        //                                            "casio",
        //                                            "dell"
        //                                        };

        //            var listCarriers = new List<string>
        //                                   {
        //                                       "ATT",
        //                                       "Verizon",
        //                                       "T-Mobile",
        //                                       "Sprint",
        //                                       "US Cellular",
        //                                       "Cricket",
        //                                       "MetroPCS",
        //                                       "BoostMobile"
        //                                   };
        //            var listProductCategories = new List<string>
        //                                            {
        //                                                "Data Cables",
        //                                                "Battery Charger",
        //                                                "Bluetooth Headset",
        //                                                "Cell Armour",
        //                                                "Licenced Product",
        //                                                "Protector Case",
        //                                                "Batteries",
        //                                                "Memory Card",
        //                                                "Screen Protector"
        //                                            };

        //            var listProductSubCategories = new List<string>
        //                                               {
        //                                                   "Batteries",
        //                                                   "OEM"
        //                                               };

        //            var listBrandNames = new List<string>
        //                                     {
        //                                         "apple",
        //                                         "ericsson",
        //                                         "blackberry",
        //                                         "garmin",
        //                                         "casio",
        //                                         "dell"
        //                                     };

        //            var listDevices = new List<string>
        //                                  {
        //                                      "MINI",
        //                                      "SHUFFLE",
        //                                      "NANO",
        //                                      "NANO2",
        //                                      "NANO3",
        //                                      "NANO4",
        //                                      "NANO5",
        //                                      "IPODTOUCH",
        //                                      "IPODTOUCH2",
        //                                      "IPODTOUCH3",
        //                                      "IPODTOUCH4",
        //                                      "VIDEO30G",
        //                                      "VIDEO60G",
        //                                      "IPHONE",
        //                                      "IPHONE3G",
        //                                      "IPHONE3GS",
        //                                      "IPHONE4",
        //                                      "HTCEVO",
        //                                      "Sansung Galaxy"
        //                                  };

        //            #endregion

        //            foreach (string manufacturer in listManufacturers)
        //            {
        //                var newManufactuer = new Manufacturer {Name = manufacturer};
        //                session.SaveOrUpdate(newManufactuer);
        //            }

        //            foreach (string brandName in listBrandNames)
        //            {
        //                var newBrandName = new BrandName {Name = brandName};
        //                session.SaveOrUpdate(newBrandName);
        //            }


        //            foreach (string category in listProductCategories)
        //            {
        //                var productCategory = new ProductCategory {Name = category};
        //                session.SaveOrUpdate(productCategory);
        //            }

        //            var productCategories = (List<ProductCategory>) session.CreateCriteria(typeof (ProductCategory))
        //                                                                .Add(Restrictions.Eq("Name", "Batteries"))
        //                                                                .List<ProductCategory>();

        //            foreach (string productSubCategory in listProductSubCategories)
        //            {
        //                var subCategory = new ProductSubCategory
        //                                      {
        //                                          Name = productSubCategory,
        //                                          ProductCategory = productCategories[0]
        //                                      };
        //                session.SaveOrUpdate(subCategory);
        //            }


        //            foreach (string carrierItem in listCarriers)
        //            {
        //                var carrier = new Carrier {Name = carrierItem};
        //                session.SaveOrUpdate(carrier);
        //            }


        //            var manufacturers =
        //                (List<Manufacturer>) session.CreateCriteria(typeof (Manufacturer)).List<Manufacturer>();
        //            var manufacturerRet = new Manufacturer();
        //            foreach (
        //                Manufacturer manufacturer in
        //                    manufacturers.Where(manufacturer => manufacturer.Name.Equals("apple")))
        //            {
        //                manufacturerRet = manufacturer;
        //                break;
        //            }

        //            var brandNames = (List<BrandName>) session.CreateCriteria(typeof (BrandName)).List<BrandName>();
        //            var brandNameRet = new BrandName();
        //            foreach (BrandName brandName in brandNames.Where(br => br.Name.Equals("apple")))
        //            {
        //                brandNameRet = brandName;
        //                break;
        //            }

        //            var productSubCategories =
        //                (List<ProductSubCategory>)
        //                session.CreateCriteria(typeof (ProductSubCategory)).List<ProductSubCategory>();
        //            var productSubCategoryRet = new ProductSubCategory();
        //            foreach (
        //                ProductSubCategory productCat in productSubCategories.Where(pc => pc.Name.Equals("Batteries")))
        //            {
        //                productSubCategoryRet = productCat;
        //                break;
        //            }


        //            var carriers = (List<Carrier>) session.CreateCriteria(typeof (Carrier)).List<Carrier>();
        //            var carrierATT = new Carrier();
        //            var carrierSprint = new Carrier();
        //            foreach (Carrier carrier in carriers.Where(c => c.Name.Equals("ATT")))
        //            {
        //                carrierATT = carrier;
        //                break;
        //            }
        //            foreach (Carrier carrier in carriers.Where(c => c.Name.Equals("Sprint")))
        //            {
        //                carrierSprint = carrier;
        //                break;
        //            }

        //            var product = new Product
        //                              {
        //                                  Name =
        //                                      "APPLE IPHONE 3G / IPHONE4 / IPOD TOUCH CYONGEAR PORTABLE CHARGER WITH SOLAR CHARGING PANEL (2400MAH) ",
        //                                  Manufacturer = manufacturerRet,
        //                                  BrandName = brandNameRet,
        //                                  ProductSubCategory = productSubCategoryRet
        //                              };
        //            var attCarrierList = new List<Carrier> {carrierATT};
        //            IEnumerable<PhoneDevice> phoneDevices =
        //                listDevices.Select(
        //                    device => new PhoneDevice {Name = device, Carriers = (IList<Carrier>) attCarrierList});
        //            if (phoneDevices == null) throw new NotImplementedException();
        //            //product.AddToPhoneDevices(phoneDevices);
        //            product.PhoneDevices = phoneDevices.ToList();
        //            var sprintCarrierList = new List<Carrier> {carrierSprint};
        //            IEnumerable<PhoneDevice> phoneDevices1 =
        //                listDevices.Select(device => new PhoneDevice {Name = device, Carriers = sprintCarrierList});
        //            foreach (ProductSubCategory productCat in productSubCategories.Where(pc => pc.Name.Equals("OEM")))
        //            {
        //                productSubCategoryRet = productCat;
        //                break;
        //            }
        //            var product1 = new Product
        //                               {
        //                                   Name =
        //                                       "APPLE IPHONE 3G / IPHONE4 / IPOD TOUCH CYONGEAR PORTABLE CHARGER WITH SOLAR CHARGING PANEL (2400MAH) ",
        //                                   Manufacturer = manufacturerRet,
        //                                   BrandName = brandNameRet,
        //                                   ProductSubCategory = productSubCategoryRet
        //                               };
        //            //product1.AddToPhoneDevices(phoneDevices1);
        //            product1.PhoneDevices = phoneDevices1.ToList();
        //            session.SaveOrUpdate(product1);
        //            //product.AddToPhoneDevices(phoneDevices1);
        //            product.PhoneDevices = phoneDevices1.ToList();
        //            session.SaveOrUpdate(product);
        //            transaction.Commit();
        //        }
        //    }
        //}
    }
}