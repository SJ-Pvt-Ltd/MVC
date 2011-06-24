using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Aktel.Domain;
using NHibernate;

namespace Persistance
{
    public class CarrierService
    {
        public ISession Session { get; set; }

        public CarrierService(ISession session)
        {
            Session = session;
        }

        public List<Carrier> GetCarriers()
        {
            return (List<Carrier>)Repo.FindAll<Carrier>(Session);
        }

        public List<PhoneDevice> GetPhoneDevicesByCarrierNameService(string carrierName)
        {
            return (List<PhoneDevice>)Repo.PhoneDevicesByCarrierNameRepository(carrierName, Session).GroupBy(x => x.Name).Select(x => x.First()).ToList();
        }
    }
}
