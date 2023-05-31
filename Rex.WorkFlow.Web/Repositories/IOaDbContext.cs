using JadeFramework.Dapper.DbContext;

namespace Rex.WorkFlow.Web.Repositories
{
    public interface IOaDbContext: IDapperDbContext
    {
       /* IOaLeaveRepository OaLeaveRepository { get; }*/

        IOaMessageRepository OaMessage { get; }
        IOaMessageUserRepository OaMessageUser { get; }
       /* IOaWorkflowsqlRepository OaWorkflowsql { get; }
        IOaChatRepository OaChat { get; }*/
    }
}
