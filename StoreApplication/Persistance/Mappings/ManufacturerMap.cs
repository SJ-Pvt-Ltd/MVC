using Aktel.Domain;
using FluentNHibernate.Mapping;

namespace Persistance.Mappings
{
    public class ManufacturerMap : ClassMap<Manufacturer>
    {
        public ManufacturerMap()
        {
            Id(x => x.Id);
            Map(x => x.Name);
            HasMany(x => x.Products)
                .Inverse()
                .Cascade.All();
        }
    }
}
