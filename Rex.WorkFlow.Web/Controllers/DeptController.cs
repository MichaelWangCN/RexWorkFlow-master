using JadeFramework.Core.Mvc;
using Microsoft.AspNetCore.Mvc;
using Rex.WorkFlow.Web.Models;
using Rex.WorkFlow.Web.Services;
using System;
using Microsoft.Extensions.Logging;
using System.Threading.Tasks;
using Rex.WorkFlow.Web.Dtos;
using System.Collections.Generic;

namespace Rex.WorkFlow.Web.Controllers
{
    /// <summary>
    /// 部门
    /// </summary>
    [Area("Sys")]
    public class DeptController : BaseController
    {
        private readonly ILogger _logger;
        private readonly ISysDeptService _deptService;
        public DeptController(ILoggerFactory loggerFactory, ISysDeptService deptService)
        {
            _logger = loggerFactory.CreateLogger<DeptController>();
            _deptService = deptService;
        }

        #region 页面
        /// <summary>
        /// 部门页
        /// </summary>
        /// <returns></returns>
        public IActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// 操作(新增|修改)
        /// </summary>
        /// <param name="id">用户ID</param>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> Operation([FromQuery] long id)
        {
            IList<SysDeptTree> deptData = await _deptService.GetDeptTreeAsync(string.Empty, "0");
            ViewBag.DeptData = deptData;
            if (id > 0)
            {
                DeptShowViewModel model = await _deptService.GetDeptAsync(id);
                return View(model);
            }
            return View(new DeptShowViewModel()
            {
                SysDept = new SysDept()
            });
        }
        #endregion

        #region CRUD
        /// <summary>
        /// 查询部门信息
        /// </summary>
        /// <param name="deptName">部门名称</param>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> FindDeptPage([FromQuery] string deptName, [FromQuery] string isDel)
        {
            DataResult dataResult = new DataResult();
            try
            {
                IList<SysDeptTree> result = await _deptService.GetDeptTreeAsync(deptName, isDel);
                dataResult.count = result.Count;
                dataResult.data = result;
                dataResult.msg = "查询部门信息成功！";
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
        public async Task<IActionResult> Add(DeptShowDto dto)
        {
            DataResult dataResult = new DataResult();
            try
            {
                dto.sysDept.CreateUserId = UserIdentity.UserId;
                bool result = await _deptService.AddAsync(dto);
                dataResult.code = result ? StateCode.Succees : StateCode.Failed;
                dataResult.msg = result ? "新增部门成功！" : "新增部门失败！";
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
        public async Task<IActionResult> Edit(DeptShowDto dto)
        {
            DataResult dataResult = new DataResult();
            try
            {
                dto.sysDept.CreateUserId = UserIdentity.UserId;
                bool result = await _deptService.UpdateAsync(dto);
                dataResult.code = result ? StateCode.Succees : StateCode.Failed;
                dataResult.msg = result ? "编辑部门成功！" : "编辑部门失败！";
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
                var result = await _deptService.DeleteAsync(ids, userid);
                dataResult.code = result ? StateCode.Succees : StateCode.Failed;
                dataResult.msg = result ? "删除部门成功！" : "删除部门失败！";
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
