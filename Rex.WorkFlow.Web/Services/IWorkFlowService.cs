using JadeFramework.Core.Domain.Entities;
using Rex.WorkFlow.Web.Dtos;
using Rex.WorkFlow.Web.Models;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Services
{
    /// <summary>
    /// IWorkFlowService
    /// </summary>
    /// <remarks>
    /// @创 建 者：Rex
    /// @创建日期：2021/3/2 14:44:49
    /// </remarks>
    public interface IWorkFlowService
    {
        Task<Page<WfWorkflow>> GetPageAsync(int pageIndex, int pageSize);
        Task<WorkFlowDetailDto> GetByIdAsync(Guid id);
        Task<bool> InsertAsync(WorkFlowDetailDto workflow);
        Task<bool> UpdateAsync(WorkFlowDetailDto workflow);
        Task<bool> DeleteAsync(FlowDeleteDTO dto);
        Task<List<WorkFlowStartDto>> GetWorkFlowStartAsync(Guid categoryid);
        Task<bool> NewVersionAsync(WorkFlowDetailDto dto);
        Task<List<long>> GetFlowNodeInfo(FlowViewModel model);
        Task<Guid?> GetFinalNodeId(FlowLineFinalNodeDto model);
    }
}
