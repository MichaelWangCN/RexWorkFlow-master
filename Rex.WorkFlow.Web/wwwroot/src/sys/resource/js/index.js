layui.use(['table', 'form', 'jquery', 'treetable'], function () {
    let table = layui.table;
    let form = layui.form;
    let $ = layui.jquery;
    let treetable = layui.treetable;

    // 向工具栏插入【展开】、【折叠】
    var toolBarHtml = $('#oper-toolbar').html();
    toolBarHtml = toolBarHtml.replace(/<div class="pear-btn-group">/g, "");
    toolBarHtml = toolBarHtml.replace(/<\/div>/g, "");
    toolBarHtml += '<button class="pear-btn pear-btn-success" lay-event="expandAll">';
    toolBarHtml += '    <i class="layui-icon layui-icon-spread-left"></i>';
    toolBarHtml += '    &nbsp;展开';
    toolBarHtml += '</button>';
    toolBarHtml += '<button class="pear-btn pear-btn-success" lay-event="foldAll">';
    toolBarHtml += '    <i class="layui-icon layui-icon-shrink-right"></i>';
    toolBarHtml += '    &nbsp;折叠';
    toolBarHtml += '</button>';
    $('#oper-toolbar').html('<div class="pear-btn-group">' + toolBarHtml + '</div>');

    // 获取部门信息
    window.renderResource = function () {
        var systemId = $('select[name=SystemId]').val();
        treetable.render({
            treeColIndex: 1,
            treeSpid: 0,
            treeIdName: 'ResourceId',
            treePidName: 'ParentId',
            skin: 'line',
            method: 'GET',
            treeDefaultClose: true,
            toolbar: '#oper-toolbar',
            elem: '#resource_table',
            url: '/Sys/Resource/FindResourcePage?systemId=' + systemId,
            page: false,
            cols: [
                [
                    { type: 'checkbox' },
                    { field: 'ResourceName', width: 200, align: 'center', title: '菜单名称' },
                    { field: 'ResourceUrl', align: 'left', title: 'URL' },
                    { field: 'Memo', title: '备注' },
                    { field: 'Buttons', title: '操作权限', templet: '#resource_btns' },
                    { field: 'Icon', width: 80, title: '图标', align: 'center', templet: '#resource_icon' },
                    { field: 'IsDel', title: '状态', align: 'center', width: 80, templet: '#resource_enable' },
                    { field: 'Sort', width: 100, align: 'center', title: '排序' },
                    { field: 'CreateTime', width: 200, align: 'center', title: '创建时间', templet: '#resource_createTime' }
                ]
            ]
        });

    }

    // 初始化执行
    renderResource();

    // 工具栏操作
    table.on('toolbar(resource-table)', function (obj) {
        let dataTable = table.checkStatus(obj.config.id).data;
        switch (obj.event) {
            case "Resource_Index_2": // 新增
                var systemId = $('select[name=SystemId]').val();
                if (systemId === "0") {
                    layer.msg("请选择所属系统！", { icon: 5 });
                    return;
                }
                openOperation("");
                break;
            case "Resource_Index_3": // 编辑
                if (dataTable.length < 1) {
                    layer.msg("您尚未选择要编辑的数据！", { icon: 5 });
                } else if (dataTable.length > 1) {
                    layer.msg("请选择一条数据进行编辑！", { icon: 5 });
                } else {
                    openOperation(dataTable[0].ResourceId);
                }
                break;
            case "Resource_Index_4": // 删除
                if (dataTable.length < 1) {
                    layer.msg("您尚未选择要删除的数据！", { icon: 5 });
                    return;
                }
                layer.confirm('您选择了' + dataTable.length + '条数据，确认要删除吗？', { icon: 3, btnAlign: 'c', title: '提示' }, function (index) {
                    var dIds = new Array();
                    for (var i = 0; i < dataTable.length; i++) {
                        dIds.push(dataTable[i].ResourceId);
                    }
                    delResource(dIds);
                });
                break;
            case "expandAll": // 展开
                treetable.expandAll("#resource_table");
                break;
            case "foldAll": // 折叠
                treetable.foldAll("#resource_table");
                break;
            default:
        }
    });

    // 删除部门信息
    function delResource(ids) {
        $.ajax({
            url: '/Sys/Resource/Delete',
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

    // 打开用户操作(新增|修改)
    function openOperation(id) {
        var systemId = $('select[name=SystemId]').val();
        var index = layer.open({
            type: 2,
            title: '<div style="text-align: center">' + (layui.util.isEmpty(id) ? '新增部门' : '编辑部门') + '</div>',
            shade: 0.1,
            content: '/Sys/Resource/Operation?systemId=' + systemId + '&id=' + id
        });
        // 最大化
        layer.full(index);
    }

    // 查询(提交)
    form.on('submit(resource-query)', function (data) {
        renderResource();
        return false;
    });

});

// 按钮格式化
function formatBtn(data) {
    var strHtml = '';
    for (var i = 0; i < data.length; i++) {
        strHtml += '<button class="pear-btn pear-btn-primary pear-btn-sm btn-opr" plain="" value="' + data[i].Id + '">' + data[i].Value + '</button>';
    }
    return strHtml;
}

// 点击(触发)查询
function clickSearch() {
    document.getElementsByClassName("btn-search")[0].click();
}