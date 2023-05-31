layui.use(['table', 'form', 'jquery'], function () {
    let table = layui.table;
    let form = layui.form;
    let $ = layui.jquery;

    let cols = [
        [{
            type: 'checkbox'
        },
        {
            title: '头像',
            field: 'HeadImg',
            align: 'center',
            width: 100,
            templet: '#user-img',
        },
        {
            title: '工号',
            field: 'JobNumber',
            align: 'center'
        },
        {
            title: '用户名',
            field: 'UserName',
            align: 'center'
        },
        {
            title: '用户账号',
            field: 'Account',
            align: 'center'
        },
        {
            title: '账号状态',
            field: 'IsDel',
            align: 'center',
            templet: '#user-enable',
            width: 100
        },
        {
            title: '创建时间',
            field: 'CreateTime',
            align: 'center',
            templet: '#user-createTime'
        },
        {
            title: '操作',
            toolbar: '#user-bar',
            align: 'center',
            width: 305
        }]
    ]

    // 数据表格渲染
    table.render({
        elem: '#user_table',
        url: '/Sys/User/FindUserPage',
        request: {
            pageName: 'PageIndex', //页码的参数名称，默认：page
            limitName: 'PageSize' //每页数据量的参数名，默认：limit
        },
        page: true,
        cols: cols,
        skin: 'line',
        toolbar: '#oper-toolbar',
        defaultToolbar: [{
            layEvent: 'refresh',
            icon: 'layui-icon-refresh',
        }, 'filter', 'print', 'exports']
    });

    // 数据表格操作
    table.on('tool(user-table)', function (obj) {
        switch (obj.event) {
            case "role": // 分配角色
                openRole(obj.data);
                break;
            case "department": // 分配部门
                openDept(obj.data);
                break;
            case "look": // 查看
                layer.open({
                    type: 2,
                    title: '查看用户信息',
                    shade: 0.1,
                    offset: '100px',
                    area: ['400px', '454px'],
                    content: '/Sys/User/Details?id=' + obj.data.UserId
                });
                break;
            default:
        }
    });

    // 数据表格工具栏操作
    table.on('toolbar(user-table)', function (obj) {
        let dataTable = table.checkStatus(obj.config.id).data;
        switch (obj.event) {
            case "refresh": // 刷新数据表格
                table.reload('user_table');
                break;
            case "User_Index_2": // 新增
                openOperation();
                break;
            case "User_Index_3": // 编辑
                if (dataTable.length < 1) {
                    layer.msg("您尚未选择要编辑的数据！", { icon: 5 });
                } else if (dataTable.length > 1) {
                    layer.msg("请选择一条数据进行编辑！", { icon: 5 });
                } else {
                    openOperation(dataTable[0].UserId);
                }
                break;
            case "User_Index_4": // 删除
                if (dataTable.length < 1) {
                    layer.msg("您尚未选择要删除的数据！", { icon: 5 });
                    return;
                }
                layer.confirm('您选择了' + dataTable.length + '条数据，确认要删除吗？', { icon: 3, btnAlign: 'c', title: '提示' }, function (index) {
                    var uIds = new Array();
                    for (var i = 0; i < dataTable.length; i++) {
                        uIds.push(dataTable[i].UserId);
                    }
                    delUser(uIds);
                });
                break;
            default:
        }
    });

    // 查询(提交)
    form.on('submit(user-query)', function (data) {
        table.reload('user_table', {
            page: {
                curr: 1 //重新从第 1 页开始
            },
            where: data.field
        });
        return false;
    });

    // 删除用户信息
    function delUser(ids) {
        $.ajax({
            url: '/Sys/User/Delete',
            type: 'POST',
            data: JSON.stringify(ids),
            dataType: 'json',
            contentType: 'application/json;charset=utf-8',
            beforeSend: function () {
                layer.load(1);
            },
            success: function (res) {
                layer.closeAll('loading');
                if (res.code === 0) {
                    layer.msg(res.msg, { icon: 1 }, function () {
                        clickSearch();
                    });
                    return;
                }
                layer.msg(res.msg, { icon: 5 });
            },
            error: function (data) {
                layer.closeAll('loading');
                console.error(data.responseText);
            }
        });
    }

    // 打开分配角色
    function openRole(data) {
        layer.open({
            type: 2,
            title: '为【'+ data.UserName +'】分配角色',
            shade: 0.1,
            offset: '65px',
            area: ['300px', '450px'],
            content: '/Sys/User/AssigningRoles?userId=' + data.UserId
        });
    }

    // 打开分配部门
    function openDept(data) {
        layer.open({
            type: 2,
            title: '为【' + data.UserName + '】分配部门',
            shade: 0.1,
            offset: '65px',
            area: ['750px', '500px'],
            content: '/Sys/User/Dept?userId=' + data.UserId
        });
    }

    // 打开用户操作(新增|修改)
    function openOperation(id) {
        layer.open({
            type: 2,
            title: layui.util.isEmpty(id) ? '新增用户' : '编辑用户',
            shade: 0.1,
            offset: '100px',
            area: ['400px', layui.util.isEmpty(id) ? '400px' : '350px'],
            content: '/Sys/User/Operation?Id='+id
        });
    }

});

// 点击(触发)查询
function clickSearch() {
    document.getElementsByClassName("btn-search")[0].click();
}