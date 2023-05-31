using JadeFramework.Core.Domain.Container;
using JadeFramework.Core.Domain.Entities;
using JadeFramework.Core.Domain.Permission;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Components
{
    /// <summary>
    /// 菜单区分布视图
    /// </summary>
    /// <remarks>
    /// @创 建 者：Rex
    /// @创建日期：2021/2/24 21:44:50
    /// </remarks>
    public class MenuViewComponent : ViewComponent
    {
        private readonly IPermissionStorageContainer _permissionStorage;

        public MenuViewComponent(IPermissionStorageContainer permissionStorage)
        {
            _permissionStorage = permissionStorage;
        }

        public async Task<IViewComponentResult> InvokeAsync(bool isShowPage = false)
        {

            string area = this.RouteData.Values["area"].ToString();
            string controller = this.RouteData.Values["controller"].ToString();
            string action = this.RouteData.Values["action"].ToString();
            RouteName routeName = new RouteName()
            {
                Action = action,
                Areas = area,
                Controller = controller
            };
            string url = string.IsNullOrEmpty(routeName.Areas)
                ? "/" + routeName.Controller + "/" + routeName.Action
                : "/" + routeName.Areas + "/" + routeName.Controller + "/" + routeName.Action;
            url = url.Trim().ToLower();
            var permission = await _permissionStorage.GetPermissionAsync();
            var menu = permission.Menus.FirstOrDefault(m => m.MenuUrl != null && m.MenuUrl.Trim().ToLower() == url);
            if (menu != null && isShowPage == false)
            {
                var list = CreateBtn(routeName, menu);
                return View(list);
            }
            else
            {
                if (isShowPage)
                {
                    List<string> list = new List<string>()
                    {
                        "<button class=\"pear-btn pear-btn-primary btn-submit\" lay-submit lay-filter=\"operation-submit\">保存</button>",
                        "<button type=\"button\" class=\"pear-btn btn-cancel\">取消</button>"
                    };
                    return View(list);
                }
                else
                {
                    return View(new List<string>());
                }
            }
        }

        /// <summary>
        /// 创建菜单HTML
        /// </summary>
        /// <param name="routeName"></param>
        /// <param name="menu"></param>
        /// <returns></returns>
        private List<string> CreateBtn(RouteName routeName, Menu menu)
        {
            var buttons = menu.MenuButton;
            string btnId = routeName.Controller + "_" + routeName.Action + "_";
            var comBtns = buttons.OrderBy(m => m.ButtonType);
            List<string> searchList = new List<string>();
            List<string> operList = new List<string>();
            operList.Add("<script type=\"text/html\" id=\"oper-toolbar\"><div class=\"pear-btn-group\">");
            foreach (var item in comBtns)
            {
                if (item.ButtonType == 1)//查看
                {
                    searchList.Add("<style type=\"text/css\">.search-card {display: block !important;}</style>");
                }
                else
                {
                    string btnColor = "pear-btn-primary";
                    if (item.ButtonName.Equals("编辑"))
                    {
                        btnColor = "pear-btn-warming";
                    }
                    else if (item.ButtonName.Equals("删除"))
                    {
                        btnColor = "pear-btn-danger";
                    }
                    operList.Add($"<button class=\"pear-btn { btnColor } { item.ButtonClass }\" lay-event=\"{ btnId + item.ButtonType }\"><i class=\"{ item.Icon }\"></i>&nbsp;{ item.ButtonName }</button>");
                }
            }
            operList.Add("</div></script>");
            return searchList.Union(operList).ToList();
        }
    }
}
