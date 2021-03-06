<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <#include "header.ftl">
    <script src="/Content/EasyUI/Buttons.js"></script>
    <style type="text/css">
        #iconlist li {
            display: block;
            float: left;
        }

        a:hover {
            font-size: 12px;
        }

        a:hover span {
            font-weight: bold;
            color: #F00;
        }
    </style>


    <script type="text/javascript">
        ${RuteUrl}
        ${toolbar}
        var ManuId = "";

        function del() {


            var rows = $('#tg').treegrid('getSelected');
            var postData = "";

            postData = {
                IDSet: rows.id
            };
            $.messager.confirm("删除信息", "您确认删除<font color='red' size='3'>" + rows.name + "</font>角色吗？", function (DeleteRole) {
                if (DeleteRole) {
                    $.get(BaseUrl + "del", postData, function (data) {
                        if (data.code > 0) {
                            //友情提示用户删除成功，刷新表格
                            $.messager.alert("友情提示", "删除成功");
                            SetTreeGridData();
                            //当删除完成之后，第二次删除的时候还记得上次的信息，这样是不可以的，所以我们需要清除第一次的信息
                            //第一种方法
                            rows.length = "";
                            //第二种方法
                            $("#tg").datagrid("clearSelections");
                        }
                        else {
                            $.messager.alert("友情提示", data.msg);
                        }
                    });
                }
            });

        }

        $(function () {
            $('#tg').treegrid({
                title: '部门管理',
                iconCls: 'icon-ok',
                fit: true,
                fitColumns: true,
                rownumbers: true,
                animate: true,
                collapsible: true,

                method: 'get',
                idField: 'id',
                treeField: 'name',
                showFooter: true,
                columns: [[
                    { title: '名称', field: 'name', width: 180 },
                    { title: '图标', field: 'iconCls', width: 60, align: 'right' },
                    { title: '备注', field: 'remarks', width: 80 },
                    { title: '排序', field: 'orderNo', width: 80 }
                ]],
                toolbar: toolbars
            });
            $('#DeparTree').combotree({
                width: 150,
                emptyText: '请选择'
            });
            SetTreeGridData();

        })
        function SetTreeGridData() {
            $.ajax({
                url: BaseUrl + 'getJson',
                type: 'POST',
                cache: false,
                error: function () { alert('Error loading PHP document'); },
                success: function (result) {
                    var data = eval(result);
                    $('#tg').treegrid('loadData', data);
                    $('#DeparTree').combotree('loadData', ConvertToTreeData(data));
                }
            });
        }

        //easyUI 弹出添加的对话框
        function addInfo() {
            //弹出层
            // $("#DivEditor").dialog('open').dialog('setTitle', '添加信息');
            $('#DivEditor').dialog({
                title: '添加信息',
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

            var rows = $('#tg').treegrid('getSelected');
            if (rows != null) {

                $('#DeparTree').combotree('setValue', rows.id)
            }
        }
        //实现的编辑，包括增查改
        function SaveInfo() {

            //判断的信息是否通过验证
            var validate = $("#ff").form('validate');
            if (validate == false) {
                return false;
            }
            //获取需要传递的参数传递给前台
          //  var postData = $("#ff").serializeArray();
            var postData = DataBaseFunction.GetFormData("ff");
            var Per = $('#DeparTree').combotree('getValue');
            if (Per == "") {

                Per = '0';
            }
            var DeparId =
                    {
                        'name': "parentid",        //属性名用引号括起来，属性间由逗号隔开
                        'value': Per
                    };

            postData.push(DeparId);
            //发送异步请求到后台保存数据
            $.post(BaseUrl + 'editInfo', postData, function (data) {
                alerts(data.msg, 2);
                if (data.code > 0) {
                    //添加成功  1.关闭弹出层，2.刷新DataGird
                   // alert("编辑成功");
                    $('#DivEditor').dialog('close');
                    $(".validatebox-tip").remove();
                    // $("#DivEditor").dialog("close");
                    SetTreeGridData();
                    $("#ff").form("clear");
                }
            });

        }



        //绑定修改显示详细信息的方法
        function editInfo() {
            //处理修改的信息，弹出修改的对话框,然后显示选择的的详细信息
            $("#DivEditor").dialog('open').dialog('setTitle', '修改信息').window('resize', { top: 100 });
            //首先发送一个异步请求去后台实现方法
            var ID = $('#tg').treegrid('getSelected').id;  //获取到了用选择的ID

            $.ajax({
                url: BaseUrl + 'getInfo',
                type: 'POST',
                data: { ID: ID },
                cache: false,
                error: function () { alert('Error $.ajax'); },
                success: function (result) {

                    for (items in result) {
                        $("#" + items).val(result[items]);
                    }
                    $('#DeparTree').combotree('setValue', result['parentid'])

                }
            });

        }
    </script>

</head>
<body>

<table id="tg"></table>


<!------------------------弹出修改角色信息的弹出层---------------------------------->
<div id="DivEditor" class="easyui-dialog" style="width: 580px; padding: 10px 20px"
     closed="true" resizable="true" modal="true" buttons="#dlg-buttons">
    <form id="ff" method="post" novalidate="novalidate">
        <fieldset>
            <legend>信息填写栏</legend>
            <table id="tblAdd">
                <tr>
                    <input type="hidden" id="id" name="id" />
                    <input type="hidden" id="createtime" name="createtime" />
                    <input type="hidden" id="modifytime" name="modifytime" />

                    <td>
                        <label>名称：</label></td>
                    <td>
                        <input class="easyui-validatebox" type="text" id="name" name="name" data-options="required:true,validType:'length[1,32]'" />
                    </td>

                </tr>
                <tr>
                    <td>
                        <label>图标：</label></td>
                    <td>
                        <input class="easyui-validatebox" type="text" id="icon" name="icon" /><a id="selecticon" ref="javascript:;"
                                                                                                 plain="true" class="easyui-linkbutton" icon="icon-search" title="选择图标"></a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>上级：</label></td>
                    <td>
                        <ul id="DeparTree"></ul>
                    </td>

                </tr>

                <tr>
                    <td>
                        <label>排序码：</label></td>
                    <td>
                        <input class="easyui-validatebox" type="text" id="orderno" name="orderno" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>描述：</label></td>
                    <td colspan="3">
                        <textarea style="height: 50px; width: 406px;" id="remarks" name="remarks"></textarea>
                    </td>
                </tr>
            </table>
        </fieldset>

    </form>

    <div style="text-align: center; width: 100%">
        <a href="javascript:void(0)" class="easyui-linkbutton" id="btnAddRole" iconcls="icon-ok" onclick="SaveInfo();">确定</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel" onclick="$('#DivEditor').dialog('close')">关闭</a>
    </div>
</div>

<div id="DviIcon" class="easyui-window" style="width: 660px; height: 400px; padding: 0px 10px" title="选择图标"
     closed="true" resizable="true" modal="true" buttons="#dlg-buttons">
</div>


</body>
</html>
