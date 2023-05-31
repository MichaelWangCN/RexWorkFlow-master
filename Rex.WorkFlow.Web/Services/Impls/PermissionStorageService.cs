﻿using JadeFramework.Cache;
using JadeFramework.Core.Domain.Container;
using JadeFramework.Core.Domain.Entities;
using JadeFramework.Core.Domain.Permission;
using JadeFramework.Core.Mvc.Extensions;
using JadeFramework.Redis;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using System;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Services.Impls
{
    /// <summary>
    /// permission storage
    /// </summary>
    /// <remarks>
    /// @创 建 者：Rex
    /// @创建日期：2021/2/24 11:44:27
    /// </remarks>
    public class PermissionStorageService : IPermissionStorageContainer
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly ISysResourceService _resourceService;
        private readonly ICachingProvider _cacheFactory;
        public PermissionStorageService(
            ICachingProvider cacheFactory,
            IHttpContextAccessor httpContextAccessor,
            ISysResourceService resourceService)
        {
            _cacheFactory = cacheFactory;
            _httpContextAccessor = httpContextAccessor;
            _resourceService = resourceService;
        }

        private UserIdentity UserIdentity()
        {
            return _httpContextAccessor.HttpContext.User.ToUserIdentity();
        }
        /// <summary>
        /// 权限KEY
        /// </summary>
        public string Key => "PERMISSION_" + UserIdentity().UserId;

        /// <summary>
        /// 存储数据
        /// </summary>
        /// <param name="obj"></param>
        public void Store(object obj)
        {
            string json = JsonConvert.SerializeObject(obj);
            _cacheFactory.Set(this.Key, json);
        }

        /// <summary>
        /// 获取缓存
        /// </summary>
        /// <returns></returns>
        public object Get()
        {
            var res = _cacheFactory.Get(this.Key);
            return res;
        }

        /// <summary>
        /// 异步获取用户权限
        /// </summary>
        /// <returns></returns>
        public async Task<UserPermission> GetPermissionAsync()
        {
            long userid = UserIdentity().UserId;
            string res = this.Get() as string;
            if (string.IsNullOrEmpty(res))
            {
                var permission = await _resourceService.GetUserPermissionAsync(userid);
                this.Store(permission);
                return permission;
            }
            return JsonConvert.DeserializeObject<UserPermission>(res);
        }



        /// <summary>
        /// 异步初始化权限
        /// </summary>
        /// <returns></returns>
        public async Task InitAsync()
        {
            long userid = UserIdentity().UserId;
            var permission = await _resourceService.GetUserPermissionAsync(userid);
            this.Store(permission);
        }
    }

    public class RedisPermissionStorageService : IPermissionStorageContainer
    {

        private static RedisClient _redisClient;
        private IHttpContextAccessor _httpContextAccessor;
        private ISysResourceService _resourceService;
        public RedisPermissionStorageService(
            IHttpContextAccessor httpContextAccessor,
            IConfiguration Configuration,
            ISysResourceService resourceService)
        {
            _httpContextAccessor = httpContextAccessor;
            _resourceService = resourceService;

            _redisClient = RedisClientSingleton.GetInstance(Configuration);
        }
        private UserIdentity UserIdentity()
        {
            return _httpContextAccessor.HttpContext.User.ToUserIdentity();
        }

        /// <summary>
        /// 权限KEY
        /// </summary>
        public string Key => "PERMISSION_" + UserIdentity().UserId;

        /// <summary>
        /// 存储数据
        /// </summary>
        /// <param name="obj"></param>
        public void Store(object obj)
        {
            string json = JsonConvert.SerializeObject(obj);
            _redisClient.GetDefaultDatabase().StringSet(this.Key, json);
        }

        /// <summary>
        /// 获取缓存
        /// </summary>
        /// <returns></returns>
        public object Get()
        {
            var res = _redisClient.GetDefaultDatabase().StringGet(this.Key);
            return res;
        }

        /// <summary>
        /// 异步获取用户权限
        /// </summary>
        /// <returns></returns>
        public async Task<UserPermission> GetPermissionAsync()
        {
            long userid = UserIdentity().UserId;
            string res = this.Get() as string;
            if (string.IsNullOrEmpty(res))
            {
                var permission = await _resourceService.GetUserPermissionAsync(userid);
                this.Store(permission);
                return permission;
            }
            return JsonConvert.DeserializeObject<UserPermission>(res);
        }



        /// <summary>
        /// 异步初始化权限
        /// </summary>
        /// <returns></returns>
        public async Task InitAsync()
        {
            long userid = UserIdentity().UserId;
            var permission = await _resourceService.GetUserPermissionAsync(userid);
            this.Store(permission);
        }
    }

}
