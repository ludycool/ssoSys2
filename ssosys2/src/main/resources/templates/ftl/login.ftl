<!DOCTYPE html>
<html>
<head>
    <title>
        权限管理系统
    </title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta id="d_meta_keywords" name="keywords" content="">
    <meta name="description" content="">
    <meta name="copyright" content="">

    <link href="/Content/Login/wuye/base.css" rel="stylesheet" type="text/css" />
    <link href="/Content/Login/wuye/login.css" rel="stylesheet" type="text/css" />
    <link href="/Content/Login/wuye/sitebefore.css" rel="stylesheet" type="text/css" />
    <script src="/Content/Scripts/jquery1.9.min.js"></script>
    <script type="text/javascript">
        ${RuteUrl}
        $(function () {
            //首次加载
            CV();
            //单击验证码事件
            //单击验证码事件
            if (self.frameElement && self.frameElement.tagName == "IFRAME") {
                // alert('在iframe中');
                window.parent.loginp();
            }
        });

        function CV() {
            $("#valiCode").attr("src", "/login/getVerify?time=" + (new Date()).getTime());

        }
        function cleartxt() {
            $('#VCode').val('');
        }


        //实现的编辑，包括增查改
        function login() {

            var LoginName=$("#LoginName").val();
            var Password=$("#Password").val();
            var VCode=$("#VCode").val();
            //发送异步请求到后台保存数据
            $.post(BaseUrl + '/tologin', {loginName:LoginName,passWrod:Password,code:VCode}, function (data) {

                if (data.code > 0) {
                   location.href="/home"
                }else {
                    alert(data.msg);
                }
            });

        }
    </script>
</head>

<body>
<div class="container">

    <div class="header">

        <table width="100%">
            <tbody>
            <tr style="vertical-align: bottom">

                <td style="width: 700px;">

                    <span style="padding-left: 10px; font-size: 30px; float: left; color: #566695; line-height: 70px; font-family: Verdana, 微软雅黑,黑体">
                                <img src="/Content/Css/Images/logo.png" width="64" height="64" align="middle" />
                                管理系统
                            </span>
                </td>

                <td align="left" valign="middle">
                    <div id="d_region_menu">
                        <ul id="breadcrumb">

                            <li><a href="#" class="chinese" target="_blank">联系我们</a></li>
                            <li><a href="#" class="chinese" target="_blank">系统说明</a></li>
                        </ul>
                    </div>

                </td>
            </tr>
            </tbody>
        </table>

    </div>



    <div class="content">
        <div class="login_box cf">
            <div class="pic fl">
                <img src="/Content/Login/wuye/login_left.jpg">
            </div>
            <div class="login fr">
                <p>
                    <label>用户名</label>
                    <input type="text" id="LoginName" class="TxtUserNameCssClass">  </input>

                </p>
                <p id="ppwd">
                    <label><a href="#"></a>密码</label>
                    <input type="password" id="Password" class="TxtPasswordCssClass">  </input>
                </p>
                <p class="verify">

                    <input type="text" id="VCode" class="TxtValidateCodeCssClass" value="验证码" onfocus="cleartxt()">  </input>
                    <span class="code">
                                <img id="valiCode" style="cursor: pointer;"  onclick="CV()" class="img" src="/login/getVerify" alt="看不清？请点我" />
                            </span>
                    <a href="#" onclick="CV();">看不清楚</a>
                </p>
                <p class="btn">
                    <input name="" type="button" onclick="login()" value="登录">
                </p>
            </div>
        </div>
    </div>

    <div id="d_footer" class="footer"><span style="font-family: Arial;"></span>&nbsp;2010-2017&nbsp;深圳万瑞博技术有限责任公司 &nbsp;All Rights Reserved.</div>
</div>
</body>
</html>

