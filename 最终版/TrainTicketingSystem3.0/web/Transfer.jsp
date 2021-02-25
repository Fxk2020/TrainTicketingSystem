<%@ page import="com.fxk.entity.City" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.fxk.entity.TransferMessage" %>
<%@ page import="com.fxk.dao.GetPeople" %>
<%--
  Created by IntelliJ IDEA.
  User: yuanbao
  Date: 2020/9/25
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%--

换乘的jsp页面:
实现换乘一次的火车实现

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>换乘</title>

    <link rel="stylesheet" href="css/headerLogo.css" type="text/css">

    <link rel="stylesheet" href="css/footerFile.css" type="text/css">

    <link rel="stylesheet" href="css/tableBeautiful2.css" type="text/css">

    <style>
        .mr5{
            padding-left: 20px;
            font-size: 18px;
            font-family: 宋体;
            color: white;
            background: #2887CA;
            padding-top: 5px;padding-bottom: 5px;
            border-radius: 8px;/*圆角效果*/
        }
        .toubu{
            margin-top: 50px;
            max-width: 780px;
            float: right;
            position: relative;
        }
        #selectCity{

            left: 25%;
            top:20%;
            position: absolute;

        }
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
            border-radius: 9px;
        }
        .submit-button:hover { /* 鼠标移入按钮范围时改变颜色 */
            background: #5599FF;
        }
        #showTrains{
            position: absolute;
            left: 25%;
            top: 30%;
        }
        #sorry_noTickets{
            position: absolute;
            left: 35%;
            top: 35%;
        }
        #buy_grade{
            position: absolute;
            left: 70%;
            top: 35%;
        }
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
    </style>
</head>
<body>

<%
    ArrayList<City> cities = (ArrayList<City>) session.getAttribute("cities");

    String namePeople = (String) session.getAttribute("namePeople");

    ArrayList<TransferMessage> transferMessages = (ArrayList<TransferMessage>) session.getAttribute("transferMessage");

    String start_station = (String) session.getAttribute("startStation");
    String end_station = (String) session.getAttribute("endStation");
    String ride_time_real = (String) session.getAttribute("rideTime");
    String seat_type = (String) session.getAttribute("seatType");

    String repeat_transfer = (String) session.getAttribute("repeat_transfer");
    session.removeAttribute("repeat_transfer");
%>

<%--重复购票的反应--%>
<%
    if (repeat_transfer!=null){
        if (repeat_transfer.equals("yes")){
%>
<script>
    alert("不能重复购买同一车次的票sorry！");
</script>
<%
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

         <%--! 正文 --%>
<%--第一部分-车站确认--%>
<%--出发城市和目的地的选择--%>
<div id="selectCity">
    出发地
    <select id="start" class="shortselect">
        <%
            for (int i=0;i<cities.size();i++){
                City city = cities.get(i);
                String name = city.getName();
        %>
        <option value="<%=i%>"><%=name%></option>
        <%
            }
        %>
    </select>
    目的地
    <select id="end" class="shortselect">
        <%
            for (int i=0;i<cities.size();i++){
                City city = cities.get(i);
                String name = city.getName();
        %>
        <option value="volvo"><%=name%></option>
        <%
            }
        %>
    </select>
    乘车日期
    <select id="time" class="shortselect">
        <option value="volvo">2020.10.10</option>
        <option value="saab">2020.10.11</option>
        <option value="opel">2020.10.12</option>
        <option value="audi">2020.10.13</option>
    </select>
    购票等级选择
    <select id="ticket_grade" class="shortselect">
        <option value="a">一等座</option>
        <option value="b">二等座</option>
        <option value="c">三等座</option>
    </select>

    <form id="submit_form" style="margin-top: 5px" action="http://localhost:8080/TrainTicketingSystem/GetTrainTransferServlet" method="post">
        <input type="button" value="查询" class="submit-button" style="margin-left: 130px;" onclick="check_before()">
        <input type="text" name="startStation" value="" style="display: none" id="startStation">
        <input type="text" name="endStation" value="" style="display: none" id="endStation">
        <input type="text" name="ride_time" value="" style="display: none" id="ride_time_real">
        <input type="text" name="ticket_type" value="" style="display: none" id="seat_type">
    </form>
</div>

<%--2.换乘信息显示--%>

<%--没有一次换乘的火车--%>
<div id="sorry_noTickets" style="display: none">
    <p style="font-size: 18px;font-weight: bolder;font-family: 宋体;color: #666666">很抱歉，未查到从<%=start_station%>到<%=end_station%>换乘一次的列车余票。</p>
</div>
<div id="showTrains">
    <%
        if (transferMessages==null||transferMessages.size()==0){
            if (start_station!=null&&end_station!=null){
            %>

    <script>
        /**
         * 显示的id必须在该语句之前定义否则无法显示
         * @type {string}
         */
        document.getElementById("sorry_noTickets").style.display = "block";
    </script>

    <%}
        }else {
            %>
    <script>
        document.getElementById("sorry_noTickets").style.display = "none"
        document.getElementById("buy_grade").style.display = "block"
    </script>
    <table class="bordered2">
        <div class="mr5" style="text-align: center">
            换乘信息
        </div>
        <div style="border-style:solid;border-width:1px;border-color: #3151A2">
    <%
            for(int i = 0; i < transferMessages.size(); i++) {
                TransferMessage message = transferMessages.get(i);
                %>
        <tr>
            <td><font style="font-family: 宋体;font-size: x-large;font-weight: bolder" id="values_start_station<%=i%>"><%=message.getStart_station_name()%></font>  <font style="font-size: xx-small" id="values_start_time1<%=i%>"><%=message.getA_start_time()%></font>开</td>
            <td>️➡️<font id="values_start_train_id<%=i%>" style="font-size: large"><%=message.getA_train_id()%></font>➡️</td>
            <td><font style="font-size: xx-small" id="values_end_time1<%=i%>"><%=message.getA_end_time()%></font>到 <font style="font-family: 宋体;font-size: x-large;font-weight: bolder;color: #d5982d" id="values_transfer_station<%=i%>"><%=message.getTransfer_station_name()%></font> <font style="font-size: xx-small" id="values_start_time2<%=i%>"><%=message.getB_start_time()%></font>开</td>
            <td>➡️<font id="values_end_train_id<%=i%>" style="font-size: large"><%=message.getB_train_id()%></font>➡️</td>
            <td><font style="font-size: xx-small" id="values_end_time2<%=i%>"><%=message.getB_end_time()%></font>到  <font style="font-family: 宋体;font-size: x-large;font-weight: bolder" id="values_end_station<%=i%>"><%=message.getEnd_station_name()%></font></td>
            <td><input type="button" class="submit-button" style="font-size: 10px" value="预定" onclick="buy_ticket(<%=i%>)"></td>
        </tr>
        <%
            }
        }
    %>
        </div>
    </table>
</div>

<%--换乘的信息--%>
<form style="display: none" action="http://localhost:8080/TrainTicketingSystem/GenerateTransferTicketServlet" method="post" id="transfer_ticket_message">
    <input type="text" name="ride_time" value="<%=ride_time_real%>" id="ride_time">
    <input type="text" name="seat_grade" value="<%=seat_type%>" id="seat_grade">
    <input type="text" name="start_station" value="" id="start_station">
    <input type="text" name="transfer_station" value="" id="transfer_station">
    <input type="text" name="end_station" value="" id="end_station">
    <input type="text" name="start_train_id" value="" id="start_train_id">
    <input type="text" name="end_train_id" value="" id="end_train_id">
    <input type="text" name="start_time1" value="" id="start_time1">
    <input type="text" name="end_time1" value="" id="end_time1">
    <input type="text" name="start_time2" value="" id="start_time2">
    <input type="text" name="end_time2" value="" id="end_time2">

    <input type="text" name="IDNumber" value="<%=GetPeople.getIDNumber(namePeople)%>" id="">
</form>



<%--!底部信息--%>
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

<%--js逻辑区--%>
<script>
    /*
    获取select中的值的方法
     */
    function check_before() {

        var  myselect=document.getElementById("start");
        var index=myselect.selectedIndex;
        var city1 = myselect.options[index].text;

        var  myselect2=document.getElementById("end");
        var index2=myselect2.selectedIndex;
        var city2 = myselect2.options[index2].text;


        if (index==index2){
            alert("始发站和终点站不能相同！请重新选择")
        }else {

            var  myselect3=document.getElementById("time");
            var index3=myselect3.selectedIndex;
            var ride_time = myselect3.options[index3].text;

            //获得车座等级
            //获取下拉框的文本内容
            var  myselect4=document.getElementById("ticket_grade");
            var index4=myselect4.selectedIndex;
            var seat_grade = myselect4.options[index4].text;

            if (seat_grade=='一等座'){
                document.getElementById("seat_type").value = 1;
            }else if (seat_grade=='二等座'){
                document.getElementById("seat_type").value = 2;
            }else {
                document.getElementById("seat_type").value = 3;
            }

            document.getElementById("startStation").value = city1;
            document.getElementById("endStation").value = city2;
            document.getElementById("ride_time_real").value = ride_time;

            // alert(ride_time)

            document.getElementById("submit_form").submit();
        }

    }
</script>

<script>
    function buy_ticket(i) {
        <%
        if (namePeople!=null&&!namePeople.equals("null")){
            %>
        var index = i;
        var start_station = document.getElementById("values_start_station"+index).innerText;
        var start_time1 = document.getElementById("values_start_time1"+index).innerText;
        var start_train_id = document.getElementById("values_start_train_id"+index).innerText;
        var end_time1 = document.getElementById("values_end_time1"+index).innerText;
        var transfer_station = document.getElementById("values_transfer_station"+index).innerText;
        var start_time2 = document.getElementById("values_start_time2"+index).innerText;
        var end_train_id = document.getElementById("values_end_train_id"+index).innerText;
        var end_time2 = document.getElementById("values_end_time2"+index).innerText;
        var end_station = document.getElementById("values_end_station"+index).innerText;



        document.getElementById("start_station").value = start_station;
        document.getElementById("transfer_station").value = transfer_station;
        document.getElementById("end_station").value = end_station;
        document.getElementById("start_train_id").value = start_train_id;
        document.getElementById("end_train_id").value = end_train_id;
        document.getElementById("start_time1").value = start_time1;
        document.getElementById("end_time1").value = end_time1;
        document.getElementById("start_time2").value = start_time2;
        document.getElementById("end_time2").value = end_time2;


        document.getElementById("transfer_ticket_message").submit();

        <%
        }
        else {
            %>
        alert("请先登录！！！");
        <%
        }
        %>
    }
</script>

</body>
</html>
