using System;

namespace Rex.WorkFlow.Web.Repositories
{
    /// <summary>
    /// ISysDatabaseFixture
    /// </summary>
    /// <remarks>
    /// @创 建 者：Rex
    /// @创建日期：2021/2/23 21:13:13
    /// </remarks>
    public interface ISysDatabaseFixture : IDisposable
    {
        ISysDbContext Db { get; }
        ISysLogDbContext LogDb { get; }
    }
}
