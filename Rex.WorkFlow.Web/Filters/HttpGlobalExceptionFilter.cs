using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Logging;

namespace Rex.WorkFlow.Web.Filters
{
    /// <summary>
    /// 全局异常过滤
    /// </summary>
    /// <remarks>
    /// @创 建 者：Rex
    /// @创建日期：2021/2/23 19:33:28
    /// </remarks>
    public class HttpGlobalExceptionFilter : IExceptionFilter
    {
        private readonly ILogger _logger;
        public HttpGlobalExceptionFilter(ILoggerFactory loggerFactory)
        {
            _logger = loggerFactory.CreateLogger<HttpGlobalExceptionFilter>();
        }

        public void OnException(ExceptionContext context)
        {
            if (!context.ExceptionHandled)
            {
                var excep = context.Exception;
                var controllerName = context.RouteData.Values["controller"];
                var actionName = context.RouteData.Values["action"];
                string errorMsg = $"在请求controller[{controllerName}] 的 action[{actionName}] 时产生异常[{excep.Message}]";

                _logger.LogError(errorMsg);
                context.ExceptionHandled = true;//Tag it is handled.
            }
        }
    }
}
