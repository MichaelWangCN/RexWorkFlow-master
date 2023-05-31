
namespace Rex.WorkFlow.Web.Models
{
    /// <summary>
    /// 返回数据结果
    /// </summary>
    /// <remarks>
    /// @创 建 者：Rex
    /// @创建日期：2021/2/24 20:36:42
    /// </remarks>
    public class DataResult
    {
        /// <summary>
        /// 状态码
        /// </summary>
        public StateCode code { get; set; }

        /// <summary>
        /// 消息提示
        /// </summary>
        public string msg { get; set; }

        /// <summary>
        /// 数量
        /// </summary>
        public int count { get; set; }

        /// <summary>
        /// 数据
        /// </summary>
        public dynamic data { get; set; }

        public DataResult()
        {
            this.code = StateCode.Succees;
        }

        /// <summary>
        /// 设置数据信息
        /// </summary>
        /// <param name="code">状态码</param>
        /// <param name="msg">消息提示</param>
        public DataResult(StateCode code, string msg)
        {
            this.code = code;
            this.msg = msg;
        }

        /// <summary>
        /// 设置数据信息
        /// </summary>
        /// <param name="code">状态码</param>
        /// <param name="msg">消息提示</param>
        /// <param name="count">总数量</param>
        /// <param name="data">数据集</param>
        public DataResult(StateCode code, string msg, int count, dynamic data)
        {
            this.code = code;
            this.msg = msg;
            this.count = count;
            this.data = data;
        }

        /// <summary>
        /// 设置数据信息
        /// </summary>
        /// <param name="code">状态码</param>
        /// <param name="msg">消息提示</param>
        public void SetDataResult(StateCode code, string msg)
        {
            this.code = code;
            this.msg = msg;
        }

        /// <summary>
        /// 设置数据信息
        /// </summary>
        /// <param name="code">状态码</param>
        /// <param name="msg">消息提示</param>
        /// <param name="count">总数量</param>
        /// <param name="data">数据集</param>
        public void SetDataResult(StateCode code, string msg, int count, dynamic data)
        {
            this.code = code;
            this.msg = msg;
            this.count = count;
            this.data = data;
        }
    }
}
