using JadeFramework.Core.Domain.Entities;
using JadeFramework.Core.Domain.Enum;
using Rex.WorkFlow.Web.Dtos;
using Rex.WorkFlow.Web.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Services
{
    /// <summary>
    /// ISysLogService
    /// </summary>
    /// <remarks>
    /// @创 建 者：Rex
    /// @创建日期：2021/3/4 20:21:49
    /// </remarks>
    public interface ISysLogService
    {
        Task<Page<SysLog>> GetPageAsync(LogSearchDto model);
        Task<Dictionary<object, object>> GetChartsAsync(LogLevel level);
        Task<HeartBeatData> GetLasterDataAsync(int recentMinutes, Application application);
    }
}
