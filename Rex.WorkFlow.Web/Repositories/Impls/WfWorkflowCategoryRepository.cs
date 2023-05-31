﻿using JadeFramework.Dapper;
using JadeFramework.Dapper.SqlGenerator;
using Rex.WorkFlow.Web.Repositories;
using Rex.WorkFlow.Web.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Repositories.Impls
{
    public class WfWorkflowCategoryRepository : DapperRepository<WfWorkflowCategory>, IWfWorkflowCategoryRepository
    {
        public WfWorkflowCategoryRepository(IDbConnection connection, SqlGeneratorConfig config) : base(connection, config)
        {
        }

        public async Task<IEnumerable<WfWorkflowCategory>> GetCategoriesAsync(List<Guid> ids)
        {
            List<string> insql = new List<string>();
            foreach (var item in ids)
            {
                insql.Add("'" + item.ToString() + "'");
            }
            string sql = $@"SELECT * FROM  `wf_workflow_category` WHERE Id IN({string.Join(",", insql)})";
            return await this.QueryAsync(sql);
        }
    }
}
