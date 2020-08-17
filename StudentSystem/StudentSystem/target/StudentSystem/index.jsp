<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1">
    <title>小傅铁路网站</title>

    <link rel="stylesheet" href="css/index.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">

    <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="js/public.js"></script>

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

        <!-- 导航 -->
        <div class="dh_bg">
            <ul>
                <li>
                    <a href="index.jsp">
                        <i class="img dh_01HOME"></i>
                        <span>网站首页</span>
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
                    <a>
                        <i class="img dh_03TARGET"></i>
                        <span>变更</span>
                    </a>
                </li>
                <li>
                    <a href="TravelGuide.jsp">
                        <i class="img dh_04GRID"></i>
                        <span>出行指南</span>
                    </a>
                </li>
                <li>
                    <a>
                        <i class="img dh_05NOTEPAD"></i>
                        <span>信息查询</span>
                    </a>
                </li>
                <li>
                    <a href="Contact_us.jsp">
                        <i class="img dh_06PEN"></i>
                        <span>联系我们</span>
                    </a>
                </li>
                <li>
                    <a>
                        <i class="img dh_07USER"></i>
                        <span>您好！请</span>
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
                            <dt><a href="buyTickets.jsp">单程</a></dt>
                        </dl>
                        <dl>
                            <i></i>
                            <dt><a href="changeTickets.jsp">往返</a></dt>
                        </dl>
                        <dl>
                            <i></i>
                            <dt><a href="seeTickets.jsp">换乘</a></dt>
                        </dl>
                    </div>
                </div>

                <div class="two_nav">
                    <span></span>
                    <div>
                        <dl>
                            <i></i>
                            <dt><a href="productslist.html">退票</a></dt>
                            <%--              <dd><a href="#">空心纤维透析器</a></dd>--%>
                            <%--              <dd><a href="#">脉搏波血压计</a></dd>--%>
                            <%--              <dd><a href="#">三高测量仪</a></dd>--%>
                        </dl>
                        <dl>
                            <i></i>
                            <dt><a href="#">变更到站</a></dt>
                            <%--              <dd><a href="#">家用制氧机</a></dd>--%>
                            <%--              <dd><a href="#">脉搏波血压计</a></dd>--%>
                        </dl>
                        <dl>
                            <i></i>
                            <dt><a href="#">改签</a></dt>
                            <%--              <dd><a href="#">磁共振成像</a></dd>--%>
                            <%--              <dd><a href="#">高频电刀</a></dd>--%>
                            <%--              <dd><a href="#">脉搏波血压计</a></dd>--%>
                            <%--              <dd><a href="#">X射线机</a></dd>--%>
                        </dl>
                        <%--            <dl>--%>
                        <%--              <i></i>--%>
                        <%--              <dt><a href="#">新型医疗器械</a></dt>--%>
                        <%--              <dd><a href="#">大脑探测仪</a></dd>--%>
                        <%--              <dd><a href="#">AI治疗仪</a></dd>--%>
                        <%--            </dl>--%>
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
                            <dt><a href="caselist.html">车次查询</a></dt>
                        </dl>
                        <dl>
                            <i></i>
                            <dt><a href="#">订单查询</a></dt>
                        </dl>
                        <dl>
                            <i></i>
                            <dt><a href="#">余票查询</a></dt>
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
                            <dt><a href="http://localhost:8080/StudentSystem/LoginInterface.jsp">登陆</a></dt>
                        </dl>
                        <dl>
                            <i></i>
                            <dt><a href="http://localhost:8080/StudentSystem/RegisterInterface.jsp">注册</a></dt>
                        </dl>
                    </div>
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

<script>
    var myVar = setInterval(function(){ myTimer() }, 1000);

    function myTimer() {
        var d = new Date();
        var t = d.toLocaleTimeString();
        document.getElementById("timeNow").innerHTML = t;
    }
</script>

</body>
</html>
