using JadeFramework.Core.Mvc;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Rex.WorkFlow.Web.Controllers
{
    public class ErrorController : BaseController
    {
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult IE()
        {
            return View();
        }

        /// <summary>
        /// 没有权限
        /// </summary>
        /// <returns></returns>
        public IActionResult NoAuth()
        {
            return View();
        }

        /// <summary>
        /// 没有菜单权限
        /// </summary>
        /// <returns></returns>
        public IActionResult NoMenu()
        {
            return View();
        }
    }
}
