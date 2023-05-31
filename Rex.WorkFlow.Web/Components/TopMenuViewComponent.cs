using JadeFramework.Core.Domain.Entities;
using JadeFramework.Core.Mvc.Extensions;
using Microsoft.AspNetCore.Mvc;
using Rex.WorkFlow.Web.Models;
using Rex.WorkFlow.Web.Services;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Components
{
    /// <summary>
    /// 顶部导航部分
    /// </summary>
    /// <remarks>
    /// @创 建 者：Rex
    /// @创建日期：2021/2/24 13:41:46
    /// </remarks>
    public class TopMenuViewComponent : ViewComponent
    {
        private readonly IOaMessageService _messageService;
        public TopMenuViewComponent(IOaMessageService messageService)
        {
            _messageService = messageService;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            UserIdentity user = HttpContext.User.ToUserIdentity();

            var messagePage = await _messageService.MyListAsync(new OaMessageMyListSearch()
            {
                IsDel = 0,
                IsRead = 0,
                PageIndex = 1,
                PageSize = 10,
                UserId = user.UserId
            });
            ViewBag.MessagePage = messagePage;

            return await Task.Run(
                () =>  View(user)
            );
        }
    }
}
