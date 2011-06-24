namespace Aktel.Domain
{
    public class ProductCategory
    {
        private readonly string _name;

        public ProductCategory(string name)
        {
            _name = name;
        }

        public string Name
        {
            get { return _name; }
        }
    }
}