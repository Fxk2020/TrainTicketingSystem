<%@ page import="java.util.ArrayList" %>
<%@ page import="com.fxk.entity.Train_seatNumber" %><%--
  Created by IntelliJ IDEA.
  User: yuanbao
  Date: 2020/9/28
  Time: 19:58
  To change this template use File | Settings | File Templates.
--%>
<%--

余票查询功能的实现

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>余票查询</title>
    <link rel="stylesheet" href="css/headerLogo.css" type="text/css">

    <link rel="stylesheet" href="css/footerFile.css" type="text/css">

    <link rel="stylesheet" href="css/tableBeautiful.css" type="text/css">
    <style>
        #noSeat{
            left: 30%;
            top:20%;
            position: absolute;
            background-color: red;
        }
        #haveSeat{
            width: 20%;
            max-height: 500px;
            left: 40%;
            top: 20%;
            overflow:auto;
            position: absolute;
            padding-bottom: 40px;
        }
        /*多选框的美化*/
        .shortselect{
            background:#fafdfe;
            height:28px;
            width:180px;
            line-height:28px;
            border:1px solid #9bc0dd;
            -moz-border-radius:2px;
            -webkit-border-radius:2px;
            border-radius:2px;
        }

        /*按钮的美化*/
        .submit-button { /* 按钮美化 */
            width: 70px; /* 宽度 */
            height: 40px; /* 高度 */
            border-width: 0px; /* 边框宽度 */
            border-radius: 3px; /* 边框半径 */
            background: #1E90FF; /* 背景颜色 */
            cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
            outline: none; /* 不显示轮廓线 */
            font-family: Microsoft YaHei; /* 设置字体 */
            color: white; /* 字体颜色 */
            font-size: 17px; /* 字体大小 */
        }
        .submit-button:hover { /* 鼠标移入按钮范围时改变颜色 */
            background: #5599FF;
        }
        #showTrain{
            position: absolute;
            left: 30%;
            top: 40%;
        }
        a{
            cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
        }
    </style>
</head>
<body>
<%
    String namePeople = (String) request.getSession(true).getAttribute("namePeople");

    ArrayList<Train_seatNumber> seatNumbers = (ArrayList<Train_seatNumber>) request.getSession(true).getAttribute("seat_number");
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



<%--2.主要内容-余票查询--%>

<%
    if (seatNumbers!=null){
%>
<div id="haveSeat">

    <p style="font-size:large;font-family: 宋体;font-weight: bold;">出行时间</p>
    <select id="time" class="shortselect">
        <option value="volvo">2020.10.10</option>
        <option value="saab">2020.10.11</option>
        <option value="opel">2020.10.12</option>
        <option value="audi">2020.10.13</option>
    </select>
    <br>
    <button onclick="submitRideTime()" class="submit-button" style="margin-top: 15px">确认</button>
    <form id="submitRideTime2" action="http://localhost:8080/TrainTicketingSystem/GetRemainTicketServlet" method="post">
        <input type="text" name="namePeople" value="<%=namePeople%>" style="display: none">
        <input id="ride_time" type="text" name="ride_time" value="" style="display: none">
    </form>
    <script>
        function submitRideTime() {

            //获取下拉框的文本内容
            var  myselect=document.getElementById("time");
            var index=myselect.selectedIndex;
            var ride_time = myselect.options[index].text;

            document.getElementById("ride_time").value = ride_time;

            document.getElementById("submitRideTime2").submit();
        }
    </script>

    <table class="bordered">
        <p style="font-size: x-large;font-family: 宋体;font-weight: bold;">剩余车票🚄：</p>
        <tr>
            <th>火车号</th>
            <th>车座等级</th>
            <th>车票剩余</th>
        </tr>
            <%
            for(int i = 0; i < seatNumbers.size(); i++) {
              Train_seatNumber temp = seatNumbers.get(i);
              String train_id = temp.getTrain_id();
              String seat_type = temp.getSeat_type();

              int seat_number = temp.getSeat_number();

%>
        <tr>
            <td><%=train_id%></td>
            <td><%=seat_type%></td>
            <td><%=seat_number%></td>
        </tr>
        <%
}%>
    </table>
</div>
        <%
    }else {
%>
<script>
    document.getElementById("noSeat").style.display = "block";
</script>
<%
    }
%>

<%--今日票已卖完！--%>
<div style="display: none" id="noSeat">
    <p>今日的所有座位已售空！</p>
</div>










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
