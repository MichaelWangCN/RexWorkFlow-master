layui.use(['table', 'form', 'jquery'], function () {
    let table = layui.table;
    let form = layui.form;
    let $ = layui.jquery;

    let cols = [
        [{
            type: 'checkbox'
        },
        {
            title: '系统排序',
            field: 'Sort',
            align: 'center',
            width: 100
        },
        {
            title: '系统名称',
            field: 'SystemName',
            align: 'center',
            width: 200
        },
        {
            title: '系统编码',
            field: 'SystemCode',
            align: 'center',
            width: 280
        },
        {
            title: '系统备注',
            field: 'Memo',
            align: 'left'
        },
        {
            title: '系统状态',
            field: 'IsDel',
            align: 'center',
            templet: '#system_enable',
            width: 100
        },
        {
            title: '创建时间',
            field: 'CreateTime',
            align: 'center',
            templet: '#system_createTime',
            width: 200
        },
        {
            title: '操作',
            toolbar: '#system_bar',
            align: 'center',
            width: 100
        }]
    ]

    // 数据表格渲染
    table.render({
        elem: '#system_table',
        url: '/Sys/System/FindSystemPage',
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

    // 工具栏操作
    table.on('toolbar(system-table)', function (obj) {
        let dataTable = table.checkStatus(obj.config.id).data;
        switch (obj.event) {
            case "refresh": // 刷新数据表格
                table.reload('system_table');
                break;
            case "System_Index_2": // 新增
                openOperation("");
                break;
            case "System_Index_3": // 编辑
                if (dataTable.length < 1) {
                    layer.msg("您尚未选择要编辑的数据！", { icon: 5 });
                } else if (dataTable.length > 1) {
                    layer.msg("请选择一条数据进行编辑！", { icon: 5 });
                } else {
                    openOperation(dataTable[0].SystemId);
                }
                break;
            case "System_Index_4": // 删除
                if (dataTable.length < 1) {
                    layer.msg("您尚未选择要删除的数据！", { icon: 5 });
                    return;
                }
                layer.confirm('您选择了' + dataTable.length + '条数据，确认要删除吗？', { icon: 3, btnAlign: 'c', title: '提示' }, function (index) {
                    var dIds = new Array();
                    for (var i = 0; i < dataTable.length; i++) {
                        dIds.push(dataTable[i].SystemId);
                    }
                    delSystem(dIds);
                });
                break;
            default:
        }
    });

    // 数据表格操作
    table.on('tool(system-table)', function (obj) {
        switch (obj.event) {
            case "look": // 查看
                layer.open({
                    type: 2,
                    title: '查看系统信息',
                    shade: 0.1,
                    offset: '100px',
                    area: ['500px', '420px'],
                    content: '/Sys/System/Details?id=' + obj.data.SystemId
                });
                break;
            default:
        }
    });

    // 删除系统信息
    function delSystem(ids) {
        $.ajax({
            url: '/Sys/System/Delete',
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

    // 打开系统操作(新增|修改)
    function openOperation(id) {
        layer.open({
            type: 2,
            title: layui.util.isEmpty(id) ? '新增系统' : '编辑系统',
            shade: 0.1,
            offset: '100px',
            area: ['500px', '410px'],
            content: '/Sys/System/Operation?id=' + id
        });
    }

    // 查询(提交)
    window.SystemReload = function () {
        table.reload('system_table');
    };

});

// 点击(触发)查询
function clickSearch() {
    window.SystemReload();
}