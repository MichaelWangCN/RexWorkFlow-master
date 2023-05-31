layui.use(['form', 'element', 'jquery', 'button', 'popup'], function () {
    var form = layui.form;
    var element = layui.element;
    var button = layui.button;
    var popup = layui.popup;
    var $ = layui.jquery;

    // 刷新二维码
    $('.codeImage').on('click', function () {
        var urlCode = "/Sys/User/ShowValidateCode?random=" + Math.random();
        $(this).attr("src", urlCode);
    });

    // 表单验证
    form.verify({
        username: function (value, item) { //value：表单的值、item：表单的DOM对象
            if (value === "") {
                return "请输入登录账号！";
            }
        },
        password: function (value, item) { //value：表单的值、item：表单的DOM对象
            if (value === "") {
                return "请输入登录密码！";
            }
        },
        validatecode: function (value, item) { //value：表单的值、item：表单的DOM对象
            if (value === "") {
                return "请输入验证码！";
            }
        }
    });

    // 登 录 提 交
    form.on('submit(login)', function (data) {
        var btnLoad = null;
        $.ajax({
            url: '/Sys/User/Login',
            type: 'POST',
            data: JSON.stringify(data.field),
            dataType: 'json',
            contentType: 'application/json;charset=utf-8',
            beforeSend: function () {
                btnLoad = button.load({ elem: '.login', time: false });
            },
            success: function (res) {
                if (res.LoginStatus === 1) {
                    if ($('input[name=savePwd]').prop('checked')) {
                        var saveInfo = {
                            uName: data.field.username,
                            uPwd: window.btoa(data.field.password)
                        }
                        localStorage.setItem("SaveInfo", JSON.stringify(saveInfo));
                    }
                    popup.success(res.Message);
                    var returnUrl = $('input[name=ReturnUrl]').val();
                    location.href = (returnUrl === "") ? "/Home/Index" : returnUrl;
                    return;
                }
                btnLoad.stop(function () {
                    $('.codeImage').click();
                    popup.failure(res.Message);
                });
            },
            error: function (data) {
                btnLoad.stop(function () {
                    $('.codeImage').click();
                    console.error(data.responseText);
                });
            }
        });

        return false;
    });

    var saveInfo = localStorage.getItem("SaveInfo");
    if (saveInfo !== null && saveInfo !== "") {
        var uInfo = JSON.parse(saveInfo);
        $('input[name=username]').val(uInfo.uName);
        $('input[name=password]').val(window.atob(uInfo.uPwd));
        $('input[name=savePwd]').prop('checked', true);
        form.render('checkbox');
    }

});