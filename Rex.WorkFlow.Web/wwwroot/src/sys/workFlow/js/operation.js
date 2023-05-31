var openParentCategoryIndex;
var openFormIndex;
layui.use(['layer', 'form', 'jquery', 'util', 'element'], function () {
    let layer = layui.layer;
    let form = layui.form;
    let $ = layui.jquery;
    var util = layui.util;
    var element = layui.element;

    var flowId = $('input[name=FlowId]').val();
    if (flowId === "00000000-0000-0000-0000-000000000000") {
        $('input[name=FlowId]').val('');
    }

    // 流程验证
    form.verify({
        FlowName: function (value, item) { //value：流程的值、item：流程的DOM对象
            if (util.isEmpty(value)) {
                return '流程名称不能为空！';
            }
        },
        FormName: function (value, item) { //value：流程的值、item：流程的DOM对象
            if (util.isEmpty(value)) {
                return '请选择关联的表单！';
            }
        },
        CategoryName: function (value, item) { //value：流程的值、item：流程的DOM对象
            if (util.isEmpty(value)) {
                return '请选择流程分类！';
            }
        }
    });

    // 初始化关联表单
    initFormTree();

    // 初始化流程分类
    initCategory();

    // 初始化GooFlow
    initGooFlow(form);

    // 点击关联表单
    $('.input-form').click(function () {
        openFormIndex = layer.open({
            type: 1,
            title: '选择关联表单',
            maxmin: false,
            area: ['300px', '500px'],
            content: $('.category-container-form'),
            success: function (layero, index) {
                $('.category-container-form').show();
            },
            cancel: function (index) {
                $('.category-container-form').hide();
            }
        });
    });

    // 点击流程分类
    $('input[name=CategoryName]').on('click', function () {
        openParentCategoryIndex = layer.open({
            type: 1,
            title: '选择流程分类',
            shade: 0.1,
            offset: '100px',
            area: ['300px', '500px'],
            content: $('.category-container'),
            success: function (layero, index) {
                $('.category-container').show();
            },
            cancel: function (index) {
                $('.category-container').hide();
            }
        });
    });

    // 操作(提交)
    form.on('submit(operation-submit)', function (data) {
        var flowmodel = {
            FlowCode: $('input[name=FlowCode]').val(),
            FlowName: $('input[name=FlowName]').val(),
            Memo: $('textarea[name=Memo]').val(),
            Enable: 0,
            FlowContent: null,
            CategoryId: $('input[name=CategoryId]').val(),
            FlowId: $('input[name=FlowId]').val(),
            FormId: $('input[name=FormId]').val()
        };
        if ($('input[name=Enable]').is(":checked")) {
            flowmodel.Enable = 1;
        }
        console.log(workflow.exportData());
        flowmodel.FlowContent = JSON.stringify(workflow.exportData());
        var url = flowmodel.FlowId;
        if (util.isEmpty(flowmodel.FlowId) || flowmodel.FlowId === "00000000-0000-0000-0000-000000000000") {
            flowmodel.FlowId = null;
            url = '/WF/WorkFlow/InsertAsync';
        } else {

            url = '/WF/WorkFlow/UpdateAsync';
        }
        layer.load(1);
        $.ajax({
            type: 'POST',
            dataType: 'JSON',
            data: { workflow: flowmodel },
            url: url,
            success: function (data) {
                layer.closeAll('loading');
                if (data) {
                    refreshWorkFlow();
                    layer.msg('操作成功！', { icon: 1, time: 1500 }, function () {
                        $('.btn-cancel').click();
                    });
                } else {
                    layer.msg('操作失败！', { icon: 5, time: 1500 });
                }
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
        var flowId = $('input[name=FlowId]').val();
        var closeId = 'editFlow';
        if (util.isEmpty(flowId) || flowId === "00000000-0000-0000-0000-000000000000") {
            closeId = 'addFlow';
        }
        parent.layui.element.tabDelete('content', closeId);
    });

    // 刷新流程设计页
    function refreshWorkFlow() {
        // 1、得到流程设计Iframe的id
        var tabTitleObj = parent.document.getElementsByClassName("layui-tab-title");
        for (var i = 0; i < tabTitleObj.length; i++) {
            var isBreak = false; 
            var tabChildrenObj = tabTitleObj[i].children;
            for (var j = 0; j < tabChildrenObj.length; j++) {
                if (tabChildrenObj[j].innerText.indexOf('流程设计') >= 0) {
                    // 1.1、执行流程设计的查询方法
                    var id = tabChildrenObj[j].getAttribute("lay-id");
                    var wfIndex = parent.document.getElementById(id); // 91
                    if (wfIndex !== null) {
                        wfIndex.contentWindow.clickSearch();
                    }
                    isBreak = true;
                    break;
                }
            }
            if (isBreak) {
                break;
            }
        }
    }

});

// 初始化GooFlow
function initGooFlow(form) {
    var property = {
        toolBtns: ["start round mix", "end round", "task", "view"],
        haveHead: true,
        headLabel: true,
        headBtns: [],
        haveTool: true,
        haveGroup: false,
        useOperStack: true
    };
    var remark = {
        cursor: "选择指针",
        direct: "结点连线",
        start: "入口结点",
        end: "结束结点",
        task: "任务结点",
        node: "条件结点",//自动结点
        chat: "会签",
        state: "状态结点",
        plug: "附加插件",
        fork: "分支结点",
        join: "联合结点",
        complex: "复合结点",
        group: "组织划分框编辑开关",
        view: "通知节点"
    };
    workflow = $.createGooFlow($("#workflowpanel"), property);
    if ($('input[name=FlowId]').val() && $('input[name=FlowId]').val() !== '00000000-0000-0000-0000-000000000000') {
        workflow.loadData(JSON.parse($('input[name=FlowContent]').val()));
    }
    workflow.reinitSize(1150, 550);
    workflow.setNodeRemarks(remark);
    workflow.onItemDel = function (id, type) {
        if (confirm("确定要删除该单元吗?")) {
            this.blurItem();
            return true;
        } else {
            return false;
        }
    };
    workflow.onItemFocus = function (id, model) {
        var obj;
        $("#ele_model").val(model);
        $("#ele_id").val(id);
        if (model === "line") {
            obj = this.$lineData[id];
            $("#ele_type").val(obj.M);
            $("#ele_from").val(obj.from);
            $("#ele_to").val(obj.to);
        } else if (model === "node") {
            obj = this.$nodeData[id];
            $("#ele_type").val(obj.type);
            $("#ele_from").val("");
            $("#ele_to").val("");
        }
        $("#ele_name").val(obj.name);
        $('#mynodeeventtitle,#mynodeeventcontent').hide();
        return true;
    };
    workflow.onItemBlur = function (id, model) {
        $('.table-flow input[type=text]').val('');
        return true;
    };
    workflow.onItemDbClick = function (id, model) {
        var nodeobj = workflow.getItemInfo(id, model);
        if (model === 'node') {
            if (nodeobj.type === 'task' || nodeobj.type === 'node' || nodeobj.type === 'chat' || nodeobj.type === 'view') {
                pageprop.toggleNodeEvent(nodeobj.id, nodeobj.type);
                return false;
            }
        } else if (model === 'line') {
            pageprop.toggleLineEvent(nodeobj.id);
            return false;
        }
    };
    workflow.onItemAdd = function (id, type, json) {
        var flag = true;
        $.each(workflow.$nodeData, function (index, item) {
            if (item.type === 'start round mix') {
                flag = false;
            }
        });
        if (json.type === 'start round mix' && flag === false) {
            alert('开始节点只能有一个');
            return false;
        } else {
            flag = true;
            $.each(workflow.$nodeData, function (index, item) {
                if (item.type === 'end round') {
                    flag = false;
                }
            });
            if (json.type === 'end round' && flag === false) {
                alert('结束节点只能有一个');
                return false;
            }
            return true;
        }
    };

    // 流程名称输入监听
    $('input[name=FlowName]').on('input', function () {
        workflow.setTitle($(this).val());
    });

    //节点属性PAGE
    var pageprop = {
        init: function () {
            pageprop.initEvent();
            pageprop.TaskEvent();
            pageprop.ChatEvent();
        },
        toggleNodeEvent: function (id, type) {
            if (type === 'task') {
                $('#mynodeeventtitle,#mynodeeventcontent').show();
                if (workflow.getItemInfo(id, 'node').setInfo) {
                    var nodeobj = workflow.getItemInfo(id, 'node');
                    $('#NodeDesignate').val(nodeobj.setInfo.NodeDesignate);
                    var node_ids;
                    if (nodeobj.setInfo.NodeDesignate === 'SPECIAL_ROLE') {
                        $('#selectrolebox').show();
                        $('#selectuserbox,#selectsqlcode').hide();
                        node_ids = nodeobj.setInfo.Nodedesignatedata.roles;
                        pageprop.__getRoleTree(node_ids, function (ids, names, data) {
                            $('#selectrolebox input[type=hidden]').val(ids.join(','));
                            $('#selectrolebox textarea').val(names.join(','));
                        });
                    } else if (nodeobj.setInfo.NodeDesignate === 'SPECIAL_USER') {
                        $('#selectuserbox').show();
                        $('#selectrolebox,#selectsqlcode').hide();
                        node_ids = nodeobj.setInfo.Nodedesignatedata.users;
                        pageprop.__getUserTree(node_ids, function (ids, names, data) {
                            $('#selectuserbox input[type=hidden]').val(ids.join(','));
                            $('#selectuserbox textarea').val(names.join(','));
                        });
                    } else if (nodeobj.setInfo.NodeDesignate === 'SQL') {
                        $('#selectsqlcode').show();
                        $('#selectuserbox,#selectrolebox').hide();
                        node_ids = nodeobj.setInfo.Nodedesignatedata.sql;
                        $('#selectsqlcode textarea').val(node_ids);
                    }
                    else {
                        $('#selectrolebox,#selectuserbox,#selectsqlcode').hide();
                    }
                }
            } else if (type === 'chat') {
                $('#mynodechattitle,#mynodechatcontent').show();
                if (workflow.getItemInfo(id, 'node').setInfo) {
                    var chatnodeobj = workflow.getItemInfo(id, 'node');
                    var chatnode_ids = chatnodeobj.setInfo.Nodedesignatedata.users;
                    $('#ChatType').val(chatnodeobj.setInfo.ChatData.ChatType);
                    $('#ChatParallelCalcType').val(chatnodeobj.setInfo.ChatData.ChatParallelCalcType);
                    pageprop.__getUserTree(chatnode_ids, function (ids, names, data) {
                        $('#selectchatusertrees').parent().find('input[type=hidden]').val(ids.join(','));
                        $('#selectchatusertrees').parent().find('textarea').val(names.join(','));
                    });
                }
            } else if (type == 'view') {
                $('#myviewtitle,#myviewcontent').show();
                if (workflow.getItemInfo(id, 'node').setInfo) {
                    var nodeobj = workflow.getItemInfo(id, 'node');
                    $('#NodeViewDesignate').val(nodeobj.setInfo.NodeDesignate);
                    var node_ids;
                    if (nodeobj.setInfo.NodeDesignate === 'SPECIAL_ROLE') {
                        $('#selectviewrolebox').show();
                        $('#selectviewuserbox,#selectviewsqlcode').hide();
                        node_ids = nodeobj.setInfo.Nodedesignatedata.roles;
                        pageprop.__getRoleTree(node_ids, function (ids, names, data) {
                            $('#selectviewrolebox input[type=hidden]').val(ids.join(','));
                            $('#selectviewrolebox textarea').val(names.join(','));
                        });
                    } else if (nodeobj.setInfo.NodeDesignate === 'SPECIAL_USER') {
                        $('#selectviewuserbox').show();
                        $('#selectviewrolebox,#selectviewsqlcode').hide();
                        node_ids = nodeobj.setInfo.Nodedesignatedata.users;
                        pageprop.__getUserTree(node_ids, function (ids, names, data) {
                            $('#selectviewuserbox input[type=hidden]').val(ids.join(','));
                            $('#selectviewuserbox textarea').val(names.join(','));
                        });
                    } else if (nodeobj.setInfo.NodeDesignate === 'SQL') {
                        $('#selectviewsqlcode').show();
                        $('#selectviewuserbox,#selectviewrolebox').hide();
                        node_ids = nodeobj.setInfo.Nodedesignatedata.sql;
                        $('#selectviewsqlcode textarea').val(node_ids);
                    }
                    else {
                        $('#selectviewrolebox,#selectviewuserbox,#selectviewsqlcode').hide();
                    }
                }
            }
        },
        toggleLineEvent: function (id) {
            $('#mylineeventtitle,#mylineeventcontent').show();
            if (workflow.getItemInfo(id, 'line').setInfo) {
                $('#selectlinebox textarea').val(workflow.getItemInfo(id, 'line').setInfo.CustomSQL);
            }
        },
        __getRoleTree: function (node_ids, callback) {
            var index = layer.load();
            $.ajax({
                type: 'POST',
                dataType: 'JSON',
                url: '/WF/Config/GetRoleTreesAsync',
                data: { ids: node_ids },
                async: false,
                success: function (data) {
                    var ids = [];
                    var names = [];
                    $.each(data, function (index, item) {
                        $.each(node_ids, function (i, id) {
                            if (id == item.id) {
                                ids.push(item.id);
                                names.push(item.name);
                            }
                        });
                    });
                    layer.close(index);
                    if (callback) {
                        callback(ids, names, data);
                    }
                }
            });
        },
        __getUserTree: function (node_ids, callback) {
            var index = layer.load();
            $.ajax({
                type: 'POST',
                dataType: 'JSON',
                url: '/WF/Config/GetUserTreeAsync',
                data: { ids: node_ids },
                async: false,
                success: function (data) {
                    var ids = [];
                    var names = [];
                    $.each(data, function (index, item) {
                        $.each(node_ids, function (i, id) {
                            if (id == item.id) {
                                ids.push(item.id);
                                names.push(item.name);
                            }
                        });
                    });
                    layer.close(index);
                    if (callback) {
                        callback(ids, names, data);
                    }
                }
            });
        },
        ChatEvent: function () {
            $('#selectchatusertrees').click(function () {
                var idstr = $(this).parent().find('input[type=hidden]').val();
                var ids = idstr.split(',');
                $.ajax({
                    type: 'POST',
                    dataType: 'JSON',
                    url: '/WF/Config/GetUserTreeAsync',
                    data: { ids: ids },
                    success: function (data) {
                        chatUserTree = $.fn.zTree.init($("#chatusersTree"), pageprop.setting, data);
                        chatUserTree.expandAll(true);
                    }
                });
                layer.open({
                    type: 1,
                    title: '选择用户',
                    maxmin: false,
                    area: ['300px', '500px'],
                    content: $('#chatusers')
                });
            });
            $('#savechatusers').click(function () {
                var nodes = chatUserTree.getCheckedNodes(true);
                var ids = [];
                var names = [];
                for (var i = 0; i < nodes.length; i++) {
                    ids.push(nodes[i].id);
                    names.push(nodes[i].name);
                }
                $('#selectchatusertrees').parent().find('input[type=hidden]').val(ids.join(','));
                $('#selectchatusertrees').parent().find('textarea').val(names.join(','));
                layer.closeAll();
            });
            /*
            $('#ChatType').change(function () {
                var val = $(this).val();
                if (val == 0) {
                    $('#ChatParallelCalcType').parent().parent().show();
                } else {
                    $('#ChatParallelCalcType').parent().parent().hide();
                }
            });
            */
            form.on('select(form-ChatType)', function (data) {
                if (data.value == 0) {
                    $('#ChatParallelCalcType').parent().parent().show();
                } else {
                    $('#ChatParallelCalcType').parent().parent().hide();
                }
            });
        },
        TaskEvent: function () {
            form.on('select(form-NodeDesignate)', function (data) {
                var val = data.value;
                if (val == 'SPECIAL_USER') {
                    $('#selectuserbox').show();
                    $('#selectsqlcode,#selectrolebox').hide();
                } else if (val == 'SPECIAL_ROLE') {
                    $('#selectrolebox').show();
                    $('#selectsqlcode,#selectuserbox').hide();
                } else if (val == 'SQL') {
                    $('#selectsqlcode').show();
                    $('#selectuserbox,#selectrolebox').hide();
                } else {
                    $('#selectuserbox,#selectrolebox,#selectsqlcode').hide();
                }
            });
            /*
            $('#NodeDesignate').change(function () {
                var val = $(this).val();
                if (val == 'SPECIAL_USER') {
                    $('#selectuserbox').show();
                    $('#selectsqlcode,#selectrolebox').hide();
                } else if (val == 'SPECIAL_ROLE') {
                    $('#selectrolebox').show();
                    $('#selectsqlcode,#selectuserbox').hide();
                } else if (val == 'SQL') {
                    $('#selectsqlcode').show();
                    $('#selectuserbox,#selectrolebox').hide();
                } else {
                    $('#selectuserbox,#selectrolebox,#selectsqlcode').hide();
                }
            });
            */

            form.on('select(form-NodeViewDesignate)', function (data) {
                var val = data.value;
                if (val == 'SPECIAL_USER') {
                    $('#selectviewuserbox').show();
                    $('#selectviewsqlcode,#selectviewrolebox').hide();
                } else if (val == 'SPECIAL_ROLE') {
                    $('#selectviewrolebox').show();
                    $('#selectviewsqlcode,#selectviewuserbox').hide();
                } else if (val == 'SQL') {
                    $('#selectviewsqlcode').show();
                    $('#selectviewuserbox,#selectviewrolebox').hide();
                } else {
                    $('#selectviewuserbox,#selectviewrolebox,#selectviewsqlcode').hide();
                }
            });
            /*
            $('#NodeViewDesignate').change(function () {
                var val = $(this).val();
                if (val == 'SPECIAL_USER') {
                    $('#selectviewuserbox').show();
                    $('#selectviewsqlcode,#selectviewrolebox').hide();
                } else if (val == 'SPECIAL_ROLE') {
                    $('#selectviewrolebox').show();
                    $('#selectviewsqlcode,#selectviewuserbox').hide();
                } else if (val == 'SQL') {
                    $('#selectviewsqlcode').show();
                    $('#selectviewuserbox,#selectviewrolebox').hide();
                } else {
                    $('#selectviewuserbox,#selectviewrolebox,#selectviewsqlcode').hide();
                }
            });
            */
            $('#selectroletrees').click(function () {
                var idstr = $('#selectrolebox input[type=hidden]').val();
                var ids = idstr.split(',');
                $.ajax({
                    type: 'POST',
                    dataType: 'JSON',
                    url: '/WF/Config/GetRoleTreesAsync',
                    data: { ids: ids },
                    success: function (data) {
                        rolesTree = $.fn.zTree.init($("#rolesTree"), pageprop.setting, data);
                        rolesTree.expandAll(true);
                    }
                });
                layer.open({
                    type: 1,
                    title: '选择角色',
                    maxmin: false,
                    area: ['300px', '500px'],
                    content: $('#roles')
                });
            });
            $('#selectviewroletrees').click(function () {
                var idstr = $('#selectviewrolebox input[type=hidden]').val();
                var ids = idstr.split(',');
                $.ajax({
                    type: 'POST',
                    dataType: 'JSON',
                    url: '/WF/Config/GetRoleTreesAsync',
                    data: { ids: ids },
                    success: function (data) {
                        viewrolesTree = $.fn.zTree.init($("#viewrolesTree"), pageprop.setting, data);
                        viewrolesTree.expandAll(true);
                    }
                });
                layer.open({
                    type: 1,
                    title: '选择角色',
                    maxmin: false,
                    area: ['300px', '500px'],
                    content: $('#viewroles')
                });
            });
            $('#selectuserpage').click(function () {
                var idstr = $('#selectuserbox input[type=hidden]').val();
                var ids = idstr.split(',');
                $.ajax({
                    type: 'POST',
                    dataType: 'JSON',
                    url: '/WF/Config/GetUserTreeAsync',
                    data: { ids: ids },
                    success: function (data) {
                        usersTree = $.fn.zTree.init($("#usersTree"), pageprop.setting, data);
                        usersTree.expandAll(true);
                    }
                });
                layer.open({
                    type: 1,
                    title: '选择用户',
                    maxmin: false,
                    area: ['300px', '500px'],
                    content: $('#users')
                });
            });
            $('#selectviewuserpage').click(function () {
                var idstr = $('#selectviewuserbox input[type=hidden]').val();
                var ids = idstr.split(',');
                $.ajax({
                    type: 'POST',
                    dataType: 'JSON',
                    url: '/WF/Config/GetUserTreeAsync',
                    data: { ids: ids },
                    success: function (data) {
                        viewusersTree = $.fn.zTree.init($("#viewusersTree"), pageprop.setting, data);
                        viewusersTree.expandAll(true);
                    }
                });
                layer.open({
                    type: 1,
                    title: '选择用户',
                    maxmin: false,
                    area: ['300px', '500px'],
                    content: $('#viewusers')
                });
            });
            $('#saveroles').click(function () {
                var nodes = rolesTree.getCheckedNodes(true);
                var ids = [];
                var names = [];
                for (var i = 0; i < nodes.length; i++) {
                    ids.push(nodes[i].id);
                    names.push(nodes[i].name);
                }
                $('#selectrolebox input[type=hidden]').val(ids.join(','));
                $('#selectrolebox textarea').val(names.join(','));
                layer.closeAll();
            });
            $('#saveviewroles').click(function () {
                var nodes = viewrolesTree.getCheckedNodes(true);
                var ids = [];
                var names = [];
                for (var i = 0; i < nodes.length; i++) {
                    ids.push(nodes[i].id);
                    names.push(nodes[i].name);
                }
                $('#selectviewrolebox input[type=hidden]').val(ids.join(','));
                $('#selectviewrolebox textarea').val(names.join(','));
                layer.closeAll();
            });
            $('#saveusers').click(function () {
                var nodes = usersTree.getCheckedNodes(true);
                var ids = [];
                var names = [];
                for (var i = 0; i < nodes.length; i++) {
                    ids.push(nodes[i].id);
                    names.push(nodes[i].name);
                }
                $('#selectuserbox input[type=hidden]').val(ids.join(','));
                $('#selectuserbox textarea').val(names.join(','));
                layer.closeAll();
            });
            $('#saveviewusers').click(function () {
                var nodes = viewusersTree.getCheckedNodes(true);
                var ids = [];
                var names = [];
                for (var i = 0; i < nodes.length; i++) {
                    ids.push(nodes[i].id);
                    names.push(nodes[i].name);
                }
                $('#selectviewuserbox input[type=hidden]').val(ids.join(','));
                $('#selectviewuserbox textarea').val(names.join(','));
                layer.closeAll();
            });
        },
        initEvent: function () {
            $('#formReturn').on('click', function () {
                layer.menu.closeCurrentTab();
            });
            $('#savenodeprop').click(function () {
                var nodeModel = $('#ele_model').val();
                if (nodeModel === 'node') {//node类型时候
                    var nodeType = $('#ele_type').val();
                    var selfinfodata = {};
                    if (nodeType === 'task') {
                        selfinfodata = {
                            NodeDesignate: $('#NodeDesignate').val(),
                            Nodedesignatedata: {
                                users: [],
                                roles: [],
                                orgs: [],
                                sql: ''
                            }
                        };
                        if (selfinfodata.NodeDesignate == 'SPECIAL_ROLE') {
                            selfinfodata.Nodedesignatedata.roles = $('#selectrolebox input[type=hidden]').val().split(',');
                        } else if (selfinfodata.NodeDesignate == 'SPECIAL_USER') {
                            selfinfodata.Nodedesignatedata.users = $('#selectuserbox input[type=hidden]').val().split(',');
                        } else if (selfinfodata.NodeDesignate == 'SQL') {
                            selfinfodata.Nodedesignatedata.sql = $('#selectsqlcode textarea').val();
                        }
                    } else if (nodeType === 'chat') {
                        selfinfodata = {
                            NodeDesignate: 'SPECIAL_USER',
                            Nodedesignatedata: {
                                users: [],
                                roles: [],
                                orgs: []
                            },
                            IsChat: true,
                            ChatData: {
                                ChatType: $('#ChatType').val(),
                                ChatParallelCalcType: $('#ChatParallelCalcType').val()
                            }
                        };
                        selfinfodata.Nodedesignatedata.users = $('#selectchatusertrees').parent().find('input[type=hidden]').val().split(',');
                    } else if (nodeType == 'view') {
                        selfinfodata = {
                            NodeDesignate: $('#NodeViewDesignate').val(),
                            Nodedesignatedata: {
                                users: [],
                                roles: [],
                                orgs: [],
                                sql: ''
                            }
                        };
                        if (selfinfodata.NodeDesignate == 'SPECIAL_ROLE') {
                            selfinfodata.Nodedesignatedata.roles = $('#selectviewrolebox input[type=hidden]').val().split(',');
                        } else if (selfinfodata.NodeDesignate == 'SPECIAL_USER') {
                            selfinfodata.Nodedesignatedata.users = $('#selectviewuserbox input[type=hidden]').val().split(',');
                        } else if (selfinfodata.NodeDesignate == 'SQL') {
                            selfinfodata.Nodedesignatedata.sql = $('#selectviewsqlcode textarea').val();
                        }
                    }
                    workflow.setName($('#ele_id').val(), $('#ele_name').val(), 'node', selfinfodata);
                } else if (nodeModel === 'line') {
                    var sql = $('#selectlinebox textarea').val();
                    var setInfo = {
                        CustomSQL: sql
                    };
                    workflow.setName($('#ele_id').val(), $('#ele_name').val(), 'line', setInfo);
                }
            });
        },
        setting: {
            check: {
                enable: true
            },
            data: {
                simpleData: {
                    enable: true
                }
            }
        }
    };
    pageprop.init();

}

// 初始化关联表单
function initFormTree() {
    $.ajax({
        url: '/WF/Form/GetFormTreeAsync',
        type: 'GET',
        data: {

        },
        dataType: 'json',
        // contentType: 'application/json;charset=utf-8',
        beforeSend: function () {
            layer.load(1);
        },
        success: function (res) {
            layer.closeAll('loading');
            if (res != null) {
                var parentMenus = res;
                var zNodes = parentMenus;
                var setting = {
                    view: {
                        dblClickExpand: false
                    },
                    data: {
                        simpleData: {
                            enable: true
                        }
                    },
                    callback: {
                        beforeClick: function (treeId, treeNode) {
                            $('input[name=FormId]').val(treeNode.id);
                            $('input[name=FormName]').val(treeNode.name);
                            layer.close(openFormIndex);
                            $('.category-container-form').hide();
                        }
                    }
                };
                var treeobj = $.fn.zTree.init($("#treeForm"), setting, zNodes);
                treeobj.expandAll(true);
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

// 初始化父级分类
function initCategory() {
    var value = $('input[name=CategoryId]').val();
    $.ajax({
        url: '/WF/Category/GetCategoryTreeAsync',
        type: 'GET',
        data: {
            id: value
        },
        dataType: 'json',
        // contentType: 'application/json;charset=utf-8',
        beforeSend: function () {
            layer.load(1);
        },
        success: function (res) {
            layer.closeAll('loading');
            if (res.code === 0) {

                var parentMenus = res.data;
                var zNodes = parentMenus;
                var setting = {
                    view: {
                        dblClickExpand: false
                    },
                    data: {
                        simpleData: {
                            enable: true
                        }
                    },
                    callback: {
                        beforeClick: function (treeId, treeNode) {
                            $('input[name=CategoryId]').val(treeNode.id);
                            $('input[name=CategoryName]').val(treeNode.name);
                            layer.close(openParentCategoryIndex);
                            $('.category-container').hide();
                        }
                    }
                };
                var treeobj = $.fn.zTree.init($("#treeCategory"), setting, zNodes);
                treeobj.expandAll(true);
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