layui.use(['layer', 'form', 'jquery', 'util'], function () {
    let layer = layui.layer;
    let form = layui.form;
    let $ = layui.jquery;
    var util = layui.util;

    // 表单验证
    form.verify({
        UserName: function (value, item) { //value：表单的值、item：表单的DOM对象
            if (util.isEmpty(value)) {
                return '用户名不能为空！';
            }
        },
        Account: function (value, item) { //value：表单的值、item：表单的DOM对象
            if (util.isEmpty(value)) {
                return '账号不能为空！';
            }
            // 验证是否存在该账号(保证登录账号的唯一)
            var accountIsExist = false;
            var checkMsg;
            $.ajax({
                url: '/Sys/User/CheckAccount',
                type: 'GET',
                data: {
                    'account': value,
                    'userId': $('input[name=UserId]').val()
                },
                dataType: 'json',
                async: false,
                success: function (res) {
                    if (res.code === 0) {
                        accountIsExist = res.data;
                    }
                    checkMsg = res.msg;
                },
                error: function (data) {
                    checkMsg = "验证账号异常！";
                    console.error(data.responseText);
                }
            });
            if (accountIsExist) {
                return checkMsg;
            }
        },
        Password: function (value, item) { //value：表单的值、item：表单的DOM对象
            if (util.isEmpty(value)) {
                return '密码不能为空！';
            }
        }
    });

    // 操作(提交)
    form.on('submit(operation-submit)', function (data) {
        data.field.IsDel = $('input[name=IsDel]').prop("checked") ? 0 : 1;
        var uId = Number($('input[name=UserId]').val());
        var requestUrl = uId !== 0 ? "/Sys/User/Update" : "/Sys/User/Add";
        $.ajax({
            url: requestUrl,
            type: 'POST',
            data: {
                'User': data.field
            },
            dataType: 'json',
            //contentType: 'application/json;charset=utf-8',
            beforeSend: function () {
                layer.load(1);
            },
            success: function (res) {
                layer.closeAll('loading');
                if (res.code === 0) {
                    layer.msg(res.msg, { icon: 1 }, function () {
                        if (parent.clickSearch) {
                            parent.clickSearch();
                        }
                        $('.btn-cancel').click();
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
        return false;
    });

    // 取消
    $('.btn-cancel').on('click', function () {
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    });

});