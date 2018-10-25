<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!--指示浏览器采用IE8渲染技术-->
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
    <meta name="viewport" content="width=device-width" />
    <title>权限管理系统</title>
    <style type="text/css">
        * {
            font-size: 12px;
            font-family: Tahoma,Verdana,微软雅黑,新宋体;
        }

        body {
            background: #D2E0F2;
        }

        a {
            color: Black;
            text-decoration: none;
        }

        a:hover {
            color: Red;
            text-decoration: underline;
        }

        .textbox03 {
            border: #878787 1px solid;
            padding: 4px 3px;
            font: Verdana, Geneva, sans-serif,宋体;
            line-height: 14px;
            background-color: #fff;
            height: auto;
            font-size: 14px;
            font-weight: bold;
            width: 190px;
        }

        .txt01 {
            font: Verdana, Geneva, sans-serif,宋体;
            padding: 3px 2px 2px 2px;
            border-width: 1px;
            border-color: #ddd;
            color: #000;
        }

        .txt {
            border: #878787 1px solid;
            padding: 4px 3px;
            font: Verdana, Geneva, sans-serif,宋体;
            line-height: 14px;
            background-color: #fff;
            height: auto;
            font-size: 14px;
        }

        .head a {
            color: White;
            text-decoration: underline;
        }

        .easyui-accordion ul {
            list-style-type: none;
            margin: 0px;
            padding: 10px;
        }

        .easyui-accordion ul li {
            padding: 0px;
        }

        .easyui-accordion ul li a {
            line-height: 24px;
        }

        .easyui-accordion ul li div {
            margin: 2px 0px;
            padding-left: 20px;
            padding-top: 2px;
        }

        .easyui-accordion ul li div.hover {
            border: 1px dashed #99BBE8;
            background: #E0ECFF;
            cursor: pointer;
        }

        .easyui-accordion ul li div.hover a {
            color: #416AA3;
        }

        .easyui-accordion ul li div.selected {
            border: 1px solid #99BBE8;
            background: #E0ECFF;
            cursor: default;
        }

        .easyui-accordion ul li div.selected a {
            color: #416AA3;
            font-weight: bold;
        }


        /*#region 菜单按钮样式 */
        #css3menu li {
            float: left;
            list-style-type: none;
        }

        #css3menu li a {
            color: #fff;
            padding-right: 20px;
        }

        #css3menu li a.active {
            color: yellow;
        }
        /*#endregion */
    </style>
    <script src="/Content/Scripts/jquery1.9.min.js"></script>
    <script src="/Content/Scripts/CommonFunction.js"></script>
    <link href="/Content/EasyUI/themes/icon.css" rel="stylesheet" />
    <link href="/Content/EasyUI/themes/default/easyui.css" rel="stylesheet" />
    <script src="/Content/EasyUI/jquery.easyui.min.js"></script>
    <script src="/Content/EasyUI/locale/easyui-lang-zh_CN.js"></script>
    <script src="/Content/EasyUI/outlook.js"></script>
    <link href="/Content/jQueryload/fakeloader.css" rel="stylesheet" />
    <script src="/Content/jQueryload/fakeloader.js"></script>
    <link href="/Content/Css/Style.css" rel="stylesheet" />
    <script src="/Content/Scripts/Style.js"></script>
</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no">
<noscript>
    <div style="position: absolute; z-index: 100000; height: 2046px; top: 0px; left: 0px; width: 100%; background: white; text-align: center;">
        <img src="images/noscript.gif" alt='抱歉，请开启脚本支持！' />
    </div>
</noscript>
<div region="north" split="true" border="false" style="overflow: hidden; height: 70px; line-height: 70px; color: #fff; font-family: Verdana, 微软雅黑,黑体" class="heder">
        <span style="float: right; padding-right: 20px;" class="head">
            欢迎你，${userName}！
            <a href="#" style="text-decoration: none; color: orange" id="Companya" onclick="ShowCompany()">${companyName}</a>
            <a href="#" style="text-decoration: none;" id="editpass" onclick="ShowCPwd()">修改密码</a>
            <a href="#" id="loginOut" style="text-decoration: none;" onclick="loginOut()">安全退出</a>
        </span>
    <span style="padding-left: 10px; font-size: 16px; float: left;">
            <img src="/Content/Css/Images/logo.png" width="64" height="64" align="middle" />
            权限管理系统
        </span>
</div>
<div data-options="region:'south',split:true,border:false" class="footer">
    后台数据管理
</div>
<div region="west" hide="true" split="true" title="导航菜单" style="width: 180px;" id="west">
    <div id='wnav' class="easyui-accordion" fit="true" border="false">
        <!--  导航内容 -->
    </div>
</div>

<div id="mainPanle" region="center" style="background: #eee; overflow-y: hidden">
    <div id="tabs" class="easyui-tabs" fit="true" border="false">
        <div title="欢迎使用" style="padding: 20px; overflow: hidden;" id="home">
            <h1>欢迎使用权限管理系统</h1>
        </div>
    </div>
</div>

<div id="mm" class="easyui-menu" style="width: 150px;">
    <div id="mm-tabupdate">刷新</div>
    <div class="menu-sep"></div>
    <div id="mm-tabclose">关闭</div>
    <div id="mm-tabcloseall">全部关闭</div>
    <div id="mm-tabcloseother">除此之外全部关闭</div>
    <div class="menu-sep"></div>
    <div id="mm-tabcloseright">当前页右侧全部关闭</div>
    <div id="mm-tabcloseleft">当前页左侧全部关闭</div>
    <div class="menu-sep"></div>
    <div id="mm-exit">退出</div>
</div>
<div id="DivEditor" class="easyui-dialog" style="width: 320px; height: 220px; padding: 10px 20px"
     closed="true" resizable="true" modal="true" buttons="#dlg-buttons">
    <form id="ff" method="post" novalidate="novalidate">
        <fieldset>
            <legend>修改密码</legend>
            <table id="tblAdd">
                <tr>
                    <td>
                        <label>旧密码：</label>
                    </td>
                    <td>
                        <input class="easyui-validatebox" type="password" id="TxtOldPwd" data-options="required:true,validType:'length[6,32]'" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>新密码：</label>
                    </td>
                    <td>
                        <input class="easyui-validatebox" type="password" id="TxtNewPwd1" data-options="required:true,validType:'length[6,32]'" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>确定新密码：</label>
                    </td>
                    <td>
                        <input class="easyui-validatebox" type="password" id="TxtNewPwd2" data-options="required:true,validType:'length[6,32]'" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center; padding-top: 10px">
                        <a href="javascript:void(0)" class="easyui-linkbutton" id="btnAddRole" iconcls="icon-ok" onclick="ChangePwd();">确定</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel" onclick="$('#DivEditor').dialog('close')">关闭</a>
                    </td>
                </tr>
            </table>
        </fieldset>
    </form>
</div>
<div id="DivCompany" class="easyui-dialog" style="width: 360px; height: 150px; padding: 10px 20px"
     closed="true" resizable="true" modal="true" buttons="#dlg-buttons">
    <form id="cc" method="post" novalidate="novalidate">
        <table class="stripes" style="table-layout: fixed;" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td>
                    <label>选择公司：</label>
                </td>
                <td>
                    <input id="companyid" class="easyui-combobox" style="width:200px;" data-options="valueField:'id',textField:'name',required:true" />
                </td>
            </tr>
            <tr>
                <td colspan="4" style="text-align: center; padding-top: 10px">
                    <a href="javascript:void(0)" class="easyui-linkbutton" id="btnAddRole" iconcls="icon-ok" onclick="ChangeCompany();">确定</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel" onclick="$('#DivCompany').dialog('close')">关闭</a>
                </td>
            </tr>
        </table>
    </form>
</div>



<script type="text/javascript">
    ${RuteUrl}
    //关闭登录窗口
    function closePwd() {
        $('#w').window('close');
    }

    //刷新tabs 里的grid
    function reloadTabGrid(title) {
        if ($("#tabs").tabs('exists', title)) {
            $('#tabs').tabs('select', title);
            //window.top.reload_Abnormal_Monitor.call();

            //刷新当前tab
            var currTab = self.parent.$('#tabs').tabs('getSelected'); //获得当前tab
            var url = $(currTab.panel('options').content).attr('src');
            //self.parent.$('#tabs').tabs('update', {
            //    tab: currTab,
            //    options: {
            //        content: createFrame(url)
            //    }
            //});
            $("#" + url)[0].contentWindow.ReloadOP();//调用刷新功能
        }
    }

    //跳转url 内有的菜单少可以 window.parent.JumpN("CommunityNotice");
    function JumpN(URL) {
        $.each(_menus, function (j, o) {
            $.each(o.children, function (k, m) {
                if (m.URL == URL) {
                    var iconCls = getIcon(m.Id);
                    addTab(m.Name, URL, iconCls);
                    return false;
                }
            });
        });
    }
    //跳转url  window.parent.JumpP("哈哈", "TF_PersonnelFile/SetUnits", "icon-plugin");
    function JumpP(Name, URL, iconCls) {
        addTab(Name, URL, 'icon ' + iconCls);
    }

    //关闭页面  Pname 标题 window.parent.closeN("发布公告");
    function closeN(Pname) {
        $('.tabs-inner span').each(function (i, n) {
            var t = $(n).text();
            if (Pname == t) {
                $('#tabs').tabs('close', t);
            }
        });
    }
    //关闭当前页面 window.parent.closeC();
    function closeC() {
        var currentTab = $('#tabs').tabs('getSelected');
        var currentTabIndex = $('#tabs').tabs('getTabIndex', currentTab);
        $('#tabs').tabs('close', currentTabIndex);

    }

    function loginOut() {
        //然后确认发送异步请求的信息到后台删除数据
        $.messager.confirm("系统信息", "<font color='red' size='3'>您确认退出登录吗？</font>", function (Delete) {
            if (Delete) {
                $.get(BaseUrl + "loginOut", function (data) {
                    if (data == "OK") {
                        //友情提示按钮删除成功，刷新表格
                        location.href = 'Login';
                        //
                    }
                    else {

                    }
                });
            }
        });
    }

    function ChangePwd() {
        if ($("#TxtNewPwd1").val() != $("#TxtNewPwd2").val()) {
            //  alert("两次密码不一致")
            alerts("两次密码不一致", 2);
            return;
        }

        var postData =
                {
                    NewPwd: $("#TxtNewPwd2").val(),      //属性名用引号括起来，属性间由逗号隔开
                    OldPwd: $("#TxtOldPwd").val()
                };
        $.post(BaseUrl + 'ChangePwd', postData, function (data) {
            $("#DivEditor").dialog('close');
            alerts(data, 2);
        });

    }
    function ShowCPwd() {
        //弹出层
        $('#DivEditor').dialog({
            title: '修改密码',
            //width: 400,
            //height: 200,
            closed: false,
            cache: false,
            // href: 'get_content.php',
            modal: true,
            onClose: function () {
                //解决弹出窗口关闭后，验证消息还显示在最上面
            }
        });
        $("#ff").form("clear");
    }
    function ShowCompany() {
        //弹出层
        $('#DivCompany').dialog({
            title: '当前公司',
            //width: 400,
            //height: 200,
            closed: false,
            cache: false,
            // href: 'get_content.php',
            modal: true,
            onClose: function () {
                //解决弹出窗口关闭后，验证消息还显示在最上面
            }
        });
        $('#companyid').combobox('reload', '/AjaxHandler/GetCompany');  // 使用新的URL重新载入列表数据

    }

    function ChangeCompany() {
        if ($('#companyid').combobox('getValue') != '') {
            var postData =
                    {
                        companyid: $('#companyid').combobox('getValue'),
                        companname: $("#companyid").combobox('getText')
                    };
            $("#Companya").html($("#companyid").combobox('getText'));
            $.post(BaseUrl + 'ChangeCompany', postData, function (data) {
                $("#DivCompany").dialog('close');
                location.reload();
                alerts(data, 2);
            });
        }
    }

    //到登录页 window.parent.loginp();
    function loginp() {
        var url = "/login";
        window.location.href = url;//谷歌地图
    }
</script>

</body>
</html>

