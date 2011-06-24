using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Aktel.Domain;
using NHibernate;

namespace Persistance
{
    public class ManufacturerService
    {
        public ISession Session { get; set; }

        public ManufacturerService(ISession session)
        {
            Session = session;
        }

        public List<Manufacturer> GetManufacturers()
        {
            return (List<Manufacturer>)Repo.FindAll<Manufacturer>(Session);
        }
    }
}
