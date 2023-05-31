using JadeFramework.Core.Domain.Entities;
using JadeFramework.Dapper;
using Rex.WorkFlow.Web.Models;
using Rex.WorkFlow.Web.Dtos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Repositories
{
    public interface IWfWorkflowRepository : IDapperRepository<WfWorkflow>
    {
        Task<Page<WfWorkflow>> GetPageAsync(int pageIndex, int pageSize);
        Task<bool> IsExistFormAsync(Guid formid);
        Task<bool> IsExistFormAsync(Guid formid, Guid excludFlowid);
        Task<bool> DeleteAsync(List<Guid> ids, IDbTransaction transaction);
        /// <summary>
        /// 根据分类获取表单信息发起流程
        /// </summary>
        /// <param name="categoryid"></param>
        /// <returns></returns>
        Task<List<WorkFlowStartDto>> GetWorkFlowStartAsync(Guid categoryid);
    }
}
