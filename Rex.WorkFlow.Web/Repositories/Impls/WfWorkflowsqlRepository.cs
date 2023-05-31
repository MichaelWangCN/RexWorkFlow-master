using Dapper;
using JadeFramework.Dapper;
using JadeFramework.Dapper.SqlGenerator;
using Rex.WorkFlow.Web.Dtos;
using Rex.WorkFlow.Web.Repositories;
using Rex.WorkFlow.Web.Models;
using Rex.WorkFlow.Web.Dtos;
using System;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Repositories.Impls
{
    public class WfWorkflowsqlRepository : DapperRepository<WfWorkflowsql>, IWfWorkflowsqlRepository
    {
        public WfWorkflowsqlRepository(IDbConnection connection, SqlGeneratorConfig config) : base(connection, config)
        {
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
                // 1、改成程序
                // 1、从sql里面取数据出来
                // 2、数据和条件进行判断

                // 把逻辑判断换到sql语句去执行
                var dbflowsql = await this.FindByIdAsync(item.Value);
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
                var res = await this.Connection.QueryAsync<int>(mysql, dbArgs);
                if (res != null && res.Any())
                {
                    finalid = item.Key;
                    break;
                }
                // 执行有结果的就是成功的
            }
            return finalid;
        }
    }
}
