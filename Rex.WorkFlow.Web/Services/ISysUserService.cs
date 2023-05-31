using JadeFramework.Core.Domain.Entities;
using JadeFramework.Core.Domain.Result;
using Rex.WorkFlow.Web.Dtos;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Services
{
    /// <summary>
    /// 用户表接口
    /// </summary>
    /// <remarks>
    /// @创 建 者：Rex
    /// @创建日期：2021/2/23 21:07:05
    /// </remarks>
    public interface ISysUserService
    {
        /// <summary>
        /// 登录
        /// </summary>
        /// <param name="account">账号</param>
        /// <param name="password">密码</param>
        /// <returns></returns>
        Task<ILoginResult<UserIdentity>> LoginAsync(string account, string password);

        /// <summary>
        /// 获取用户列表
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        Task<UserIndexViewModel> GetUserPageAsync(UserIndexSearch search);

        /// <summary>
        /// 查询用户信息
        /// </summary>
        /// <param name="userid">用户编号</param>
        /// <returns></returns>
        Task<UserShowDto> GetAsync(long userid);

        /// <summary>
        /// 验证登录账号是否存在
        /// </summary>
        /// <param name="account">登录账号</param>
        /// <param name="userId">用户编号</param>
        /// <returns></returns>
        Task<bool> CheckAccountIsExist(string account, long userId);

        /// <summary>
        /// 新增用户
        /// </summary>
        /// <param name="dto">用户对象</param>
        /// <returns></returns>
        Task<bool> AddAsync(UserShowDto dto);

        /// <summary>
        /// 编辑用户
        /// </summary>
        /// <param name="dto">用户对象</param>
        /// <returns></returns>
        Task<bool> UpdateAsync(UserShowDto dto);

        /// <summary>
        /// 逻辑删除
        /// </summary>
        /// <param name="ids"></param>
        /// <param name="userid"></param>
        /// <returns></returns>
        Task<bool> DeleteAsync(List<long> ids, long userid);

        /// <summary>
        /// 保存用户角色
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        Task<bool> SaveUserRoleAsync(RoleBoxDto dto);

        /// <summary>
        /// 用户部门
        /// </summary>
        /// <param name="userid">用户ID</param>
        /// <returns></returns>
        Task<UserDeptViewModel> GetUserDeptAsync(long userid);

        /// <summary>
        /// 保存用户部门
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        Task<bool> SaveUserDeptAsync(UserDeptDto dto);

        Task<List<ZTree>> GetUserTreeAsync(List<long> ids);

    }
}
