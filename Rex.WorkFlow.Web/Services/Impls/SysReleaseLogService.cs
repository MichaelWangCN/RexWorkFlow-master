using JadeFramework.Core.Domain.Entities;
using Rex.WorkFlow.Web.Models;
using Rex.WorkFlow.Web.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Services.Impls
{
    /// <summary>
    /// 发布日志服务
    /// </summary>
    /// <remarks>
    /// @创 建 者：Rex
    /// @创建日期：2021/3/4 20:24:08
    /// </remarks>
    public class SysReleaseLogService : ISysReleaseLogService
    {
        private ISysDatabaseFixture _databaseFixture;
        private ILogJobs _logJobs;
        public SysReleaseLogService(ISysDatabaseFixture databaseFixture, ILogJobs logJobs)
        {
            _databaseFixture = databaseFixture;
            _logJobs = logJobs;
        }

        /// <summary>
        /// 发布日志分页获取
        /// </summary>
        /// <param name="pageIndex">当前页</param>
        /// <param name="pageSize">每页大小</param>
        /// <returns></returns>
        public async Task<Page<SysReleaseLog>> GetPageAsync(int pageIndex, int pageSize)
        {
            return await _databaseFixture.Db.SysReleaseLog.GetPageAsync(pageIndex, pageSize);
        }


    }
}
