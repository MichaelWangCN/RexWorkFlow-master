﻿using JadeFramework.Core.Domain.Entities;
using Rex.WorkFlow.Web.Dtos;
using Rex.WorkFlow.Web.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Services
{
    /// <summary>
    /// 角色
    /// </summary>
    public interface ISysRoleService
    {
        /// <summary>
        /// 获取角色列表
        /// </summary>
        /// <param name="search">查询条件</param>
        /// <param name="isSearchPage">是否查询分页信息</param>
        /// <returns></returns>
        Task<RoleIndexViewModel> GetListAsync(RoleIndexSearch search, bool isSearchPage = false);

        /// <summary>
        /// 获取角色基本信息
        /// </summary>
        /// <param name="roleid">角色ID</param>
        /// <returns></returns>
        Task<SysRole> GetAsync(long roleid);

        /// <summary>
        /// 新增角色
        /// </summary>
        /// <param name="role"></param>
        /// <returns></returns>
        Task<bool> AddAsync(SysRole role);

        /// <summary>
        /// 编辑角色
        /// </summary>
        /// <param name="role"></param>
        /// <returns></returns>
        Task<bool> UpdateAsync(SysRole role);

        /// <summary>
        /// 获取该角色下的用户
        /// </summary>
        /// <param name="roleid">角色ID</param>
        /// <param name="pageIndex">当前页</param>
        /// <param name="pageSize">每页大小</param>
        /// <returns></returns>
        Task<Page<SysUser>> GetRoleUserAsync(long roleid, int pageIndex, int pageSize);

        /// <summary>
        /// 逻辑删除
        /// </summary>
        /// <param name="ids"></param>
        /// <param name="userid"></param>
        /// <returns></returns>
        Task<bool> DeleteAsync(List<long> ids, long userid);

        /// <summary>
        /// 获取角色树
        /// </summary>
        /// <param name="userid">用户ID</param>
        /// <returns></returns>
        Task<List<ZTree>> GetTreeAsync(long userid);

        /// <summary>
        /// 删除角色下的用户
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        Task<bool> DeleteUserAsync(RoleToUserDto dto);

        /// <summary>
        /// 角色加入用户
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        Task<bool> AddUserAsync(RoleToUserDto dto);

        /// <summary>
        /// 获取角色树
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        Task<List<ZTree>> GetRoleTreesAsync(List<long> ids);
    }
}
