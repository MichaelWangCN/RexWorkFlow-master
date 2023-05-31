using JadeFramework.Core.Domain.Entities;
using Rex.WorkFlow.Web.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Services
{
    /// <summary>
    /// IFormService
    /// </summary>
    /// <remarks>
    /// @创 建 者：Rex
    /// @创建日期：2021/3/2 20:17:26
    /// </remarks>
    public interface IFormService
    {
        Task<Page<FormPageDto>> GetPageAsync(int pageIndex, int pageSize);
        Task<FormDetailDto> GetFormDetailAsync(Guid id);
        Task<bool> InsertAsync(FormDetailDto model);
        Task<bool> UpdateAsync(FormDetailDto model);
        Task<List<ZTree>> GetFormTreeAsync();
    }
}
