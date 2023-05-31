using JadeFramework.Dapper;
using Rex.WorkFlow.Web.Dtos;
using Rex.WorkFlow.Web.Models;
using Rex.WorkFlow.Web.Dtos;
using System;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Repositories
{
    public interface IWfWorkflowsqlRepository : IDapperRepository<WfWorkflowsql>
    {
        /// <summary>
        /// 获取最终的节点ID
        /// </summary>
        /// <param name="data">连线条件字典集合</param>
        /// <returns></returns>
        Task<Guid?> GetFinalNodeId(FlowLineFinalNodeDto model);
    }
}
