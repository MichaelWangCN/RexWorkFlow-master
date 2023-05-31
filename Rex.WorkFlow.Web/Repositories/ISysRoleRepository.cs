using JadeFramework.Core.Domain.Entities;
using JadeFramework.Dapper;
using Rex.WorkFlow.Web.Models;
using Rex.WorkFlow.Web.Dtos;
using Rex.WorkFlow.Web.Dtos;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Repositories
{
    public interface ISysRoleRepository : IDapperRepository<SysRole>
    {
        Task<List<SysRole>> GetListAsync(IEnumerable<long> roleids);
        Task<Page<SysRole>> GetPageAsync(RoleIndexSearch search);

        /// <summary>
        /// 根据用户ID获取该用户的角色
        /// </summary>
        /// <param name="userid">用户ID</param>
        /// <returns></returns>
        Task<IEnumerable<SysRole>> GetByUserIdAsync(long userid);
    }
}
