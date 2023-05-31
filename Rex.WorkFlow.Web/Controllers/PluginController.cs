using JadeFramework.Core.Extensions;
using JadeFramework.Core.Mvc;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Rex.WorkFlow.Web.Dtos;
using Rex.WorkFlow.Web.Models;
using Rex.WorkFlow.Web.Services;
using System;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Controllers
{
    /// <summary>
    /// 插件
    /// </summary>
    [Area("Sys")]
    public class PluginController : BaseController
    {
        private readonly ILogger _logger;
        private readonly ISysUserService _userService;

        public PluginController(ILoggerFactory loggerFactory, ISysUserService userService)
        {
            _logger = loggerFactory.CreateLogger<UserController>();
            _userService = userService;
        }

        /// <summary>
        /// 用户(添加)页面
        /// </summary>
        /// <returns></returns>
        public IActionResult User()
        {
            ViewBag.More = Request.Query["more"].Count > 0 ? Convert.ToInt32(Request.Query["more"]) : 1;
            return View();
        }

        /// <summary>
        /// 查询用户信息
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> FindUserInfo([FromQuery] UserIndexSearch search)
        {
            DataResult dataResult = new DataResult();
            try
            {
                if (search.PageIndex.IsDefault())
                {
                    search.PageIndex = 1;
                }
                if (search.PageSize.IsDefault())
                {
                    search.PageSize = 10;
                }
                UserIndexViewModel result = await _userService.GetUserPageAsync(search);
                dataResult.count = result.Users.TotalItems;
                dataResult.data = result.Users.Items;
                dataResult.msg = "查询用户信息成功！";
            }
            catch (Exception ex)
            {
                dataResult.code = StateCode.Error;
                dataResult.msg = ex.Message;
                _logger.LogError(ex.Message);
            }
            return Ok(dataResult);
        }
    }
}
