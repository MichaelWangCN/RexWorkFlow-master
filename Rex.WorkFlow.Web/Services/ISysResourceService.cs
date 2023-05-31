using JadeFramework.Core.Domain.Entities;
using JadeFramework.Core.Domain.Permission;
using Rex.WorkFlow.Web.Dtos;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Services
{
    /// <summary>
    /// 资源服务接口
    /// </summary>
    /// <remarks>
    /// @创 建 者：Rex
    /// @创建日期：2021/2/24 11:35:48
    /// </remarks>
    public interface ISysResourceService
    {
        /// <summary>
        /// 获取树形菜单
        /// </summary>
        /// <param name="systemId">系统ID</param>
        /// <returns></returns>
        Task<ResourceIndexViewModel> GetTreeAsync(long systemId);

        /// <summary>
        /// 获取资源信息
        /// </summary>
        /// <param name="id"></param>
        /// <param name="systemid"></param>
        /// <returns></returns>
        Task<ResourceShowViewModel> GetResourceAsync(long id, long systemid);

        /// <summary>
        /// 新增
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        Task<bool> AddAsync(ResourceShowDto dto);

        /// <summary>
        /// 编辑
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        Task<bool> UpdateAsync(ResourceShowDto dto);

        /// <summary>
        /// 删除菜单
        /// </summary>
        /// <param name="ids"></param>
        /// <param name="userid"></param>
        /// <returns></returns>
        Task<bool> DeleteAsync(long[] ids, long userid);

        Task<IList<SelectListItem>> GetSystemItems(long systemId);

        Task<IList<SysResourceTree>> GetResourceTreeAsync(long systemId);

        /// <summary>
        /// 根据用户获取左侧菜单列表
        /// </summary>
        /// <param name="userid">用户ID</param>
        /// <returns></returns>
        Task<List<ResourceTreeViewModel>> GetLeftTreeAsync(long userid);

        /// <summary>
        /// 异步获取用户操作权限
        /// </summary>
        /// <param name="userid">用户ID</param>
        /// <returns></returns>
        Task<UserPermission> GetUserPermissionAsync(long userid);

        /// <summary>
        /// 获取树形数据
        /// </summary>
        /// <param name="roleid">角色ID</param>
        /// <returns></returns>
        Task<List<ZTree>> GetBoxTreeAsync(long roleid);

        /// <summary>
        /// 角色分配资源保存
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        Task<bool> BoxSaveAsync(RoleTreeDto dto);
    }
}
