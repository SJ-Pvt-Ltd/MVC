using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Aktel.Domain;
using NHibernate;

namespace Persistance
{
    public class BrandService
    {
        public ISession Session { get; set; }

        public BrandService(ISession session)
        {
            Session = session;
        }

        public List<BrandName> GetBrands()
        {
            return (List<BrandName>)Repo.FindAll<BrandName>(Session);
        }
    }
}
