using JadeFramework.Core.Domain.Entities;
using JadeFramework.Dapper;
using JadeFramework.Dapper.SqlGenerator;
using Rex.WorkFlow.Web.Repositories;
using Rex.WorkFlow.Web.Models;
using System.Data;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Repositories.Impls
{
    public class SysSystemRepository : DapperRepository<SysSystem>, ISysSystemRepository
    {
        public SysSystemRepository(IDbConnection connection, SqlGeneratorConfig config) : base(connection, config)
        {
        }


        public async Task<Page<SysSystem>> GetPageAsync(int pageIndex, int pageSize)
        {
            Page<SysSystem> page = new Page<SysSystem>()
            {
                PageIndex = pageIndex,
                PageSize = pageSize
            };
            int offset = (pageIndex - 1) * pageSize;
            string sql = $"SELECT * FROM sys_system WHERE isdel=0 order by sort ASC LIMIT @offset,@pageSize";
            page.Items = await this.QueryAsync(sql,new { offset = offset , pageSize = pageSize });
            page.TotalItems = await this.ExecuteScalarAsync<int>($"SELECT COUNT(1) FROM sys_system WHERE isdel=0");
            return page;
        }
    }
}
