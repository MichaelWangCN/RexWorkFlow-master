using JadeFramework.Core.Domain.Entities;
using JadeFramework.Core.Extensions;
using JadeFramework.Core.Mvc;
using JadeFramework.WorkFlow;
using Microsoft.AspNetCore.Authorization;
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
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Controllers
{
    [Area("WF")]
    [Authorize]
    public class WorkFlowInstanceController : BaseController
    {
        private readonly IWorkFlowInstanceService _workFlowInstanceService;
        private readonly IWorkflowCategoryService _categoryService;
        private readonly IWorkFlowService _workFlowService;
        private readonly IOaMessageService _messageService;
        private IHubContext<MessageHub> _hubContext;

        public WorkFlowInstanceController(IWorkFlowInstanceService workFlowInstanceService,
            IWorkflowCategoryService categoryService,
            IOaMessageService messageService,
            IWorkFlowService workFlowService,
            IServiceProvider serviceProvider)
        {
            this._workFlowInstanceService = workFlowInstanceService;
            this._categoryService = categoryService;
            this._workFlowService = workFlowService;
            this._messageService = messageService;
            _hubContext = serviceProvider.GetRequiredService<IHubContext<MessageHub>>();
        }

        #region 我的审批历史记录

        /// <summary>
        /// 我的审批历史记录
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> MyApprovalHistory(int pageIndex = 1, int pageSize = 10)
        {
            var page = await _workFlowInstanceService.GetMyApprovalHistoryAsync(pageIndex, pageSize, UserIdentity.UserId.ToString());
            return View(page);
        }

        #endregion

        #region 我的流程

        [HttpGet]
        public async Task<IActionResult> MyFlow(int pageIndex = 1, int pageSize = 10)
        {
            var page = await _workFlowInstanceService.GetUserWorkFlowPageAsync(pageIndex, pageSize, UserIdentity.UserId.ToString());
            return View(page);
        }

        #endregion

        #region 流程发起
        /// <summary>
        /// 列表页
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IActionResult Start()
        {
            return View();
        }

        /// <summary>
        /// 开始流程实例
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        [ActionName("CreateInstanceAsync")]
        public async Task<WorkFlowResult> CreateInstanceAsync([FromBody] WorkFlowProcessTransition model)
        {
            model.UserId = UserIdentity.UserId.ToString();
            model.UserName = UserIdentity.UserName;
            var res = await _workFlowInstanceService.CreateInstanceAsync(model);
            return res;
        }

        /// <summary>
        /// 流程申请
        /// </summary>
        /// <param name="flowid"></param>
        /// <param name="instanceid"></param>
        /// <returns></returns>
        public async Task<IActionResult> Process(Guid flowid, Guid? instanceid)
        {
            WorkFlowProcess process = new WorkFlowProcess
            {
                UserId = UserIdentity.UserId.ToString(),
                FlowId = flowid,
                InstanceId = instanceid ?? default(Guid)
            };
            var res = await _workFlowInstanceService.GetProcessAsync(process);
            return View(res);
        }

        [HttpPost]
        [ActionName("ProcessTransitionFlowAsync")]
        public async Task<WorkFlowResult> ProcessTransitionFlowAsync([FromBody] WorkFlowProcessTransition model)
        {
            model.UserId = UserIdentity.UserId.ToString();
            model.UserName = UserIdentity.UserName;
            return await _workFlowInstanceService.ProcessTransitionFlowAsync(model);
        }

        /// <summary>
        /// 获取审批意见
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpGet]
        [ActionName("GetFlowApprovalAsync")]
        public async Task<WorkFlowResult> GetFlowApprovalAsync([FromQuery] WorkFlowProcessTransition model)
        {
            model.UserId = UserIdentity.UserId.ToString();
            return await _workFlowInstanceService.GetFlowApprovalAsync(model);
        }


        /// <summary>
        /// 添加或修改自定义表单数据
        /// </summary>
        /// <param name="addProcess"></param>
        /// <returns></returns>
        [HttpPost]
        [ActionName("AddOrUpdateCustomFlowFormAsync")]
        public async Task<WorkFlowResult> AddOrUpdateCustomFlowFormAsync([FromBody] WorkFlowProcess addProcess)
        {
            addProcess.UserId = UserIdentity.UserId.ToString();
            addProcess.UserName = UserIdentity.UserName;
            return await _workFlowInstanceService.AddOrUpdateCustomFlowFormAsync(addProcess);
        }
        #endregion

        #region 流程待办


        /// <summary>
        /// 流程待办
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> TodoList(int pageIndex = 1, int pageSize = 10)
        {
            WorkFlowTodoSearchDto searchDto = new WorkFlowTodoSearchDto
            {
                PageIndex = pageIndex,
                PageSize = pageSize,
                UserId = UserIdentity.UserId.ToString()
            };
            var page = await _workFlowInstanceService.GetUserTodoListAsync(searchDto);
            return View(page);
        }

        /// <summary>
        /// 首页待办获取
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<DataResult> HomeTodoList()
        {
            DataResult dataResult = new DataResult();
            try
            {
                WorkFlowTodoSearchDto searchDto = new WorkFlowTodoSearchDto
                {
                    PageIndex = 1,
                    PageSize = 10,
                    UserId = UserIdentity.UserId.ToString()
                };
                var page = await _workFlowInstanceService.GetUserTodoListAsync(searchDto);
                dataResult.data = page.Items;
                dataResult.count = page.TotalItems;
                dataResult.code = StateCode.Succees;
                dataResult.msg = "查询待办事项成功！";
            }
            catch (Exception ex)
            {
                dataResult.code = StateCode.Error;
                dataResult.msg = "查询待办事项失败！";
                Debug.WriteLine(ex.Message);
            }
            return dataResult;
        }

        #endregion

        #region 用户流程操作历史记录

        /// <summary>
        /// 用户流程操作历史记录
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> OperationHistory(int pageIndex = 1, int pageSize = 10)
        {
            WorkFlowOperationHistorySearchDto searchDto = new WorkFlowOperationHistorySearchDto
            {
                PageIndex = pageIndex,
                PageSize = pageSize,
                UserId = UserIdentity.UserId.ToString()
            };
            var page = await _workFlowInstanceService.GetUserOperationHistoryAsync(searchDto);
            return View(page);
        }
        #endregion

        /// <summary>
        /// 流程图
        /// </summary>
        /// <param name="instanceId">实例ID</param>
        /// <returns></returns>
        public async Task<IActionResult> FlowImage(Guid flowid, Guid? instanceId)
        {
            var instance = await _workFlowInstanceService.GetFlowImageAsync(flowid, instanceId);
            return View(instance);
        }

        /// <summary>
        /// 流程催办
        /// </summary>
        /// <param name="urge"></param>
        /// <returns></returns>
        [HttpPost]
        [ActionName("UrgeAsync")]
        public async Task<WorkFlowResult> UrgeAsync([FromBody] UrgeDto urge)
        {
            urge.Sender = UserIdentity.UserId.ToString();
            var workflowResult = await _workFlowInstanceService.UrgeAsync(urge);
            if (!workflowResult.Result)
            {
                return workflowResult;
            }
            var urgeTypeArray = urge.UrgeType.Split(',').Where(m => !string.IsNullOrEmpty(m));
            List<long> urgeUserList = workflowResult.Data.ToString().Split(',')
                .Where(m => !string.IsNullOrEmpty(m))
                .Select(m => Convert.ToInt64(m)).ToList();

            // 1、发送SingalR
            MessagePushSomBodyDTO model = new MessagePushSomBodyDTO
            {
                UserIds = urgeUserList,
                Title = urge.Title,
                MsgJson = urge.UrgeContent,
                Sender = urge.Sender.ToInt64(),
                Link = urge.Link
            };
            foreach (var item in urgeTypeArray)
            {
                UrgeType urgeType = (UrgeType)item.ToInt32();
                switch (urgeType)
                {
                    case UrgeType.EMail:
                        UrgeSendEMail();
                        break;
                    case UrgeType.SMS:
                        UrgeSendSMS();
                        break;
                    case UrgeType.WeChat:
                        UrgeSendWeChat();
                        break;
                    case UrgeType.SignalR:
                    default:
                        await UrgeSendSignalR(model);
                        break;
                }
            }
            return WorkFlowResult.Success();
        }

        protected async Task UrgeSendSignalR(MessagePushSomBodyDTO model)
        {
            //入库操作
            int messageid = await _messageService.PushSomeBodyAndInsertDbAsync(model);
            if (messageid == 0)
            {
                throw new Exception("沒有权限操作");
            }
            //消息推送操作
            var users = SignalRMessageGroups.UserGroups.Where(m => model.UserIds.Contains(m.UserId) && m.GroupName == MessageDefault.GroupName).ToList();
            foreach (var item in users)
            {
                await _hubContext.Clients.Client(item.ConnectionId).SendAsync(MessageDefault.ReceiveMessage, new
                {
                    id = 1,
                    Title = model.Title + ":【" + model.MsgJson + "】",
                    model.Link,
                    IsSystem = 1,
                    CreateTime = DateTime.Now.ToTimeStamp()
                });
            }
        }
        protected void UrgeSendEMail()
        {

        }
        protected void UrgeSendSMS()
        {

        }
        protected void UrgeSendWeChat()
        {

        }

    }
}
