using JadeFramework.Core.Mvc;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace Rex.WorkFlow.Web.Controllers
{
    [Authorize]
    public class HomeController : BaseController
    {
        private readonly ILogger _logger;

        public HomeController(ILoggerFactory loggerFactory)
        {
            _logger = loggerFactory.CreateLogger<HomeController>();
        }

        /// <summary>
        /// 后台主页
        /// </summary>
        /// <returns></returns>
        public IActionResult Index()
        {
            //_logger.LogInformation($"进入后台主页：{ DateTime.Now.ToString("yyyy-MM-dd HH:mm") }");
            return View();
        }

        /// <summary>
        /// 首页
        /// </summary>
        /// <returns></returns>
        public IActionResult Default()
        {
            return View();
        }

    }
}
