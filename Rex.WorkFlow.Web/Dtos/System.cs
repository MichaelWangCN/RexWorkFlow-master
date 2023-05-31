using JadeFramework.Core.Domain.Entities;
using System.Collections.Generic;

namespace Rex.WorkFlow.Web.Dtos
{
    public class SystemIndexViewModel
    {
    }

    public class SystemIndexSearch : BaseSearch
    {

    }
    public class SystemDeleteDTO
    {
        public List<long> Ids { get; set; }
        public long UserId { get; set; }
    }
}
