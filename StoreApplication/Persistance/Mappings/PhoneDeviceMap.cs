using Aktel.Domain;
using FluentNHibernate.Mapping;

namespace Persistance.Mappings
{
    public class PhoneDeviceMap : ClassMap<PhoneDevice>
    {
        public PhoneDeviceMap()
        {
            Id(x => x.Id, "PhoneDeviceId");
            Map(x => x.Name);
            HasManyToMany(x => x.Carriers)
                .Inverse()
                .Cascade.SaveUpdate()
                .Table("DeviceCarrier")
                .ParentKeyColumn("PhoneDeviceId")
                .ChildKeyColumn("CarrierId");
            HasManyToMany(x => x.Products)
                //.Inverse()
                .Cascade.SaveUpdate()
                .Table("DeviceProduct")
                .ParentKeyColumn("PhoneDeviceId")
                .ChildKeyColumn("ProductId");
        }
    }
}
