using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Aktel.Domain
{
    public class Cart
    {
        public virtual int Id { get; private set; }
        public virtual IList<CartItem> Items { get; set; }
        public virtual int TotalPrice { get; set; }

        public virtual void AddItem(CartItem item)
        {
            Items.Add(item);
        }
        public virtual void RemoveItem(CartItem item)
        {
            Items.Add(item);
        }

        public virtual void UpdateItemQuantity(CartItem item, int updateToQty)
        {
           Items.Where(x => x.Equals(item)).First().UpdateQty(updateToQty);
        }
    }

    public class CartItem
    {
        public virtual int Id { get; private set; }
        public virtual Product Product { get; set; }
        public virtual int Qty { get; set; }
        public virtual int Subtotal { get; set; }

        public virtual void UpdateQty(int updateToQty)
        {
            Qty = updateToQty;
        }
    }
}
