using JadeFramework.Dapper;
using Rex.WorkFlow.Web.Models;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Repositories
{
    public interface IWfWorkflowCategoryRepository: IDapperRepository<WfWorkflowCategory>
    {
        Task<IEnumerable<WfWorkflowCategory>> GetCategoriesAsync(List<Guid> ids);
    }
}
