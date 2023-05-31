using JadeFramework.Core.Domain.Entities;
using Rex.WorkFlow.Web.Dtos;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Services
{
    /// <summary>
    /// IWorkflowCategoryService
    /// </summary>
    /// <remarks>
    /// @创 建 者：Rex
    /// @创建日期：2021/3/2 14:41:31
    /// </remarks>
    public interface IWorkflowCategoryService
    {
        /// <summary>
        /// 获取树状列表
        /// </summary>
        /// <returns></returns>
        Task<List<CategoryTreeListDto>> GetTreeListAsync();


        Task<List<CategoryTreeDto>> GetTreeAsync();

        /// <summary>
        /// 获取流程分类树
        /// </summary>
        /// <returns></returns>
        Task<List<ZTree>> GetCategoryTreeAsync();
        Task<CategoryDetailDto> GetCategoryDetailAsync(Guid id);
        Task<bool> InsertAsync(CategoryDetailDto model);
        Task<bool> UpdateAsync(CategoryDetailDto model);
        Task<bool> DeleteAsync(CategoryDeleteDto model);
    }
}
