using System.Collections.Generic;
using Iesi.Collections.Generic;

namespace Aktel.Domain
{
    public class PhoneDevice
    {
        public virtual int Id { get; private set; }
        public virtual string Name { get; set;}
        public virtual IList<Carrier> Carriers { get; set; }
        public virtual IList<Product> Products { get; set; }

        public PhoneDevice()
        {
            Carriers = new List<Carrier>();
            Products = new List<Product>();
        }
        
        //public virtual PhoneDevice AddToCarriers(List<Carrier> carriers)
        //{
        //    foreach (var carrier in carriers)
        //    {
        //        Carriers.Add(carrier);
        //    }
        //    return this;
        //}


        public virtual bool Equals(PhoneDevice other)
        {
            if (ReferenceEquals(null, other)) return false;
            if (ReferenceEquals(this, other)) return true;
            return other.Id == Id && Equals(other.Name, Name);
        }

        public override bool Equals(object obj)
        {
            if (ReferenceEquals(null, obj)) return false;
            if (ReferenceEquals(this, obj)) return true;
            if (obj.GetType() != typeof (PhoneDevice)) return false;
            return Equals((PhoneDevice) obj);
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