//------------------------------------------------------------------------------
// <auto-generated>
//     此代码由工具生成。
//     创建人：wms
//     创建时间：2019/12/1 14:30:13
//     说明：
// </auto-generated>
//------------------------------------------------------------------------------
using JadeFramework.Dapper;
using JadeFramework.Dapper.SqlGenerator;
using Rex.WorkFlow.Web.Repositories;
using Rex.WorkFlow.Web.Models;
using System.Data;

namespace Rex.WorkFlow.Web.Repositories.Impls
{
    /// <summary>
    /// 催办记录表 仓储
    /// </summary>
    public class WfWorkflowUrgeRepository : DapperRepository<WfWorkflowUrge>, IWfWorkflowUrgeRepository
    {
        public WfWorkflowUrgeRepository(IDbConnection connection, SqlGeneratorConfig config) : base(connection, config)
        {
        }
    }
}
