using System.Collections.Generic;

namespace Rex.WorkFlow.Web.Dtos
{
    public class SignalRMessageGroups
    {
        public string ConnectionId { get; set; }
        public long UserId { get; set; }
        public string GroupName { get; set; }
        public static List<SignalRMessageGroups> UserGroups = new List<SignalRMessageGroups>();
    }
}
