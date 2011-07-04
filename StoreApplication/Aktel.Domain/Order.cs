using System.Collections.Generic;

namespace Aktel.Domain
{
    public class Order
    {
        public virtual int Id { get; private set; }
        public virtual IList<OrderLine> OrderLine { get; set; }
        public virtual int TotalPrice { get; set; }
        public virtual string ShippingAddress { get; set; }
    }

    public class OrderLine
    {
        public virtual int Id { get; private set; }
        public virtual Product Product { get; set; }
        public virtual int Qty { get; set; }
    }
}