using JadeFramework.Core.Domain.CodeBuilder.MySQL;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Services
{
    /// <summary>
    /// ICodeBuilderService
    /// </summary>
    /// <remarks>
    /// @创 建 者：Rex
    /// @创建日期：2021/3/4 20:25:08
    /// </remarks>
    public interface ICodeBuilderService
    {
        Task<List<Table>> GetTablesAsync(TableSearch search);
        Task<List<TableColumn>> GetTableColumnsAsync(TableSearch search);
    }
}
