using JadeFramework.Dapper;
using Rex.WorkFlow.Web.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Repositories
{
    public interface ISysRoleResourceRepository : IDapperRepository<SysRoleResource>
    {
        Task<IEnumerable<SysRoleResource>> GetListByRoleIdAsync(IEnumerable<long> roleids);
    }
}
