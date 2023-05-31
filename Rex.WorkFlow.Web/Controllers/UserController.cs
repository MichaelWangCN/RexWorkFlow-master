using JadeFramework.Core.Domain.Entities;
using JadeFramework.Core.Domain.Result;
using JadeFramework.Core.Extensions;
using JadeFramework.Core.Mvc;
using JadeFramework.Core.Mvc.Extensions;
using JadeFramework.Core.Security;
using Microsoft.Extensions.Logging;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Rex.WorkFlow.Web.Dtos;
using Rex.WorkFlow.Web.Models;
using Rex.WorkFlow.Web.Services;
using System;
using System.IO;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Collections.Generic;

namespace Rex.WorkFlow.Web.Controllers
{
    /// <summary>
    /// 用户管理
    /// </summary>
    [Area("Sys")]
    public class UserController : BaseController
    {
        private readonly ILogger _logger;
        private readonly ISysUserService _sysUserService;
        private readonly IVerificationCode _verificationCode;
        private readonly ISysRoleService _roleService;
        public UserController(
            ILoggerFactory loggerFactory, 
            IVerificationCode verificationCode, 
            ISysUserService sysUserService,
            ISysRoleService roleService
        )
        {
            _logger = loggerFactory.CreateLogger<UserController>();
            _verificationCode = verificationCode;
            _sysUserService = sysUserService;
            _roleService = roleService;
        }

        #region 页面
        /// <summary>
        /// 用户管理
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// 操作(新增|修改)
        /// </summary>
        /// <param name="id">用户ID</param>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> Operation([FromQuery] long id)
        {
            if (id > 0)
            {
                UserShowDto userShowDto = await _sysUserService.GetAsync(id);
                return View(userShowDto);
            }
            return View(new UserShowDto()
            {
                User = new SysUser()
            });
        }

        /// <summary>
        /// 分配角色
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IActionResult AssigningRoles([FromQuery] long userId)
        {
            ViewBag.UserId = userId;
            return View();
        }

        /// <summary>
        /// 分配部门
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IActionResult Dept([FromQuery] long userId)
        {
            ViewBag.UserId = userId;
            return View();
        }

        /// <summary>
        /// 查看详情
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> Details([FromQuery] long id)
        {
            if (id > 0)
            {
                UserShowDto userShowDto = await _sysUserService.GetAsync(id);
                return View(userShowDto);
            }
            return View(new UserShowDto()
            {
                User = new SysUser()
            });
        }

        /// <summary>
        /// 登录
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IActionResult Login()
        {
            string returnUrl = Request.Query["ReturnUrl"].Count == 1 ? Request.Query["ReturnUrl"].ToString().Trim() : string.Empty;
            ViewBag.ReturnUrl = returnUrl;
            return View();
        }

        /// <summary>
        /// 退出
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> LogOut()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return Redirect("Login");
        }
        #endregion

        #region 新增用户信息
        /// <summary>
        /// 新增
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        [ActionName("Add")]
        public async Task<IActionResult> Add(UserShowDto model)
        {
            DataResult dataResult = new DataResult();
            try
            {
                model.User.CreateUserId = UserIdentity.UserId;
                var result = await _sysUserService.AddAsync(model);
                dataResult.code = result ? StateCode.Succees : StateCode.Failed;
                dataResult.msg = "新增用户信息成功！";
            }
            catch (Exception ex)
            {
                dataResult.code = StateCode.Error;
                dataResult.msg = "新增用户信息失败！";
                _logger.LogError(ex.Message);
            }
            return Ok(dataResult);
        }
        #endregion

        #region 编辑用户信息
        /// <summary>
        /// 编辑
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        [HttpPost]
        [ActionName("Update")]
        public async Task<IActionResult> Update(UserShowDto model)
        {
            DataResult dataResult = new DataResult();
            try
            {
                model.User.UpdateUserId = UserIdentity.UserId;
                var result = await _sysUserService.UpdateAsync(model);
                dataResult.code = result ? StateCode.Succees : StateCode.Failed;
                dataResult.msg = "编辑用户信息成功！";
            }
            catch (Exception ex)
            {
                dataResult.code = StateCode.Error;
                dataResult.msg = "编辑用户信息失败！";
                _logger.LogError(ex.Message);
            }
            return Ok(dataResult);
        }
        #endregion

        #region 删除用户信息
        /// <summary>
        /// 逻辑删除
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        [HttpPost]
        [ActionName("Delete")]
        public async Task<IActionResult> Delete([FromBody] List<long> ids)
        {
            DataResult dataResult = new DataResult();
            try
            {
                long userid = UserIdentity.UserId;
                var result = await _sysUserService.DeleteAsync(ids, userid);
                dataResult.code = result ? StateCode.Succees : StateCode.Failed;
                dataResult.msg = "删除用户信息成功！";
            }
            catch (Exception ex)
            {
                dataResult.code = StateCode.Error;
                dataResult.msg = "删除用户信息失败！";
                _logger.LogError(ex.Message);
            }
            return Ok(dataResult);

        }
        #endregion

        #region 获取角色树
        [HttpGet]
        [Authorize]
        [ActionName("RoleBox")]
        public async Task<IActionResult> RoleBox([Bind("userid"), FromQuery] int userId)
        {
            DataResult dataResult = new DataResult();
            try
            {
                List<ZTree> zTreeList = await _roleService.GetTreeAsync(userId);
                dataResult.data = zTreeList;
                dataResult.msg = "获取角色树信息成功！";
                dataResult.code = StateCode.Succees;
            }
            catch (Exception ex)
            {
                dataResult.code = StateCode.Error;
                dataResult.msg = "获取角色树信息失败！";
                _logger.LogError(ex.Message);
            }
            return Ok(dataResult);
        }
        #endregion

        #region 保存用户角色
        [HttpPost]
        [Authorize]
        [ActionName("RoleBoxSave")]
        public async Task<IActionResult> RoleBoxSave([FromBody] RoleBoxDto dto)
        {
            DataResult dataResult = new DataResult();
            try
            {
                dto.CreateUserId = UserIdentity.UserId;
                bool result = await _sysUserService.SaveUserRoleAsync(dto);
                dataResult.msg = result ? "保存用户角色成功！" : "保存用户角色失败";
                dataResult.code = result ? StateCode.Succees : StateCode.Failed;
            }
            catch (Exception ex)
            {
                dataResult.code = StateCode.Error;
                dataResult.msg = "保存用户角色成功异常！";
                _logger.LogError(ex.Message);
            }
            return Ok(dataResult);
        }
        #endregion

        #region 获取用户部门
        /// <summary>
        /// 获取用户部门
        /// </summary>
        /// <param name="userid">用户ID</param>
        /// <returns></returns>
        [HttpGet]
        [Authorize]
        [ActionName("GetUserDept")]
        public async Task<IActionResult> GetUserDept([FromQuery] long userId)
        {
            DataResult dataResult = new DataResult();
            try
            {
                UserDeptViewModel result = await _sysUserService.GetUserDeptAsync(userId);
                dataResult.data = result;
                dataResult.msg = "获取用户部门成功！";
            }
            catch (Exception ex)
            {
                dataResult.code = StateCode.Error;
                dataResult.msg = "获取用户部门异常！";
                _logger.LogError(ex.Message);
            }
            return Ok(dataResult);
        }
        #endregion

        #region 保存用户部门
        /// <summary>
        /// 保存用户部门
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        [HttpPost]
        [Authorize]
        [ActionName("SaveUserDept")]
        public async Task<IActionResult> SaveUserDept([FromBody] UserDeptDto dto)
        {
            DataResult dataResult = new DataResult();
            try
            {
                bool result = await _sysUserService.SaveUserDeptAsync(dto);
                dataResult.code = result ? StateCode.Succees : StateCode.Failed;
                dataResult.msg = result ? "获取用户部门成功！" : "获取用户部门失败！";
            }
            catch (Exception ex)
            {
                dataResult.code = StateCode.Error;
                dataResult.msg = "保存用户部门异常！";
                _logger.LogError(ex.Message);
            }
            return Ok(dataResult);
        }
        #endregion

        #region 验证登录账号是否存在
        /// <summary>
        /// 验证登录账号是否存在
        /// </summary>
        /// <param name="account">登录账号</param>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> CheckAccount([FromQuery] string account, [FromQuery] long userId)
        {
            DataResult dataResult = new DataResult();
            try
            {
                var result = await _sysUserService.CheckAccountIsExist(account, userId);
                dataResult.data = result;
                dataResult.msg = result ? "该登录账号已存在！" : "该登录账号不存在！";
            }
            catch (Exception ex)
            {
                dataResult.code = StateCode.Error;
                dataResult.msg = ex.Message;
                _logger.LogError(ex.Message);
            }
            return Ok(dataResult);
        }
        #endregion

        #region 分页查询用户信息
        /// <summary>
        /// 分页查询用户信息
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> FindUserPage([FromQuery] UserIndexSearch search)
        {
            DataResult dataResult = new DataResult();
            try
            {
                if (search.PageIndex.IsDefault())
                {
                    search.PageIndex = 1;
                }
                if (search.PageSize.IsDefault())
                {
                    search.PageSize = 10;
                }
                var result = await _sysUserService.GetUserPageAsync(search);
                dataResult.count = result.Users.TotalItems;
                dataResult.data = result.Users.Items;
                dataResult.msg = "查询分页成功！";
            }
            catch (Exception ex)
            {
                dataResult.code = StateCode.Error;
                dataResult.msg = ex.Message;
                _logger.LogError(ex.Message);
            }
            return Ok(dataResult);
        }
        #endregion

        #region 图片验证码
        /// <summary>
        /// 图片验证码
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IActionResult ShowValidateCode()
        {
            // 1.得到验证码
            string vc = string.Empty;

            // 2.生成验证码
            MemoryStream msValidateCode = _verificationCode.Create(out vc);

            // 3.存储到Session
            HttpContext.Session.SetString("validateCode", vc);

            return File(msValidateCode.ToArray(), "image/jpeg");
        }
        #endregion

        #region 用户登录
        /// <summary>
        /// 登录
        /// </summary>
        /// <param name="model">登录参数</param>
        /// <returns></returns>
        [HttpPost]
        [AllowAnonymous]
        public async Task<LoginResult<UserIdentity>> Login([FromBody] UserLoginDto model)
        {
            // 1、验证是否为空
            if (string.IsNullOrEmpty(model.username) || string.IsNullOrEmpty(model.password))
            {
                return new LoginResult<UserIdentity>
                {
                    Message = "用户名或密码无效！",
                    LoginStatus = LoginStatus.Error
                };
            }
            if (model.validatecode.IsNullOrEmpty())
            {
                return new LoginResult<UserIdentity>
                {
                    Message = "请输入验证码！",
                    LoginStatus = LoginStatus.Error
                };
            }

            // 2、验证码校验
            string serverValidateCode = HttpContext.Session.GetString("validateCode");
            if (!model.validatecode.Equals(serverValidateCode,StringComparison.InvariantCultureIgnoreCase))
            {
                HttpContext.Session.Remove("validateCode");
                return new LoginResult<UserIdentity>
                {
                    Message = "验证码错误！",
                    LoginStatus = LoginStatus.Error
                };
            }
            HttpContext.Session.Remove("validateCode");

            // 3、登录校验
            var loginresult = await _sysUserService.LoginAsync(model.username, model.password);
            if (loginresult != null && loginresult.LoginStatus == LoginStatus.Success)
            {
                await SaveLogin(loginresult);
                return new LoginResult<UserIdentity>
                {
                    LoginStatus = LoginStatus.Success,
                    Message = "登录成功"
                };
            }
            else
            {
                _logger.LogError(loginresult?.Message);
                return new LoginResult<UserIdentity>
                {
                    Message = loginresult?.Message,
                    LoginStatus = LoginStatus.Error
                };
            }
        }
        private async Task SaveLogin(ILoginResult<UserIdentity> loginResult)
        {
            ClaimsIdentity identity = new ClaimsIdentity(CookieAuthenticationDefaults.AuthenticationScheme);
            identity.AddClaims(loginResult.User.ToClaims());
            await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(identity));
        }
        #endregion

    }
}
