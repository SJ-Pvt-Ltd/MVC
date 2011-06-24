using Aktel.Domain;
using FluentNHibernate.Mapping;

namespace Persistance.Mappings
{
    public class ProductCategoryMap : ClassMap<ProductCategory>
    {
        public ProductCategoryMap()
        {
            Id(x => x.Id);
            Map(x => x.Name);
            HasMany(x => x.SubCategories)
                .Inverse()
                .Cascade.All();
        }
    }
}