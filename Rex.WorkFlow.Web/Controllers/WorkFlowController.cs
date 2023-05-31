using JadeFramework.Core.Mvc;
using Microsoft.AspNetCore.Authorization;
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
    /// 流程设计
    /// </summary>
    [Area("WF")]
    [Authorize]
    public class WorkFlowController : BaseController
    {
        private readonly ILogger _logger;
        private readonly IWorkFlowService workFlowService;

        public WorkFlowController(ILoggerFactory loggerFactory, IWorkFlowService workFlowService)
        {
            _logger = loggerFactory.CreateLogger<WorkFlowController>();
            this.workFlowService = workFlowService;
        }

        #region 页面
        /// <summary>
        /// 流程设计列表页
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
            WorkFlowDetailDto workflow = id != null ? await workFlowService.GetByIdAsync(id.Value) : new WorkFlowDetailDto();
            return View(workflow);
        }
        #endregion

        #region CRUD
        /// <summary>
        /// 分页查询流程设计设计信息
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        [ActionName("FindWorkFlowPage")]
        [HttpGet]
        public async Task<IActionResult> FindWorkFlowPage(int pageIndex = 1, int pageSize = 10)
        {
            DataResult dataResult = new DataResult();
            try
            {
                var page = await workFlowService.GetPageAsync(pageIndex, pageSize);
                dataResult.count = page.TotalItems;
                dataResult.data = page.Items;
                dataResult.msg = "分页查询流程设计设计成功！";
            }
            catch (Exception ex)
            {
                dataResult.code = StateCode.Error;
                dataResult.msg = ex.Message;
                _logger.LogError(ex.Message);
            }
            return Ok(dataResult);
        }

        [HttpPost]
        [ActionName("InsertAsync")]
        public async Task<bool> InsertAsync(WorkFlowDetailDto workflow)
        {
            workflow.CreateUserId = UserIdentity.UserId.ToString();
            return await workFlowService.InsertAsync(workflow);
        }

        [HttpPost]
        [ActionName("UpdateAsync")]
        public async Task<bool> UpdateAsync(WorkFlowDetailDto workflow)
        {
            workflow.CreateUserId = UserIdentity.UserId.ToString();
            return await workFlowService.UpdateAsync(workflow);
        }

        /// <summary>
        /// 逻辑删除
        /// </summary>
        /// <param name="ids"></param>
        /// <param name="userid"></param>
        /// <returns></returns>
        [HttpPost]
        [ActionName("DeleteAsync")]
        public async Task<bool> DeleteAsync([FromBody] FlowDeleteDTO dto)
        {
            dto.UserId = UserIdentity.UserId;
            return await workFlowService.DeleteAsync(dto);
        }
        #endregion

        /// <summary>
        /// new workflow version
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        [HttpPost]
        [ActionName("NewVersionAsync")]
        public async Task<bool> NewVersionAsync([FromBody] WorkFlowDetailDto dto)
        {
            dto.CreateUserId = UserIdentity.UserId.ToString();
            return await workFlowService.NewVersionAsync(dto);
        }

        [HttpGet]
        [ActionName("GetWorkFlowStartAsync")]
        public async Task<List<WorkFlowStartDto>> GetWorkFlowStartAsync(Guid? categoryid)
        {
            return await workFlowService.GetWorkFlowStartAsync(categoryid ?? default(Guid));
        }

        [HttpGet]
        [ActionName("GetWorkFlowStartByListAsync")]
        public async Task<IActionResult> GetWorkFlowStartByListAsync(Guid? categoryid)
        {
            DataResult dataResult = new DataResult();
            try
            {
                var result = await workFlowService.GetWorkFlowStartAsync(categoryid ?? default(Guid));
                dataResult.data = result;
                dataResult.msg = "查询流程发起列表成功！";
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.Message);
            }
            return Ok(dataResult);
        }

    }
}
