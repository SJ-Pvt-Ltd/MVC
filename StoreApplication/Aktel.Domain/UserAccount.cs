using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Aktel.Domain
{
    class UserAccount
    {
        public UserAccount()
        {
            Cart = new Cart();
        }

        public virtual int Id { get; private set;}
        public virtual string UserName { get; private set; }
        public virtual string Password { get; private set; }
        public virtual Cart Cart { get; set; }
        public virtual List<Order> Orders { get; set; }
        
        public bool Equals(UserAccount other)
        {
            if (ReferenceEquals(null, other)) return false;
            if (ReferenceEquals(this, other)) return true;
            return other.Id == Id && Equals(other.UserName, UserName) && Equals(other.Password, Password);
        }

        public override bool Equals(object obj)
        {
            if (ReferenceEquals(null, obj)) return false;
            if (ReferenceEquals(this, obj)) return true;
            if (obj.GetType() != typeof (UserAccount)) return false;
            return Equals((UserAccount) obj);
        }

        public override int GetHashCode()
        {
            unchecked
            {
                int result = Id;
                result = (result*397) ^ (UserName != null ? UserName.GetHashCode() : 0);
                result = (result*397) ^ (Password != null ? Password.GetHashCode() : 0);
                return result;
            }
        }

        public static bool operator ==(UserAccount left, UserAccount right)
        {
            return Equals(left, right);
        }

        public static bool operator !=(UserAccount left, UserAccount right)
        {
            return !Equals(left, right);
        }
    }
}
