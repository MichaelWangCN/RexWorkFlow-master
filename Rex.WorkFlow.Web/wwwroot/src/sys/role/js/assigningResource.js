layui.use(['layer'], function () {
    let layer = layui.layer;

    // 执行加载角色信息
    loadResourceTree();

    // 确定
    $('.btn-submit').on('click', function () {
        var treeRole = $.fn.zTree.getZTreeObj("treeRole");
        var nodes = treeRole.getCheckedNodes(true);
        var ResourceIds = [];
        for (var i = 0; i < nodes.length; i++) {
            ResourceIds.push(nodes[i].id);
        }
        var roleId = $('input[name=hroleid]').val();
        var param = {
            "RoleId": Number(roleId),
            'ResourceIds': ResourceIds
        };
        $.ajax({
            url: '/Sys/Role/BoxSave',
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
function loadResourceTree() {
    var rolesTree;
    var expandDepth = 2;
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
        url: '/Sys/Role/Box',
        type: 'GET',
        data: {
            'roleId': $('input[name=hroleid]').val()
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
                if (expandDepth !== 0) {
                    rolesTree.expandAll(false);
                    var nodes = rolesTree.getNodesByFilter(function (node) {
                        return (node.level < expandDepth);
                    });
                    if (nodes.length > 0) {
                        for (var i = 0; i < nodes.length; i++) {
                            rolesTree.expandNode(nodes[i], true, false);
                        }
                    }
                } else {
                    rolesTree.expandAll(true);
                }
                /* end：初始化树形角色 */
            }
        },
        error: function (data) {
            layer.closeAll('loading');
            console.error(data.responseText);
        }
    });
}