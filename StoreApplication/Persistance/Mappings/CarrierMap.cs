using Aktel.Domain;
using FluentNHibernate.Mapping;

namespace Persistance.Mappings
{
    public class CarrierMap : ClassMap<Carrier>
    {
        public CarrierMap()
        {
            Id(x => x.Id, "CarrierId");
            Map(x => x.Name);
            HasManyToMany(x => x.PhoneDevices)
                .Inverse()
                .Cascade.All()
                .Table("DeviceCarrier")
                .ParentKeyColumn("CarrierId")
                .ChildKeyColumn("PhoneDeviceId");
        }
    }
}
