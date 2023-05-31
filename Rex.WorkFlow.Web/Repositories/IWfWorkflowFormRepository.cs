using JadeFramework.Core.Domain.Entities;
using JadeFramework.Dapper;
using Rex.WorkFlow.Web.Models;
using Rex.WorkFlow.Web.Dtos;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Repositories
{
    public interface IWfWorkflowFormRepository: IDapperRepository<WfWorkflowForm>
    {
        Task<Page<FormPageDto>> GetPageAsync(int pageIndex, int pageSize);
    }
}
