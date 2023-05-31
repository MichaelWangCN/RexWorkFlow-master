using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.SignalR;
using Rex.WorkFlow.Web.Dtos;
using Rex.WorkFlow.Web.Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Hubs
{
    /// <summary>
    /// 建立客户端连接
    /// </summary>
    /// <remarks>
    /// @创 建 者：Rex
    /// @创建日期：2021/3/4 20:14:01
    /// </remarks>
    [Authorize]
    public class MessageHub : Hub
    {
        public MessageHub()
        {
        }

        public override async Task OnConnectedAsync()
        {
            await base.OnConnectedAsync();
        }

        public override async Task OnDisconnectedAsync(Exception ex)
        {
            await Groups.RemoveFromGroupAsync(Context.ConnectionId, MessageDefault.GroupName);
            var curUser = SignalRMessageGroups.UserGroups.FirstOrDefault(m => m.ConnectionId == Context.ConnectionId && m.GroupName == MessageDefault.GroupName);
            if (curUser != null)
            {
                SignalRMessageGroups.UserGroups.Remove(curUser);
            }
            await base.OnDisconnectedAsync(ex);
        }


        public async Task InitMessage(long userid)
        {
            await Groups.AddToGroupAsync(Context.ConnectionId, MessageDefault.GroupName);
            var curUser = SignalRMessageGroups.UserGroups.FirstOrDefault(m => m.UserId == userid && m.GroupName == MessageDefault.GroupName);
            if (curUser != null)
            {
                SignalRMessageGroups.UserGroups.Remove(curUser);
            }
            SignalRMessageGroups.UserGroups.Add(new SignalRMessageGroups
            {
                ConnectionId = Context.ConnectionId,
                GroupName = MessageDefault.GroupName,
                UserId = userid
            });
        }

    }
}
