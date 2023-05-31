﻿using Dapper;
using JadeFramework.Core.Domain.CodeBuilder.MySQL;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Services.Impls
{
    /// <summary>
    /// CodeBuilderService
    /// </summary>
    /// <remarks>
    /// @创 建 者：Rex
    /// @创建日期：2021/3/4 20:25:47
    /// </remarks>
    public class CodeBuilderService : ICodeBuilderService
    {
        public string GetConnectionString(TableSearch search)
        {
            string connectionString = $"Server={search.DataSource};User Id={search.UserId};Password={search.Password};Database={search.Database};Character Set=utf8;SslMode=none";
            return connectionString;
        }

        public async Task<List<Table>> GetTablesAsync(TableSearch search)
        {
            string connectionString = GetConnectionString(search);
            try
            {
                using (IDbConnection connection = new MySqlConnection(connectionString))
                {
                    string sql = SQLProvider.GetTableSql(search.Database);
                    if (!string.IsNullOrEmpty(search.TableName))
                    {
                        sql += $" AND TABLE_NAME = '{search.TableName}' ";
                    }
                    var res = await connection.QueryAsync<Table>(sql);
                    return res.ToList();
                }
            }
            catch (System.Exception ex)
            {
                throw new System.Exception(ex.Message);
            }
        }

        public async Task<List<TableColumn>> GetTableColumnsAsync(TableSearch search)
        {
            try
            {
                string connectionString = GetConnectionString(search);
                using (IDbConnection connection = new MySqlConnection(connectionString))
                {
                    string sql = SQLProvider.GetTableColumnsSql(search.Database, search.TableName);
                    var res = await connection.QueryAsync<TableColumn>(sql);
                    return res.ToList();
                }
            }
            catch (System.Exception ex)
            {
                throw new System.Exception(ex.Message);
            }
        }

    }
}
