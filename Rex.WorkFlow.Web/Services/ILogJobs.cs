using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Services
{
    /// <summary>
    /// ILogJobs
    /// </summary>
    /// <remarks>
    /// @创 建 者：Rex
    /// @创建日期：2021/2/24 9:17:20
    /// </remarks>
    public interface ILogJobs
    {
        /// <summary>
        /// 登录日志
        /// </summary>
        /// <returns></returns>
        void LoginLog(long userid, string username);

        /// <summary>
        /// 异常记录
        /// </summary>
        /// <param name="userid">用户ID</param>
        /// <param name="exception">异常</param>
        /// <returns></returns>
        void ExceptionLog(long userid, Exception exception);
    }
}
