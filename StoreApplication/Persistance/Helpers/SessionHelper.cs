using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using FluentNHibernate.Cfg;
using FluentNHibernate.Cfg.Db;
using FluentNHibernate.Conventions.Helpers;
using NHibernate;
using NHibernate.Tool.hbm2ddl;
using Persistance.Mappings;

namespace Persistance
{
    public class SessionHelper
    {
        public static ISessionFactory CreateSessionFactory()
        {
            var connectionString = Properties.Settings.Default.dataSource;
            return Fluently
                .Configure()
                .Database(MsSqlConfiguration.MsSql2005.ConnectionString(connectionString))
                .Mappings(x => x.FluentMappings.AddFromAssemblyOf<ProductMap>())
                .ExposeConfiguration(cfg => new SchemaExport(cfg)
                                                .Create(false, true))
                .ExposeConfiguration(x => x.SetProperty("current_session_context_class", "thread_static"))
                .BuildSessionFactory();
        }

        public static ISessionFactory OpenSessionFactory()
        {
            var connectionString = Properties.Settings.Default.dataSource;
            return Fluently
                .Configure()
                .Database(MsSqlConfiguration.MsSql2005.ConnectionString(connectionString))
                .Mappings(x => x.FluentMappings.AddFromAssemblyOf<ProductMap>().Conventions.Add(DefaultLazy.Never()))
                .ExposeConfiguration(x => x.SetProperty("current_session_context_class", "thread_static"))
                .BuildSessionFactory();
        }
    }
}
