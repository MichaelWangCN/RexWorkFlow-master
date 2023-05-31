﻿using JadeFramework.Core.Dapper;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Rex.WorkFlow.Web.Models
{
    /// <summary>
    /// 部门表
    /// </summary>
    [Table("sys_dept")]
    public class SysDept
    {
        /// <summary>
        /// 部门ID
        /// </summary>
        [Key, Identity]
        public long DeptId { get; set; }

        /// <summary>
        /// 部门名称
        /// </summary>
        public string DeptName { get; set; }

        /// <summary>
        /// 部门编码
        /// </summary>
        public string DeptCode { get; set; }

        /// <summary>
        /// 父级ID
        /// </summary>
        public long ParentId { get; set; }

        /// <summary>
        /// 路径
        /// </summary>
        public string Path { get; set; }

        /// <summary>
        /// 是否删除
        /// </summary>
        public byte IsDel { get; set; }

        /// <summary>
        /// 备注
        /// </summary>
        public string Memo { get; set; }

        /// <summary>
        /// 创建人ID
        /// </summary>
        public long CreateUserId { get; set; }

        /// <summary>
        /// 创建时间戳
        /// </summary>
        public long CreateTime { get; set; }

    }

    public sealed class SysDeptMapper : ClassMapper<SysDept>
    {
        public SysDeptMapper()
        {
            Table("sys_dept");
            AutoMap();
        }
    }
}
