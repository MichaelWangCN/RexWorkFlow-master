using JadeFramework.Core.Domain.Entities;
using Rex.WorkFlow.Web.Dtos;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Services
{
    /// <summary>
    /// 服务之间调用
    /// </summary>
    /// <remarks>
    /// @创 建 者：Rex
    /// @创建日期：2021/3/4 13:20:12
    /// </remarks>
    public interface IConfigService
    {
        Task<List<ZTree>> GetRoleTreesAsync(List<long> ids);
        Task<List<ZTree>> GetUserTreeAsync(List<long> ids);

        /// <summary>
        /// 根据角色ID获取用户ID
        /// </summary>
        /// <param name="roleids"></param>
        /// <returns></returns>
        Task<List<long>> GetUserIdsByRoleIdsAsync(List<long> roleids);
        Task<List<long>> GetFlowNodeInfo(string sysname, FlowViewModel model);
        /// <summary>
        /// 获取最终的节点ID
        /// </summary>
        /// <param name="model">连线条件字典集合</param>
        /// <returns></returns>
        Task<Guid?> GetFinalNodeId(string sysname, FlowLineFinalNodeDto model);

        /// <summary>
        /// //对某些人进行消息推送并入库
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        Task UrgeSendSignalR(MessagePushSomBodyDTO model);
    }
}
