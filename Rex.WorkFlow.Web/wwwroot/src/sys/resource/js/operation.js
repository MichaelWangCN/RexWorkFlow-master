layui.use(['layer', 'form', 'jquery', 'util', 'iconPicker'], function () {
    let layer = layui.layer;
    let form = layui.form;
    let $ = layui.jquery;
    var util = layui.util;
    var iconPicker = layui.iconPicker;

    // 表单验证
    form.verify({
        ResourceName: function (value, item) { //value：表单的值、item：表单的DOM对象
            if (util.isEmpty(value)) {
                return '菜单名称不能为空！';
            }
        }
    });

    // 图标选择器
    iconPicker.render({
        elem: '#icon_picker',
        type: 'fontClass',
        search: true,
        page: true,
        limit: 16,
        click: function (data) {
            $('#icon_picker').val("layui-icon " + data.icon);
        },
        success: function (d) {
            //$('#icon_picker').val("layui-icon " + d.icon);
        }
    });

    // 打开父级菜单选择
    $('.btn-parent-menu').on('click', function () {
        layer.open({
            type: 2,
            title: '选择父级菜单',
            shade: 0.1,
            offset: '100px',
            area: ['240px', '500px'],
            content: '/Sys/Resource/SelectParentMenu'
        });
    });

    // 操作(提交)
    form.on('submit(operation-submit)', function (data) {
        data.field.IsDel = $('input[name=IsDel]').prop("checked") ? 0 : 1;
        if (!util.isEmpty(data.field.ParentId)) {
            data.field.ParentId = $('input[name=ParentId]').attr("data-id");
        }

        var model = {
            SysResource: data.field,
            ButtonDto: []
        };
        var btns = new Array();
        var btnObj = document.getElementsByName("Btns");
        for (var i = 0; i < btnObj.length; i++) {
            btns.push({
                'Id': btnObj[i].dataset.id,
                'ButtonType': btnObj[i].dataset.buttontype,
                'ButtonModel': btnObj[i].dataset.buttonmodel,
                'Name': btnObj[i].dataset.title
            });
            if (btnObj[i].checked) {
                btns[i].ButtonModel = btns[i].ButtonType;
            }
        }
        model.ButtonDto = btns;
        delete model.SysResource.Btns;
        var dId = Number($('input[name=ResourceId]').val());
        var requestUrl = dId !== 0 ? "/Sys/Resource/Update" : "/Sys/Resource/Add";
        $.ajax({
            url: requestUrl,
            type: 'POST',
            data: model,
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

// 设置父级菜单值
function setParentIdMenu(id, name) {
    $('input[name=ParentId]').val(name);
    $('input[name=ParentId]').attr("data-id", id);
}