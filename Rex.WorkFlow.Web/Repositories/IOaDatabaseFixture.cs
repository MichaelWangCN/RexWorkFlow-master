using System;

namespace Rex.WorkFlow.Web.Repositories
{

    public interface IOaDatabaseFixture : IDisposable
    {
        IOaDbContext Db { get; }
    }
}
