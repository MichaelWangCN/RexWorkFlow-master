using JadeFramework.Core.Domain.Entities;
using JadeFramework.Core.Extensions;
using JadeFramework.Core.Mvc;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Rex.WorkFlow.Web.Dtos;
using Rex.WorkFlow.Web.Models;
using Rex.WorkFlow.Web.Services;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Controllers
{
    /// <summary>
    /// 系统
    /// </summary>
    [Area("Sys")]
    public class SystemController : BaseController
    {
        private readonly ILogger _logger;
        private readonly ISysSystemService _systemService;
        public SystemController(ILoggerFactory loggerFactory, ISysSystemService systemService)
        {
            _logger = loggerFactory.CreateLogger<SystemController>();
            _systemService = systemService;
        }

        #region 页面
        /// <summary>
        /// 系统管理页
        /// </summary>
        /// <returns></returns>
        public IActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// 操作(新增|修改)
        /// </summary>
        /// <param name="id">系统ID</param>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> Operation([FromQuery] long id)
        {
            if (id > 0)
            {
                SysSystem sysSystem = await _systemService.GetByIdAsync(id);
                return View(sysSystem);
            }
            return View(new SysSystem());
        }

        /// <summary>
        /// 查看详情
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> Details([FromQuery] long id)
        {
            if (id > 0)
            {
                SysSystem sysSystem = await _systemService.GetByIdAsync(id);
                return View(sysSystem);
            }
            return View(new SysSystem());
        }
        #endregion

        #region 新增系统信息
        /// <summary>
        /// 新增
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        [ActionName("Add")]
        public async Task<IActionResult> Add(SysSystem system)
        {
            DataResult dataResult = new DataResult();
            try
            {
                system.CreateUserId = UserIdentity.UserId;
                bool result = await _systemService.InsertAsync(system);
                dataResult.code = result ? StateCode.Succees : StateCode.Failed;
                dataResult.msg = "新增系统信息成功！";
            }
            catch (Exception ex)
            {
                dataResult.code = StateCode.Error;
                dataResult.msg = "新增系统信息失败！";
                _logger.LogError(ex.Message);
            }
            return Ok(dataResult);
        }
        #endregion

        #region 编辑系统信息
        /// <summary>
        /// 编辑
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        [HttpPost]
        [ActionName("Update")]
        public async Task<IActionResult> Update(SysSystem system)
        {
            DataResult dataResult = new DataResult();
            try
            {
                system.UpdateUserId = UserIdentity.UserId;
                bool result = await _systemService.UpdateAsync(system);
                dataResult.code = result ? StateCode.Succees : StateCode.Failed;
                dataResult.msg = "编辑系统信息成功！";
            }
            catch (Exception ex)
            {
                dataResult.code = StateCode.Error;
                dataResult.msg = "编辑系统信息失败！";
                _logger.LogError(ex.Message);
            }
            return Ok(dataResult);
        }
        #endregion

        #region 删除系统信息
        /// <summary>
        /// 逻辑删除
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        [HttpPost]
        [ActionName("Delete")]
        public async Task<IActionResult> Delete([FromBody] List<long> ids)
        {
            DataResult dataResult = new DataResult();
            try
            {
                long userid = UserIdentity.UserId;
                bool result = await _systemService.DeleteAsync(ids, userid);
                dataResult.code = result ? StateCode.Succees : StateCode.Failed;
                dataResult.msg = "删除系统信息成功！";
            }
            catch (Exception ex)
            {
                dataResult.code = StateCode.Error;
                dataResult.msg = "删除系统信息失败！";
                _logger.LogError(ex.Message);
            }
            return Ok(dataResult);

        }
        #endregion

        #region 分页查询系统信息
        /// <summary>
        /// 分页查询系统信息
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> FindSystemPage([FromQuery] SystemIndexSearch search)
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
                Page<SysSystem> result = await _systemService.GetPageAsync(search.PageIndex, search.PageSize);

                dataResult.count = result.TotalItems;
                dataResult.data = result.Items;
                dataResult.msg = "查询分页成功！";
            }
            catch (Exception ex)
            {
                dataResult.code = StateCode.Error;
                dataResult.msg = ex.Message;
                _logger.LogError(ex.Message);
            }
            return Ok(dataResult);
        }
        #endregion

    }
}
