<%--
  Created by IntelliJ IDEA.
  User: yuanbao
  Date: 2020/8/15
  Time: 21:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>小傅铁路网站</title>
    <link rel="stylesheet" href="css/headerLogo.css" type="text/css">

<%--    css代码 --%>
    <style>


        body
        {
            font: 12px 'Lucida Sans Unicode', 'Trebuchet MS', Arial, Helvetica;
            margin: 0;
            background-color: #d9dee2;
        }

        /*-----------登录界面的位置---------*/

        /*-----------登录的背景图片---------*/

        #login_background{
            background-image: url("images/backgroud-img.jpg");

            /*background-color: red;*/

            background-size: cover;

            z-index: 0;

            width: 100%;

            height: 100%;

        }

        #login_content{
            z-index: 1;

            text-align: center;
        }

        #login
        {
            background-color: #fff;
            height: 240px;
            width: 400px;
            margin: -150px 0 0 -230px;
            padding: 30px;
            position: absolute;
            top: 50%;
            left: 80%;
            -moz-border-radius: 3px;
            -webkit-border-radius: 3px;
            border-radius: 3px;
            -webkit-box-shadow:
                    0 0 2px rgba(0, 0, 0, 0.2),
                    0 1px 1px rgba(0, 0, 0, .2),
                    0 3px 0 #fff,
                    0 4px 0 rgba(0, 0, 0, .2),
                    0 6px 0 #fff,
                    0 7px 0 rgba(0, 0, 0, .2);
            -moz-box-shadow:
                    0 0 2px rgba(0, 0, 0, 0.2),
                    1px 1px   0 rgba(0,   0,   0,   .1),
                    3px 3px   0 rgba(255, 255, 255, 1),
                    4px 4px   0 rgba(0,   0,   0,   .1),
                    6px 6px   0 rgba(255, 255, 255, 1),
                    7px 7px   0 rgba(0,   0,   0,   .1);
            box-shadow:
                    0 0 2px rgba(0, 0, 0, 0.2),
                    0 1px 1px rgba(0, 0, 0, .2),
                    0 3px 0 #fff,
                    0 4px 0 rgba(0, 0, 0, .2),
                    0 6px 0 #fff,
                    0 7px 0 rgba(0, 0, 0, .2);
        }

        #login:before
        {
            content: '';
            position: absolute;
            z-index: -1;
            border: 1px dashed #ccc;
            top: 5px;
            bottom: 5px;
            left: 5px;
            right: 5px;
            -moz-box-shadow: 0 0 0 1px #fff;
            -webkit-box-shadow: 0 0 0 1px #fff;
            box-shadow: 0 0 0 1px #fff;
        }

        /*---------账号登录的美化-----------*/

        h1
        {
            text-shadow: 0 1px 0 rgba(255, 255, 255, .7), 0px 2px 0 rgba(0, 0, 0, .5);
            text-transform: uppercase;
            text-align: center;
            color: #666;
            margin: 0 0 30px 0;
            letter-spacing: 4px;
            font: normal 26px/1 Verdana, Helvetica;
            position: relative;
        }

        h1:after, h1:before
        {
            background-color: #777;
            content: "";
            height: 1px;
            position: absolute;
            top: 15px;
            width: 120px;
        }

        h1:after
        {
            background-image: -webkit-gradient(linear, left top, right top, from(#777), to(#fff));
            background-image: -webkit-linear-gradient(left, #777, #fff);
            background-image: -moz-linear-gradient(left, #777, #fff);
            background-image: -ms-linear-gradient(left, #777, #fff);
            background-image: -o-linear-gradient(left, #777, #fff);
            background-image: linear-gradient(left, #777, #fff);
            right: 0;
        }

        h1:before
        {
            background-image: -webkit-gradient(linear, right top, left top, from(#777), to(#fff));
            background-image: -webkit-linear-gradient(right, #777, #fff);
            background-image: -moz-linear-gradient(right, #777, #fff);
            background-image: -ms-linear-gradient(right, #777, #fff);
            background-image: -o-linear-gradient(right, #777, #fff);
            background-image: linear-gradient(right, #777, #fff);
            left: 0;
        }

        /*--------底部文字和图片的css代码------------*/

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

        fieldset
        {
            border: 0;
            padding: 0;
            margin: 0;
        }

        /*--------账号和密码的美化------------*/

        #inputs input
        {
            background: #f1f1f1 url(images/login-sprite.png) no-repeat;
            padding: 15px 15px 15px 30px;
            margin: 0 0 10px 0;
            width: 353px; /* 353 + 2 + 45 = 400 */
            border: 1px solid #ccc;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            -moz-box-shadow: 0 1px 1px #ccc inset, 0 1px 0 #fff;
            -webkit-box-shadow: 0 1px 1px #ccc inset, 0 1px 0 #fff;
            box-shadow: 0 1px 1px #ccc inset, 0 1px 0 #fff;
        }

        #username
        {
            background-position: 5px -2px !important;
        }

        #password
        {
            background-position: 5px -52px !important;
        }

        #inputs input:focus
        {
            background-color: #fff;
            border-color: #e8c291;
            outline: none;
            -moz-box-shadow: 0 0 0 1px #e8c291 inset;
            -webkit-box-shadow: 0 0 0 1px #e8c291 inset;
            box-shadow: 0 0 0 1px #e8c291 inset;
        }

        /*--------下方提交按钮的美化------------*/
        #actions
        {
            margin: 25px 0 0 0;
        }

        #submit
        {
            background-color: #ffb94b;
            background-image: -webkit-gradient(linear, left top, left bottom, from(#fddb6f), to(#ffb94b));
            background-image: -webkit-linear-gradient(top, #fddb6f, #ffb94b);
            background-image: -moz-linear-gradient(top, #fddb6f, #ffb94b);
            background-image: -ms-linear-gradient(top, #fddb6f, #ffb94b);
            background-image: -o-linear-gradient(top, #fddb6f, #ffb94b);
            background-image: linear-gradient(top, #fddb6f, #ffb94b);

            -moz-border-radius: 3px;
            -webkit-border-radius: 3px;
            border-radius: 3px;

            text-shadow: 0 1px 0 rgba(255,255,255,0.5);

            -moz-box-shadow: 0 0 1px rgba(0, 0, 0, 0.3), 0 1px 0 rgba(255, 255, 255, 0.3) inset;
            -webkit-box-shadow: 0 0 1px rgba(0, 0, 0, 0.3), 0 1px 0 rgba(255, 255, 255, 0.3) inset;
            box-shadow: 0 0 1px rgba(0, 0, 0, 0.3), 0 1px 0 rgba(255, 255, 255, 0.3) inset;

            border-width: 1px;
            border-style: solid;
            border-color: #d69e31 #e3a037 #d5982d #e3a037;

            float: left;
            height: 35px;
            padding: 0;
            width: 120px;
            cursor: pointer;
            font: bold 15px Arial, Helvetica;
            color: #8f5a0a;
        }

        #submit:hover,#submit:focus
        {
            background-color: #fddb6f;
        }

        #submit:active
        {
            outline: none;

            -moz-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.5) inset;
            -webkit-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.5) inset;
            box-shadow: 0 1px 4px rgba(0, 0, 0, 0.5) inset;
        }

        #submit::-moz-focus-inner
        {
            border: none;
        }

        #actions a
        {
            color: #3151A2;
            float: right;
            line-height: 35px;
            margin-left: 10px;
        }




    </style>
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
        <font style="font-size: 35px">欢迎登录小傅铁路网站</font>
    </div>
</div>

<%--账号登录的模块--%>
<div id="login_background">

    <div id="login_content">
        <form id="login">
            <h1>账号登录</h1>
            <fieldset id="inputs">
                <input id="username" type="text" placeholder="Username" autofocus required>
                <input id="password" type="password" placeholder="Password" required>
            </fieldset>
            <fieldset id="actions">
                <input type="submit" id="submit" value="立即登录">
                <a href="http://localhost:8080/StudentSystem/RegisterInterface.jsp">注册账号</a>
            </fieldset>
        </form>
    </div>

</div>



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

