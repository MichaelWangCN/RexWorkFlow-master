using JadeFramework.Core.Domain.Entities;
using JadeFramework.Core.Mvc;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Rex.WorkFlow.Web.Services;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Controllers
{
    [Area("WF")]
    [Authorize]
    public class ConfigController : BaseController
    {
        private readonly ISysRoleService sysRoleService;
        private readonly ISysUserService sysUserService;

        public ConfigController(ISysRoleService sysRoleService, ISysUserService sysUserService)
        {
            this.sysRoleService = sysRoleService;
            this.sysUserService = sysUserService;
        }

        [HttpPost]
        [ActionName("GetRoleTreesAsync")]
        public async Task<List<ZTree>> GetRoleTreesAsync(List<long> ids)
        {
            return await sysRoleService.GetRoleTreesAsync(ids);
        }

        [HttpPost]
        [ActionName("GetUserTreeAsync")]
        public async Task<List<ZTree>> GetUserTreeAsync(List<long> ids)
        {
            return await sysUserService.GetUserTreeAsync(ids);
        }
    }
}
