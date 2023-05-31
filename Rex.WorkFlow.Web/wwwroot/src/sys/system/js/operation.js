layui.use(['layer', 'form', 'jquery', 'util'], function () {
    let layer = layui.layer;
    let form = layui.form;
    let $ = layui.jquery;
    var util = layui.util;

    // 表单验证
    form.verify({
        SystemName: function (value, item) { //value：表单的值、item：表单的DOM对象
            if (util.isEmpty(value)) {
                return '系统名称不能为空！';
            }
        },
        Sort: function (value, item) { //value：表单的值、item：表单的DOM对象
            if (util.isEmpty(value)) {
                return '排序不能为空！';
            }
        }
    });

    // 操作(提交)
    form.on('submit(operation-submit)', function (data) {
        data.field.IsDel = $('input[name=IsDel]').prop("checked") ? 0 : 1;
        var uId = Number($('input[name=SystemId]').val());
        var requestUrl = uId !== 0 ? "/Sys/System/Update" : "/Sys/System/Add";
        $.ajax({
            url: requestUrl,
            type: 'POST',
            data: data.field,
            dataType: 'json',
            // contentType: 'application/json;charset=utf-8',
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