using Rex.WorkFlow.Web.Dtos;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Services
{
    /// <summary>
    /// ISysDeptService
    /// </summary>
    /// <remarks>
    /// @创 建 者：Rex
    /// @创建日期：2021/2/28 14:23:56
    /// </remarks>
    public interface ISysDeptService
    {
        Task<DeptIndexViewModel> GetTreeAsync();
        Task<IList<SysDeptTree>> GetDeptTreeAsync(string deptName, string IsDel);
        Task<DeptShowViewModel> GetDeptAsync(long deptid);
        Task<bool> AddAsync(DeptShowDto dto);
        Task<bool> UpdateAsync(DeptShowDto dto);
        Task<bool> DeleteAsync(long[] ids, long userid);
    }
}
