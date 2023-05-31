using JadeFramework.Core.Domain.Entities;
using JadeFramework.Dapper;
using Rex.WorkFlow.Web.Models;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Repositories
{
    public interface ISysReleaseLogRepository: IDapperRepository<SysReleaseLog>
    {
        Task<Page<SysReleaseLog>> GetPageAsync(int pageIndex, int pageSize);
    }
}
