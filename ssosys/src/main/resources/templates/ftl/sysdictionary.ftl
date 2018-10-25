<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


    <style type="text/css">
        #iconlist li {
            display: block;
            float: left;
        }
    </style>
 <#include "header.ftl">
    <script src="/Content/EasyUI/Buttons.js"></script>
    <script type="text/javascript">
        ${RuteUrl}
        ${toolbar}
        var dictypeid = "";
        jQuery(document).ready(function () {

            BindDic();
            BindDicType();
        });

        function BindDic() {
            $('#tg').treegrid({
                title: '数据词典',
                iconCls: 'icon-ok',
                fit: true,
                fitColumns: true,
                rownumbers: true,
                animate: true,
                collapsible: true,//是否展开
                method: 'get',
                idField: 'id',
                treeField: 'name',
                showFooter: true,
                columns: [[

                    { field: 'DicTypeId', title: '所属类型编号', width: 100, sortable: true },
                    { title: '名称', field: 'name', width: 180 },
                    { title: '键值', field: 'dicNo', width: 80 },
                    {
                        title: '图标', field: 'iconCls', width: 80, formatter: function (value, row, index) {


                            if (value != undefined) {
                                var bool = value.indexOf("/");

                                if (bool > 0) {
                                    return '<img  src="' + value + '" style="width: 50px; height: 50px;" />';
                                }

                            }

                        }

                    },
                    { title: '排序', field: 'orderId', width: 80 },
                    { field: 'createTime', title: '添加时间', width: 100 }
                ]],
                toolbar: toolbars
            });
            $('#dictypeid').combobox({
                width: 150,
                emptyText: '请选择'
            });
            //SetTreeGridData();

        }

        function SetTreeGridData() {
            $.ajax({
                url: BaseUrl + 'getJson?DicType=' + dictypeid,
                type: 'POST',
                cache: false,
                error: function () { alert('Error loading PHP document'); },
                success: function (result) {
                    var data = eval(result);
                    $('#tg').treegrid('loadData', data);
                    $('#parentid').combotree('loadData', ConvertToTreeData(data));
                }
            });
        }
        function BindDicType() {

            $('#tbDicType').datagrid({
                url: '/AjaxHandler/GetSys_DicTypeDataGrid',
                columns: [[
                    { field: 'dictypename', title: '名称', width: 140 }
                ]],
                nowrap: true,
                singleSelect: true,
                striped: true,
                collapsible: true,
                pageSize: 1000,
                fit: true,
                rownumbers: true,
                onClickRow: function () {

                    dictypeid = $("#tbDicType").datagrid("getSelected").dictypeid;  //获取到了用按钮选择的ID
                    SetTreeGridData();
                },
                onLoadSuccess: function () {
                    $('#tbDicType').datagrid('selectRow', 0);
                    dictypeid = $("#tbDicType").datagrid("getSelected").dictypeid;  //获取到了用按钮选择的ID
                    SetTreeGridData();
                }
            });
            $('#dictypeid').combobox('reload', '/AjaxHandler/GetSys_DicTypeJson');  // 使用新的URL重新载入列表数据


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
            $('#dictypeid').combobox('setValue', dictypeid);
            var rows = $('#tg').treegrid('getSelected');
            if (rows != null) {
                $('#parentid').combotree('setValue', rows.id);
            }


        }
        //绑定修改显示详细信息的方法
        function editInfo() {

            var rows = $('#tg').treegrid('getSelected');
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
                    $('#parentid').combotree('setValue', data['parentid']);
                    $('#dictypeid').combobox('setValue', data['dictypeid']);
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
                    SetTreeGridData();
                }
            });

        }

        //删除
        function del() {

            //得到按钮选择的数据的ID
            var rows = $('#tg').treegrid("getSelections");
            //首先判断按钮是否已经选择了需要删除的数据,然后循环将按钮选择的数据传递到后台
            if (rows.length >= 1) {
                //遍历出按钮选择的数据的信息，这就是按钮按钮选择删除的按钮ID的信息
                var ids = "";   //1,2,3,4,5
                for (var i = 0; i < rows.length; i++) {
                    //异步将删除的ID发送到后台，后台删除之后，返回前台，前台刷洗表格
                    ids += "" + rows[i]["id"] + ",";
                }
                //最后去掉最后的那一个,
                ids = ids.substring(0, ids.length - 1);
                //获取按钮选择的按钮信息，如果按钮选择了已经登录的按钮的话需要给出不能删除的信息
                var Name = "";
                for (var i = 0; i < rows.length; i++) {
                    Name += rows[i]["name"] + ",";
                }
                Name = Name.substring(0, Name.length - 1);
                //首先取出来到底是直接删除还是伪删除发送异步请求的地址和是否是伪删除的参数
                var postData = "";

                postData = {
                    IDSet: ids
                };
                $.messager.confirm("删除信息", "您确认删除<font color='red' size='3'>" + Name + "</font>吗？", function (Delete) {
                    if (Delete) {
                        $.get(BaseUrl + "del", postData, function (data) {
                            alerts(data.msg, 2);
                            if (data.code > 0) {
                                SetTreeGridData();
                            }
                        });
                    }
                });
            }
            else {
                alert("请选择你要删除的数据");
            }
        }

        function FileHeadSave() {
            //----上传头像
            var FileId = "";
            $("#ff").form('submit', {
                url: "/httpHandle/Sys_FilesHandler.ashx?action=addImg&SourceTable=Sys_Dictionary",
                onSubmit: function () {

                },
                success: function (data) {
                    var d = eval('(' + data + ')');
                    if (d.code > 0) {
                        var imgList = eval('(' + d.data + ')');
                        $("input[name='icon']").val(imgList[0].route + imgList[0].relativepath)

                        var file = $("input[name='file1']");//清空文件
                        file.after(file.clone().val(""));
                        file.remove();
                    }
                    else {
                        alerts(d.msg, 5);
                    }

                }
            })
        }
    </script>

</head>
<body>

<div class="easyui-layout" data-options="fit:true" style="margin:5px;">
    <div region="west" split="true" title="所属类型" style="width:180px;"><table id="tbDicType"></table></div>
    <div region="center" style="padding:5px;background:#eee;" iconcls 'icon-user_earth'><table id="tg"></table></div>
</div>
<!------------------------弹出层---------------------------------->
<div id="DivEditor" class="easyui-dialog" style="width: 630px;"
     closed="true" resizable="true" modal="true" buttons="#dlg-buttons">
    <div id="Div_form" class="easyui-panel" style="padding: 10px 10px; overflow-x: hidden;" data-options=" height:320,width:610,border:false">
        <form id="ff" method="post" enctype="multipart/form-data">

            <table class="stripes" style="table-layout: fixed;" border="0" cellspacing="0" cellpadding="0">
                <input type="hidden" name="dicid" />
                <input type="hidden" name="createtime" />
                <input type="hidden" name="isvalid" />
                <input type="hidden" name="isdeleted" />
                <tr>
                    <td>
                        <label>字典类型：</label>
                    </td>
                    <td>
                        <input id="dictypeid" class="easyui-combobox" name="dictypeid" style="width: 200px;" data-options="valueField:'dictypeid',textField:'dictypename',required:true" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>父级：</label>
                    </td>
                    <td>
                        <select id="parentid" name="parentid" class="easyui-combotree" style="width: 200px;"></select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>字典名称：</label>
                    </td>
                    <td>
                        <input class="easyui-validatebox textbox" type="text" name="dicname" data-options="required:true,validType:'length[1,32]'" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>字典编号：</label>
                    </td>
                    <td>
                        <input class="easyui-validatebox textbox" type="text" name="dicno" data-options="required:true,validType:'length[1,32]'" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>图标：</label>
                    </td>
                    <td>
                        <input class="easyui-validatebox textbox" type="text" id="icon" name="icon" /><a id="selecticon" ref="javascript:;"
                                                                                                         plain="true" class="easyui-linkbutton" icon="icon-search" title="选择图标"></a>
                        <input type="file" name="file1" style="width: 50px;" onchange="FileHeadSave()" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>备注：</label>
                    </td>
                    <td>
                        <textarea class="areabox" name="remarks" style="height:50px;"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>序号：</label>
                    </td>
                    <td>
                        <input class="easyui-validatebox textbox" type="text" name="orderid" onkeyup="clearNoNumberContainDot(this)" />
                    </td>
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
