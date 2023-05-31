using JadeFramework.Core.Domain.Entities;
using JadeFramework.Core.Extensions;
using JadeFramework.Core.Mvc;
using Microsoft.AspNetCore.Authorization;
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
    /// 角色管理
    /// </summary>
    [Area("Sys")]
    public class RoleController : BaseController
    {
        private readonly ILogger _logger;
        private readonly ISysRoleService _roleService;
        private readonly ISysResourceService _resourceService;
        public RoleController(
            ILoggerFactory loggerFactory,
            ISysRoleService roleService,
            ISysResourceService resourceService
        )
        {
            _logger = loggerFactory.CreateLogger<UserController>();
            _roleService = roleService;
            _resourceService = resourceService;
        }

        #region 页面
        /// <summary>
        /// 角色页面
        /// </summary>
        /// <returns></returns>
        public async Task<IActionResult> Index(RoleIndexSearch search)
        {
            RoleIndexViewModel result = await _roleService.GetListAsync(search);
            return View(result);
        }

        /// <summary>
        /// 操作(新增|修改)
        /// </summary>
        /// <param name="id">角色ID</param>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> Operation([FromQuery] long systemId, [FromQuery] long id)
        {
            ViewBag.SystemId = systemId;
            if (id > 0)
            {
                SysRole sysRole = await _roleService.GetAsync(id);
                return View(sysRole);
            }
            return View(new SysRole());
        }

        /// <summary>
        /// 查看详情
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> Details([FromQuery] long id)
        {
            SysRole sysRole = await _roleService.GetAsync(id);
            return View(sysRole);
        }

        /// <summary>
        /// 分配资源
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IActionResult AssigningResource([FromQuery] long roleId)
        {
            ViewBag.RoleId = roleId;
            return View();
        }

        /// <summary>
        /// 分配用户
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IActionResult AssigningUsers([FromQuery] long roleId)
        {
            ViewBag.RoleId = roleId;
            return View();
        }
        #endregion

        #region CRUD
        /// <summary>
        /// 分页查询角色信息
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> FindRolePage(RoleIndexSearch search)
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
                RoleIndexViewModel result = await _roleService.GetListAsync(search, true);
                dataResult.count = result.Page.TotalItems;
                dataResult.data = result.Page.Items;
                dataResult.msg = "查询角色成功！";
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
        /// 分页查询用户角色信息
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> FindRolePageByRoleId([FromQuery] long roleId, [FromQuery] int pageIndex = 1, [FromQuery] int pageSize = 10)
        {
            DataResult dataResult = new DataResult();
            try
            {
                Page<SysUser> pageSysUser = await _roleService.GetRoleUserAsync(roleId, pageIndex, pageSize);
                dataResult.count = pageSysUser.TotalItems;
                dataResult.data = pageSysUser.Items;
                dataResult.msg = "分页查询用户角色信息成功！";
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
        /// 新增
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        [ActionName("Add")]
        public async Task<IActionResult> Add([FromBody] SysRole role)
        {
            DataResult dataResult = new DataResult();
            try
            {
                role.CreateUserId = UserIdentity.UserId;
                bool result = await _roleService.AddAsync(role);
                dataResult.code = result ? StateCode.Succees : StateCode.Failed;
                dataResult.msg = result ? "新增角色成功!" : "新增角色失败！";
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
        public async Task<IActionResult> Update([FromBody] SysRole role)
        {
            DataResult dataResult = new DataResult();
            try
            {
                role.CreateUserId = UserIdentity.UserId;
                bool result = await _roleService.UpdateAsync(role);
                dataResult.code = result ? StateCode.Succees : StateCode.Failed;
                dataResult.msg = result ? "编辑角色成功!" : "编辑角色失败！";
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
                bool result = await _roleService.DeleteAsync(ids, userid);
                dataResult.code = result ? StateCode.Succees : StateCode.Failed;
                dataResult.msg = result ? "删除角色成功!" : "删除角色失败！";
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

        #region 角色分配资源
        /// <summary>
        /// 查询树形角色分配资源
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Authorize]
        [ActionName("Box")]
        public async Task<IActionResult> Box([FromQuery] long roleId)
        {
            DataResult dataResult = new DataResult();
            try
            {
                if (roleId <= 0)
                {
                    return NotFound();
                }
                List<ZTree> zTreeList = await _resourceService.GetBoxTreeAsync(roleId);
                dataResult.data = zTreeList;
                dataResult.msg = "查询树形角色分配资源成功！";
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
        /// 角色分配资源保存
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        [HttpPost]
        [Authorize]
        [ActionName("BoxSave")]
        public async Task<IActionResult> BoxSave([FromBody] RoleTreeDto dto)
        {
            DataResult dataResult = new DataResult();
            try
            {
                dto.CreateUserId = UserIdentity.UserId;
                bool result = await _resourceService.BoxSaveAsync(dto);
                dataResult.code = result ? StateCode.Succees : StateCode.Failed;
                dataResult.msg = result ? "分配资源成功！" : "分配资源失败！";
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
        /// 删除角色下的用户
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        [HttpPost]
        [Authorize]
        [ActionName("DeleteUser")]
        public async Task<IActionResult> DeleteUser([FromBody] RoleToUserDto dto)
        {
            DataResult dataResult = new DataResult();
            try
            {
                dto.CurrentUserId = UserIdentity.UserId;
                bool result = await _roleService.DeleteUserAsync(dto);
                dataResult.code = result ? StateCode.Succees : StateCode.Failed;
                dataResult.msg = result ? "删除角色下的用户成功！" : "删除角色下的用户失败！";
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
        /// 添加角色下的用户
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        [HttpPost]
        [Authorize]
        [ActionName("AddUser")]
        public async Task<IActionResult> AddUser(RoleToUserDto dto)
        {
            DataResult dataResult = new DataResult();
            try
            {
                dto.CurrentUserId = UserIdentity.UserId;
                bool result = await _roleService.AddUserAsync(dto);
                dataResult.code = result ? StateCode.Succees : StateCode.Failed;
                dataResult.msg = result ? "添加角色下的用户成功！" : "添加角色下的用户失败！";
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
