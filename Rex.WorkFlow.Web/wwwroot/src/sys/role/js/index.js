layui.use(['table', 'form', 'jquery'], function () {
    let table = layui.table;
    let form = layui.form;
    let $ = layui.jquery;

    let cols = [
        [{
            type: 'checkbox'
        },
        {
            title: '角色名称',
            field: 'RoleName',
            align: 'center',
            width: 200
        },
        {
            title: '备注',
            field: 'Memo',
            align: 'center'
        },
        {
            title: '状态',
            field: 'IsDel',
            align: 'center',
            templet: '#role_enable',
            width: 100
        },
        {
            title: '创建时间',
            field: 'CreateTime',
            align: 'center',
            templet: '#role_CreateTime',
            width: 150
        },
        {
            title: '操作',
            toolbar: '#role_bar',
            align: 'center',
            width: 310
        }]
    ]

    // 数据表格渲染
    table.render({
        elem: '#role_table',
        url: '/Sys/Role/FindRolePage',
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
        }, 'filter', 'print', 'exports'],
        where: {
            SystemId: $('select[name=SystemId]').val()
        }
    });

    // 查询(提交)
    form.on('submit(role-query)', function (data) {
        table.reload('role_table', {
            page: {
                curr: 1 //重新从第 1 页开始
            },
            where: data.field
        });
        return false;
    });

    // 数据表格工具栏操作
    table.on('toolbar(role-table)', function (obj) {
        let dataTable = table.checkStatus(obj.config.id).data;
        switch (obj.event) {
            case "refresh": // 刷新数据表格
                table.reload('role_table');
                break;
            case "Role_Index_2": // 新增
                var systemId = $('select[name=SystemId]').val();
                if (systemId === "0") {
                    layer.msg("请选择所属系统！", { icon: 5 });
                    return;
                }
                openOperation();
                break;
            case "Role_Index_3": // 编辑
                if (dataTable.length < 1) {
                    layer.msg("您尚未选择要编辑的数据！", { icon: 5 });
                } else if (dataTable.length > 1) {
                    layer.msg("请选择一条数据进行编辑！", { icon: 5 });
                } else {
                    openOperation(dataTable[0].RoleId);
                }
                break;
            case "Role_Index_4": // 删除
                if (dataTable.length < 1) {
                    layer.msg("您尚未选择要删除的数据！", { icon: 5 });
                    return;
                }
                layer.confirm('您选择了' + dataTable.length + '条数据，确认要删除吗？', { icon: 3, btnAlign: 'c', title: '提示' }, function (index) {
                    var rIds = new Array();
                    for (var i = 0; i < dataTable.length; i++) {
                        rIds.push(dataTable[i].RoleId);
                    }
                    delRole(rIds);
                });
                break;
            default:
        }
    });

    // 数据表格操作
    table.on('tool(role-table)', function (obj) {
        switch (obj.event) {
            case "resource": // 分配资源
                openResource(obj.data);
                break;
            case "user": // 分配用户
                openUser(obj.data);
                break;
            case "look": // 查看
                layer.open({
                    type: 2,
                    title: '查看角色信息',
                    shade: 0.1,
                    offset: '100px',
                    area: ['400px', '335px'],
                    content: '/Sys/Role/Details?id=' + obj.data.RoleId
                });
                break;
            default:
        }
    });

    // 打开分配用户
    function openUser(data) {
        var index = layer.open({
            type: 2,
            title: '<div style="text-align:center;">为【' + data.RoleName + '】分配用户</div>',
            shade: 0.1,
            content: '/Sys/Role/AssigningUsers?roleId=' + data.RoleId
        });
        // 最大化
        layer.full(index);
    }

    // 打开分配资源
    function openResource(data) {
        layer.open({
            type: 2,
            title: '为【' + data.RoleName + '】分配资源',
            shade: 0.1,
            offset: '65px',
            area: ['300px', '650px'],
            content: '/Sys/Role/AssigningResource?roleId=' + data.RoleId
        });
    }

    // 打开角色操作(新增|修改)
    function openOperation(id) {
        var systemId = $('select[name=SystemId]').val();
        layer.open({
            type: 2,
            title: layui.util.isEmpty(id) ? '新增角色' : '编辑角色',
            shade: 0.1,
            offset: '100px',
            area: ['400px', '360px'],
            content: '/Sys/Role/Operation?systemId=' + systemId + '&id=' + id
        });
    }

    // 删除角色信息
    function delRole(ids) {
        $.ajax({
            url: '/Sys/Role/Delete',
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

});

// 点击(触发)查询
function clickSearch() {
    document.getElementsByClassName("btn-search")[0].click();
}