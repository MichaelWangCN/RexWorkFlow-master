﻿using JadeFramework.Core.Dapper;
using JadeFramework.Core.Extensions;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Rex.WorkFlow.Web.Models
{
    /// <summary>
    /// 用户表
    /// </summary>
    [Table("sys_user")]
    public class SysUser
    {
        public SysUser()
        {
            this.CreateTime = DateTime.Now.ToTimeStamp();
        }

        /// <summary>
        /// 用户ID
        /// </summary>
        [Key, Identity]
        public long UserId { get; set; }

        /// <summary>
        /// 账号
        /// </summary>
        public string Account { get; set; }

        /// <summary>
        /// 用户名
        /// </summary>
        public string UserName { get; set; }

        /// <summary>
        /// 工号
        /// </summary>
        public string JobNumber { get; set; }

        /// <summary>
        /// 密码
        /// </summary>
        public string Password { get; set; }

        /// <summary>
        /// 头像地址
        /// </summary>
        public string HeadImg { get; set; }

        /// <summary>
        /// 是否删除 1:是，0：否
        /// </summary>
        public byte IsDel { get; set; }

        /// <summary>
        /// 创建人ID
        /// </summary>
        public long CreateUserId { get; set; }

        /// <summary>
        /// 时间戳
        /// </summary>
        public long CreateTime { get; set; }

        /// <summary>
        /// 更新人
        /// </summary>
        public long? UpdateUserId { get; set; }

        /// <summary>
        /// 更新时间
        /// </summary>
        public long? UpdateTime { get; set; }
    }

    internal sealed class SysUserMapper : ClassMapper<SysUser>
    {
        public SysUserMapper()
        {
            Table("sys_user");
            AutoMap();
        }
    }
}
