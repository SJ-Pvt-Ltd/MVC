using System.Collections.Generic;

namespace Aktel.Domain
{
    public class ProductSubCategory
    {
        public virtual int Id { get; private set; }
        public virtual string Name { get; set; }
        public virtual ProductCategory ProductCategory {get; set;}
        public virtual IList<Product> Products { get; private set; }

        public ProductSubCategory()
        {
            Products = new List<Product>();
        }

        public virtual bool Equals(ProductSubCategory other)
        {
            if (ReferenceEquals(null, other)) return false;
            if (ReferenceEquals(this, other)) return true;
            return other.Id == Id && Equals(other.Name, Name);
        }

        public override bool Equals(object obj)
        {
            if (ReferenceEquals(null, obj)) return false;
            if (ReferenceEquals(this, obj)) return true;
            if (obj.GetType() != typeof (ProductSubCategory)) return false;
            return Equals((ProductSubCategory) obj);
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