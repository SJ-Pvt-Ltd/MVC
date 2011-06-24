using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Aktel.Domain
{
    public class Product
    {
        public int ID { get; set; }
        public int Id { get; private set; }
        public string Name { get; private set; }
        public ProductCategory ProductCategory { get; private set; }
        public BrandName BrandNames { get; private set; }
        public Manufacturer Manufactuers { get; private set; }
        public PhoneDevice AssociatedDevices { get; private set; }

        public Product(int id, string name, ProductCategory productCategory)
        {
            ID = id;
            Name = name;
            ProductCategory = productCategory;
        }
    }
}
