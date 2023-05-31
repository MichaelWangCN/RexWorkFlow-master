using JadeFramework.Core.Domain.Entities;
using JadeFramework.Core.Extensions;
using Rex.WorkFlow.Web.Dtos;
using Rex.WorkFlow.Web.Models;
using Rex.WorkFlow.Web.Repositories;
using Rex.WorkFlow.Web.Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Services.Impls
{
    /// <summary>
    /// SysDeptService
    /// </summary>
    /// <remarks>
    /// @创 建 者：Rex
    /// @创建日期：2021/2/28 14:24:54
    /// </remarks>
    public class SysDeptService : ISysDeptService
    {
        private readonly ISysDatabaseFixture _databaseFixture;
        private readonly ILogJobs _logJobs;
        public SysDeptService(ISysDatabaseFixture databaseFixture, ILogJobs logJobs)
        {
            _databaseFixture = databaseFixture;
            _logJobs = logJobs;
        }


        public async Task<DeptIndexViewModel> GetTreeAsync()
        {
            DeptIndexViewModel model = new DeptIndexViewModel();
            var list = await _databaseFixture.Db.SysDept.FindAllAsync();
            var dblist = list.ToList();
            List<DeptTreeViewModel> trees = new List<DeptTreeViewModel>();
            foreach (var item in dblist.Where(m => m.ParentId == 0))
            {
                DeptTreeViewModel tree = new DeptTreeViewModel
                {
                    DeptId = item.DeptId,
                    DeptName = item.DeptName,
                    DeptCode = item.DeptCode,
                    ParentId = item.ParentId,
                    IsDel = item.IsDel,
                    Memo = item.Memo
                };

                tree.Children = dblist.Where(m => m.ParentId == tree.DeptId)
                    .Select(m => new DeptTreeViewModel()
                    {
                        DeptId = m.DeptId,
                        DeptName = m.DeptName,
                        DeptCode = m.DeptCode,
                        ParentId = m.ParentId,
                        IsDel = m.IsDel,
                        Memo = m.Memo
                    }).ToList();

                var tempchild = tree.Children;
                GetChildren(ref tempchild, ref dblist);
                tree.Children = tempchild;
                trees.Add(tree);
            }
            model.DeptTree = trees;
            return model;
        }

        public async Task<IList<SysDeptTree>> GetDeptTreeAsync(string deptName, string IsDel)
        {
            deptName = string.IsNullOrEmpty(deptName) ? string.Empty : deptName.Trim();
            string _where = string.Empty;
            if (!string.IsNullOrEmpty(IsDel))
            {
                _where = $" AND IsDel = { IsDel }";
            }
            string sql = $"SELECT * FROM sys_dept WHERE DeptName LIKE '%{ deptName }%'" + _where;
            var deptData = await _databaseFixture.Db.SysDept.QueryAsync(sql); 

            IList<SysDept> deptList = deptData.ToList();
            IList<SysDeptTree> sdtList = deptList.MapToList<SysDept, SysDeptTree>();
            return sdtList;
        }

        /// <summary>
        /// 获取子节点集合
        /// </summary>
        /// <param name="child"></param>
        /// <param name="list"></param>
        private void GetChildren(ref List<DeptTreeViewModel> child, ref List<SysDept> list)
        {
            foreach (var item in child)
            {
                item.Children = list.Where(m => m.ParentId == item.DeptId)
                    .Select(m => new DeptTreeViewModel
                    {
                        DeptId = m.DeptId,
                        DeptName = m.DeptName,
                        DeptCode = m.DeptCode,
                        ParentId = m.ParentId,
                        IsDel = m.IsDel,
                        Memo = m.Memo
                    }).ToList();
                var tempchild = item.Children;
                GetChildren(ref tempchild, ref list);
                item.Children = tempchild;
            }
        }

        /// <summary>
        /// 获取部门信息
        /// </summary>
        /// <param name="deptid"></param>
        /// <returns></returns>
        public async Task<DeptShowViewModel> GetDeptAsync(long deptid)
        {
            DeptShowViewModel model;
            if (deptid > 0)
            {
                model = new DeptShowViewModel
                {
                    SysDept = await _databaseFixture.Db.SysDept.FindAsync(m => m.DeptId == deptid)
                };
            }
            else
            {
                model = new DeptShowViewModel()
                {
                    SysDept = new SysDept()
                };
            }
            var dblist = await _databaseFixture.Db.SysDept.FindAllAsync(m => m.IsDel == 0 && m.DeptId != deptid);
            model.ParentMenus = dblist.ToList()
                .Select(m => new ZTree()
                {
                    id = m.DeptId.ToString(),
                    name = m.DeptName,
                    pId = m.ParentId
                }).ToList();
            return model;
        }

        public async Task<bool> AddAsync(DeptShowDto dto)
        {
            using (var tran = _databaseFixture.Db.BeginTransaction())
            {
                try
                {
                    dto.sysDept.CreateTime = DateTime.Now.ToTimeStamp();
                    await _databaseFixture.Db.SysDept.InsertAsync(dto.sysDept, tran);

                    //path
                    string path = "";
                    if (dto.sysDept.ParentId > 0)
                    {
                        var parentres = await _databaseFixture.Db.SysDept.FindAsync(m => m.DeptId == dto.sysDept.ParentId);
                        if (parentres != null)
                        {
                            path = parentres.Path;
                        }
                    }
                    dto.sysDept.Path = path.IsNullOrEmpty() ? dto.sysDept.DeptId.ToString() : path + ":" + dto.sysDept.DeptId;
                    await _databaseFixture.Db.SysDept.UpdateAsync(dto.sysDept, tran);

                    tran.Commit();
                    return true;
                }
                catch (Exception ex)
                {
                    tran.Rollback();
                    _logJobs.ExceptionLog(dto.sysDept.CreateUserId, ex);
                    return false;
                }
            }
        }

        /// <summary>
        /// 编辑
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        public async Task<bool> UpdateAsync(DeptShowDto dto)
        {
            using (var tran = _databaseFixture.Db.BeginTransaction())
            {
                try
                {
                    var dbdept = await _databaseFixture.Db.SysDept.FindAsync(m => m.DeptId == dto.sysDept.DeptId);
                    if (dbdept == null)
                    {
                        return false;
                    }

                    #region 基本信息

                    dbdept.DeptName = dto.sysDept.DeptName;
                    dbdept.DeptCode = dto.sysDept.DeptCode;
                    dbdept.ParentId = dto.sysDept.ParentId;
                    dbdept.IsDel = dto.sysDept.IsDel;
                    dbdept.Memo = dto.sysDept.Memo;

                    //path
                    string path = "";
                    if (dto.sysDept.ParentId > 0)
                    {
                        var parentres = await _databaseFixture.Db.SysDept.FindAsync(m => m.DeptId == dto.sysDept.ParentId);
                        if (parentres != null)
                        {
                            path = parentres.Path;
                        }
                    }
                    dbdept.Path = path.IsNullOrEmpty() ? dto.sysDept.DeptId.ToString() : path + ":" + dto.sysDept.DeptId;

                    await _databaseFixture.Db.SysDept.UpdateAsync(dbdept, tran);

                    #endregion

                    tran.Commit();
                    return true;
                }
                catch (Exception ex)
                {
                    tran.Rollback();
                    _logJobs.ExceptionLog(dto.sysDept.CreateUserId, ex);
                    return false;
                }
            }
        }

        public async Task<bool> DeleteAsync(long[] ids, long userid)
        {
            using (var tran = _databaseFixture.Db.BeginTransaction())
            {
                try
                {
                    string sql = $"SELECT * FROM sys_dept WHERE IsDel = 0 AND DeptId IN({ ids.Join(",") })";
                    var dblist = await _databaseFixture.Db.SysDept.QueryAsync(sql); //.FindAllAsync(m => m.IsDel == 0 && ids.Contains(m.DeptId));
                    var dbres = dblist.ToList();
                    if (dbres.Any())
                    {
                        foreach (var item in dbres)
                        {
                            await _databaseFixture.Db.SysDept.DeleteAsync(item, tran);
                        }
                    }
                    tran.Commit();
                    return true;
                }
                catch (Exception e)
                {
                    tran.Rollback();
                    _logJobs.ExceptionLog(userid, e);
                    return false;
                }
            }
        }
    }
}
