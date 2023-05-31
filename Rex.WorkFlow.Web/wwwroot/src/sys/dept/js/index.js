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
    window.renderDept = function () {
        //var deptName = $('input[name=DeptName]').val();
        //var isDel = $('select[name=IsDel]').val();
        treetable.render({
            treeColIndex: 1,
            treeSpid: 0,
            treeIdName: 'DeptId',
            treePidName: 'ParentId',
            skin: 'line',
            method: 'GET',
            treeDefaultClose: true,
            toolbar: '#oper-toolbar',
            elem: '#dept_table',
            url: '/Sys/Dept/FindDeptPage?deptName=&isDel=0',
            page: false,
            cols: [
                [
                    { type: 'checkbox' },
                    { field: 'DeptName', width: 200, align: 'center', title: '部门名称' },
                    { field: 'DeptCode', width: 150, align: 'center', title: '部门编码' },
                    { field: 'Memo', title: '备注' },
                    { field: 'IsDel', title: '状态', align: 'center', width: 80, templet: '#dept_enable' },
                    { field: 'CreateTime', width: 200, align: 'center', title: '创建时间', templet: '#dept_createTime' }
                ]
            ]
        });

    }

    // 初始化执行
    renderDept();

    // 工具栏操作
    table.on('toolbar(dept-table)', function (obj) {
        let dataTable = table.checkStatus(obj.config.id).data;
        switch (obj.event) {
            case "Dept_Index_2": // 新增
                openOperation("");
                break;
            case "Dept_Index_3": // 编辑
                if (dataTable.length < 1) {
                    layer.msg("您尚未选择要编辑的数据！", { icon: 5 });
                } else if (dataTable.length > 1) {
                    layer.msg("请选择一条数据进行编辑！", { icon: 5 });
                } else {
                    openOperation(dataTable[0].DeptId);
                }
                break;
            case "Dept_Index_4": // 删除
                if (dataTable.length < 1) {
                    layer.msg("您尚未选择要删除的数据！", { icon: 5 });
                    return;
                }
                layer.confirm('您选择了' + dataTable.length + '条数据，确认要删除吗？', { icon: 3, btnAlign: 'c', title: '提示' }, function (index) {
                    var dIds = new Array();
                    for (var i = 0; i < dataTable.length; i++) {
                        dIds.push(dataTable[i].DeptId);
                    }
                    delDept(dIds);
                });
                break;
            case "expandAll": // 展开
                treetable.expandAll("#dept_table");
                break;
            case "foldAll": // 折叠
                treetable.foldAll("#dept_table");
                break;
            default:
        }
    });

    // 删除部门信息
    function delDept(ids) {
        $.ajax({
            url: '/Sys/Dept/Delete',
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
        layer.open({
            type: 2,
            title: layui.util.isEmpty(id) ? '新增部门' : '编辑部门',
            shade: 0.1,
            offset: '100px',
            area: ['500px', '460px'],
            content: '/Sys/Dept/Operation?id=' + id
        });
    }

    // 查询(提交)
    form.on('submit(dept-query)', function (data) {
        renderDept();
        return false;
    });

});

// 点击(触发)查询
function clickSearch() {
    document.getElementsByClassName("btn-search")[0].click();
}