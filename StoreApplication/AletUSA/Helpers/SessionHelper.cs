using FluentNHibernate.Cfg;
using FluentNHibernate.Cfg.Db;
using FluentNHibernate.Conventions.Helpers;
using NHibernate;
using NHibernate.Tool.hbm2ddl;
using Persistance.Mappings;

namespace Aktel.Mvc.Helpers
{
    public class SessionHelper
    {
        public static ISessionFactory CreateSessionFactory()
        {
            var connectionString = "Data Source=twisterwireless.com;Initial Catalog=Aktel_Dev1;user id=twisterwireles_web;pwd=twister";
            //Properties.Settings.Default.dataSource;
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
            var connectionString = "Data Source=twisterwireless.com;Initial Catalog=Aktel_Dev1;user id=twisterwireles_web;pwd=twister";
            //var connectionString = Properties.Settings.Default.dataSource;
            return Fluently
                .Configure()
                .Database(MsSqlConfiguration.MsSql2005.ConnectionString(connectionString))
                .Mappings(x => x.FluentMappings.AddFromAssemblyOf<ProductMap>().Conventions.Add(DefaultLazy.Never()))
                .ExposeConfiguration(x => x.SetProperty("current_session_context_class", "thread_static"))
                .BuildSessionFactory();
        }
    }
}
