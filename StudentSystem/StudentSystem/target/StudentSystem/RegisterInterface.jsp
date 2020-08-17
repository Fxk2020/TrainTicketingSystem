<%--
  Created by IntelliJ IDEA.
  User: yuanbao
  Date: 2020/8/16
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <title>小傅铁路网站</title>
    <style type="text/css">
        body,h1,h2,h3,h4,h5,h6,hr,p,blockquote,dl,dt,dd,ul,ol,li,pre,form,fieldset,legend,button,input,textarea,th,td{margin:0;padding:0}
        body,button,input,select,textarea{font:12px/1.5 tahoma,arial,\5b8b\4f53,sans-serif;text-align:justify;text-justify:inter-ideograph;word-break:break-all;word-wrap:break-word}
        h1,h2,h3,h4,h5,h6{font-size:100%}
        address,cite,dfn,em,var,i,u{font-style:normal}
        code,kbd,pre,samp{font-family:courier new,courier,monospace}
        small{font-size:12px}ul,ol{list-style:none}
        sup{vertical-align:text-top}sub{vertical-align:text-bottom}
        legend{color:#000}fieldset,img{border:0}button,input,select,textarea{font-size:100%;padding:0;margin:0}
        table{border-collapse:collapse;border-spacing:0}caption,th{ text-align:left }
        .ovh{overflow:hidden}.l{float:left}.r{float:right}.cur{cursor:pointer}
        .c_b{content:".";display:block;height:0;clear:both;visibility:hidden;zoom:1;font-size:0px;overflow:hidden;visibility:hidden}.c_b2{clear:both}.dn{display:none}.dis{display:block}.b{font-weight:bold}
        body{behavior:url("css/hover_htc.htc");font-family:"Microsoft YaHei",宋体; color:#333;}/*hover*/

        /*会员注册*/
        .login ul{/*background:url(../images/line.png) repeat-x;*/ padding-top:10px; border-top:1px solid #fff}
        .login ul a{ color:#005cb1}
        .login .id input,.login .pw input,.in_id,.in_mo,.reg_input,.reg_input_pic{background-color:#FFF; border:1px solid #d5cfc2;  font-size:14px; font-weight:bold; vertical-align:middle}
        .login .id input,.login .pw input{width:170px; height:30px;margin:0 5px 5px 0; line-height:30px; padding:0 5px;}
        .login .id input:hover,.login .pw input:hover,.in_id:hover,.in_mo:hover,.reg_input:hover,.reg_input_pic:hover{border:1px solid #005cb1;background-color:#F2FAFF;}
        .l_button,.r_button{background:url(images/login_button.png) no-repeat; width:118px; height:39px; border:none; cursor:pointer; display:block; float:left; text-indent:-9000px}
        .l_button{background-position:0 -60px;}
        .r_button{background-position:-138px -60px; margin-right:4px}
        .l_button:hover{background-position:0 0;}
        .r_button:hover{background-position:-138px 0;}
        .f_reg_but{margin:10px 0 0 115px}

        .reg{width:460px;
            font-size:14px;
            line-height:25px;
            overflow:hidden;
            left: 40%;
            top:25%;
        position: absolute}
        .reg dl{padding-left:10px; font-size:14px;}
        .reg dl dt{ margin-top:15px}
        .reg dl dd{padding:3px 0}
        .reg .title{width:100px; display:inline-block; text-align:right; padding-right:10px}
        .reg_input_pic{width:80px;}
        .in_pic_s{margin-left:83px}
        .reg .img{position:absolute}
        .onShow,.onFocus,.onError,.onCorrect,.onLoad{background:url(images/reg_bg.png) no-repeat 3000px 3000px;padding-left:30px; font-size: 12px; height:25px; width:124px; display:inline-block; line-height:25px; vertical-align:middle; overflow:hidden; margin-left:6px}
        .onShow{color:#999; padding-left:0px}
        .onFocus{background-position:0px -30px; color:#333}
        .onError{background-position:0px -60px; color:#333}
        .onCorrect{background-position:0px 0; text-indent:-9000px}
        .onLoad{background-position:0px 0}
        .reg_m{margin-left:90px}
        .clew_txt{display:inline-block; padding:7px  0 0 15px; font-size:12px;}

        .id input,.pw input,.in_id,.in_mo,.reg_input,.reg_input_pic{_behavior:url(js/Round_htc.htc);-moz-border-radius:4px;-webkit-border-radius:4px;border-radius:4px; height:25px;}
        .user_button a,.pay_but{_behavior:url(js/Round_htc.htc);-moz-border-radius:100px;-webkit-border-radius:100px;border-radius:100px;}

        .footer-txt{
            margin: 0;
            padding: 0;
            position: absolute;
            bottom: 0;

            text-align: center;
            height: 32px;
            /*background-color: rgb(128,138,135);*/
            background-color: #3385cc;
            font-family: "Courier New";
            font-size: 18px;
            width: 100%;

        }
        .footer-image{
            text-align: center;
            margin: 0;
            bottom: 35px;
            position: absolute;
            /*left: 600px;*/
            background-color: #F8F8F8;
            width: 100%;
        }

        #one1,#one2{display:block; background-color:#e9eed8; padding:5px 0; text-align:center; clear:both; cursor:pointer}
        #one2{margin-top:15px}
        #one1:hover,#one2:hover{background-color:#d4dfb0}
        #one1 span,#one2 span{color:#F00}
    </style>

    <link rel="stylesheet" href="css/headerLogo.css" type="text/css">

    <script src="js/jquery-1.11.0.min.js" type=text/javascript></script>
    <script src="js/formValidator_min.js" type="text/javascript" charset="UTF-8"></script>
    <script src="js/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $.formValidator.initConfig({formid:"form1",debug:false,submitonce:true,
                onerror:function(msg,obj,errorlist){
                    //$.map(errorlist,function(msg1){alert(msg1)});
                    alert(msg);
                }
            });
            $("#t_UserName").formValidator({onshow:"5-10个字符",onfocus:"5-10个字符",oncorrect:"该用户名可以注册"}).inputValidator({min:5,max:10,onerror:"输入有误"}).regexValidator({regexp:"username",datatype:"enum",onerror:"格式有误"});
            $("#iptNickName").formValidator({onshow:"至少4个字符",onfocus:"至少4个字符",oncorrect:"通过"}).inputValidator({min:4,empty:{leftempty:false,rightempty:false,emptyerror:"输入有误"},onerror:"输入有误"});
            $("#t_UserPass").formValidator({onshow:"至少6个字符",onfocus:"至少6个字符",oncorrect:"密码合法"}).inputValidator({min:6,empty:{leftempty:false,rightempty:false,emptyerror:"输入有误"},onerror:"输入有误"});
            $("#t_RePass").formValidator({onshow:"请再次输入密码",onfocus:"请再次输入密码",oncorrect:"密码一致"}).inputValidator({min:6,empty:{leftempty:false,rightempty:false,emptyerror:"输入有误"},onerror:"输入有误"}).compareValidator({desid:"t_UserPass",operateor:"=",onerror:"密码不一致"});
            $("#iptName").formValidator({onshow:"至少4个字符",onfocus:"至少4个字符",oncorrect:"通过"}).inputValidator({min:4,empty:{leftempty:false,rightempty:false,emptyerror:"输入有误"},onerror:"输入有误"});
            $("#iptCard").formValidator({onshow:"15或18位的身份证",onfocus:"15或18位的身份证",oncorrect:"输入正确"}).functionValidator({fun:isCardID});
            $("#t_Email").formValidator({onshow:"6-100个字符",onfocus:"6-100个字符",oncorrect:"恭喜你,你输对了",defaultvalue:"@"}).inputValidator({min:6,max:100,onerror:"长度非法"}).regexValidator({regexp:"^([\\w-.]+)@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.)|(([\\w-]+.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(]?)$",onerror:"格式不正确"});
        });
        function test1(obj)
        {
            if(obj.value=="全角字符当做1个长度")
            {
                $.formValidator.getInitConfig("1").wideword = false;
                obj.value = "全角字符当做2个长度";
            }
            else
            {
                $.formValidator.getInitConfig("1").wideword = true;
                obj.value = "全角字符当做1个长度";
            }

        }
        function reloadPage(){
            location.reload()
        }

    </script>
</head>

<body>
<!--头部-->
<div class="top_bg" id="top_bg">
    <div class="top_line">
    </div>
    <div class="top_main">

        <!--网站logo-->
        <div class="top_logo">
            <a href='./' onclick="reloadPage()"><img src="images/logo2.png"></a>
        </div>

        <br>
        <br>
        <font style="font-size: 35px">欢迎注册"小傅铁路网站"账号</font>
    </div>
</div>


<!--注册开始-->
<div class="reg">
    <form action="" method="post" name="form1" id="form1">
        <dl>
            <dt class="f14 b">帐户基本信息</dt>
<%--            <dd><span class="title">登录账号：</span><input class="reg_input" name="t_UserName" id="t_UserName" onblur="checkusername(this.value);" type="text" /><span id="t_UserNameTip" class="onshow"></span></dd>--%>
            <dd><span class="title">昵称：</span><input class="reg_input" name="iptNickName" id="iptNickName" onblur="checkNickName(this.value)" type="text" /><span id="iptNickNameTip" class="onshow"></span></dd>
            <dd><span class="title">身份认证：</span><input type="radio" id="Sex_Man" name="rb_Sex" value="0" checked="CHECKED" />学生<label for="Sex_Man"></label>
                <input type="radio" id="Sex_Woman" name="rb_Sex" value="0" /><label for="Sex_Woman">非学生</label>　
<%--                <input name="" type="checkbox" value="" /> 跳过--%>
            </dd>
        </dl>
        <dl>
            <dt class="f14 b">帐户安全设置</dt>
            <dd><span class="title">登录密码：</span><input class="reg_input" onblur="return checkpasswd(this);" id="t_UserPass" name="t_UserPass" type="password"/><span id="t_UserPassTip" class="onshow"></span></dd>
            <dd><span class="title">确认登录密码：</span><input onblur="checkdoublepassword();" class="reg_input" type="password" id="t_RePass" name="t_RePass"/><span id="t_RePassTip" class="onshow"></span></dd>
            <dd><span class="title">真实姓名：</span><input name="iptName" id="iptName" class="reg_input" type="text" onblur="return isCnn(this)" /><span id="iptNameTip" class="onshow"></span></dd>
            <dd><span class="title">身份证号：</span><input class="reg_input" name='iptCard' type='text' id='iptCard' onblur="return checktheform();" /><span id="iptCardTip" class="onshow"></span></dd>
            <dd><span class="title">邮箱地址：</span><input class="reg_input" name="t_Email" type="text" id="t_Email" onblur="checkemail(this.value)" /><span id="t_EmailTip" class="onshow"></span></dd>
            <dd><span class="title">验证码：</span><input id="t_CheckCode" class="reg_input_pic" name="t_CheckCode" type="text" maxlength="4" />
                <img class="img" src="images/eee.jpg" width="60" height="30" /><span id="t_CheckCodeTip" class="reg_m onError in_pic_s">请输入验证码</span></dd>
        </dl>
        <div class="f_reg_but"><input id="button" name="button" type="submit" value="注册" class="r_button"/><span class="clew_txt">如果您已有帐号，可<a href="http://localhost:8080/StudentSystem/LoginInterface.jsp">直接登录</a></span></div>
    </form>
</div>
<!--注册结束-->

<%--底部图片连接--%>
<div class="footer-image">
    <img src="images/bottom.png" style="height: 115px;margin: 0" usemap="#company">
    <map name="company">
        <area shape="rect" coords="30,40,190,60" href="http://www.china-railway.com.cn/" target="view_window">
        <area shape="rect" coords="200,40,360,60" href="http://www.cric-china.com.cn/gsjs/bxgs_intro/" target="view_window">
        <area shape="rect" coords="30,75,190,95" href="http://www.95306.cn/#/" target="view_window">
        <area shape="rect" coords="200,75,360,95" href="http://www.cre.cn/" target="view_window">
    </map>
</div>

<%--显示时间及版权所有--%>
<div class="footer-txt">
    <span style="color: #FFFAF0">版权所有©山东大学-软件学院</span>
    <span style="color: #FFFAF0" id="timeNow"></span>
    <img src="images/top_tel.png"><span style="color: #FFFAF0">创作者：小傅</span>
</div>


</body>
</html>
