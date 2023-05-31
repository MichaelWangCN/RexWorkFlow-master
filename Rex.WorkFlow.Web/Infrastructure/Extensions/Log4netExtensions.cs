using Microsoft.Extensions.Logging;
using System.IO;

namespace Rex.WorkFlow.Web.Infrastructure.Extensions
{
    /// <summary>
    /// Log4netExtensions
    /// </summary>
    /// <remarks>
    /// @创 建 者：Rex
    /// @创建日期：2021/2/24 17:11:49
    /// </remarks>
    public static class Log4netExtensions
    {
        public static ILoggerFactory AddLog4Net(this ILoggerFactory factory, string log4NetConfigFile)
        {
            factory.AddProvider(new Log4NetProvider(log4NetConfigFile));
            return factory;
        }

        public static ILoggerFactory AddLog4Net(this ILoggerFactory factory)
        {
            var configPath = Directory.GetCurrentDirectory() + "\\Config\\log4net.config";//获取当前的项目文件所在的目录
            factory.AddProvider(new Log4NetProvider(configPath));
            return factory;
        }
    }
}
