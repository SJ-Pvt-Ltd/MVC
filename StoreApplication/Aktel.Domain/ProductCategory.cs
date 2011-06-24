using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Aktel.Domain
{
    public class ProductCategory
    {
        public virtual int Id { get; private set; }
        public virtual string Name { get; set; }
        public virtual IList<ProductSubCategory> SubCategories { get; set; }

        public ProductCategory()
        {
            SubCategories = new List<ProductSubCategory>();
        }

        public virtual bool Equals(ProductCategory other)
        {
            if (ReferenceEquals(null, other)) return false;
            if (ReferenceEquals(this, other)) return true;
            return other.Id == Id && Equals(other.Name, Name);
        }

        public override bool Equals(object obj)
        {
            if (ReferenceEquals(null, obj)) return false;
            if (ReferenceEquals(this, obj)) return true;
            if (obj.GetType() != typeof (ProductCategory)) return false;
            return Equals((ProductCategory) obj);
        }

        public override int GetHashCode()
        {
            unchecked
            {
                return (Id*397) ^ (Name != null ? Name.GetHashCode() : 0);
            }
        }
    }
}
