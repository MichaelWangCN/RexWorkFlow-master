using JadeFramework.Dapper;
using JadeFramework.Dapper.SqlGenerator;
using Rex.WorkFlow.Web.Repositories;
using Rex.WorkFlow.Web.Models;
using System.Data;

namespace Rex.WorkFlow.Web.Repositories.Impls
{
    public class WfWorkflowOperationHistoryRepository : DapperRepository<WfWorkflowOperationHistory>, IWfWorkflowOperationHistoryRepository
    {
        public WfWorkflowOperationHistoryRepository(IDbConnection connection, SqlGeneratorConfig config) : base(connection, config)
        {
        }
    }
}
