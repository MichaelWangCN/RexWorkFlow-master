using System;
using System.Collections.Generic;

namespace Rex.WorkFlow.Web.Dtos
{
    public class PushAllDTO
    {
        public long MessageId { get; set; }
        public string Title { get; set; }
        public DateTime PublishTime { get; set; }
    }

    public class MessagePushDTO
    {
        public long UserId { get; set; }
        public string GroupName { get; set; }
        public string MsgJson { get; set; }
    }
    public class MessageGroupPushDTO
    {
        public string GroupName { get; set; }
        public string MsgJson { get; set; }
    }

    public class MessagePushSomBodyDTO
    {
        public List<long> UserIds { get; set; }

        /// <summary>
        /// 发送人
        /// </summary>
        public long Sender { get; set; }

        public string Title { get; set; }
        /// <summary>
        /// 消息内容
        /// </summary>
        public string MsgJson { get; set; }
        /// <summary>
        /// 跳转地址
        /// </summary>
        public string Link { get; set; }
    }
}
