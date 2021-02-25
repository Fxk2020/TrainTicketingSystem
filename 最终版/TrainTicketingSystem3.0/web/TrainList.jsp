<%@ page import="java.util.ArrayList" %>
<%@ page import="com.fxk.entity.Train_stopTable" %><%--
  Created by IntelliJ IDEA.
  User: yuanbao
  Date: 2020/9/28
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>

<%--

记录所有正常运行的火车的车次表

--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>车次表</title>
    <link rel="stylesheet" href="css/headerLogo.css" type="text/css">

    <link rel="stylesheet" href="css/footerFile.css" type="text/css">

    <link rel="stylesheet" href="css/tableBeautiful.css" type="text/css">
    <style>
        #haveTrain{
            width: 80%;
            max-height: 500px;
            left: 10%;
            top: 20%;
            overflow:auto;
            position: absolute;
            padding-bottom: 40px;
        }
    </style>
</head>
<body>

<%
    String namePeople = (String) request.getSession(true).getAttribute("namePeople");

    ArrayList<Train_stopTable> train_stopTables = (ArrayList<Train_stopTable>) request.getSession(true).getAttribute("allTrain");
%>
<!--1。头部相关信息-->
<div class="top_bg" id="top_bg">
    <div class="top_line">
    </div>
    <div class="top_main">

        <!--网站logo-->
        <div class="top_logo">
            <a href='./' onclick="reloadPage()"><img src="images/logo2.png"></a>
        </div>

        <!--用户是否登录的显示-->
        <div id="notDenglu" class="toubu">
            您好！请
            <a href="http://localhost:8080/TrainTicketingSystem/LoginInterface.jsp">登录</a>
            <a href="http://localhost:8080/TrainTicketingSystem/RegisterInterface.jsp">注册</a>
        </div>

        <div id="yiDenglu" class="toubu" style="display: none">
            您好！<%=namePeople%>
        </div>
    </div>
</div>
<%--    用户是否登录的显示 --%>
<%
    if(namePeople!=null&&!namePeople.equals("null")){
%>
<script>
    document.getElementById("notDenglu").style.display="none";//隐藏
    document.getElementById("yiDenglu").style.display="block";
</script>
<%
    }
%>

<%--2.正文-显示所有未停运的火车--%>
<%
    if (train_stopTables!=null){

%>
<div id="haveTrain">
    <table class="bordered">
        <p style="font-size: x-large;font-family: 宋体;font-weight: bold;">车次表🚄：</p>
        <tr>
            <th>火车号</th>
            <th>经过的车站</th>
            <th>到达时间</th>
            <th>在该车站停止的时间</th>
            <th>火车已经行驶的路程</th>
        </tr>
        <%
            for (int i = 0; i < train_stopTables.size(); i++) {
                Train_stopTable temp = train_stopTables.get(i);
                String train_id = temp.getTrain_id();
                String arrive_time = temp.getArrive_time();
                String stop_time = temp.getStop_time();
                int mileage = temp.getMileage();
                String station_name = temp.getStation_name();
                if (stop_time.equals("0分钟")){
                    if (mileage==0){
                        stop_time = "始发站";
                    }else {
                        stop_time = "终点站";
                    }

                }
        %>
        <tr>
            <td><%=train_id%></td>
            <td><%=station_name%></td>
            <td><%=arrive_time%></td>
            <td><%=stop_time%></td>
            <td><%=mileage%>千米</td>
        </tr>
        <%
            }%>
    </table>
</div>

<%
    }else {

    }
%>




<%--3.尾部相关信息--%>
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

<%--版权所有--%>
<div class="footer-txt">
    <span style="color: #FFFAF0">版权所有©山东大学-软件学院</span>
    <span style="color: #FFFAF0" id="timeNow"></span>
    <img src="images/top_tel.png"><span style="color: #FFFAF0">创作者：小傅</span>
</div>

</body>
</html>
