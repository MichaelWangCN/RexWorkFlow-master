layui.use(['layer', 'form', 'jquery'], function () {
    let layer = layui.layer;
    let form = layui.form;
    let $ = layui.jquery;

    var uId = $('input[name=UserId]').val();
    loadUserDept(uId);

    // 监听复选框
    function checkboxListener() {
        form.on('checkbox(department)', function (data) {
            clearCheckbox();
            $('input[name=deptName][value="' + data.value + '"]').prop("checked", true);
            form.render('checkbox'); // 复选框渲染
        });
    }

    // 清空复选框
    function clearCheckbox() {
        var deptObj = document.getElementsByName("deptName");
        for (var i = 0; i < deptObj.length; i++) {
            deptObj[i].checked = false;
        }
    }

    // 加载用户部门信息
    function loadUserDept(id) {
        $.ajax({
            url: '/Sys/User/GetUserDept',
            type: 'GET',
            data: {
                'userId': id
            },
            dataType: 'json',
            //contentType: 'application/json;charset=utf-8',
            beforeSend: function () {
                layer.load(1);
            },
            success: function (res) {
                layer.closeAll('loading');
                if (res.code === 0) {
                    var strHtml = '';
                    for (var i = 0; i < res.data.Depts.length; i++) {
                        var disabledHtml = '';
                        var checkedHtml = '';
                        if (res.data.Depts[i].Disabled) {
                            disabledHtml = 'disabled="disabled"';
                        }
                        if (res.data.Depts[i].Selected) {
                            checkedHtml = 'checked="checked"';
                        }
                        strHtml += '<input type="checkbox" name="deptName" title="' + res.data.Depts[i].Text + '" value="' + res.data.Depts[i].Value + '" ' + disabledHtml + ' ' + checkedHtml + ' lay-filter="department" />';
                    }
                    $('#td_dept').html(strHtml);
                    form.render('checkbox'); // 复选框渲染
                    checkboxListener();
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

    // 确定
    $('.btn-submit').on('click', function () {
        var checkedLength = $('input[name=deptName]:checked').length;
        if (checkedLength < 1) {
            layer.msg("您尚未选择部门！", { icon: 5 });
            return;
        }
        var param = {
            'UserId': $('input[name=UserId]').val(),
            "DeptId": $('input[name=deptName]:checked').val()
        };
        $.ajax({
            url: '/Sys/User/SaveUserDept',
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
    });

    // 取消
    $('.btn-cancel').on('click', function () {
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    });

});