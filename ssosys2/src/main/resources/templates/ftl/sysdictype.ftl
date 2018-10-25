<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <#include "header.ftl">
    <script src="/Content/EasyUI/Buttons.js"></script>
    <style type="text/css">
        #iconlist li { display:block; float:left;}


    </style>



    <script type="text/javascript">
        ${RuteUrl}
        ${toolbar}
        jQuery(document).ready(function () {
            DataGridSet();

        })
        function DataGridSet() {
            $('#dg').datagrid({
                url: BaseUrl + 'search',
                columns: [[
                    { field: 'ck', checkbox: true },

                    { field: 'dictypeid', title: 'Id', width: 100, sortable: true },
                    { field: 'dictypename', title: '字典名称', width: 100, sortable: true },
                    { field: 'dictypenum', title: '字典编号', width: 100, sortable: true },
                    {
                        field: 'icon', title: '图标', width: 100, sortable: true, formatter: function (value) {
                            if (value) {
                                var s = '<span class=" icon  ' + value + ' " style=" display:block">' + '&nbsp;</span>';
                                return s;
                            } else {
                                return '';
                            }
                        }
                    },
                    { field: 'remarks', title: '备注', width: 100, sortable: true },
                    { field: 'orderid', title: '序号', width: 100, sortable: true },
                    { field: 'createtime', title: '添加时间', width: 100, sortable: true }
                    //{
                    //    field: 'isValid', title: '是否有效', width: 100, sortable: true, formatter: function (value, row, index) {
                    //        if (row.isValid) {
                    //            return "是";
                    //        } else {
                    //            return "否";
                    //        }
                    //    }
                    //}
                ]],
                iconCls: 'icon-save',
                title: '词典类型',
                nowrap: true,
                fit: true,
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
        function ShowOP() {
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
            $("#DivEditor").dialog('open').dialog('setTitle', '修改-' + rows.dictypename).window('resize', { top: 20 });
            $(".validatebox-tip").remove();//清除验证样式

            //$("#ff input[name='HouseCode']").attr("disabled", "true");

            var ID = rows.dictypeid;  //获取到了用选择的ID
            $.ajax({
                url: BaseUrl + 'getInfo',
                type: 'POST',
                data: { ID: ID },
                cache: false,
                error: function () { alert('Error $.ajax'); },
                success: function (data) {
                    //var result = eval('(' + data + ')');
                    DataBaseFunction.BindForm("ff", data);
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
            DataBaseFunction.deleteInfo("dg", "dictypeid", "dictypename");
        }
    </script>


</head>
<body style="overflow-y: hidden">

<table id="dg"></table>

<!------------------------搜索弹出层---------------------------------->
<div id="Div_Searh" class="easyui-dialog" style="width: 380px; padding: 10px 20px;"
     closed="true" resizable="true" modal="true" buttons="#dlg-buttons">
    <form id="fSearh">

        <table class="stripes" style="table-layout: fixed; margin: 0 auto; width: 320px;" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td style="width: 60px;">
                    <label>名称：</label></td>
                <td>
                    <input type="text" class="textbox" name="dictypename_like" style="width: 200px;" />
                </td>

            </tr>
        </table>

    </form>
    <div style="text-align: center; width: 100%; margin: 5px 0px; display: block;">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-undo" style="float: left;" onclick=" DataBaseFunction.ClearForm('fSearh');">清除</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" style="float: right;" iconcls="icon-search" onclick="SearchGo();">搜索</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" style="float: right;" iconcls="icon-cancel" onclick="$('#Div_Searh').dialog('close')">关闭</a>
    </div>
</div>
<!------------------------弹出层---------------------------------->
<div id="DivEditor" class="easyui-dialog" style="width: 630px;"
     closed="true" resizable="true" modal="true" buttons="#dlg-buttons">
    <div id="Div_form" class="easyui-panel" style="padding: 10px 10px; overflow-x: hidden;" data-options=" height:350,width:610,border:false">
        <form id="ff" method="post" enctype="multipart/form-data">

            <table class="stripes" style="table-layout: fixed;" border="0" cellspacing="0" cellpadding="0">
                <input type="hidden" name="dictypeid" /><input type="hidden" name="createtime" /><input type="hidden" name="isvalid" /><input type="hidden" name="isdeleted" /><tr>
                <td style="width:120px;">
                    <label>字典名称：</label></td>
                <td style="width:480px;">
                    <input class="easyui-validatebox textbox" type="text" name="dictypename" data-options="required:true"  /></td>
            </tr>
                <tr>
                    <td>
                        <label>字典编号：</label></td>
                    <td>
                        <input class="easyui-validatebox textbox" type="text" name="dictypenum" data-options="required:true"  /></td>
                </tr>
                <tr>
                    <td>
                        <label>图标：</label></td>
                    <td>
                        <input class="easyui-validatebox textbox" type="text" id="icon" name="icon" /><a id="selecticon" ref="javascript:;"
                                                                                                         plain="true" class="easyui-linkbutton" icon="icon-search" title="选择图标"></a></td>
                </tr>
                <tr>
                    <td>
                        <label>备注：</label></td>
                    <td>
                        <textarea  class="areabox"  name="remarks" ></textarea></td>
                </tr>
                <tr>
                    <td>
                        <label>序号：</label></td>
                    <td>
                        <input class="easyui-validatebox textbox" type="text" name="orderid"  onkeyup="clearNoNumberContainDot(this)"/></td>
                </tr>
            </table>

        </form>
    </div>

    <div style="text-align: center; width: 100%; margin-bottom: 5px;">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-ok" onclick="SaveInfo();">确定</a>&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel" onclick="$('#DivEditor').dialog('close')">关闭</a>
    </div>
</div>
<div id="DviIcon" class="easyui-window" style="width:680px;height:400px;padding:10px 20px" title="选择图标"
     closed="true" resizable="true" modal="true" buttons="#dlg-buttons">

</div>
</body>
</html>

