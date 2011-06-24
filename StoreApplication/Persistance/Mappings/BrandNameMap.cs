using Aktel.Domain;
using FluentNHibernate.Mapping;

namespace Persistance.Mappings
{
    public class BrandNameMap : ClassMap<BrandName>
    {
        public BrandNameMap()
        {
            Id(x => x.Id);
            Map(x => x.Name);
            HasMany(x => x.Products)
                .Inverse()
                .Cascade.All();
        }
    }
}
