using Aktel.Domain;
using FluentNHibernate.Mapping;

namespace Persistance.Mappings
{
    public class ProductSubCategoryMap : ClassMap<ProductSubCategory>
    {
        public ProductSubCategoryMap()
        {
            Id(x => x.Id);
            Map(x => x.Name);
            References(x => x.ProductCategory).Cascade.All();
            HasMany(x => x.Products)
                .Inverse()
                .Cascade.SaveUpdate();
        }
    }
}
