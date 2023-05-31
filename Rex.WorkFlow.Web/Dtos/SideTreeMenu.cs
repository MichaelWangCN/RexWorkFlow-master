using System.Collections.Generic;

namespace Rex.WorkFlow.Web.Dtos
{
    /// <summary>
    /// 侧边树形菜单
    /// </summary>
    /// <remarks>
    /// @创 建 者：Rex
    /// @创建日期：2021/2/24 14:44:59
    /// </remarks>
    public class SideTreeMenu
    {
        /// <summary>
        /// 编号
        /// </summary>
        public long id { get; set; }

        /// <summary>
        /// 标题
        /// </summary>
        public string title { get; set; }

        /// <summary>
        /// 0：不可跳转的目录、1：是可点击跳转的菜单
        /// </summary>
        public int type { get; set; }

        /// <summary>
        /// 字体图标
        /// </summary>
        public string icon { get; set; }

        /// <summary>
        /// 打开类型
        /// </summary>
        public string openType { get; set; }

        /// <summary>
        /// 链接
        /// </summary>
        public string href { get; set; }

        /// <summary>
        /// 子节点
        /// </summary>
        public List<SideTreeMenu> children { get; set; }
    }
}
