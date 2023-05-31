using JadeFramework.Core.Domain.Entities;
using Rex.WorkFlow.Web.Models;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Services
{
    /// <summary>
    /// 发布日志服务
    /// </summary>
    /// <remarks>
    /// @创 建 者：Rex
    /// @创建日期：2021/3/4 20:23:11
    /// </remarks>
    public interface ISysReleaseLogService
    {
        /// <summary>
        /// 发布日志分页获取
        /// </summary>
        /// <param name="pageIndex">当前页</param>
        /// <param name="pageSize">每页大小</param>
        /// <returns></returns>
        Task<Page<SysReleaseLog>> GetPageAsync(int pageIndex, int pageSize);
    }
}
