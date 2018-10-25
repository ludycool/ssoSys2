
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

 <#include "header.ftl">
    <script type="text/javascript">
        ${RuteUrl}
        var departmentId = "";
        var UserId = "";
        jQuery(document).ready(function () {
            BindUser();
            BindDepertment();
            BindRole();
        });

        function BindRole() {

            $('#tbRole').datagrid({
                url: '/AjaxHandler/GetList?RoleTypes=1',
                columns: [[
                    { field: 'rolename', title: '角色名称', width: 100 },
                    { field: 'projectname', title: '所属项目', width: 100 },
                    { field: 'remarks', title: '描述', width: 270, align: 'right' }
                ]],
                nowrap: true,
                singleSelect: true,
                striped: true,
                collapsible: true,
                pageSize: 1000,
                width: 510,
                height: 300,
                rownumbers: true
            });

        }
        function BindUser() {
            $('#dg').datagrid({
                url: BaseUrl + 'search',
                columns: [[
                    { field: 'ck', checkbox: true },
                    { field: 'loginname', title: '登录名', width: 200 },
                    { field: 'truename', title: '姓名', width: 200 },
                    { field: 'rolename', title: '角色', width: 200 },
                    { field: 'password', title: '密码', width: 100 },
                    { field: 'projectname', title: '所属项目', width: 100 },
                    { field: 'departmentname', title: '部门', width: 100 },
                    { field: 'createtime', title: '创建时间', width: 200 }
                ]],
                nowrap: true,
                singleSelect: true,
                striped: true,
                collapsible: true,
                pagination: true,
                fit: true,
                fitColumns: true,
                queryParams: { departmentId: departmentId, T: Math.floor(Math.random() * 1000000) },
                rownumbers: true,
                onLoadError: function () {
                    alert("没有数据");
                },
                toolbar: [{
                    id: 'btnadd',
                    text: '添加',
                    iconCls: 'icon-add',
                    handler: function () {
                        //实现弹出注册信息的页面
                        ShowAddDialog();
                    }
                }, '-', {
                    id: 'btncut',
                    text: '修改',
                    iconCls: 'icon-cut',
                    handler: function () {
                        //实现修改的方法
                        ShowUpdateInfo();
                    }
                }, '-', {
                    id: 'btnCancle',
                    text: '直接删除',
                    iconCls: 'icon-remove',
                    handler: function () {
                        //实现直接删除所有数据的方法
                        deleteInfo();
                    }

                }
                    , '-', {
                        id: 'btncut',
                        text: '分配角色',
                        iconCls: 'icon-arrow_out_longer',
                        handler: function () {
                            showRole();
                        }
                    }]
            });

        }
        function BindDepertment() {

            $('#tbDepartMent').datagrid({
                url: '/AjaxHandler/GetDepartment',
                columns: [[
                    { field: 'name', title: '名称', width: 140 }
                ]],
                nowrap: true,
                singleSelect: true,
                striped: true,
                collapsible: true,
                pageSize: 1000,
                fit: true,
                rownumbers: true,
                onClickRow: function () {
                    DeParmentId = $("#tbDepartMent").datagrid("getSelections")[0].id;  //获取到了用按钮选择的ID
                    $('#dg').datagrid('load', {
                        page: 1,
                        departmentId: DeParmentId
                    });
                }
            });
            $('#departmentid').combobox('reload', '/AjaxHandler/GetDepartment');  // 使用新的URL重新载入列表数据
        }


        function showRole() {
            var rows = $("#dg").datagrid("getSelected");
            if (rows) {
                UserId = rows.id;
                var rowData = $('#tbRole').datagrid("getRows");
                $.each(rowData, function (idx, val) {//遍历JSON设置选中行
                    if (val.id == rows.roleid) {
                        $('#tbRole').datagrid('selectRow', idx);
                    }
                });
                $('#DivRole').dialog({
                    title: '角色设定',
                    //width: 400,
                    //height: 200,
                    closed: false,
                    cache: false,
                    // href: 'get_content.php',
                    modal: true, top: 100,
                    onClose: function () {
                        //解决弹出窗口关闭后，验证消息还显示在最上面
                    }
                });
            }
        }

        function SetRole() {
            var rows = $("#tbRole").datagrid("getSelected");
            if (rows) {
                var postData =
                        {
                            UserId: UserId,        //属性名用引号括起来，属性间由逗号隔开
                            RoleId: rows.id
                        };
                $.post(BaseUrl + 'SetRole', postData, function (data) {
                    if (data = "OK") {
                        //添加成功  1.关闭弹出层，2.刷新DataGird
                        alert("设置成功");
                        $("#dg").datagrid("reload");
                        $('#DivRole').dialog('close');
                    }
                    else {
                        alert("编辑失败，请您检查");
                    }
                });
            }
        }
        //easyUI 弹出添加按钮的对话框
        function ShowAddDialog() {
            //弹出层
            // $("#DivEditor").dialog('open').dialog('setTitle', '添加按钮信息');
            $('#DivEditor').dialog({
                title: '添加按钮信息',
                //width: 400,
                //height: 200,
                closed: false,
                cache: false,
                // href: 'get_content.php',
                modal: true, top: 100,
                onClose: function () {
                    //解决弹出窗口关闭后，验证消息还显示在最上面

                }
            });
            $("#ff").form("clear");
        }
        //实现按钮的编辑，包括增查改
        function editInfo() {

            //判断按钮的信息是否通过验证
            var validate = $("#ff").form('validate');
            if (validate == false) {
                return false;
            }
            //获取需要传递的参数传递给前台 push
           // var postData = $("#ff").serializeArray();
            var postData = DataBaseFunction.GetFormData("ff")
            //var DeparId =
            //{
            //    'name': "departmentId",        //属性名用引号括起来，属性间由逗号隔开
            //    'value': $('#departmentId').combotree('getValue')
            //};
            //postData.push(DeparId);


            //发送异步请求到后台保存按钮数据
            $.post(BaseUrl + 'editInfo', postData, function (data) {
                alerts(data.msg, 2);
                if (data.code > 0) {
                    $('#DivEditor').dialog('close');
                    $(".validatebox-tip").remove();
                    // $("#DivEditor").dialog("close");
                    $("#dg").datagrid("reload");
                    $("#ff").form("clear");
                }
            });

        }

        //修改按钮的信息
        function ShowUpdateInfo(browse) {
            //首先取出来按钮选择的数据的ID
            var rows = $("#dg").datagrid("getSelections");
            //首先取出来值判断按钮只能选择一个
            if (rows.length != 1) {
                $.messager.alert("友情提示", "每次只能修改/浏览一条，你已经选择了<font color='red'  size='6'>" + rows.length + "</font>条", "error");
                return;
            }
            if (browse == null) {
                //处理修改的信息，弹出修改的对话框,然后显示选择的按钮的详细信息
                $("#DivEditor").dialog('open').dialog('setTitle', '修改按钮信息').window('resize', { top: 100 });
                //绑定修改显示详细信息的方法
                BindShowUpdateInfo();

            }
            else {
                //处理浏览的信息，弹出浏览狂，然后显示浏览信息的相信信息
                $("#DivBrowerRole").dialog('open').dialog('setTitle', '按钮浏览').window('resize', { top: 100 });
                //绑定按钮的浏览信息
                BindBrowerRoleInfo();
            }
        }

        //绑定修改显示详细信息的方法
        function BindShowUpdateInfo() {
            //首先按钮发送一个异步请求去后台实现方法
            var ID = $("#dg").datagrid("getSelections")[0].id;  //获取到了用按钮选择的ID
            $.ajax({
                url: BaseUrl + 'getInfo',
                type: 'POST',
                data: { ID: ID },
                cache: false,
                error: function () { alert('Error loading PHP document'); },
                success: function (result) {

                    for (items in result) {

                        $("#" + items).val(result[items]);
                    }
                    $('#departmentid').combobox('setValue', result['departmentid']);

                }
            });

        }
        //实现直接删除数据和伪删除数据的方法
        function deleteInfo(not) {
            //得到按钮选择的数据的ID
            var rows = $("#dg").datagrid("getSelections");
            //首先判断按钮是否已经选择了需要删除的数据,然后循环将按钮选择的数据传递到后台
            if (rows.length >= 1) {
                //遍历出按钮选择的数据的信息，这就是按钮按钮选择删除的按钮ID的信息
                var ids = "";   //1,2,3,4,5
                for (var i = 0; i < rows.length; i++) {
                    //异步将删除的ID发送到后台，后台删除之后，返回前台，前台刷洗表格
                    ids += rows[i].id + ",";
                }
                //最后去掉最后的那一个,
                ids = ids.substring(0, ids.length - 1);
                //获取按钮选择的按钮信息，如果按钮选择了已经登录的按钮的话需要给出不能删除的信息
                var LoginName = "";
                for (var i = 0; i < rows.length; i++) {
                    LoginName += rows[i].loginname + ",";
                }
                LoginName = LoginName.substring(0, LoginName.length - 1);
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
                $.messager.confirm("删除信息", "您确认删除<font color='red' size='3'>" + LoginName + "</font>按钮吗？", function (DeleteRole) {
                    if (DeleteRole) {
                        $.get(BaseUrl + "del", postData, function (data) {
                            if (data.code>0) {
                                //友情提示按钮删除成功，刷新表格
                                $.messager.alert("友情提示", "删除成功");
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
    </script>
</head>
<body>

<div class="easyui-layout" data-options="fit:true" style="margin:5px;">
    <div region="west" split="true" title="所属单位" style="width:180px;"><table id="tbDepartMent"></table></div>
    <div region="center" title="用户" style="padding:5px;background:#eee;" iconcls 'icon-user_earth'><table id="dg"></table></div>
</div>
<div id="DivEditor" class="easyui-dialog" style="width:580px;padding:10px 20px"
     closed="true" resizable="true" modal="true" buttons="#dlg-buttons">
    <form id="ff" method="post" novalidate="novalidate">
        <fieldset>
            <legend>按钮信息填写栏</legend>
            <table id="tblAdd">
                <tr>
                    <input type="hidden" id="id" name="id" />
                    <td><label>登录名：</label></td>
                    <td>
                        <input class="easyui-validatebox" type="text" id="loginname" name="loginname" data-options="required:true,validType:'length[1,32]'" />
                    </td>
                </tr>
                <tr>
                    <td><label>姓名：</label></td>
                    <td>
                        <input class="easyui-validatebox" type="text" id="truename" name="truename" data-options="required:true,validType:'length[1,32]'" />
                    </td>

                </tr>
                <tr>
                    <td><label>单位：</label></td>
                    <td>
                        <input id="departmentid" class="easyui-combobox" name="departmentid"
                               data-options="valueField:'id',textField:'name'" />
                    </td>
                </tr>
                <tr>
                    <td><label>密码：</label></td>
                    <td>
                        <input class="easyui-validatebox" type="text" id="Password" name="Password" />
                    </td>
                </tr>
            </table>
        </fieldset>

    </form>
    <div style="text-align: center; width: 100%">
        <a href="javascript:void(0)" class="easyui-linkbutton" id="btnAddRole" iconcls="icon-ok" onclick="editInfo();">确定</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel" onclick="$('#DivEditor').dialog('close')">关闭</a>
    </div>
</div>
<div id="DivRole" class="easyui-dialog" style="width:580px;height:435px;padding:10px 20px"
     closed="true" resizable="true" modal="true" buttons="#dlg-buttons">
    <fieldset>
        <legend>选择角色</legend>
        <table>
            <tr>
                <td colspan="4">
                    <table id="tbRole"></table>
                </td>
            </tr>
            <tr>
                <td colspan="4" style="text-align:center; padding-top:10px">
                    <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-ok" onclick="SetRole();">确定</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel" onclick="$('#DivRole').dialog('close')">关闭</a>
                </td>
            </tr>
        </table>
    </fieldset>
</div>
</body>
</html>


