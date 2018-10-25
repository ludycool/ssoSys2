<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

 <#include "header.ftl">
    <script type="text/javascript">
        ${RuteUrl}
        var MenuButtonsData;
        var RoleId;
        jQuery(document).ready(function () {//获取每个菜单有的按钮
            $('#projectid').combobox('reload', '/AjaxHandler/Getpoject');  // 使用新的URL重新载入列表数据
            $('#projectid_eq').combobox('reload', '/AjaxHandler/Getpoject');  // 使用新的URL重新载入列表数据

            $('#roletypes').combobox('reload', '/AjaxHandler/GetSysItem?ItemType=RoleTypes');  // 使用新的URL重新载入列表数据
            $.ajax({
                url: BaseUrl + 'GetMenuButtonsData',
                type: 'POST',
                cache: false,
                error: function () { alert('Error loading PHP document'); },
                success: function (result) {
                    MenuButtonsData = result;
                }
            });

            $('#dg').datagrid({
                url: BaseUrl + 'search',
                columns: [[
                    { field: 'ck', checkbox: true },
                    { field: 'rolename', title: '角色名称', width: 100 },
                    { field: 'roletypesname', title: '类型', width: 100 },
                    { field: 'projectname', title: '所属项目', width: 100 },
                    { field: 'remarks', title: '描述', width: 300, align: 'right' }
                ]],
                iconCls: 'icon-text_list_bullets',
                title: '角色设置',
                nowrap: true,
                fit: true,
                fitColumns: true,
                singleSelect: true,
                striped: true,
                collapsible: true,
                pageSize: 20,
                pagination: true,
                width: 'auto',
                rownumbers: true,
                toolbar: [{
                    id: 'btnadd',
                    text: '添加',
                    iconCls: 'icon-add',
                    handler: function () {
                        //实现弹出注册信息的页面
                        AddInfo();
                    }
                }, '-', {
                    id: 'btncut',
                    text: '修改',
                    iconCls: 'icon-cut',
                    handler: function () {
                        //实现修改的方法
                        editInfo();
                    }
                }, '-', {
                    id: 'btnCancle',
                    text: '直接删除',
                    iconCls: 'icon-remove',
                    handler: function () {
                        //实现直接删除所有数据的方法
                        deleteInfo();
                    }
                }, '-', {
                    id: 'btnSetRole',
                    text: '分配权限',
                    iconCls: 'icon-shield_rainbow',
                    handler: function () {
                        var row = $("#dg").datagrid("getSelections")[0];  //获取到了用用户选择的ID
                        if (row != null) {
                            RoleId = row.id;

                            ShowSetRoleDiv(row);
                        }
                    }
                }, '-', {
                    id: 'btnFlash',
                    text: '刷新权限',
                    iconCls: 'icon-arrow_refresh',
                    handler: function () {
                        var row = $("#dg").datagrid("getSelections")[0];  //获取到了用用户选择的ID
                        if (row != null) {
                            RoleId = row.id;
                            Refreshpermissions(RoleId);
                        }
                    }
                }]
            });
        });


        function Refreshpermissions(id) {
            var postData = {
                roleid: id
            };
            $.post(BaseUrl + 'Refreshpermissions', postData, function (data) {
                alerts(data.msg, 2);

            });
        }


        //easyUI 弹出添加的对话框
        function AddInfo() {
            //弹出层
            // $("#DivEditor").dialog('open').dialog('setTitle', '添加信息');
            $('#DivEditor').dialog({
                title: '添加信息',
                //width: 400,
                //height: 200,
                closed: false,
                cache: false,
                // href: 'get_content.php',
                modal: true, top: 50, left: 50,
                onClose: function () {
                    //解决弹出窗口关闭后，验证消息还显示在最上面
                }
            });
            $(".validatebox-tip").remove();//清除验证样式
            DataBaseFunction.ClearForm("ff");
        }


        //绑定修改显示详细信息的方法
        function editInfo() {
            var rows = $("#dg").datagrid('getSelected');
            //首先取出来值判断只能选择一个
            if (rows == null) {
                $.messager.alert("友情提示", "请选择", "error");
                return;
            }
            $("#DivEditor").dialog('open').dialog('setTitle', '修改-' + rows.rolename).window('resize', { top: 50, left: 50 });
            $(".validatebox-tip").remove();//清除验证样式
            var ID = rows.id;  //获取到了用选择的ID
            $.ajax({
                url: BaseUrl + 'getInfo',
                type: 'POST',
                data: { ID: ID },
                cache: false,
                error: function () { alert('Error $.ajax'); },
                success: function (data) {
                    //   var result = eval('(' + data + ')');
                    DataBaseFunction.BindForm("ff", data);
                    $('#roletypes').combobox('setValue', data.roletypes);
                    $('#projectid').combobox('setValue', data['projectid']);
                }
            });
        }

        //实现的编辑，包括增查改
        function SaveInfo() {

            //判断的信息是否通过验证
            var validate = $("#ff").form('validate');
            if (validate == false) {
                return false;
            }
            //获取需要传递的参数传递给前台
            var data = DataBaseFunction.GetFormData("ff")
            //发送异步请求到后台保存数据
            $.post(BaseUrl + 'editInfo', data, function (data) {
                alerts(data.msg, 2);
                if (data.code > 0) {
                    $('#DivEditor').dialog('close');
                    $(".validatebox-tip").remove();
                    $("#dg").datagrid("reload");
                }
            });
        }

        //实现直接删除数据和伪删除数据的方法
        function deleteInfo(not) {
            //得到用户选择的数据的ID
            var rows = $("#dg").datagrid("getSelections");
            //首先判断用户是否已经选择了需要删除的数据,然后循环将用户选择的数据传递到后台
            if (rows.length >= 1) {
                //遍历出用户选择的数据的信息，这就是用户用户选择删除的用户ID的信息
                var ids = "";   //1,2,3,4,5
                for (var i = 0; i < rows.length; i++) {
                    //异步将删除的ID发送到后台，后台删除之后，返回前台，前台刷洗表格
                    ids += rows[i].id + ",";
                }
                //最后去掉最后的那一个,
                ids = ids.substring(0, ids.length - 1);
                //获取用户选择的用户信息，如果用户选择了已经登录的用户的话需要给出不能删除的信息
                var roleNames = "";
                for (var i = 0; i < rows.length; i++) {
                    roleNames += rows[i].rolename + ",";
                }
                roleNames = roleNames.substring(0, roleNames.length - 1);
                //首先取出来到底是直接删除还是伪删除发送异步请求的地址和是否是伪删除的参数
                var postData = "";

                postData = {
                    IDSet: ids
                };
                //}
                //else {
                //    postData = {
                //        ID: ids, Not: not
                //    }
                //}
                //然后确认发送异步请求的信息到后台删除数据
                $.messager.confirm("删除信息", "您确认删除<font color='red' size='3'>" + roleNames + "</font>角色吗？", function (DeleteRole) {
                    if (DeleteRole) {
                        $.get(BaseUrl + "del", postData, function (data) {
                            if (data.code > 0) {
                                //友情提示用户删除成功，刷新表格
                                $.messager.alert("友情提示", "删除/还原成功");
                                $("#dg").datagrid("reload");
                                //当删除完成之后，第二次删除的时候还记得上次的信息，这样是不可以的，所以我们需要清除第一次的信息
                                //第一种方法
                                rows.length = "";
                                //第二种方法
                                $("#dg").datagrid("clearSelections");
                            }
                            else {
                                $.messager.alert("友情提示", data.msg);
                            }
                        });
                    }
                });
            }
            else {
                alert("请选择你要删除的数据");
            }
        }
        //搜索
        function SearchGo() {
            DataBaseFunction.Search("fSearh", "dg");
            $("#Div_Searh").dialog('close');
        }



        //显示权限
        function ShowSetRoleDiv(data) {
            $('#DivSetRole').window({
                title: '角色:' + data.rolename + ' --  权限分配',
                modal: true,
                top: 50
            });
            $('#DivSetRole').window('open');

            var Column = $.ajax({//获取列数据
                url: BaseUrl + 'GetBtnColumn',
                data: {},
                async: false
            }).responseText;
            var Columndata = eval(Column);

            $('#tbRole').treegrid({

                width: 'auto',
                height: 500,
                rownumbers: true,
                animate: true,
                collapsible: true,
                fit: true,
                fitColumns: true,
                url: BaseUrl + 'GetManeOP',
                queryParams: { Id: data.id, T: Math.floor(Math.random() * 1000000) },
                method: 'get',
                idField: 'MenuId',
                treeField: 'Name',
                showFooter: true,
                columns: [Columndata],//
                toolbar: [{
                    id: 'btnadd',
                    text: '全选',
                    iconCls: 'icon-add',
                    handler: function () {
                        TreeEditorSet.IsSelect(true);
                        TreeEditorSet.CancleEdit();
                    }
                }, '-', {
                    id: 'btncut',
                    text: '取消全选',
                    iconCls: 'icon-delete',
                    handler: function () {
                        TreeEditorSet.IsSelect(false);
                    }
                }, '-', {
                    id: 'btnIsNotCancle',
                    text: '编辑',
                    iconCls: 'icon-television_add',
                    handler: function () {

                        TreeEditorSet.StartEdit();

                    }
                },
                    '-', {
                        id: 'btnIsNotCancle',
                        text: '取消编辑',
                        iconCls: 'icon-television_delete',
                        handler: function () {

                            TreeEditorSet.CancleEdit();
                        }
                    }, '-', {
                        id: 'btnCancle',
                        text: '保存应用',
                        iconCls: 'icon-ok',
                        handler: function () {
                            TreeEditorSet.CancleEdit();
                            TreeEditorSet.SaveSelect(RoleId);

                            // $('#DivSetRole').window('close');
                        }
                    }],
                onDblClickCell: function () {
                    var row = $('#tbRole').treegrid('getSelected');
                    if (row) {
                        $('#tbRole').treegrid('beginEdit', row.MenuId);
                        var editors = $('#tbRole').treegrid('getEditors', row.MenuId);
                        for (var k = 0; k < editors.length; k++) {
                            row[editors[k].field] = 1;
                            DelEditor(editors[k], row)
                        }
                    }
                }

            });
        }

        var TreeEditorSet = {
            IsSelect: function (IsSelectAll) {

                var row = $('#tbRole').treegrid('getData');

                $.each(row, function (i, n) {
                    if (n != null) {

                        var editors = $('#tbRole').treegrid('getEditors', n.MenuId);
                        for (var i = 0; i < editors.length; i++) {
                            IsCheckEditor(editors[i], n, IsSelectAll)

                        }
                        var row2 = $('#tbRole').treegrid('getChildren', n.MenuId);
                        for (var i = 0; i < row2.length; i++) {

                            var editors2 = $('#tbRole').treegrid('getEditors', row2[i].MenuId);
                            for (var k = 0; k < editors2.length; k++) {

                                IsCheckEditor(editors2[k], row2[i], IsSelectAll)
                            }
                        }
                    }
                });

            },
            CancleEdit: function () {
                var row = $('#tbRole').treegrid('getData');
                if (row != null) {
                    $.each(row, function (i, n) {
                        if (n != null) {
                            $('#tbRole').treegrid('endEdit', n.MenuId);
                            var row2 = $('#tbRole').treegrid('getChildren', n.MenuId);
                            for (var i = 0; i < row2.length; i++) {
                                $('#tbRole').treegrid('endEdit', row2[i].MenuId);
                            }
                        }
                    });

                }
            },
            StartEdit: function () {
                var row = $('#tbRole').treegrid('getData');
                if (row != null) {
                    $.each(row, function (i, n) {
                        if (n != null) {
                            $('#tbRole').treegrid('beginEdit', n.MenuId);
                            var editors = $('#tbRole').treegrid('getEditors', n.MenuId);
                            for (var i = 0; i < editors.length; i++) {
                                DelEditor(editors[i], n)
                            }
                            var row2 = $('#tbRole').treegrid('getChildren', n.MenuId);
                            for (var i = 0; i < row2.length; i++) {
                                $('#tbRole').treegrid('beginEdit', row2[i].MenuId);
                                var editors2 = $('#tbRole').treegrid('getEditors', row2[i].MenuId);
                                for (var k = 0; k < editors2.length; k++) {

                                    DelEditor(editors2[k], row2[i])
                                }
                            }
                        }
                    });
                }
            },
            SaveSelect: function (roleid) {

                var row = $('#tbRole').treegrid('getData');
                var RoleManus = "";
                var RoleManuButtons = "";

                $.each(row, function (i, n) {
                    if (n != null) {
                        for (items in n) {

                            if (items != "MenuId" && items != "_parentId") {//有可能为1的字段
                                if (n[items] == "1") {
                                    if (items == "ControlId_Browse") {
                                        RoleManus += n.MenuId + "_";
                                    } else {
                                        var indx = items.indexOf('_');
                                        var buttonId = items.substring(indx + 1, items.length);
                                        RoleManuButtons += n.MenuId + ":" + buttonId + "_"
                                    }
                                }
                            }
                        }
                        var row2 = $('#tbRole').treegrid('getChildren', n.MenuId);
                        $.each(row2, function (j, d) {
                            if (d != null) {
                                for (items in n) {
                                    if (items != "MenuId" && items != "_parentId") {//有可能为1的字段
                                        if (d[items] == "1") {
                                            if (items == "ControlId_Browse") {
                                                RoleManus += d.MenuId + "_";
                                            } else {
                                                var indx = items.indexOf('_');
                                                var buttonId = items.substring(indx + 1, items.length);
                                                RoleManuButtons += d.MenuId + ":" + buttonId + "_"
                                            }
                                        }
                                    }
                                }
                            }

                        })

                    }
                });

                RoleManus = RoleManus.substring(0, RoleManus.length - 1);
                RoleManuButtons = RoleManuButtons.substring(0, RoleManuButtons.length - 1);
                $.ajax({
                    url: BaseUrl + 'SaveRoleOP',
                    type: 'POST',
                    cache: false,
                    data: { RoleManus: RoleManus, RoleManuButtons: RoleManuButtons, RoleId: roleid },
                    error: function () { alert('SaveRoleOP'); },
                    success: function (result) {
                        if (result == "ok") {
                            alert("设置成功")
                        } else {

                            alert("设置失败", 2)
                        }
                    }
                });
            }

        }
        function DelEditor(dd, n) {

            if (dd.field != "ControlId_Browse") {
                var NoHave = true;

                var indx = dd.field.indexOf('_');
                var buttonId = dd.field.substring(indx + 1, dd.field.length);

                $.each(MenuButtonsData, function (j, d) {
                    if (d != null) {
                        if (d.parentid == n.MenuId && d.buttonid == buttonId) {
                            NoHave = false;
                        }
                    }
                });
                if (NoHave) {
                    $(dd.target).remove();
                }
            }


        }
        function IsCheckEditor(dd, n, IsSelectAll) {


            var NoHave = true;

            var indx = dd.field.indexOf('_');
            var buttonId = dd.field.substring(indx + 1, dd.field.length);

            $.each(MenuButtonsData, function (j, d) {
                if (d != null) {
                    if (d.parentid == n.MenuId && d.buttonid == buttonId) {
                        NoHave = false;
                    }
                }
            });
            if (!NoHave || dd.field == "ControlId_Browse") {
                $(dd.target).prop('checked', IsSelectAll);
            }
        }


        function formatCheck(value) {

            if (value == "1") {

                var s = '<span class="icon icon-ok">&nbsp;</span>';
                return s;
            } else if (value == "0") {
                var s = '×';
                return s;
            }

        }
    </script>

</head>
<body>
<!-- 一行高度是48px; -->
<div id="div_Searh" style="height:49px;width:100%;margin-top:0px;">
    <form id="fSearh">
        <table class="stripes" style="table-layout: fixed;margin-top:5px; width: 100%;" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td style="width: 80px;">
                    <label>项目：</label>
                </td>
                <td style="width: 210px;">
                    <input id="projectid_eq" name="projectid_eq" class="easyui-combobox" style=" width:200px;" data-options="valueField:'id',textField:'name'" />
                </td>
                <td>
                    <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-undo" style="float: left;" onclick=" DataBaseFunction.ClearForm('fSearh');">清除</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" style="float: left;" iconcls="icon-search" onclick="SearchGo();">搜索</a>
                </td>
            </tr>
        </table>
    </form>
</div>
<table id="dg"></table>

<!------------------------弹出修改角色信息的弹出层---------------------------------->
<div id="DivEditor" class="easyui-dialog" style="width: 680px;"
     closed="true" resizable="true" modal="true" buttons="#dlg-buttons">
    <div id="Div_form" class="easyui-panel" style="padding: 10px 20px; overflow-x: hidden;" data-options=" border:false">
        <form id="ff" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" />
            <input type="hidden" name="createby" />
            <input type="hidden" name="createtime" />
            <input type="hidden" name="modifyby" />
            <input type="hidden" name="modifytime" />
            <table class="stripes" style="table-layout: fixed;" border="0" cellspacing="0" cellpadding="0">

                <tr>
                    <td style="width:100px;">
                        <label>名称：</label>
                    </td>
                    <td>
                        <input class="easyui-validatebox textbox" type="text" name="rolename" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>备注：</label>
                    </td>
                    <td>
                        <textarea class="areabox" name="remarks"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>角色类型：</label>
                    </td>
                    <td>
                        <input id="roletypes" class="easyui-combobox" name="roletypes"
                               data-options="valueField:'itemvalue',textField:'itemname',required:true" />
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;">
                        <label>项目</label>
                    </td>
                    <td>
                        <input id="projectid" name="projectid" class="easyui-combobox" style="width:200px;" data-options="valueField:'id',textField:'name',required:true" />
                    </td>

                </tr>
            </table>
        </form>
    </div>

    <div style="text-align: center; width: 100%; margin-bottom: 5px;">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-ok" onclick="SaveInfo();">确定</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel" onclick="$('#DivEditor').dialog('close')">关闭</a>
    </div>
</div>

<div id="DivSetRole" class="easyui-window" style="width: 1000px; height: 700px;"
     closed="true" resizable="true" modal="true" buttons="#dlg-buttons">

    <table id="tbRole"></table>


</div>


</body>



</html>


