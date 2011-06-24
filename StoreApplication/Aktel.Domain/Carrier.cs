using System.Collections.Generic;
using Iesi.Collections.Generic;

namespace Aktel.Domain
{
    public class Carrier
    {
        public virtual int Id { get; private set; }
        public virtual string Name { get; set; }
        public virtual IList<PhoneDevice> PhoneDevices { get; set; }

        public Carrier()
        {
            PhoneDevices = new List<PhoneDevice>();
        }

        public virtual bool Equals(Carrier other)
        {
            if (ReferenceEquals(null, other)) return false;
            if (ReferenceEquals(this, other)) return true;
            return other.Id == Id && Equals(other.Name, Name);
        }

        public override bool Equals(object obj)
        {
            if (ReferenceEquals(null, obj)) return false;
            if (ReferenceEquals(this, obj)) return true;
            if (obj.GetType() != typeof (Carrier)) return false;
            return Equals((Carrier) obj);
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