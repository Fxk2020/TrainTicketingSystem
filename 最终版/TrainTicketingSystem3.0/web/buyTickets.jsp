<%@ page import="java.util.ArrayList" %>
<%@ page import="com.fxk.entity.City" %>
<%@ page import="com.fxk.entity.Train" %><%--
  Created by IntelliJ IDEA.
  User: yuanbao
  Date: 2020/9/8
  Time: 20:29
  To change this template use File | Settings | File Templates.
--%>

<%--
@buyTickets:
选中车座准备付款
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"   pageEncoding="UTF-8" %>
<html>
<head>
    <title>购票</title>
    <link rel="stylesheet" href="css/headerLogo.css" type="text/css">

    <link rel="stylesheet" href="css/footerFile.css" type="text/css">

    <link rel="stylesheet" href="css/tableBeautiful.css" type="text/css">

    <script src="/js/jquery-1.11.0.min.js"></script>


    <style type="text/css">
        #selectCity{

            left: 30%;
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

        .toubu{
            margin-top: 50px;
            max-width: 780px;
            float: right;
            position: relative;
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

    ArrayList<Train> trains = (ArrayList<Train>) session.getAttribute("trains");

    String namePeople = (String) session.getAttribute("namePeople");

    String ride_time = (String) session.getAttribute("ride_time");

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

//出发城市和目的地的选择
<div id="selectCity">
    出发城市
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
    出行时间
    <select id="time" class="shortselect">
        <option value="volvo">2020.10.10</option>
        <option value="saab">2020.10.11</option>
        <option value="opel">2020.10.12</option>
        <option value="audi">2020.10.13</option>
    </select>

    <form id="submit_form" style="margin-top: 5px" action="http://localhost:8080/TrainTicketingSystem/GetTrainServlet" method="post">
        <input type="radio" name="status" value="0">普通
        <br>
        <input type="radio" name="status" value="1" checked>学生
        <br>
        <input type="button" value="查询" class="submit-button" style="margin-top: 15px" onclick="check_before()">
        <input type="text" name="startStation" value="" style="display: none" id="startStation">
        <input type="text" name="endStation" value="" style="display: none" id="endStation">
        <input type="text" name="ride_time" value="" style="display: none" id="ride_time_js">
    </form>
</div>

<div id="showTrain">
    <%
        if (trains!=null){

            if (trains.size()==0){
                %>
    <p>您可使用<a style="color:blue" href="http://localhost:8080/TrainTicketingSystem/Transfer.jsp">接续换乘</a>功能，查询途中换乘一次的部分列车余票情况。</p>
    <%
            }else {

            %>
    <table class="bordered">
        <thead style="text-align: center"><font style="font-weight: bolder;font-size: x-large;margin-bottom: 15px">查询结果:</font></thead>
        <tr>
            <th>火车号</th>
            <th>始发站</th>
            <th>终点站</th>
            <th>一等座</th>
            <th>二等座</th>
            <th>三等座</th>
            <th></th>
            <th></th>
            <th></th>
        </tr>
    <%
            for (int i=0;i<trains.size();i++){
                String trainType = trains.get(i).getTrainType();

                String startStation = trains.get(i).getStartStation();
                String endStation = trains.get(i).getEndStation();

                String seat1 = trains.get(i).getSeat1();
                String seat2 = trains.get(i).getSeat2();
                String seat3 = trains.get(i).getSeat3();
                %>
        <tr>
            <td id="tds<%=i%>"><%=trainType%></td>
            <td id="tdss<%=i%>"><%=startStation%></td>
            <td id="tdsss<%=i%>"><%=endStation%></td>
            <td><%=seat1%></td>
            <td><%=seat2%></td>
            <td><%=seat3%></td>

            <%
                if (check_have(seat1)){
                    %>
            <td><input type="button" value="一等座购票" class="submit-button" style="font-size: 10px" onclick="buyFirst(<%=i%>,'一等座')"></td>
            <%
                }
                else {
                    %>
            <td></td>
            <%
                }
            %>

            <%
                if (check_have(seat2)){
            %>
            <td><input type="button" value="二等座购票" class="submit-button" style="font-size: 10px" onclick="buyFirst(<%=i%>,'二等座')"></td>
            <%
                }
                else {
            %>
            <td></td>
            <%
                }
            %>

            <%
                if (check_have(seat3)){
            %>
            <td><input type="button" value="三等座购票" class="submit-button" style="font-size: 10px" onclick="buyFirst(<%=i%>,'三等座')"></td>
            <%
                }
                else {
            %>
            <td></td>
            <%
                }
            %>



        </tr>
    <%
            }}
        }
    %>
    </table>
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

<%--版权所有--%>
<div class="footer-txt">
    <span style="color: #FFFAF0">版权所有©山东大学-软件学院</span>
    <span style="color: #FFFAF0" id="timeNow"></span>
    <img src="images/top_tel.png"><span style="color: #FFFAF0">创作者：小傅</span>
</div>

<%--用以传输js的值 火车票的有关信息--%>
<form action="http://localhost:8080/TrainTicketingSystem/Session_message" style="display: none" id="budeyi" method="post">
    <input type="text" name="trainType" value="" id="trainType_js">
    <input type="text" name="start_station_name" value="" id="start_station_name_js">
    <input type="text" name="end_station_name" value="" id="end_station_name_js">

    <input type="text" name="realName" value="<%=namePeople%>">
    <input type="text" name="seat_grade" value="" id="seat_grade_js">
    <input type="text" name="ride_time2" value="<%=ride_time%>">
</form>

<script>
    /*
    获取select中的值的方法
     */
    function check_before() {

        //获取下拉框的文本内容
        var  myselect=document.getElementById("start");
        var index=myselect.selectedIndex;
        var city1 = myselect.options[index].text;

        var  myselect2=document.getElementById("end");
        var index2=myselect2.selectedIndex;
        var city2 = myselect2.options[index2].text;

        var  myselect=document.getElementById("time");
        var myindex=myselect.selectedIndex;
        var ride_time = myselect.options[myindex].text;

        if (index==index2){
            alert("始发站和终点站不能相同！请重新选择")
        }else {
            document.getElementById("startStation").value = city1;
            document.getElementById("endStation").value = city2;
            document.getElementById("ride_time_js").value = ride_time;

            document.getElementById("submit_form").submit();
        }

    }
</script>
<script>

    /*

     */
    function buyFirst(i,grade) {

        <%
        if (namePeople!=null&&!namePeople.equals("null")){
            %>
        var index = i;

        var trainType_js = document.getElementById("tds"+index).innerText;
        var start_station_name = document.getElementById("tdss"+index).innerText;
        var end_station_name = document.getElementById("tdsss"+index).innerText;

        document.getElementById("trainType_js").value = trainType_js;
        document.getElementById("start_station_name_js").value = start_station_name;
        document.getElementById("end_station_name_js").value = end_station_name;

        if (grade=='一等座'){
            // alert("一等座");
            document.getElementById("seat_grade_js").value = 1;
        }else if (grade=='二等座'){
            // alert("二等座");
            document.getElementById("seat_grade_js").value = 2;
        }else {
            // alert("三等座");
            document.getElementById("seat_grade_js").value = 3;
        }
        document.getElementById("budeyi").submit();

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
<%!
    private boolean check_have(String seat1) {

        if (seat1.equals("有余票")){
            return true;
        }else {
            return false;
        }

    }
%>