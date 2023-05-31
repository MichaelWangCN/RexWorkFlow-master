using JadeFramework.Core.Domain.Entities;
using JadeFramework.Core.Domain.Enum;
using Rex.WorkFlow.Web.Dtos;
using Rex.WorkFlow.Web.Models;
using Rex.WorkFlow.Web.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Services.Impls
{
    /// <summary>
    /// SysLogService
    /// </summary>
    /// <remarks>
    /// @创 建 者：Rex
    /// @创建日期：2021/3/4 20:22:31
    /// </remarks>
    public class SysLogService : ISysLogService
    {
        private ISysDatabaseFixture _databaseFixture;
        private ILogJobs _logJobs;
        public SysLogService(ISysDatabaseFixture databaseFixture, ILogJobs logJobs)
        {
            _databaseFixture = databaseFixture;
            _logJobs = logJobs;
        }

        public async Task<Page<SysLog>> GetPageAsync(LogSearchDto model)
        {
            return await _databaseFixture.LogDb.SysLog.GetPageAsync(model);
        }
        public async Task<Dictionary<object, object>> GetChartsAsync(LogLevel level)
        {
            var list = await _databaseFixture.LogDb.SysLog.GetChartsAsync(level);
            return list;
        }

        public async Task<HeartBeatData> GetLasterDataAsync(int recentMinutes, Application application)
        {
            return await _databaseFixture.LogDb.SysLog.GetLasterDataAsync(recentMinutes, application);
        }

    }
}
