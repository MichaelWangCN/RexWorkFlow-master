using JadeFramework.Core.Domain.Entities;
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
    /// 流程分类
    /// </summary>
    [Area("WF")]
    [Authorize]
    public class CategoryController : BaseController
    {
        private readonly ILogger _logger;
        private readonly IWorkflowCategoryService categoryService;
        private readonly IWorkFlowService workFlowService;

        public CategoryController(ILoggerFactory loggerFactory, IWorkflowCategoryService categoryService, IWorkFlowService workFlowService)
        {
            _logger = loggerFactory.CreateLogger<CategoryController>();
            this.categoryService = categoryService;
            this.workFlowService = workFlowService;
        }

        #region 页面
        /// <summary>
        /// 流程分类页
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
            CategoryDetailDto model;
            if (id != null && id != default(Guid))
            {
                model = await categoryService.GetCategoryDetailAsync(id.Value);
            }
            else
            {
                model = new CategoryDetailDto();
            }
            return View(model);
        }
        #endregion

        #region 获取流程分类树形菜单
        /// <summary>
        /// 获取流程分类树形菜单
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        [ActionName("GetCategoryTreeAsync")]
        public async Task<IActionResult> GetCategoryTreeAsync(Guid? id)
        {
            DataResult dataResult = new DataResult();
            try
            {
                if (id != null && id != default(Guid))
                {
                    var trees = await categoryService.GetCategoryTreeAsync();
                    var res = trees.Where(m => m.id != id.ToString()).ToList();
                    res.Add(new ZTree
                    {
                        id = default(Guid).ToString(),
                        name = "无",
                        open = true,
                        pId = default(Guid).ToString(),
                    });
                    dataResult.data = res;
                }
                else
                {
                    var trees = await categoryService.GetCategoryTreeAsync();
                    trees.Add(new ZTree
                    {
                        id = default(Guid).ToString(),
                        name = "流程分类",
                        open = true,
                        pId = Guid.NewGuid().ToString()
                    });
                    dataResult.data = trees;
                }

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

        #region CRUD
        /// <summary>
        /// 分页查询流程分类信息
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> FindCategoryPage()
        {
            DataResult dataResult = new DataResult();
            try
            {
                var result = await categoryService.GetTreeAsync();
                dataResult.count = result.Count;
                dataResult.data = result;
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

        /// <summary>
        /// 添加流程分类
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        [ActionName("Add")]
        public async Task<IActionResult> InsertAsync([FromBody] CategoryDetailDto model)
        {
            DataResult dataResult = new DataResult();
            try
            {
                model.UserId = UserIdentity.UserId.ToString();
                bool result = await categoryService.InsertAsync(model);
                dataResult.code = result ? StateCode.Succees : StateCode.Failed;
                dataResult.msg = result ? "添加流程分类成功！" : "添加流程分类失败！";
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
        /// 编辑流程分类信息
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        [ActionName("Update")]
        public async Task<IActionResult> UpdateAsync([FromBody] CategoryDetailDto model)
        {
            DataResult dataResult = new DataResult();
            try
            {
                model.UserId = UserIdentity.UserId.ToString();
                bool result = await categoryService.UpdateAsync(model);
                dataResult.code = result ? StateCode.Succees : StateCode.Failed;
                dataResult.msg = result ? "编辑流程分类成功！" : "编辑流程分类失败！";
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
        [ActionName("Delete")]
        public async Task<IActionResult> DeleteAsync([FromBody] CategoryDeleteDto model)
        {
            DataResult dataResult = new DataResult();
            try
            {
                model.UserId = UserIdentity.UserId.ToString();
                bool result = await categoryService.DeleteAsync(model);
                dataResult.code = result ? StateCode.Succees : StateCode.Failed;
                dataResult.msg = result ? "删除流程分类成功！" : "删除流程分类失败！";
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
