layui.use(['table', 'form', 'jquery'], function () {
    let table = layui.table;
    let form = layui.form;
    let $ = layui.jquery;

    let cols = [
        [{
            type: 'checkbox'
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
            templet: '#au_enable',
            width: 100
        },
        {
            title: '创建时间',
            field: 'CreateTime',
            align: 'center',
            templet: '#au_createTime'
        }]
    ]

    // 数据表格渲染
    table.render({
        elem: '#au_table',
        url: '/Sys/Role/FindRolePageByRoleId?roleId=' + $('input[name=RoleId]').val(),
        request: {
            pageName: 'PageIndex', //页码的参数名称，默认：page
            limitName: 'PageSize' //每页数据量的参数名，默认：limit
        },
        page: {
            layout: ['prev', 'page', 'next', 'skip', 'count']
        },
        cols: cols,
        skin: 'line',
        toolbar: '#oper-toolbar'
    });

    // 查询(提交)
    form.on('submit(user-query)', function (data) {
        table.reload('au_table');
        return false;
    });

    // 数据表格工具栏操作
    table.on('toolbar(au-table)', function (obj) {
        let dataTable = table.checkStatus(obj.config.id).data;
        switch (obj.event) {
            case "add-user": // 加入用户
                openAddUser();
                break;
            case "del-user": // 删除
                if (dataTable.length < 1) {
                    layer.msg("您尚未选择要删除的数据！", { icon: 5 });
                    return;
                }
                layer.confirm('您选择了' + dataTable.length + '条数据，确认要删除吗？', { icon: 3, btnAlign: 'c', title: '提示' }, function (index) {
                    var uIds = new Array();
                    for (var i = 0; i < dataTable.length; i++) {
                        uIds.push(dataTable[i].UserId);
                    }
                    var roleId = $('input[name=RoleId]').val();
                    delRoleUser(roleId, uIds);
                });
                break;
            default:
        }
    });

    // 打开加入用户
    function openAddUser() {
        layer.open({
            type: 2,
            title: '选择用户',
            shade: 0.1,
            offset: '35px',
            area: ['1000px', '700px'],
            content: '/Sys/Plugin/User'
        });
    }

    // 删除角色用户
    function delRoleUser(rId, uIds) {
        var param = {
            RoleId: rId,
            UserIds: uIds
        };
        $.ajax({
            url: '/Sys/Role/DeleteUser',
            type: 'POST',
            data: JSON.stringify(param),
            dataType: 'json',
            contentType: 'application/json;charset=utf-8',
            beforeSend: function () {
                layer.load(1);
            },
            success: function (res) {
                layer.closeAll('loading');
                if (res.code === 0) {
                    layer.msg(res.msg, { icon: 1 }, function () {
                        table.reload('au_table');
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

    // 返回
    $('.btn-cancel').on('click', function () {
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    });

    window.setTimeout(function () {
        layer.tips('点击此处即可返回！', '.btn-cancel', { tips:3 });
    }, 500);

});

// 保存用户
function SaveUsers(uInfo) {
    var uIds = new Array();
    for (var i = 0; i < uInfo.length; i++) {
        uIds.push(uInfo[i].UserId);
    }
    var param = {
        RoleId: Number(document.getElementsByName("RoleId")[0].value),
        UserIds: uIds
    }
    $.ajax({
        url: '/Sys/Role/AddUser',
        type: 'POST',
        data: param,
        dataType: 'json',
        //contentType: 'application/json;charset=utf-8',
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

// 点击(触发)查询
function clickSearch() {
    document.getElementsByClassName("btn-search")[0].click();
}