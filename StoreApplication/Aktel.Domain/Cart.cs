using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Aktel.Domain
{
    public class Cart
    {
        public virtual int Id { get; private set; }
        public virtual List<CartItem> Items { get; set; }
        public virtual double GetTotalPrice() 
        { 
            if(Items.Count > 0)
            {
                var total = 0d;
                Items.ForEach(x => total += x.Subtotal);
                return total;
            }
            return 0;
        }

        public virtual void AddItem(CartItem item)
        {
            Items.Add(item);
        }
        public virtual void RemoveItem(int Id)
        {
            Items.Remove(Items.Where(x => x.Product.Id.Equals(Id)).First());
        }

        public virtual void UpdateItemQuantity(int item, int updateToQty)
        {
           Items.Where(x => x.Product.Id.Equals(item)).First().UpdateQty(updateToQty);
        }

        public virtual bool IsItemAlreadyInCart(int id)
        {
            if (Items == null)
                Items = new List<CartItem>();
            return Items.Any(x => x.Product.Id.Equals(id));
        }

        public bool Equals(Cart other)
        {
            if (ReferenceEquals(null, other)) return false;
            if (ReferenceEquals(this, other)) return true;
            return other.Id == Id && Equals(other.Items, Items) && other.GetTotalPrice() == GetTotalPrice();
        }

        public override bool Equals(object obj)
        {
            if (ReferenceEquals(null, obj)) return false;
            if (ReferenceEquals(this, obj)) return true;
            if (obj.GetType() != typeof (Cart)) return false;
            return Equals((Cart) obj);
        }

        public override int GetHashCode()
        {
            unchecked
            {
                int result = Id;
                result = (result*397) ^ (Items != null ? Items.GetHashCode() : 0);
                return result;
            }
        }
    }

    public class CartItem
    {
        public virtual int Id { get; private set; }
        public virtual Product Product { get; set; }
        public virtual int Qty { get; set; }
        public virtual double Subtotal { get; set; }

        public virtual void UpdateQty(int updateToQty)
        {
            Qty = updateToQty;
        }

        public bool Equals(CartItem other)
        {
            if (ReferenceEquals(null, other)) return false;
            if (ReferenceEquals(this, other)) return true;
            return other.Id == Id && Equals(other.Product, Product) && other.Qty == Qty;
        }

        public override bool Equals(object obj)
        {
            if (ReferenceEquals(null, obj)) return false;
            if (ReferenceEquals(this, obj)) return true;
            if (obj.GetType() != typeof (CartItem)) return false;
            return Equals((CartItem) obj);
        }

        public override int GetHashCode()
        {
            unchecked
            {
                int result = Id;
                result = (result*397) ^ (Product != null ? Product.GetHashCode() : 0);
                result = (result*397) ^ Qty;
                return result;
            }
        }
    }
}
