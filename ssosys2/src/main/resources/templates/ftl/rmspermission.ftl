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

        #iconlistM li {
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

        var ManuId = "";
        function deleteInfo() {


            var rows = $('#tg').treegrid('getSelected');
            var postData = "";

            postData = {
                IDSet: rows.id
            };
            $.messager.confirm("删除信息", "您确认删除<font color='red' size='3'>" + rows.name + "</font>菜单吗？", function (DeleteRole) {
                if (DeleteRole) {
                    $.get(BaseUrl + "del", postData, function (data) {
                        if (data.code > 0) {
                            //友情提示用户删除成功，刷新表格
                            $.messager.alert("友情提示", "删除成功");
                            SetTreeGridData();
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
                title: '菜单管理',
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
                    { title: '值', field: 'valuename', width: 80 },
                    { title: '地址', field: 'url', width: 80 },
                    { title: '图标', field: 'iconCls', width: 60, align: 'right' },
                    { title: '项目', field: 'projectname', width: 100 },
                    //{ title: '类型', field: 'typeid', width: 80 },
                    { title: '排序', field: 'orderNo', width: 80 },
                    {
                        field: 'remarks', title: '备注', width: 120
                    }
                ]],
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
                    id: 'btnIsNotCancle',
                    text: '删除',
                    iconCls: 'icon-remove',
                    handler: function () {
                        //实现删删除的方法
                        var rows = $('#tg').treegrid('getSelected');
                        ManuId = rows.id
                        deleteInfo();
                    }
                }, '-', {
                    id: 'btnCancle',
                    text: '分配操作',
                    iconCls: 'icon-shape_group',
                    handler: function () {
                        var rows = $('#tg').treegrid('getSelected');
                        ManuId = rows.id;
                        ShowSetBtnInfo();

                    }
                }]
            });
            $('#DeparTree').combotree({
                width: 150,
                emptyText: '请选择'
            });

            $('#projectid').combobox('reload', '/AjaxHandler/Getpoject');  // 使用新的URL重新载入列表数据
            $('#projectid_eq').combobox('reload', '/AjaxHandler/Getpoject');  // 使用新的URL重新载入列表数据

            SetTreeGridData();
        })
        function SetTreeGridData() {


            var postData =
                    {
                        projectid: $('#projectid_eq').combobox('getValue')
                    };
            $.ajax({
                url: BaseUrl + 'getJson',
                type: 'POST',
                data: postData,
                cache: false,
                error: function () { alert('Error loading PHP document'); },
                success: function (result) {
                    $('#tg').treegrid('loadData', result);
                    $('#DeparTree').combotree('loadData', ConvertToTreeData(result));
                }
            });


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
            var rows = $('#tg').treegrid('getSelected');
            if (rows != null) {

                $('#DeparTree').combotree('setValue', rows.id);
                $("#parentid").val(rows.parentManuId)

                //$("#ParentManuId").val("00000000-0000-0000-0000-000000000000")
            }
        }
        //实现按钮的编辑，包括增查改
        function editInfo() {

            //判断按钮的信息是否通过验证
            var validate = $("#ff").form('validate');
            if (validate == false) {
                return false;
            }
            //获取需要传递的参数传递给前台
          //  var postData = $("#ff").serializeArray();
            var postData = DataBaseFunction.GetFormData("ff")
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
            //发送异步请求到后台保存按钮数据
            $.post(BaseUrl + 'editInfo', postData, function (data) {
                if (data.code > 0) {
                    //添加成功  1.关闭弹出层，2.刷新DataGir
                    $('#DivEditor').dialog('close');
                    $(".validatebox-tip").remove();
                    // $("#DivEditor").dialog("close");
                    SetTreeGridData();
                    $("#ff").form("clear");
                }

                alerts(data.msg, 1);
            });

        }

        //修改按钮的信息
        function ShowUpdateInfo() {
            //首先取出来按钮选择的数据的ID


            //处理修改的信息，弹出修改的对话框,然后显示选择的按钮的详细信息
            $("#DivEditor").dialog('open').dialog('setTitle', '修改按钮信息').window('resize', { top: 100 });
            //绑定修改显示详细信息的方法
            BindShowUpdateInfo();

        }
        //绑定修改显示详细信息的方法
        function BindShowUpdateInfo() {
            //首先按钮发送一个异步请求去后台实现方法
            var ID = $('#tg').treegrid('getSelected').id;  //获取到了用按钮选择的ID

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
                    $('#DeparTree').combotree('setValue', result['parentid']);


                    $('#projectid').combobox('setValue', result['projectid']);
                }
            });

        }
        //搜索
        function SearchGo() {
            SetTreeGridData();
        }

        //修改操作
        function ShowSetBtnInfo() {
            //首先取出来按钮选择的数据的ID


            $("#DivSetBtn").dialog('open').dialog('setTitle', '修改按钮信息').window('resize', { top: 100 });
            $('#tbOut').datagrid({
                url: BaseUrl + 'GetOneOut',
                columns: [[
                    {
                        field: 'icon', title: '图标', width: 50,
                        formatter: function (value) {
                            if (value) {
                                var s = '<span class=" icon  ' + value + ' " style=" display:block">' + '&nbsp;</span>';
                                return s;
                            } else {
                                return '';
                            }
                        }
                    },
                    { field: 'buttonname', title: '名称', width: 60, align: 'right' },
                    { field: 'pcode', title: '值', width: 60, align: 'right' }
                ]], onDblClickRow: function (index, row) {
                    //AddManuBtn(row.Id, id)//添加单按钮
                    addbtn();
                },
                title: "未添加的按钮",
                queryParams: { ManuId: ManuId, T: Math.floor(Math.random() * 1000000) },
                height: 340,
                iconCls: 'icon-add',
                nowrap: true,
                singleSelect: true,
                striped: true,
                collapsible: true,
                width: 'auto',
                rownumbers: true
            });

            $('#tbIn').datagrid({
                url: BaseUrl + 'GetOneIn',
                columns: [[
                    {
                        field: 'icon', title: '图标', width: 50,
                        formatter: function (value) {
                            if (value) {
                                var s = '<span class=" icon  ' + value + ' " style=" display:block">' + '&nbsp;</span>';
                                return s;
                            } else {
                                return '';
                            }
                        }
                    },
                    { field: 'buttonname', title: '名称', width: 60, align: 'right' },
                    { field: 'pcode', title: '值', width: 60, align: 'right' }
                ]], onDblClickRow: function (index, row) {
                    Delbtn();
                    //  DelManuBtn(row.Id, id)//删菜单按钮
                },
                title: "已存在的按钮",
                iconCls: 'icon-ok',
                queryParams: { ManuId: ManuId, T: Math.floor(Math.random() * 1000000) },
                height: 340,
                nowrap: true,
                singleSelect: true,
                striped: true,
                collapsible: true,
                width: 'auto',
                rownumbers: true
            });
        }
        function AddManuBtn(btnId, ManuId)//添加单按钮
        {
            var postData = "";

            postData = {
                btnId: btnId,
                ManuId: ManuId
            };
            //发送异步请求到后台
            $.post(BaseUrl + 'AddManuBtn', postData, function (data) {
                if (data = "OK") {

                    $('#tbOut').datagrid('load', {
                        ManuId: ManuId, T: Math.floor(Math.random() * 1000000)
                    });
                    $('#tbIn').datagrid('load', {
                        ManuId: ManuId, T: Math.floor(Math.random() * 1000000)
                    });
                }
                else {
                    alert("添加失败");
                }
            });
        }


        function SaveBtnSet() {
            var postData = "";
            var rows = $("#tbOut").datagrid('getRows');
            if (rows.length > 0) {//删除存在的
                res = -1;
                var DelId = "";
                for (var i = 0; i < rows.length; i++) {

                    DelId += "'" + rows[i].id + "',";
                }

                DelId = DelId.substring(0, DelId.length - 1);
                postData = {
                    IdSet: DelId,
                    ManuId: ManuId
                };
                //发送异步请求到后台
                $.post(BaseUrl + 'DelManuBtn', postData, function (data) {
                    if (data = "OK") {


                    }
                    else {
                        alert("删除失败");
                    }
                });
            }
            var rows = $("#tbIn").datagrid('getRows');
            if (rows.length > 0) {//添加或者更新


                for (var i = 0; i < rows.length; i++) {

                    postData = {
                        BtnId: rows[i].id,
                        ManuId: ManuId,
                        OrderNo: $('#tbIn').datagrid('getRowIndex', rows[i])
                    };
                    //发送异步请求到后台
                    $.post(BaseUrl + 'AddManuBtn', postData, function (data) {
                        if (data = "OK") {


                        }
                        else {
                            alert("添加" + rows[i].buttonname + "失败");
                        }
                    });
                }



            }
            alert("添加成功");
            $('#DivSetBtn').dialog('close');
        }


        function addbtn() {
            var row = $('#tbOut').datagrid('getSelected');
            if (row != null) {
                $("#tbIn").datagrid("appendRow", row);

                var b = $('#tbOut').datagrid('getRowIndex', row);
                $('#tbOut').datagrid('deleteRow', b);
                $('#tbOut').datagrid('selectRow', b - 1);
            }

        }
        function addbtnAll() {
            var rows = $("#tbOut").datagrid('getRows');
            var dd = rows.length;
            for (var i = 0; i < dd; i++) {
                $("#tbIn").datagrid("appendRow", rows[0]);
                $('#tbOut').datagrid('deleteRow', 0);

            }
        }
        function delbtnAll() {
            var rows = $("#tbIn").datagrid('getRows');
            var dd = rows.length;
            for (var i = 0; i < dd; i++) {
                $("#tbOut").datagrid("appendRow", rows[0]);
                $('#tbIn').datagrid('deleteRow', 0);

            }
        }

        function Delbtn() {
            var row = $('#tbIn').datagrid('getSelected');
            if (row != null) {
                $("#tbOut").datagrid("appendRow", row);

                var b = $('#tbIn').datagrid('getRowIndex', row);
                $('#tbIn').datagrid('deleteRow', b);

                $('#tbIn').datagrid('selectRow', b - 1);
            }


        }
        function Downbtn() {

            var row = $('#tbIn').datagrid('getSelected');
            if (row != null) {
                var rowindex = $('#tbIn').datagrid('getRowIndex', row);
                var rows = $("#tbIn").datagrid('getRows');
                if (rowindex < rows.length - 1) {
                    var newRowIndex = rowindex + 1;

                    var targetRow = rows[newRowIndex];
                    var currentRow = rows[rowindex];

                    rows[newRowIndex] = currentRow;
                    rows[rowindex] = targetRow;

                    $("#tbIn").datagrid('loadData', rows);
                    $("#tbIn").datagrid('selectRow', newRowIndex);
                }
            }
        }
        function Upbtn() {

            var row = $('#tbIn').datagrid('getSelected');
            if (row != null) {
                var rowindex = $('#tbIn').datagrid('getRowIndex', row);



                if (rowindex > -1) {
                    var rows = $("#tbIn").datagrid('getRows');
                    var newRowIndex = rowindex - 1;
                    if (newRowIndex < 0)
                        newRowIndex = 0;

                    var targetRow = rows[newRowIndex];
                    var currentRow = rows[rowindex];

                    rows[newRowIndex] = currentRow;
                    rows[rowindex] = targetRow;

                    $("#tbIn").datagrid('loadData', rows);
                    $("#tbIn").datagrid('selectRow', newRowIndex);

                }
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
<table id="tg"></table>


<!------------------------弹出修改角色信息的弹出层---------------------------------->
<div id="DivEditor" class="easyui-dialog" style="width: 580px; padding: 10px 20px"
     closed="true" resizable="true" modal="true" buttons="#dlg-buttons">
    <form id="ff" method="post" enctype="multipart/form-data">
        <fieldset>
            <legend>菜单信息填写栏</legend>
            <table id="tblAdd">
                <input type="hidden" id="id" name="id" />
                <input type="hidden" id="typeid" name="typeid" />

                <input type="hidden" id="isshow" name="show_flag" />
                <input type="hidden" id="isenable" name="show_flag" />
                <input type="hidden" id="createtime" name="createtime" />
                <input type="hidden" id="modifytime" name="modifytime" />
                <input type="hidden" id="modifytime" name="level" />
                <tr>

                    <td>
                        <label>名称：</label>
                    </td>
                    <td>
                        <input class="easyui-validatebox" type="text" id="pname" name="pname" data-options="required:true,validType:'length[1,32]'" />
                    </td>

                </tr>
                <tr>

                    <td>
                        <label>权限标识符：</label>
                    </td>
                    <td>
                        <input class="easyui-validatebox" type="text" id="pcode" name="pcode" />
                    </td>

                </tr>
                <tr>
                    <td>
                        <label>地止：</label>
                    </td>
                    <td>
                        <input class="easyui-validatebox" type="text" id="url" name="url" data-options="required:true,validType:'length[1,64]'" />
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
                <tr>
                    <td>
                        <label>图标：</label>
                    </td>
                    <td>
                        <input class="easyui-validatebox" type="text" id="icon" name="icon" /><a id="selecticon" ref="javascript:;"
                                                                                                 plain="true" class="easyui-linkbutton" icon="icon-search" title="选择图标"></a>
                        <input type="file" name="file1" style="width: 50px;" onchange="FileHeadSave()" />
                    </td>
                </tr>

                <tr>
                    <td>
                        <label>大图标：</label>
                    </td>
                    <td>
                        <input class="easyui-validatebox" type="text" id="color" name="color" /><a id="selecticonM" ref="javascript:;"
                                                                                                   plain="true" class="easyui-linkbutton" icon="icon-search" title="选择图标"></a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>上级：</label>
                    </td>
                    <td>
                        <ul id="DeparTree"></ul>
                    </td>

                </tr>


                <tr>
                    <td>
                        <label>排序码：</label>
                    </td>
                    <td>
                        <input class="easyui-validatebox" type="text" id="orderno" name="orderno" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>描述：</label>
                    </td>
                    <td colspan="3">
                        <textarea style="height: 50px; width: 406px;" id="remarks" name="remarks"></textarea>
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

<div id="DviIcon" class="easyui-window" style="width: 660px; height: 400px; padding: 0px 10px" title="选择图标"
     closed="true" resizable="true" modal="true" buttons="#dlg-buttons">
</div>

<div id="DviIconM" class="easyui-window" style="width: 660px; height: 400px; padding: 0px 10px" title="选择大图标"
     closed="true" resizable="true" modal="true" buttons="#dlg-buttons">
</div>

<div id="DivSetBtn" class="easyui-dialog" style="width: 510px; height: 440px; padding: 10px 10px;"
     closed="true" resizable="true" modal="true" buttons="#dlg-buttons">

    <div style="display: block; width: 210px; float: left; height: 340px;">
        <table id="tbOut"></table><!-- 未选择的-->

    </div>
    <div style="display: block; width: 30px; float: left; height: 340px;">

        <div id="divSelect" style="height: 100px; height: 30px; padding-top: 130px; padding-left: 5px;">


            <span class=" icon icon-arrow_right" style="display: block; cursor: pointer" onclick="addbtn();">&nbsp;</span>
            <br />
            <span class=" icon icon-arrow_left" style="display: block; cursor: pointer" onclick="Delbtn();">&nbsp;</span>
        </div>


    </div>
    <div style="display: block; width: 210px; float: left; height: 340px;">

        <table id="tbIn"></table><!-- 已选择的-->
    </div>
    <div style="display: block; width: 20px; float: right; height: 340px;">
        <div style="height: 100px; height: 20px; padding-top: 130px;">
            <span class=" icon icon-arrow_up" style="display: block; cursor: pointer" onclick="Upbtn()">&nbsp;</span>
            <br />
            <span class=" icon icon-arrow_down" style="display: block; cursor: pointer" onclick="Downbtn()">&nbsp;</span>
        </div>
    </div>

    <div style="display: block; width: 480px; height: 20px; text-align: center; line-height: 20px;">
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'"
           onclick="javascript:addbtnAll()">全选</a>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-delete'"
           onclick="javascript:delbtnAll()">清除</a>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
           onclick="javascript:SaveBtnSet()">应用</a>

        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cross'"
           onclick="javascript: $('#DivSetBtn').dialog('close');">关闭</a>

    </div>
</div>
</body>
</html>
