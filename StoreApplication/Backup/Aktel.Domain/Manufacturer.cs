using System.Collections.Generic;

namespace Aktel.Domain
{
    public class Manufacturer
    {
        public int Id { get; private set; }
        public string Name { get; private set; }
        private List<Product> _products = new List<Product>();

        public Manufacturer(string name)
        {
            Name = name;
        }
        
        public void AddToProducts(Product product)
        {
            _products.Add(product);
        }

        public List<Product> GetAllAssociatedProducts()
        {
            return _products;
        }
    }
}
