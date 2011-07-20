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
        public virtual int TotalPrice { get; set; }

        public virtual void AddItem(CartItem item)
        {
            Items.Add(item);
        }
        public virtual void RemoveItem(string productName)
        {
            Items.Remove(Items.Where(x => x.Product.Name.Equals(productName)).First());
        }

        public virtual void UpdateItemQuantity(string item, int updateToQty)
        {
           Items.Where(x => x.Product.Name.Equals(item)).First().UpdateQty(updateToQty);
        }

        public virtual bool IsItemAlreadyInCart(string itemName)
        {
            if (Items == null)
                Items = new List<CartItem>();
            return Items.Any(x => x.Product.Name.Equals(itemName));
        }

        public bool Equals(Cart other)
        {
            if (ReferenceEquals(null, other)) return false;
            if (ReferenceEquals(this, other)) return true;
            return other.Id == Id && Equals(other.Items, Items) && other.TotalPrice == TotalPrice;
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
                result = (result*397) ^ TotalPrice;
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
