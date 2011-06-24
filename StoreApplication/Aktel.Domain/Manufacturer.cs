using System.Collections.Generic;

namespace Aktel.Domain
{
    public class Manufacturer
    {
        public virtual int Id { get; private set; }
        public virtual string Name { get; set; }
        public virtual IList<Product> Products { get; private set; }

        public Manufacturer()
        {
            Products = new List<Product>();
        }

        public virtual void AddToProducts(List<Product> products)
        {
            Products = products;
        }

        public virtual bool Equals(Manufacturer other)
        {
            if (ReferenceEquals(null, other)) return false;
            if (ReferenceEquals(this, other)) return true;
            return other.Id == Id && Equals(other.Name, Name);
        }

        public override bool Equals(object obj)
        {
            if (ReferenceEquals(null, obj)) return false;
            if (ReferenceEquals(this, obj)) return true;
            if (obj.GetType() != typeof (Manufacturer)) return false;
            return Equals((Manufacturer) obj);
        }

        public override int GetHashCode()
        {
            unchecked
            {
                return (Id*397) ^ (Name != null ? Name.GetHashCode() : 0);
            }
        }

        public static bool operator ==(Manufacturer left, Manufacturer right)
        {
            return Equals(left, right);
        }

        public static bool operator !=(Manufacturer left, Manufacturer right)
        {
            return !Equals(left, right);
        }
    }
}
