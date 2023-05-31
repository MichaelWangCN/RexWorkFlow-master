using JadeFramework.Core.Extensions;
using JadeFramework.Core.Mvc;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.Extensions.DependencyInjection;
using Rex.WorkFlow.Web.Dtos;
using Rex.WorkFlow.Web.Hubs;
using Rex.WorkFlow.Web.Infrastructure;
using Rex.WorkFlow.Web.Models;
using Rex.WorkFlow.Web.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Controllers
{
    [Area("OA")]
    public class MessageController : BaseController
    {
        private readonly IHubContext<MessageHub> _hubContext;
        private readonly IOaMessageService _messageService;

        public MessageController(IServiceProvider serviceProvider, IOaMessageService messageService)
        {
            _hubContext = serviceProvider.GetRequiredService<IHubContext<MessageHub>>();
            this._messageService = messageService;
        }


        [HttpGet]
        public async Task<IActionResult> Index(int pageIndex = 1, int pageSize = 10)
        {
            var res = await _messageService.GetPageAsync(pageIndex, pageSize);
            return View(res);
        }
        [HttpGet]
        public IActionResult Show()
        {
            return View();
        }

        #region 权限控制

        [HttpGet]
        [ActionName("Get")]
        public async Task<IActionResult> Get([Bind("Id"), FromQuery] long id)
        {
            if (id > 0)
            {
                var res = await _messageService.GetByIdAsync(id);
                return Ok(res);
            }
            else
            {
                return Ok(new MessageShowDTO()
                {
                    StartTime = DateTime.Now,
                    EndTime = DateTime.Now.AddDays(1)
                });
            }
        }
        #endregion

        /// <summary>
        /// 新增
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        [ActionName("Add")]
        public async Task<IActionResult> Add([FromBody] MessageShowDTO model)
        {
            model.CreateUserId = UserIdentity.UserId;
            bool res = await _messageService.InsertAsync(model);
            return Ok(res);
        }

        /// <summary>
        /// 编辑
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        [ActionName("Update")]
        public async Task<IActionResult> Update([FromBody] MessageShowDTO model)
        {
            bool res = await _messageService.UpdateAsync(model);
            return Ok(res);
        }

        /// <summary>
        /// 逻辑删除
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        [HttpPost]
        [ActionName("Delete")]
        public async Task<IActionResult> Delete([FromBody] List<long> ids)
        {
            var res = await _messageService.DeleteAsync(new MessageDeleteDTO
            {
                Ids = ids,
                UserId = UserIdentity.UserId
            });
            return Ok(res);
        }


        [HttpPost]
        [ActionName("EnableMessage")]
        public async Task<bool> EnableMessage([FromBody] List<long> ids)
        {
            var list = await _messageService.EnableMessageAsync(ids);
            //获取立即执行的消息
            var imlist = list.Where(m => m.StartTime == 0 || m.EndTime == 0);
            foreach (var item in imlist)
            {
                await this.PushMessageAsync(item);
            }
            return true;
        }


        /// <summary>
        /// 我的消息
        /// </summary>
        /// <returns></returns>
        public async Task<IActionResult> MyList(OaMessageMyListSearch search)
        {
            if (search.PageIndex == 0)
            {
                search.PageIndex = 1;
            }
            if (search.PageSize == 0)
            {
                search.PageSize = 10;
            }
            search.UserId = UserIdentity.UserId;
            var page = await _messageService.MyListAsync(search);
            return View(page);
        }

        /// <summary>
        /// 获取首页消息
        /// </summary>
        /// <returns></returns>
        public async Task<IActionResult> HomeMessage()
        {
            OaMessageMyListSearch search = new OaMessageMyListSearch();
            if (search.PageIndex == 0)
            {
                search.PageIndex = 1;
            }
            if (search.PageSize == 0)
            {
                search.PageSize = 10;
            }
            search.IsRead = 0;
            search.UserId = UserIdentity.UserId;
            var page = await _messageService.MyListAsync(search);
            return Ok(page);
        }



        /// <summary>
        /// 消息明细
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<IActionResult> Detail(long id)
        {
            var res = await _messageService.MyListDetailAsync(id, UserIdentity.UserId);
            return View(res);
        }

        /// <summary>
        /// 消息已读
        /// </summary>
        /// <param name="message"></param>
        /// <returns></returns>
        [HttpPost]
        [ActionName("ReadMessageAsync")]
        public async Task<bool> ReadMessageAsync([FromBody] OaMessageReadDto message)
        {
            message.UserId = UserIdentity.UserId;
            var res = await _messageService.ReadMessageAsync(message);
            return res;
        }

        #region 消息推送

        /// <summary>
        /// 全员推送
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        [ActionName("PushMessageAsync")]
        public async Task<IActionResult> PushMessageAsync([FromBody] object data)
        {
            await _hubContext.Clients.All.SendAsync(MessageDefault.ReceiveMessage, data);
            return Ok();
        }

        /// <summary>
        /// 对某人推送
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        [ActionName("PushAnyOneAsync")]
        public async Task<IActionResult> PushAnyOneAsync([FromBody] MessagePushDTO model)
        {
            if (model == null)
            {
                return Forbid();
            }
            var user = SignalRMessageGroups.UserGroups.FirstOrDefault(m => m.UserId == model.UserId && m.GroupName == model.GroupName);
            if (user != null)
            {
                await _hubContext.Clients.Client(user.ConnectionId).SendAsync(MessageDefault.ReceiveAnyOne, model.MsgJson);
            }
            return Ok();
        }

        /// <summary>
        /// 对某组进行推送
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        [ActionName("PushGroupAsync")]
        public async Task<IActionResult> PushGroupAsync([FromBody] MessageGroupPushDTO model)
        {
            if (model == null)
            {
                return Forbid();
            }
            var list = SignalRMessageGroups.UserGroups.Where(m => m.GroupName == model.GroupName);
            foreach (var item in list)
            {
                await _hubContext.Clients.Client(item.ConnectionId).SendAsync(model.GroupName, model.MsgJson);
            }
            return Ok();
        }

        /// <summary>
        /// 对 某些人进行消息推送并入库
        /// 【只针对首页消息提示】
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        [ActionName("PushSomeBodyAndInsertDbAsync")]
        public async Task<IActionResult> PushSomeBodyAndInsertDbAsync([FromBody] MessagePushSomBodyDTO model)
        {
            if (model == null)
            {
                return Forbid();
            }

            //入库操作
            int messageid = await _messageService.PushSomeBodyAndInsertDbAsync(model);
            if (messageid == 0)
            {
                return Forbid();
            }
            //消息推送操作
            var users = SignalRMessageGroups.UserGroups.Where(m => model.UserIds.Contains(m.UserId) && m.GroupName == MessageDefault.GroupName).ToList();
            foreach (var item in users)
            {
                await _hubContext.Clients.Client(item.ConnectionId).SendAsync(MessageDefault.ReceiveMessage, new
                {
                    id = messageid,
                    Title = model.Title + ":【" + model.MsgJson + "】",
                    model.Link,
                    IsSystem = 1,
                    CreateTime = DateTime.Now.ToTimeStamp()
                });
            }
            return Ok();

        }
        #endregion
    }
}
