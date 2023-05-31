using JadeFramework.Cache;
using JadeFramework.Core.Domain.Container;
using JadeFramework.Core.Security;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Rex.WorkFlow.Web.Filters;
using Rex.WorkFlow.Web.Infrastructure;
using Rex.WorkFlow.Web.Infrastructure.Extensions;
using Rex.WorkFlow.Web.Repositories;
using Rex.WorkFlow.Web.Repositories.Impls;
using Rex.WorkFlow.Web.Services;
using Rex.WorkFlow.Web.Services.Impls;
using System;
using AutoMapper;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Rex.WorkFlow.Web.Hubs;

namespace Rex.WorkFlow.Web
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            // 1、缓存
            services.AddMemoryCache();
            services.AddScoped<ICachingProvider, MemoryCachingProvider>();
            services.AddResponseCompression();

            // 2、cookie身份认证
            services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
            .AddCookie(CookieAuthenticationDefaults.AuthenticationScheme, options =>
            {
                options.LoginPath = new PathString("/Sys/User/Login");
                options.AccessDeniedPath = new PathString("/Error/NoAuth");
                options.LogoutPath = new PathString("/Sys/User/LogOut");
                options.ExpireTimeSpan = TimeSpan.FromHours(2);
            });

            // 注册
            services.AddScoped<IWFDatabaseFixture, WFDatabaseFixture>();
            services.AddScoped<IWorkFlowService, WorkFlowService>();
            services.AddScoped<IFormService, FormService>();
            services.AddScoped<IWorkFlowInstanceService, WorkFlowInstanceService>();
            services.AddScoped<IWorkflowCategoryService, WorkflowCategoryService>();
            services.AddScoped<ICachingProvider, MemoryCachingProvider>();
            services.AddScoped<ISysDatabaseFixture, SysDatabaseFixture>();
            services.AddScoped<ILogJobs, LogJobs>();
            services.AddScoped<ISysLogService, SysLogService>();
            services.AddScoped<ISysReleaseLogService, SysReleaseLogService>();
            services.AddScoped<ISysResourceService, SysResourceService>();
            services.AddScoped<ISysRoleService, SysRoleService>();
            services.AddScoped<ISysUserService, SysUserService>();
            services.AddScoped<ISysSystemService, SysSystemService>();
            services.AddScoped<ISysDeptService, SysDeptService>();
            services.AddScoped<IWorkFlowService, WorkFlowService>();
            services.AddScoped<ICodeBuilderService, CodeBuilderService>();
            services.AddScoped<IPermissionStorageContainer, PermissionStorageService>();
            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            services.AddScoped<IVerificationCode, VerificationCode>();
            services.AddScoped<IOaDatabaseFixture, OaDatabaseFixture>();
            services.AddScoped<IOaMessageService, OaMessageService>();

            services.AddAutoMapper();

            // 3、Controller和views
            services.AddControllersWithViews(option => 
                option.Filters.Add(typeof(HttpGlobalExceptionFilter))
             ).AddNewtonsoftJson(op => 
                op.SerializerSettings.ContractResolver = new Newtonsoft.Json.Serialization.DefaultContractResolver()
             );//修改默认首字母为大写

            // 4、使用SignalR
            services.AddSignalR().AddNewtonsoftJsonProtocol();

            services.AddControllersWithViews();

            services.AddSession();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, ILoggerFactory loggerFactory)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            loggerFactory.AddLog4Net();//log4net

            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthentication();

            app.UseAuthorization();

            app.UseSession();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");

                // 1、区域终结点配置
                endpoints.MapControllerRoute(
                   name: "areaRoute",
                   pattern: "{area:exists}/{controller=Home}/{action=Index}/{id?}");

                // 2、映射SignalR 连接中心
                endpoints.MapHub<MessageHub>("/messageHub", options => options.Transports = Microsoft.AspNetCore.Http.Connections.HttpTransports.All);
            });
        }
    }
}
