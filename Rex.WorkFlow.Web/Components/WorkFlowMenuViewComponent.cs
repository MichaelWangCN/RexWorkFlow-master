using JadeFramework.WorkFlow;
using Microsoft.AspNetCore.Mvc;
using Rex.WorkFlow.Web.Services;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Components
{
    /// <summary>
    /// WorkFlowMenuViewComponent
    /// </summary>
    /// <remarks>
    /// @创 建 者：Rex
    /// @创建日期：2021/3/4 16:32:23
    /// </remarks>
    public class WorkFlowMenuViewComponent : ViewComponent
    {
        private readonly IWorkFlowInstanceService workFlowInstanceService;

        public WorkFlowMenuViewComponent(IWorkFlowInstanceService workFlowInstanceService)
        {
            this.workFlowInstanceService = workFlowInstanceService;
        }

        public async Task<IViewComponentResult> InvokeAsync(WorkFlowProcess process)
        {
            return View(process);
        }
    }
}
