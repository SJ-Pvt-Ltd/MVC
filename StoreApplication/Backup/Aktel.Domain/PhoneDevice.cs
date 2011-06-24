using System.Collections.Generic;

namespace Aktel.Domain
{
    public class PhoneDevice
    {
        public string Name { get; private set;}
        private List<Product> _products = new List<Product>();
        
        public PhoneDevice(string name)
        {
            Name = name;
        }

        public void AddProduct(Product product)
        {
            _products.Add(product);
        }

        public List<Product> GetAllAssociatedProducts()
        {
            return _products;
        }

    }

}