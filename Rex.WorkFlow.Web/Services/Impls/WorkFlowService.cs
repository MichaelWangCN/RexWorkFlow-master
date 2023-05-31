using AutoMapper;
using Dapper;
using JadeFramework.Core.Domain.Entities;
using JadeFramework.Core.Extensions;
using Rex.WorkFlow.Web.Dtos;
using Rex.WorkFlow.Web.Models;
using Rex.WorkFlow.Web.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Rex.WorkFlow.Web.Infrastructure;

namespace Rex.WorkFlow.Web.Services.Impls
{
    /// <summary>
    /// WorkFlowService
    /// </summary>
    /// <remarks>
    /// @创 建 者：Rex
    /// @创建日期：2021/3/2 14:46:01
    /// </remarks>
    public class WorkFlowService : IWorkFlowService
    {
        private readonly IWFDatabaseFixture databaseFixture;
        private readonly ISysDatabaseFixture sysDatabaseFixture;
        private readonly IMapper mapper;

        public WorkFlowService(IWFDatabaseFixture databaseFixture, IMapper mapper, ISysDatabaseFixture sysDatabaseFixture)
        {
            this.databaseFixture = databaseFixture;
            this.mapper = mapper;
            this.sysDatabaseFixture = sysDatabaseFixture;
        }

        public async Task<Page<WfWorkflow>> GetPageAsync(int pageIndex, int pageSize)
        {
            return await databaseFixture.Db.Workflow.GetPageAsync(pageIndex, pageSize);
        }

        public async Task<WorkFlowDetailDto> GetByIdAsync(Guid id)
        {
            var res = await databaseFixture.Db.Workflow.FindByIdAsync(id);
            //var model = mapper.Map<WfWorkflow, WorkFlowDetailDto>(res);
            WorkFlowDetailDto model = res.MapTo<WfWorkflow, WorkFlowDetailDto>();

            var category = await databaseFixture.Db.WorkflowCategory.FindByIdAsync(res.CategoryId);
            model.CategoryName = category.Name;
            var form = await databaseFixture.Db.WorkflowForm.FindByIdAsync(res.FormId);
            model.FormName = form.FormName;
            return model;
        }

        public async Task<bool> InsertAsync(WorkFlowDetailDto workflow)
        {
            workflow.FlowId = Guid.NewGuid();
            workflow.FlowCode = DateTime.Now.ToTimeStamp() + string.Empty.CreateNumberNonce();

            //判断表单是否已被关联
            var res = await databaseFixture.Db.Workflow.IsExistFormAsync(workflow.FormId);
            if (res)
            {
                return false;
            }
            //var model = mapper.Map<WorkFlowDetailDto, WfWorkflow>(workflow);
            WfWorkflow model = workflow.MapTo<WorkFlowDetailDto, WfWorkflow>();
            return await databaseFixture.Db.Workflow.InsertAsync(model);
        }

        public async Task<bool> UpdateAsync(WorkFlowDetailDto workflow)
        {
            var dbflow = await databaseFixture.Db.Workflow.FindByIdAsync(workflow.FlowId);

            //判断表单是否已被关联
            var res = await databaseFixture.Db.Workflow.IsExistFormAsync(workflow.FormId, dbflow.FlowId);
            if (res)
            {
                return false;
            }

            dbflow.FormId = workflow.FormId;
            dbflow.CategoryId = workflow.CategoryId;
            dbflow.FlowName = workflow.FlowName;
            dbflow.Enable = workflow.Enable;
            dbflow.FlowContent = workflow.FlowContent;
            dbflow.Memo = workflow.Memo;
            return await databaseFixture.Db.Workflow.UpdateAsync(dbflow);
        }

        public async Task<bool> DeleteAsync(FlowDeleteDTO dto)
        {
            using (var tran = databaseFixture.Db.BeginTransaction())
            {
                try
                {
                    await databaseFixture.Db.Workflow.DeleteAsync(dto.Ids, tran);

                    tran.Commit();
                    return true;
                }
                catch (Exception ex)
                {
                    tran.Rollback();
                    return false;
                }
            }
        }

        public async Task<List<WorkFlowStartDto>> GetWorkFlowStartAsync(Guid categoryid)
        {
            return await databaseFixture.Db.Workflow.GetWorkFlowStartAsync(categoryid);
        }

        //public async Task<List<WorkFlowLineDto>> GetAllLinesAsync()
        //{
        //    var dbLines = await databaseFixture.Db.WorkflowLine.FindAllAsync(m => m.IsDel == 0);
        //    return dbLines.Select(m => new WorkFlowLineDto
        //    {
        //        LineId = m.Id,
        //        Name = m.Name
        //    }).ToList();
        //}

        //public async Task<WorkFlowLineDto> GetLineAsync(Guid lineid)
        //{
        //    var line = await databaseFixture.Db.WorkflowLine.FindByIdAsync(lineid);
        //    return new WorkFlowLineDto
        //    {
        //        LineId = line.Id,
        //        Name = line.Name
        //    };
        //}

        /// <summary>
        /// new workflow version
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        public async Task<bool> NewVersionAsync(WorkFlowDetailDto dto)
        {
            using (var tran = databaseFixture.Db.BeginTransaction())
            {
                try
                {
                    //取出Enable==1 and FlowId=dto.FlowId 肯定存在，并且只能为一条，如果没有情况可能是新的版本正在修改中
                    WfWorkflow dbworkflow = await databaseFixture.Db.Workflow.FindAsync(m => m.Enable == 1 && m.FlowId == dto.FlowId);
                    WfWorkflow newworkflow = dbworkflow;

                    dbworkflow.Enable = 0;
                    dbworkflow.IsOld = 1;
                    await databaseFixture.Db.Workflow.UpdateAsync(dbworkflow);

                    //new workflow
                    newworkflow.FlowName = newworkflow.FlowName + "-NEW";
                    newworkflow.Enable = 0;
                    newworkflow.CreateTime = DateTime.Now.ToTimeStamp();
                    newworkflow.CreateUserId = dto.CreateUserId;
                    newworkflow.FlowVersion++;
                    newworkflow.FlowId = Guid.NewGuid();//重新创建FlowId 使用FlowCode判断流程几个版本
                    newworkflow.IsOld = 0;
                    await databaseFixture.Db.Workflow.InsertAsync(newworkflow);
                    tran.Commit();
                    return true;
                }
                catch (Exception ex)
                {
                    tran.Rollback();
                    return false;
                }
            }

        }

        /// <summary>
        /// 工作流查询数据
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>
        public async Task<List<long>> GetFlowNodeInfo(FlowViewModel model)
        {
            try
            {
                var dbflow = await sysDatabaseFixture.Db.SysWorkflowsql.FindByIdAsync(model.sql);
                string mysql = dbflow.FlowSQL;
                var dbparamnames = dbflow.Param.Split(',');
                DynamicParameters dbArgs = new DynamicParameters();
                foreach (string item in dbparamnames)
                {
                    if (item.Equals("userid", StringComparison.OrdinalIgnoreCase))
                    {
                        dbArgs.Add(item, model.UserId);
                    }
                    else
                    {
                        foreach (var key in model.param.Keys)
                        {
                            if (key.ToLower() == item.ToLower())
                            {
                                dbArgs.Add(item, model.param[key]);
                                break;
                            }
                        }
                    }
                }
                var res = await databaseFixture.Db.Connection.QueryAsync<string>(mysql, dbArgs);
                var list = res.Where(m => !string.IsNullOrEmpty(m)).ToList();
                if (list.Any())
                {
                    string userids = res.ToList()[0];
                    string[] array = userids.Split(',');
                    return array.Select(x => Convert.ToInt64(x)).ToList();
                }
                else
                {
                    throw new Exception("人员查询未找到！！！");
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        /// <summary>
        /// 获取最终的节点ID
        /// </summary>
        /// <param name="data">连线条件字典集合</param>
        /// <returns></returns>
        public async Task<Guid?> GetFinalNodeId(FlowLineFinalNodeDto model)
        {
            Guid? finalid = null;
            foreach (var item in model.Data)
            {
                var dbflowsql = await sysDatabaseFixture.Db.SysWorkflowsql.FindByIdAsync(item.Value);
                string mysql = dbflowsql.FlowSQL;
                var dbparamnames = dbflowsql.Param.Split(',');
                DynamicParameters dbArgs = new DynamicParameters();
                foreach (string param in dbparamnames)
                {
                    if (param.Equals("userid", StringComparison.OrdinalIgnoreCase))//当前用户ID特殊处理
                    {
                        dbArgs.Add(param, model.UserId);
                    }
                    else
                    {
                        foreach (var key in model.Param.Keys)
                        {
                            if (key.ToLower() == param.ToLower())
                            {
                                dbArgs.Add(param, model.Param[key]);
                                break;
                            }
                        }
                    }
                }
                var res = await databaseFixture.Db.Connection.QueryAsync<int>(mysql, dbArgs);
                if (res != null && res.Any())
                {
                    finalid = item.Key;
                    break;
                }
            }
            return finalid;
        }


    }
}
