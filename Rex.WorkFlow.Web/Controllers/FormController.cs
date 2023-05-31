using JadeFramework.Core.Domain.Entities;
using JadeFramework.Core.Extensions;
using JadeFramework.Core.Mvc;
using JadeFramework.WorkFlow;
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
    /// 表单设计
    /// </summary>
    [Area("WF")]
    [Authorize]
    public class FormController : BaseController
    {
        private readonly ILogger _logger;
        private readonly IFormService formService;

        public FormController(ILoggerFactory loggerFactory, IFormService formService)
        {
            _logger = loggerFactory.CreateLogger<FormController>();
            this.formService = formService;
        }

        #region 页面
        /// <summary>
        /// 表单设计页
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
        public async Task<IActionResult> Operation(Guid? id)
        {
            FormDetailDto model;
            if (id == null || id == default(Guid))
            {
                model = new FormDetailDto();
            }
            else
            {
                model = await formService.GetFormDetailAsync(id.Value);
            }
            return View(model);
        }
        #endregion

        #region CRUD
        /// <summary>
        /// 分页查询表单设计信息
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        [ActionName("FindFormPage")]
        [HttpGet]
        public async Task<IActionResult> FindFormPage(int pageIndex = 1, int pageSize = 10)
        {
            DataResult dataResult = new DataResult();
            try
            {
                var page = await formService.GetPageAsync(pageIndex, pageSize);
                foreach (var item in page.Items)
                {
                    item.FormTypeName = ((WorkFlowFormType)item.FormType).GetDescription();
                }
                dataResult.count = page.TotalItems;
                dataResult.data = page.Items;
                dataResult.msg = "分页查询表单设计成功！";
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
        /// 添加表单
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        [ActionName("Add")]
        public async Task<IActionResult> InsertAsync([FromBody] FormDetailDto model)
        {
            DataResult dataResult = new DataResult();
            try
            {
                model.CreateUserId = UserIdentity.UserId.ToString();
                var result = await formService.InsertAsync(model);
                dataResult.code = result ? StateCode.Succees : StateCode.Failed;
                dataResult.msg = result ? "添加表单成功！" : "添加表单失败！";
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
        /// 修改
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        [ActionName("Update")]
        public async Task<IActionResult> UpdateAsync([FromBody] FormDetailDto model)
        {
            DataResult dataResult = new DataResult();
            try
            {
                model.CreateUserId = UserIdentity.UserId.ToString();
                var result = await formService.UpdateAsync(model);
                dataResult.code = result ? StateCode.Succees : StateCode.Failed;
                dataResult.msg = result ? "编辑表单成功！" : "编辑表单失败！";
            }
            catch (Exception ex)
            {
                dataResult.code = StateCode.Error;
                dataResult.msg = ex.Message;
                _logger.LogError(ex.Message);
            }
            return Ok(dataResult);
        }

        [HttpGet]
        [ActionName("GetFormTreeAsync")]
        public async Task<List<ZTree>> GetFormTreeAsync()
        {
            return await formService.GetFormTreeAsync();
        }
        #endregion

    }
}
