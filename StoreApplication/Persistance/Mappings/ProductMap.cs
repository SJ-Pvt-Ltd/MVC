using Aktel.Domain;
using FluentNHibernate.Mapping;

namespace Persistance.Mappings
{
    public class ProductMap : ClassMap<Product>
    {
        public ProductMap()
        {
            Id(x => x.Id, "ProductId");
            Map(x => x.Name);
            References(x => x.ProductSubCategory).Cascade.All();
            References(x => x.BrandName).Cascade.All();
            References(x => x.Manufacturer).Cascade.All();
            HasManyToMany(x => x.PhoneDevices)
                .Cascade.All()
                .Inverse()
                .Table("DeviceProduct")
                .ParentKeyColumn("ProductId")
                .ChildKeyColumn("PhoneDeviceId"); 
    
        }
    }
}
