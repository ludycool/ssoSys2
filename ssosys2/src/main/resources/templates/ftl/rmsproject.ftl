<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <#include "header.ftl">
    <script type="text/javascript">
        ${RuteUrl}
        ${toolbar}
            jQuery(document).ready(function () {
                DataGridSet();
                $('#companyid').combobox('reload', '/AjaxHandler/GetCompany');  // 使用新的URL重新载入列表数据
                $('#companyid_eq').combobox('reload', '/AjaxHandler/GetCompany');  // 使用新的URL重新载入列表数据
            })
            function DataGridSet() {
                $('#dg').datagrid({
                    url: BaseUrl + 'search',
                    columns: [[
                        { field: 'ck', checkbox: true },

              { field: 'id', title: '主键', width: 100, sortable: true },
                { field: 'name', title: '名称', width: 100, sortable: true },
              { field: 'companyname', title: '公司', width: 100, sortable: true },
              { field: 'remarks', title: '备注', width: 100, sortable: true },
              { field: 'createtime', title: '添加时间', width: 100, sortable: true },
              { field: 'modifytime', title: '更新时间', width: 100, sortable: true }
                    ]],
                    iconCls: 'icon-text_list_bullets',
                    title: '项目',
                    nowrap: true,
                    // fit: true,
                    height: GetwinHeight() - 50,//高度计算
                    fitColumns: true,
                    singleSelect: true,
                    striped: true,
                    collapsible: true,
                    pageSize: 20,
                    pagination: true,
                    rownumbers: true,
                    sortName: 'createtime',
                    sortOrder: 'desc',
                    toolbar: toolbars
                });
            }
            //刷新
            function ReloadOP() {
                $("#dg").datagrid("reload");
            }
            //easyUI 弹出添加的对话框
            function addInfo() {
                //弹出层
                // $("#DivEditor").dialog('open').dialog('setTitle', '添加信息');
                $('#DivEditor').dialog({
                    title: '添加',
                    //width: 400,
                    //height: 200,
                    closed: false,
                    cache: false,
                    // href: 'get_content.php',
                    modal: true, top: 20,
                    onClose: function () {
                        //解决弹出窗口关闭后，验证消息还显示在最上面

                    }
                });
                $(".validatebox-tip").remove();//清除验证样式
                DataBaseFunction.ClearForm("ff");
                //$("input[name='HouseNo']").focus();
                //$("#ff input[name='Tel']").removeAttr("disabled");

            }

            //查看
            function showInfo() {
                var rows = $("#dg").datagrid('getSelected');
                //首先取出来值判断只能选择一个
                if (rows == null) {
                    // $.messager.alert("友情提示", "请选择", "error");
                    return;
                }
                $("#DivShow").dialog('open').dialog('setTitle', '查看-' /*+ rows.Name*/).window('resize', { top: 20 });
                DataBaseFunction.BindForm("fshow", rows);
                //if (rows.Types == 0) {
                //    $("#fshow span[name='Types']").html('转账');
                //} else {
                //    $("#fshow span[name='Types']").html('购物');

                //}
            }
            //绑定修改显示详细信息的方法
            function editInfo() {

                var rows = $("#dg").datagrid('getSelected');
                //首先取出来值判断只能选择一个
                if (rows == null) {
                    $.messager.alert("友情提示", "请选择", "error");
                    return;
                }
                $("#DivEditor").dialog('open').dialog('setTitle', '修改-' /*+ rows.Name*/).window('resize', { top: 20 });
                $(".validatebox-tip").remove();//清除验证样式

                //$("#ff input[name='HouseCode']").attr("disabled", "true");

                var ID = rows.id;  //获取到了用选择的ID
                $.ajax({
                    url: BaseUrl + 'getInfo',
                    type: 'POST',
                    data: { ID: ID },
                    cache: false,
                    error: function () { alert('Error $.ajax'); },
                    success: function (data) {
                        //var result = eval('(' + data + ')');
                        DataBaseFunction.BindForm("ff", data);
                        $('#companyid').combobox('select', data.companyid);
                        //$("input[name='HouseNo']").focus();
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

            //搜索
            function SearchGo() {
                DataBaseFunction.Search("fSearh", "dg");
                $("#Div_Searh").dialog('close');
            }
            //搜索
            function Search() {

                // $("#fSearh").form("clear");
                $("#Div_Searh").dialog('open').dialog('setTitle', '搜索').window('resize', { top: 100, left: 100 });
            }
            //删除
            function del() {
                DataBaseFunction.deleteInfo("dg", "id", "name");
            }
        </script>
</head>
<body style="overflow-y: hidden" class="easyui-layout">



    <!-- 一行高度是48px; -->
    <div id="div_Searh" style="height:49px;width:100%;margin-top:0px;">
        <form id="fSearh">
            <table class="stripes" style="table-layout: fixed;margin-top:5px; width: 100%;" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td style="width: 80px;">
                        <label>关键词：</label>
                    </td>
                    <td style="width: 160px;">
                        <input type="text" class="textbox" name="name|remarks_like" style="width: 120px;" />
                    </td>
                    <td style="width: 80px;">
                        <label>公司：</label>
                    </td>
                    <td style="width: 160px;">
                        <input id="companyid_eq" name="companyid_eq" class="easyui-combobox" data-options="valueField:'id',textField:'name'" />
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


    <!------------------------弹出层---------------------------------->
    <div id="DivEditor" class="easyui-dialog" style="width: 650px;"
         closed="true" resizable="true" modal="true" buttons="#dlg-buttons">
        <div id="Div_form" class="easyui-panel" style="padding: 10px 10px; overflow-x: hidden;" data-options=" height:300,width:630,border:false">
            <form id="ff" method="post" enctype="multipart/form-data">

                <input type="hidden" name="id" />
                <input type="hidden" name="createtime" />
                <input type="hidden" name="modifytime" />
                <input type="hidden" name="del_flag" />
                <table class="stripes" style="table-layout: fixed;" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td style="width:120px;">
                            <label>公司</label>
                        </td>
                        <td>
                            <input id="companyid" name="companyid" class="easyui-combobox" style="width:200px;" data-options="valueField:'id',textField:'name',required:true" />
                        </td>

                    </tr>
                    <tr><td><label>名称：</label></td><td><input class="easyui-validatebox textbox" type="text" name="name" /></td></tr>
                    <tr><td><label>备注：</label></td><td><textarea class="areabox" name="remarks"></textarea></td></tr>
                </table>

            </form>
        </div>

        <div style="text-align: center; width: 100%; margin-bottom: 5px;">
            <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-ok" onclick="SaveInfo();">确定</a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel" onclick="$('#DivEditor').dialog('close')">关闭</a>
        </div>
    </div>





</body>
</html>

