using System.Collections.Generic;

namespace Aktel.Domain
{
    public class BrandName
    {
        public virtual int Id { get; private set; }
        public virtual string Name { get; set; }
        public virtual IList<Product> Products { get; private set; }

        public BrandName()
        {
            Products = new List<Product>();
        }
    }
}