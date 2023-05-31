using JadeFramework.Core.Domain.Entities;
using JadeFramework.Core.Domain.Enum;
using JadeFramework.Dapper;
using Rex.WorkFlow.Web.Models;
using Rex.WorkFlow.Web.Dtos;
using Rex.WorkFlow.Web.Dtos;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Repositories
{
    public interface ISysLogRepository : IDapperRepository<SysLog>
    {
        Task<Page<SysLog>> GetPageAsync(LogSearchDto model);
        /// <summary>
        /// 根据日志级别获取日志统计信息
        /// </summary>
        /// <param name="level"></param>
        /// <returns></returns>
        Task<Dictionary<object, object>> GetChartsAsync(LogLevel level);

        Task<HeartBeatData> GetLasterDataAsync(int recentMinutes, Application application);
    }
}
