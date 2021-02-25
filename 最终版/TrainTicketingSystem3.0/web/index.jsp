<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1">
    <title>小傅铁路网站</title>

    <link rel="stylesheet" href="css/index.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="css/footerFile.css" type="text/css">

    <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="js/public.js"></script>

    <style type="text/css">
        a{
            cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
        }
    </style>

</head>
<body>
<%--获取登录者的姓名--%>
<%

    String name = (String) request.getSession(true).getAttribute("username_msg");

    System.out.println("session:name-"+name);

    String pay_successfully = (String) request.getSession(true).getAttribute("pay_successfully");
    System.out.println("successfully:paypaypay"+pay_successfully);

    if (pay_successfully!=null){
        if (pay_successfully.equals("OK")){
        }
    }
%>


<!--头部-->
<div class="top_bg" id="top_bg">
    <div class="top_line">
    </div>
    <div class="top_main">

        <!--网站logo-->
        <div class="top_logo">
            <a><img src="images/logo2.png"></a>
        </div>

        <!-- 导航 -->
        <div class="dh_bg">
            <ul>
                <li>
                    <a>
                        <i class="img dh_01HOME"></i>
                        <span onclick="">网站首页</span>
                    </a>
                </li>
                <!-- 一级导航 -->
                <li class="cur">
                    <a>
                        <i class="img dh_02COMPASS"></i>
                        <span>购票</span>
                    </a>
                </li>
                <li>
                    <a href="TravelGuide.html">
                        <i class="img dh_04GRID"></i>
                        <span>用户使用指南</span>
                    </a>
                </li>
                <li>
                    <a>
                        <i class="img dh_05NOTEPAD"></i>
                        <span>信息查询</span>
                    </a>
                </li>

                <li>
                    <a>
                        <i class="img dh_07USER"></i>
                        <span>您好!<font id="Have_name" style="visibility: hidden"><%=name%></font><font id="No_name" style="visibility: visible">请</font> </span>
                    </a>
                </li>
                <li id="user_center" style="visibility: hidden">
                    <a onclick="submit_name2()">
                        <i class="img dh_06PEN"></i>
                        <span>个人中心👤</span>
                        <form id="submit_form_userCenter" action="http://localhost:8080/TrainTicketingSystem/Session_message_userCenter" method="post" style="display: none">
                            <input type="text" name="namePeople" value="<%=name%>" >
                        </form>
                    </a>
                </li>
            </ul>

            <!-- 背景块 -->
            <div class="dh_bg_cur">
                <img src="images/nav_cur.png">
            </div>

            <!-- 二级菜单 -->
            <div class="two_nav_box">
                <div class="two_nav">
                    <span></span>
                    <div>
                        <dl>
                            <i></i>
                            <dt><a onclick="submit_name()" style="cursor: pointer">单程</a></dt>
                            <form id="submit_form" action="http://localhost:8080/TrainTicketingSystem/GetCitiesServlet" method="post" style="display: none">
                                <input type="text" name="namePeople" value="<%=name%>">
                                <input type="text" name="Type_ticket" value="dancheng">
                            </form>
                        </dl>
                        <dl>
                            <i></i>
                            <dt><a onclick="submit_name_huancheng()" style="cursor: pointer">换乘</a></dt>
                            <form id="submit_form2" action="http://localhost:8080/TrainTicketingSystem/GetCitiesServlet" method="post" style="display: none">
                                <input type="text" name="namePeople" value="<%=name%>">
                                <input type="text" name="Type_ticket" value="huancheng">
                            </form>
                        </dl>
                    </div>
                </div>
                <div class="two_nav">
                    <span></span>
                </div>
                <div class="two_nav">
                    <span></span>
                    <div>
                        <dl>
                            <i></i>
                            <dt><a onclick="submit_stopTable()">车次查询</a></dt>
                            <form id="submit_form_train" action="http://localhost:8080/TrainTicketingSystem/GetAllTrainServlet" method="post" style="display: none">
                                <input type="text" name="namePeople" value="<%=name%>">
                                <input type="text" name="stop_run" value="run">
                            </form>
                        </dl>
                        <dl>
                            <i></i>
                            <dt><a onclick="submit_ticket()">余票查询</a></dt>
                            <form id="submit_form_ticket" action="http://localhost:8080/TrainTicketingSystem/GetRemainTicketServlet" method="post" style="display: none">
                                <input type="text" name="namePeople" value="<%=name%>">
                                <input type="text" name="ride_time" value="2020.10.10">
                            </form>
                        </dl>
                        <dl>
                            <i></i>
                            <dt><a onclick="submit_stopTrain()">暂停运营查询</a></dt>
                            <form id="submit_form_stop_train" action="http://localhost:8080/TrainTicketingSystem/GetAllTrainServlet" method="post" style="display: none">
                                <input type="text" name="namePeople" value="<%=name%>">
                                <input type="text" name="stop_run" value="stop">
                            </form>
                        </dl>
                    </div>
                </div>
                <div class="two_nav">
                    <span></span>
                    <div  id="loginAndRegisterModel">
                        <dl>
                            <i></i>
                            <dt><a href="http://localhost:8080/TrainTicketingSystem/LoginInterface.jsp">登陆</a></dt>
                        </dl>
                        <dl>
                            <i></i>
                            <dt><a href="http://localhost:8080/TrainTicketingSystem/RegisterInterface.jsp">注册</a></dt>
                        </dl>
                    </div>
                    <div id="quitLogin" style="display: none">
                        <dl>
                            <i></i>
                            <dt><a onclick="quitLogin()">退出登录</a> </dt>
                        </dl>
                    </div>
                </div>
                <div class="two_nav">
                    <span></span>
                </div>
            </div>
            <!-- 二级菜单end -->
        </div>
        <!-- 导航菜单 end -->
    </div>
</div>

<div>
    <br><br><br>
</div>

<!--大图轮播-->
<div class="pic">
    <%-- 储存图片的区域 --%>
    <div class="content">
        <img src="images/railway/img01.jpg" style="width: 1490px" height="758px">
        <img src="images/railway/imgsss.jpg" style="width: 1490px" height="758px">
        <img src="images/railway/img03.jpeg" style="width: 1490px" height="758px">
        <img src="images/railway/img04.jpg" style="width: 1490px" height="758px">
        <img src="images/railway/imgss.jpg" style="width: 1490px" height="758px">
    </div>
    <%--  底下的小红点 --%>
    <ul class="index">
        <li class="red" style="background-color: red"></li>
        <li class="red"></li>
        <li class="red"></li>
        <li class="red"></li>
        <li class="red"></li>
    </ul>
    <%--  左右移动图片   --%>
    <div class="right"></div>
    <div class="left"></div>
</div>

<%--底部图片连接--%>
<div style="text-align: center;margin: 0;width: 100%;background-color: #F8F8F8;">
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


<%-- 控制轮播图的js方法 --%>
<script type="text/javascript">
    $(function () {

        // alert("hello");

        var timer = setInterval(picLoop,3000);//定时调用函数
        var index = 0;
        function picLoop() {
            index++;
            if (index==5){
                index = 0;//达到末尾从头来过
            }
            $(".content").animate({"left":-1490*index},300);
            //classred控制小红点的变化
            $(".red").eq(index).css("background-color","red").siblings().css("background-color","rgba(100,100,100,0,3)");
        }

//定时器的控制
        $(".pic").hover(function () {
            clearInterval(timer);
            $(".left").show();
            $(".right").show();
        },function () {
            timer = setInterval(picLoop,3000);
            $(".left").hide();
            $(".right").hide();
        })

        $(".red").mouseover(function () {
            $(this).css("background-color","red").siblings().css("background-color","rgba(100,100,100,0,3)");
            index = $(this).index();
            $(".content").animate({"left":-1490*index},300);

        })
//左右箭头的监听
        $(".left").click(function () {
            index--;
            if(index==-1){index = 4;}
            $(".content").animate({"left":-1490*index},300);
            //classred控制小红点的变化
            $(".red").eq(index).css("background-color","red").siblings().css("background-color","rgba(100,100,100,0,3)");
        })

        $(".right").click(function () {
            index++;
            if (index==5){index=0;}
            $(".content").animate({"left":-1490*index},300);
            //classred控制小红点的变化
            $(".red").eq(index).css("background-color","red").siblings().css("background-color","rgba(100,100,100,0,3)");

        })
    })
</script>

<%--传送客户姓名的方法--%>
<script>
    function submit_name() {
        document.getElementById("submit_form").submit();
    }
</script>
<script>
    function submit_name_huancheng() {
        document.getElementById("submit_form2").submit();
    }
</script>

<script>
    function submit_name2() {
        document.getElementById("submit_form_userCenter").submit();
    }
</script>
<script>
    function submit_ticket() {
        document.getElementById("submit_form_ticket").submit();
    }
</script>
<script>
    function submit_stopTable() {
        document.getElementById("submit_form_train").submit();
    }
</script>
<script>
    function submit_stopTrain() {
        document.getElementById("submit_form_stop_train").submit();
    }
</script>

<%--一旦页面刷新session重新建立所有内容全部消失--%>
<script>
    <%--function logo_reload(){--%>
    <%--    document.location.reload(true);--%>
    <%--    <%--%>

    <%--    System.out.println(name);--%>

    <%--    request.getSession(true).setAttribute("username_msg",name);--%>
    <%--    %>--%>
    <%--}--%>
</script>

<%--获取当前时间--%>
<script>
    var myVar = setInterval(function(){ myTimer() }, 1000);

    function myTimer() {
        var d = new Date();
        var t = d.toLocaleTimeString();
        document.getElementById("timeNow").innerHTML = t;
    }
</script>

<%--退出系统的方法--%>
<script>
    function quitLogin() {
        <%
        request.getSession(true).invalidate();//注销该request的所有session
        %>

        location.reload();
    }
</script>

<%--用户登录后页面的变化--%>
<%
    if(name!=null){
        %>
<script>
    document.getElementById("loginAndRegisterModel").style.display="none";//隐藏
    document.getElementById("Have_name").style.visibility="visible";
    document.getElementById("No_name").style.visibility="hidden";
    document.getElementById("quitLogin").style.display="block";

    document.getElementById("user_center").style.visibility="visible";

</script>
<%
    }
%>

</body>
</html>
