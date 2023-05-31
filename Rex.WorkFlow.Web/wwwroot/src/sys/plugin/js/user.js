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
        }]
    ]

    // 数据表格渲染
    table.render({
        elem: '#user_table',
        url: '/Sys/Plugin/FindUserInfo',
        height: 450,
        request: {
            pageName: 'PageIndex', //页码的参数名称，默认：page
            limitName: 'PageSize' //每页数据量的参数名，默认：limit
        },
        id: 'uInfo',
        page: {
            layout: ['prev', 'page', 'next', 'skip', 'count']
        },
        cols: cols,
        skin: 'line'
    });

    // 查询(提交)
    form.on('submit(user-query)', function (data) {
        table.reload('uInfo', {
            page: {
                curr: 1 //重新从第 1 页开始
            },
            where: data.field
        });
        return false;
    });

    // 确定保存
    $('.btn-submit').on('click', function () {
        var data = table.checkStatus('uInfo').data;

        var userArr = new Array();
        for (var i = 0; i < data.length; i++) {
            userArr.push({
                UserId: data[i].UserId,
                UserName: data[i].UserName
            });
        }
        if (userArr.length < 1) {
            layer.msg("您尚未选择用户！", { icon: 5 });
            return;
        }

        var more = $('input[name=more]').val();
        if (more === "0" && userArr.length > 1) {
            layer.msg("您只能选择一个用户！", { icon: 5 });
            return;
        }

        if (parent.SaveUsers) {
            parent.SaveUsers(userArr);
            $('.btn-cancel').click();
        } else {
            layer.msg("在父窗体未找到【SaveUsers】该方法！", { icon: 5 });
        }
    });

    // 取消
    $('.btn-cancel').on('click', function () {
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    });

});