using JadeFramework.Core.Extensions;
using JadeFramework.Dapper;
using JadeFramework.Dapper.SqlGenerator;
using Rex.WorkFlow.Web.Repositories;
using Rex.WorkFlow.Web.Models;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Repositories.Impls
{
    public class SysRoleResourceRepository : DapperRepository<SysRoleResource>, ISysRoleResourceRepository
    {
        public SysRoleResourceRepository(IDbConnection connection, SqlGeneratorConfig config) : base(connection, config)
        {
        }

        public async Task<IEnumerable<SysRoleResource>> GetListByRoleIdAsync(IEnumerable<long> roleids)
        {
            string sql = $"SELECT * FROM sys_role_resource WHERE roleid IN({roleids.Join()})";
            return await this.QueryAsync(sql);
        }
    }
}
