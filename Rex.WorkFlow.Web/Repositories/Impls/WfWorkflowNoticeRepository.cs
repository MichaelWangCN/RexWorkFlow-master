using JadeFramework.Dapper;
using JadeFramework.Dapper.SqlGenerator;
using Rex.WorkFlow.Web.Repositories;
using Rex.WorkFlow.Web.Models;
using System.Data;

namespace Rex.WorkFlow.Web.Repositories.Impls
{
    public class WfWorkflowNoticeRepository : DapperRepository<WfWorkflowNotice>, IWfWorkflowNoticeRepository
    {
        public WfWorkflowNoticeRepository(IDbConnection connection, SqlGeneratorConfig config) : base(connection, config)
        {
        }
    }
}
