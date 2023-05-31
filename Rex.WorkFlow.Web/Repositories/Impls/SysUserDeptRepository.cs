using JadeFramework.Dapper;
using JadeFramework.Dapper.SqlGenerator;
using Rex.WorkFlow.Web.Repositories;
using Rex.WorkFlow.Web.Models;
using System.Data;

namespace Rex.WorkFlow.Web.Repositories.Impls
{
    public class SysUserDeptRepository : DapperRepository<SysUserDept>, ISysUserDeptRepository
    {
        public SysUserDeptRepository(IDbConnection connection, SqlGeneratorConfig config) : base(connection, config)
        {
        }
    }
}
