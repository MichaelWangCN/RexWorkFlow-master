using System.Data;
using JadeFramework.Dapper;
using JadeFramework.Dapper.SqlGenerator;
using Rex.WorkFlow.Web.Repositories;
using Rex.WorkFlow.Web.Models;

namespace Rex.WorkFlow.Web.Repositories.Impls
{
    public class WfWorkflowTransitionHistoryRepository : DapperRepository<WfWorkflowTransitionHistory>, IWfWorkflowTransitionHistoryRepository
    {
        public WfWorkflowTransitionHistoryRepository(IDbConnection connection, SqlGeneratorConfig config) : base(connection, config)
        {
        }
    }
}
