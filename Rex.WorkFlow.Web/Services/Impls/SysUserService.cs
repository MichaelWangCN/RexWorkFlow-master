using JadeFramework.Core.Domain.Entities;
using JadeFramework.Core.Domain.Result;
using JadeFramework.Core.Extensions;
using JadeFramework.Core.Security;
using Rex.WorkFlow.Web.Dtos;
using Rex.WorkFlow.Web.Models;
using Rex.WorkFlow.Web.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Services.Impls
{
    /// <summary>
    /// 用户表的接口实现
    /// </summary>
    /// <remarks>
    /// @创 建 者：Rex
    /// @创建日期：2021/2/24 9:15:58
    /// </remarks>
    public class SysUserService : ISysUserService
    {
        private readonly ISysDatabaseFixture _databaseFixture;
        private readonly ILogJobs _logJobs;
        public SysUserService(ISysDatabaseFixture databaseFixture, ILogJobs logJobs)
        {
            _databaseFixture = databaseFixture;
            _logJobs = logJobs;
        }

        /// <summary>
        /// 获取用户列表
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        public async Task<UserIndexViewModel> GetUserPageAsync(UserIndexSearch search)
        {
            UserIndexViewModel model = new UserIndexViewModel()
            {
                Users = await _databaseFixture.Db.SysUser.GetPageAsync(search),
                Search = search
            };
            return model;
        }

        /// <summary>
        /// 查询用户信息
        /// </summary>
        /// <param name="userid">用户编号</param>
        /// <returns></returns>
        public async Task<UserShowDto> GetAsync(long userid)
        {
            UserShowDto model = new UserShowDto
            {
                User = new SysUser()
            };
            if (userid > 0)
            {
                var dbuser = await _databaseFixture.Db.SysUser.FindAsync(m => m.UserId == userid);
                model.User.UserName = dbuser.UserName;
                model.User.HeadImg = dbuser.HeadImg;
                model.User.UserId = dbuser.UserId;
                model.User.Account = dbuser.Account;
                model.User.CreateTime = dbuser.CreateTime;
                model.User.JobNumber = dbuser.JobNumber;
                model.User.IsDel = dbuser.IsDel;
            }
            return model;
        }

        /// <summary>
        /// 验证登录账号是否存在
        /// </summary>
        /// <param name="account">登录账号</param>
        /// <param name="userId">用户编号</param>
        /// <returns></returns>
        public async Task<bool> CheckAccountIsExist(string account, long userId)
        {
            var sysUser = await _databaseFixture.Db.SysUser.FindAsync(m => m.Account == account && m.UserId != userId);
            return sysUser != null;
        }

        /// <summary>
        /// 新增用户
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        public async Task<bool> AddAsync(UserShowDto dto)
        {
            try
            {
                SysUser sysUser = new SysUser
                {
                    UserName = dto.User.UserName,
                    Account = dto.User.Account,
                    IsDel = dto.User.IsDel
                };
                sysUser.CreateTime = DateTime.Now.ToTimeStamp();
                sysUser.Password = EncryptProvider.CreateSha1Code(dto.User.Password);

                //工号生成
                sysUser.JobNumber = DateTime.Now.ToString("yyyyMMdd") + DateTime.Now.ToString("ff");

                await _databaseFixture.Db.SysUser.InsertAsync(sysUser);
                return true;
            }
            catch (Exception e)
            {
                _logJobs.ExceptionLog(dto.User.CreateUserId, e);
                return false;
            }
        }

        /// <summary>
        /// 编辑用户
        /// </summary>
        /// <param name="dto">用户对象</param>
        /// <returns></returns>
        public async Task<bool> UpdateAsync(UserShowDto dto)
        {
            try
            {
                var dbuser = await _databaseFixture.Db.SysUser.FindAsync(m => m.UserId == dto.User.UserId);
                if (dbuser == null)
                {
                    return false;
                }
                dbuser.UserName = dto.User.UserName;
                dbuser.Account = dto.User.Account;
                dbuser.IsDel = dto.User.IsDel;
                dbuser.UpdateTime = DateTime.Now.ToTimeStamp();
                dbuser.UpdateUserId = dto.User.UpdateUserId;
                await _databaseFixture.Db.SysUser.UpdateAsync(dbuser);
                return true;
            }
            catch (Exception e)
            {
                _logJobs.ExceptionLog(dto.User.UserId, e);
                return false;
            }
        }

        /// <summary>
        /// 保存用户角色
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        public async Task<bool> SaveUserRoleAsync(RoleBoxDto dto)
        {
            using (var tran = _databaseFixture.Db.BeginTransaction())
            {
                try
                {
                    var userrolelist = await _databaseFixture.Db.SysUserRole.FindAllAsync(m => m.UserId == dto.UserId);
                    var dbuserrole = userrolelist.ToList();
                    if (dbuserrole.HasItems())
                    {
                        foreach (var item in dbuserrole)
                        {
                            await _databaseFixture.Db.SysUserRole.DeleteAsync(item, tran);
                        }
                    }
                    if (dto.RoleIds.HasItems())
                    {
                        foreach (var item in dto.RoleIds)
                        {
                            SysUserRole userrole = new SysUserRole()
                            {
                                UserId = dto.UserId,
                                RoleId = item,
                                CreateTime = DateTime.Now.ToTimeStamp()
                            };
                            await _databaseFixture.Db.SysUserRole.InsertAsync(userrole, tran);
                        }
                    }
                    tran.Commit();
                    return true;
                }
                catch (Exception ex)
                {
                    tran.Rollback();
                    _logJobs.ExceptionLog(dto.CreateUserId, ex);
                    return false;
                }
            }
        }


        /// <summary>
        /// 用户部门
        /// </summary>
        /// <param name="userid">用户ID</param>
        /// <returns></returns>
        public async Task<UserDeptViewModel> GetUserDeptAsync(long userid)
        {
            UserDeptViewModel userDept = new UserDeptViewModel()
            {
                DeptId = 0
            };
            var user = await _databaseFixture.Db.SysUser.FindByIdAsync(userid);
            if (user != null)
            {
                userDept.UserId = user.UserId;
                userDept.UserName = user.UserName;
                var dbuserdept = await _databaseFixture.Db.SysUserDept.FindAsync(m => m.UserId == user.UserId);
                var dbdepts = await _databaseFixture.Db.SysDept.FindAllAsync(m => m.IsDel == 0);
                userDept.Depts = dbdepts.Select(m => new SelectListItem()
                {
                    Value = m.DeptId.ToString(),
                    Text = m.DeptName,
                    Selected = false
                }).ToList();
                if (dbuserdept != null)
                {
                    userDept.DeptId = dbuserdept.DeptId;
                    foreach (var item in userDept.Depts)
                    {
                        if (item.Value == dbuserdept.DeptId.ToString())
                        {
                            item.Selected = true;
                            break;
                        }
                    }
                }
            }
            return userDept;
        }

        /// <summary>
        /// 保存用户部门
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        public async Task<bool> SaveUserDeptAsync(UserDeptDto dto)
        {
            using (var tran = _databaseFixture.Db.BeginTransaction())
            {
                try
                {
                    //删除
                    var dbdata = await _databaseFixture.Db.SysUserDept.FindAsync(m => m.UserId == dto.UserId);
                    if (dbdata != null)
                    {
                        await _databaseFixture.Db.SysUserDept.DeleteAsync(dbdata, tran);
                        //部门ID相同 不保存
                        if (dbdata.DeptId == dto.DeptId)
                        {
                            return true;
                        }
                    }

                    //保存
                    SysUserDept userDept = new SysUserDept()
                    {
                        UserId = dto.UserId,
                        DeptId = dto.DeptId,
                        CreateTime = DateTime.Now.ToTimeStamp()
                    };
                    await _databaseFixture.Db.SysUserDept.InsertAsync(userDept, tran);

                    tran.Commit();
                    return true;
                }
                catch
                {
                    tran.Rollback();
                    return false;
                }
            }
        }

        /// <summary>
        /// 逻辑删除
        /// </summary>
        /// <param name="ids"></param>
        /// <param name="userid"></param>
        /// <returns></returns>
        public async Task<bool> DeleteAsync(List<long> ids, long userid)
        {
            using (var tran = _databaseFixture.Db.BeginTransaction())
            {
                try
                {
                    var dbuses = await _databaseFixture.Db.SysUser.FindAllAsync(m => m.IsDel == 0 && ids.Contains(m.UserId));
                    foreach (var item in dbuses)
                    {
                        item.IsDel = 1;
                        await _databaseFixture.Db.SysUser.UpdateAsync(item, tran);
                    }
                    tran.Commit();
                    return true;
                }
                catch (Exception ex)
                {
                    tran.Rollback();
                    _logJobs.ExceptionLog(userid, ex);
                    return false;
                }
            }
        }

        /// <summary>
        /// 登录
        /// </summary>
        /// <param name="account">账号</param>
        /// <param name="password">密码</param>
        /// <returns></returns>
        public async Task<ILoginResult<UserIdentity>> LoginAsync(string account, string password)
        {
            ILoginResult<UserIdentity> loginResult = new LoginResult<UserIdentity>();
            try
            {
                if (account.IsNullOrEmpty() || password.IsNullOrEmpty())
                {
                    loginResult.LoginStatus = LoginStatus.Error;
                    loginResult.Message = "请输入用户名或密码";
                    return loginResult;
                }
                string pwd = EncryptProvider.CreateSha1Code(password);
                account = account.TrimBlank();
                SysUser dbuser = await _databaseFixture.Db.SysUser.FindAsync(m => m.IsDel == 0 && m.Account == account && m.Password == pwd);
                if (dbuser == null)
                {
                    loginResult.Message = "用户名或密码错误！";
                    loginResult.LoginStatus = LoginStatus.Error;
                }
                else
                {
                    _logJobs.LoginLog(dbuser.UserId, dbuser.UserName);
                    loginResult.User = new UserIdentity
                    {
                        UserId = dbuser.UserId,
                        UserName = dbuser.UserName,
                        HeadImg = dbuser.HeadImg,
                        Sex = UserSex.Unknown,
                        CreateTime = dbuser.CreateTime.ToDateTime()
                    };
                    loginResult.LoginStatus = LoginStatus.Success;
                }
            }
            catch (Exception ex)
            {
                loginResult.Message = ex.Message;
                loginResult.LoginStatus = LoginStatus.Exception;
                _logJobs.ExceptionLog(0, ex);
            }
            return loginResult;
        }

        public async Task<List<ZTree>> GetUserTreeAsync(List<long> ids)
        {
            var dbuser = await _databaseFixture.Db.SysUser.FindAllAsync(m => m.IsDel == 0);
            return dbuser.Select(m => new ZTree
            {
                id = m.UserId.ToString(),
                name = m.UserName,
                open = true,
                @checked = ids.Contains(m.UserId)
            }).ToList();
        }

    }
}
