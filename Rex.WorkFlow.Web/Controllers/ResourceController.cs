using JadeFramework.Core.Domain.Container;
using JadeFramework.Core.Domain.Entities;
using JadeFramework.Core.Mvc;
using JadeFramework.Core.Mvc.Extensions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Rex.WorkFlow.Web.Dtos;
using Rex.WorkFlow.Web.Models;
using Rex.WorkFlow.Web.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Controllers
{
    /// <summary>
    /// 资源
    /// </summary>
    [Area("Sys")]
    public class ResourceController : BaseController
    {
        private readonly ILogger _logger;
        private readonly IPermissionStorageContainer _permissionStorage;
        private readonly ISysResourceService _resourceService;
        public ResourceController(ILoggerFactory loggerFactory, ISysResourceService resourceService, IPermissionStorageContainer permissionStorage)
        {
            _logger = loggerFactory.CreateLogger<ResourceController>();
            _resourceService = resourceService;
            _permissionStorage = permissionStorage;
        }

        #region 页面
        /// <summary>
        /// 菜单管理
        /// </summary>
        /// <returns></returns>
        public async Task<IActionResult> Index([FromQuery] long systemId)
        {
            IList<SelectListItem> sli = await _resourceService.GetSystemItems(systemId);
            return View(sli);
        }

        /// <summary>
        /// 操作(新增|修改)
        /// </summary>
        /// <param name="id">用户ID</param>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> Operation([FromQuery] long id, [FromQuery] long systemId)
        {
            ViewBag.SystemId = systemId;
            ResourceShowViewModel resourceShowViewModel = await _resourceService.GetResourceAsync(id, systemId);
            return View(resourceShowViewModel);
        }

        /// <summary>
        /// 菜单管理
        /// </summary>
        /// <returns></returns>
        public IActionResult SelectParentMenu()
        {
            return View();
        }
        #endregion

        #region CRUD
        /// <summary>
        /// 新增
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        [ActionName("Add")]
        public async Task<IActionResult> Add(ResourceShowDto dto)
        {
            DataResult dataResult = new DataResult();
            try
            {
                dto.SysResource.CreateUserId = UserIdentity.UserId;
                bool result = await _resourceService.AddAsync(dto);
                dataResult.code = result ? StateCode.Succees : StateCode.Failed;
                dataResult.msg = result ? "新增菜单成功！" : "新增菜单失败！";
            }
            catch (Exception ex)
            {
                dataResult.code = StateCode.Error;
                dataResult.msg = ex.Message;
                _logger.LogError(ex.Message);
            }
            return Ok(dataResult);
        }

        /// <summary>
        /// 编辑
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        [ActionName("Update")]
        public async Task<IActionResult> Edit(ResourceShowDto dto)
        {
            DataResult dataResult = new DataResult();
            try
            {
                dto.SysResource.CreateUserId = UserIdentity.UserId;
                bool result = await _resourceService.UpdateAsync(dto);
                dataResult.code = result ? StateCode.Succees : StateCode.Failed;
                dataResult.msg = result ? "编辑菜单成功！" : "编辑菜单失败！";
            }
            catch (Exception ex)
            {
                dataResult.code = StateCode.Error;
                dataResult.msg = ex.Message;
                _logger.LogError(ex.Message);
            }
            return Ok(dataResult);
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        [HttpPost]
        [ActionName("Delete")]
        public async Task<IActionResult> Delete([FromBody] long[] ids)
        {
            DataResult dataResult = new DataResult();
            try
            {
                long userid = UserIdentity.UserId;
                bool result = await _resourceService.DeleteAsync(ids, userid);
                dataResult.code = result ? StateCode.Succees : StateCode.Failed;
                dataResult.msg = result ? "删除菜单成功！" : "删除菜单失败！";
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

        #region 菜单列表
        /// <summary>
        /// 查询菜单列表
        /// </summary>
        /// <param name="systemId">系统编号</param>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> FindResourcePage([FromQuery] long systemId)
        {
            DataResult dataResult = new DataResult();
            try
            {
                if (systemId > 0)
                {
                    IList<SysResourceTree> result = await _resourceService.GetResourceTreeAsync(systemId);
                    dataResult.count = result.Count;
                    dataResult.data = result;
                } else
                {
                    dataResult.data = new List<SysResourceTree>();
                }
                dataResult.msg = "查询菜单列表成功！";
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

        #region 获取树形菜单数据
        /// <summary>
        /// 获取树形菜单数据
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> TreeMenu()
        {
            // 1、查询侧边栏菜单信息
            var user = HttpContext.User.ToUserIdentity();
            IList<ResourceTreeViewModel> resourceTrees = await _resourceService.GetLeftTreeAsync(user.UserId);
            if (resourceTrees.Any())
            {
                //读取该用户全部操作权限并缓存
                await _permissionStorage.InitAsync();
            }

            // 2、将数据转换为前台所需信息
            IList<SideTreeMenu> sideTreeMenus = GetSideTreeMenu(resourceTrees);
            return Ok(sideTreeMenus);
        }

        /// <summary>
        /// 得到前台自定义菜单所需信息
        /// </summary>
        /// <param name="resourceTrees">树形菜单资源</param>
        /// <returns></returns>
        private List<SideTreeMenu> GetSideTreeMenu(IList<ResourceTreeViewModel> resourceTrees)
        {
            List<SideTreeMenu> sideTreeMenus = new List<SideTreeMenu>();
            foreach (var rtvm in resourceTrees)
            {
                SideTreeMenu stm = new SideTreeMenu()
                {
                    id = rtvm.ResourceId,
                    title = rtvm.ResourceName,
                    icon = rtvm.Icon,
                    type = (string.IsNullOrEmpty(rtvm.ResourceUrl) || rtvm.ResourceUrl.Equals("/")) ? 0 : 1,
                    openType = "_iframe",
                    href = rtvm.ResourceUrl
                };
                if (rtvm.Children.Count > 0)
                {
                    stm.children = GetSideTreeMenu(rtvm.Children);
                }
                sideTreeMenus.Add(stm);
            }
            return sideTreeMenus;
        }
        #endregion

    }
}
