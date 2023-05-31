using System;

namespace Rex.WorkFlow.Web.Repositories
{
    public interface IWFDatabaseFixture: IDisposable
    {
        IWFDbContext Db { get; }
    }
}
