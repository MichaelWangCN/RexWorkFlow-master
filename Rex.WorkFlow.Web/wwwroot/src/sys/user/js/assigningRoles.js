layui.use(['layer'], function () {
    let layer = layui.layer;

    // 执行加载角色信息
    loadRoleTree();

    // 确定
    $('.btn-submit').on('click', function () {
        var treeRole = $.fn.zTree.getZTreeObj("treeRole");
        var nodes = treeRole.getCheckedNodes(true);
        var roleIds = [];
        for (var i = 0; i < nodes.length; i++) {
            if (nodes[i].level == 1) {
                roleIds.push(nodes[i].id);
            }
        }
        var userId = $('input[name=huserid]').val();
        var param = {
            "UserId": Number(userId),
            'RoleIds': roleIds
        };
        $.ajax({
            url: '/Sys/User/RoleBoxSave',
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

// 加载角色信息
function loadRoleTree() {
    var rolesTree;
    var setting = {
        check: {
            enable: true
        },
        data: {
            simpleData: {
                enable: true
            }
        }
    };
    $.ajax({
        url: '/Sys/User/RoleBox',
        type: 'GET',
        data: {
            'userId': $('input[name=huserid]').val()
        },
        dataType: 'json',
        //contentType: 'application/json;charset=utf-8',
        beforeSend: function () {
            layer.load(1);
        },
        success: function (res) {
            layer.closeAll('loading');
            if (res.code === 0) {
                /* start：初始化树形角色 */
                var zNodes = res.data;
                rolesTree = $.fn.zTree.init($("#treeRole"), setting, zNodes);
                rolesTree.expandAll(true); // 展开全部
                /* end：初始化树形角色 */
            }
        },
        error: function (data) {
            layer.closeAll('loading');
            console.error(data.responseText);
        }
    });
}