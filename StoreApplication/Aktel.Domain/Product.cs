using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Aktel.Domain
{
    public class Product
    {
        public virtual int Id { get; private set; }
        public virtual string Name { get; set; }
        public virtual ProductSubCategory ProductSubCategory { get; set; }
        public virtual BrandName BrandName { get; set; }
        public virtual Manufacturer Manufacturer { get; set; }
        public virtual IList<PhoneDevice> PhoneDevices { get; set; }

        public Product()
        {
            PhoneDevices = new List<PhoneDevice>();
        }

        //public virtual void AddToPhoneDevices(List<PhoneDevice> phoneDevices)
        //{
        //    foreach(var device in phoneDevices)
        //    PhoneDevices.Add(device);
        //}

        public virtual bool Equals(Product other)
        {
            if (ReferenceEquals(null, other)) return false;
            if (ReferenceEquals(this, other)) return true;
            return other.Id == Id && Equals(other.Name, Name) && Equals(other.ProductSubCategory, ProductSubCategory) && Equals(other.BrandName, BrandName) && Equals(other.Manufacturer, Manufacturer) && Equals(other.PhoneDevices, PhoneDevices);
        }

        public override bool Equals(object obj)
        {
            if (ReferenceEquals(null, obj)) return false;
            if (ReferenceEquals(this, obj)) return true;
            if (obj.GetType() != typeof (Product)) return false;
            return Equals((Product) obj);
        }

        public override int GetHashCode()
        {
            unchecked
            {
                int result = Id;
                result = (result*397) ^ (Name != null ? Name.GetHashCode() : 0);
                result = (result*397) ^ (ProductSubCategory != null ? ProductSubCategory.GetHashCode() : 0);
                result = (result*397) ^ (BrandName != null ? BrandName.GetHashCode() : 0);
                result = (result*397) ^ (Manufacturer != null ? Manufacturer.GetHashCode() : 0);
                result = (result*397) ^ (PhoneDevices != null ? PhoneDevices.GetHashCode() : 0);
                return result;
            }
        }
    }
}
