using JadeFramework.Core.Domain.Entities;
using Rex.WorkFlow.Web.Dtos;
using Rex.WorkFlow.Web.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Services
{
    /// <summary>
    /// IOaMessageService
    /// </summary>
    /// <remarks>
    /// @创 建 者：Rex
    /// @创建日期：2021/3/4 20:08:41
    /// </remarks>
    public interface IOaMessageService
    {
        Task<Page<OaMessage>> GetPageAsync(int pageIndex, int pageSize);
        Task<MessageShowDTO> GetByIdAsync(long id);
        Task<bool> InsertAsync(MessageShowDTO model);
        Task<bool> UpdateAsync(MessageShowDTO model);
        Task<bool> DeleteAsync(MessageDeleteDTO dto);
        Task<List<OaMessage>> EnableMessageAsync(List<long> ids);
        Task<Page<OaMessageMyList>> MyListAsync(OaMessageMyListSearch search);
        Task<OaMessageMyListDetail> MyListDetailAsync(long id, long userid);

        Task<bool> ReadMessageAsync(OaMessageReadDto message);

        /// <summary>
        /// 对 某些人进行消息推送并入库
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        Task<int> PushSomeBodyAndInsertDbAsync(MessagePushSomBodyDTO model);
    }
}
