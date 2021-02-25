<%@ page import="java.util.ArrayList" %>
<%@ page import="com.fxk.entity.Ticket" %>
<%@ page import="com.fxk.dao.GetPeople" %><%--
  Created by IntelliJ IDEA.
  User: yuanbao
  Date: 2020/9/27
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>

<%--

个人中心：负责改签和退票
退票+ride_time

--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>个人中心👤</title>

    <link rel="stylesheet" href="css/headerLogo.css" type="text/css">

    <link rel="stylesheet" href="css/footerFile.css" type="text/css">
    <link rel="stylesheet" href="css/tableBeautiful.css" type="text/css">

    <script src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>
    <style>
        a{
            cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
            color: #005cb1;
        }
        a:link{
            color:red
        }
        a:visited{

            color:orange

        }
        a:hover{

            color:green;

        }
        a:active{

            color:black;

        }
        .toubu{
            margin-top: 50px;
            max-width: 780px;
            float: right;
            position: relative;
        }
        #noOrders{
            left: 30%;
            top:20%;
            position: absolute;
        }
        #haveOrder{
            left: 20%;
            top:20%;
            position: absolute;
        }

        .submit-button { /* 按钮美化 */
            width: 70px; /* 宽度 */
            height: 40px; /* 高度 */
            border-width: 0; /* 边框宽度 */
            border-radius: 3px; /* 边框半径 */
            background: #1E90FF; /* 背景颜色 */
            cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
            outline: none; /* 不显示轮廓线 */
            font-family: Microsoft YaHei, serif; /* 设置字体 */
            color: white; /* 字体颜色 */
            font-size: 17px; /* 字体大小 */
        }
        .submit-button:hover { /* 鼠标移入按钮范围时改变颜色 */
            background: #5599FF;
        }
        #changeTicket{
            left: 40%;
            top:40%;
            position: absolute;
        }
        /*冷冻div使其无法被点击*/
        .disable {
            pointer-events: none;
        }
    </style>
</head>
<body>

<%
    String namePeople = (String) session.getAttribute("namePeople");

    ArrayList<Ticket> orders = (ArrayList<Ticket>) session.getAttribute("orders");
    System.out.println(orders.size());

    int user_id = GetPeople.getUserId(namePeople);

    String successful = (String) session.getAttribute("successful_refund");

    String successfulChangeTime = (String) session.getAttribute("successfulChangeTime");

    String ride_time_static = "";

    String IDNumber = GetPeople.getIDNumber(namePeople);

%>

<%
    if (successful!=null&&successful.equals("OK")){
        %>
<script>
    alert("退票成功！")
    <%
    if (successful!=null){
        successful="";
        request.getSession(true).setAttribute("successful_refund",successful);
    }
    %>
</script>
<%

        System.out.println("successful2:"+successful);

    }
%>
<input type="text" value="" id="changeTicket_return" style="display: none">
<script>
    document.getElementById("changeTicket_return").value = <%=successfulChangeTime%>
    var value_return = document.getElementById("changeTicket_return").value;//什么都没有但不是null

    if (value_return!=""){
        if (value_return === 'OK'){
            alert("改签成功！")
        }else {
            alert("改签失败！")
        }
        document.getElementById("changeTicket_return").value = "";
    }else {

    }
</script>


<!--1.头部-->
<div class="top_bg" id="top_bg">
    <div class="top_line">
    </div>
    <div class="top_main">

        <!--网站logo-->
        <div class="top_logo">
            <a><img src="images/logo2.png"></a>
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


<%--2.正文--%>
<%--显示用户订单--%>
<%
    if (orders!=null&&orders.size()!=0){
        %>
<div id="haveOrder">
<table class="bordered">
    <p style="font-size: x-large;font-family: 宋体;font-weight: bold;">您的订单🚄：<a onclick="shouye()">返回首页</a></p>
    <tr>
        <th>火车号</th>
        <th>始发站</th>
        <th>终点站</th>
        <th>车厢</th>
        <th>车座等级</th>
        <th>车座位置</th>
        <th>出行时间</th>
        <th>始发站发车时间</th>
        <th>终点站到达时间</th>
        <th>车票价格</th>
        <th>下单时间</th>
        <th></th>
        <th></th>
    </tr>
<%
       for(int i = 0; i < orders.size(); i++) {
            Ticket temp = orders.get(i);
            String train_id = temp.getTrain_id();
            String start_station_name = temp.getStart_station_name();
            String end_station_name = temp.getEnd_station_name();
            int seat_grade = temp.getSeat_grade();
            int carriage = temp.getCarriage();
            String seat_location = temp.getSeat_location();
            String ride_time = temp.getRide_time();

            if (i==0){
                ride_time_static=ride_time;
            }

            String start_time = temp.getStart_time();
            String end_time = temp.getEnd_time();
            double price = temp.getPrice();
            String orderTime = temp.getOrderTime();

            int ticket_id = temp.getTicket_id();

       %>
    <tr>
        <td id="tds<%=i%>" style="display: none"><%=ticket_id%></td>
        <td id="tdss<%=i%>"><%=train_id%></td>
        <td id="generate<%=i%>"><%=start_station_name%></td>
        <td id="generates<%=i%>"><%=end_station_name%></td>
        <td id="tdsss<%=i%>"><%=carriage%></td>
        <td id="generatess<%=i%>"><%=seat_grade%></td>
        <td id="tdssss<%=i%>"><%=seat_location%></td>
        <td id="tdsssss<%=i%>"><%=ride_time%></td>
        <td><%=start_time%></td>
        <td><%=end_time%></td>
        <td><%=price%></td>
        <td><%=orderTime%></td>
        <td><input value="退票" type="button" class="submit-button" style="font-size: 10px" onclick="refund(<%=i%>)"></td>
        <td><input id="changeTicket_2" value="改签" type="button" class="submit-button" style="font-size: 10px" onclick="changeTicket(<%=i%>)"></td>
    </tr>
<%
}
       %>
</table>
</div>
    <%
    }else {
        %>
<%--你尚无订单！--%>
<div style="display:none" id="noOrders">
    <p>您尚无订单！</p>
    <p><a onclick="goBuy()">去购票</a></p>
</div>
<script>
    document.getElementById("noOrders").style.display = "block";
</script>
<%
    }
%>

<%--选择改签的形式--%>
<div style="display: none;" id="changeTicket">
    <p style="font-weight: bold;font-family: 宋体;font-size: large;margin-bottom: 20px;font-size: 12px">请选择您的改签方式:</p>
    <button onclick="changeLocation()" value="" class="submit-button" style="margin-left: 20px;font-size: 12px">改变位置</button>
    <button onclick="changeTime()" value="" class="submit-button" style="margin-left: 20px;font-size: 12px">改变时间</button>
    <button onclick="cancelChange()" id="cancelChange" class="submit-button" style="margin-left: 20px;font-size: 12px">取消</button>
</div>

<%--退票所需信息--%>
<form id="submitForm1" style="display: none" action="http://localhost:8080/TrainTicketingSystem/RefundServlet" method="post">
    <input type="text" id="ticket_id" name="ticket_id" value="">
    <input type="text" id="train_id" name="train_id" value="">
    <input type="text" id="train_carriage" name="train_carriage" value="">
    <input type="text" id="train_location" name="train_location" value="">
    <input type="text" id="user_id" name="user_id" value="<%=user_id%>">
    <input type="text" id="user_name" name="user_name" value="<%=namePeople%>">
    <input type="text" id="ride_time" name="ride_time" value="">
</form>
<%--转到购票页面--%>
<form id="submitForm2" action="http://localhost:8080/TrainTicketingSystem/GetCitiesServlet" method="post" style="display: none">
    <input type="text" name="namePeople" value="<%=namePeople%>">
    <input type="text" name="Type_ticket" value="dancheng">
</form>
<%--转到首页--%>
<form id="submitForm_1" action="http://localhost:8080/TrainTicketingSystem/MessageServlet" method="post" style="display: none">
    <input type="text" name="namePeople" value="<%=namePeople%>">
    <input type="text" name="fangshi" value="shouye">
</form>

<%--改签时间所需信息--%>
<form id="submitForm3" action="http://localhost:8080/TrainTicketingSystem/ChangeTicketServlet" method="post" style="display:none;">
    <input type="text" name="ride_time_change" value="" id="ride_time_change_js"><!--更改的时间-->
    <input type="text" id="ticket_id2" name="ticket_id" value="">
    <input type="text" id="train_id2" name="train_id" value="">
    <input type="text" id="train_carriage2" name="train_carriage" value="">
    <input type="text" id="train_location2" name="train_location" value="">
    <input type="text" id="user_id2" name="user_id" value="<%=user_id%>">
    <input type="text" id="user_name2" name="user_name" value="<%=namePeople%>">
    <input type="text" id="ride_time2" name="ride_time" value="">

    <input type="text" id="start_station_name2" name="start_station_name" value="">
    <input type="text" id="end_station_name2" name="end_station_name" value="">
    <input type="text" id="seat_grade2" name="seat_grade" value="">

    <input type="text" name="changeWhat" value="time">
</form>

<%--更改位置所需信息--%>
<form id="submitForm4" action="http://localhost:8080/TrainTicketingSystem/Change_location.jsp" method="post" style="display: none">
    <input type="text" id="location_ticket_id" name="ticket_id" value="">
    <input type="text" id="location_train_id" name="train_id" value="">
    <input type="text" id="location_ride_time" name="location_ride_time" value="">
    <input type="text" id="location_carriage_old" name="carriage_old" value="">
    <input type="text" id="location_location_old" name="location_old" value="">

    <input type="text" id="location_type" name="location_type" value="">
    <input type="text" name="IDNumber_people" value="<%=IDNumber%>">
</form>
<script>
    function goBuy() {
        document.getElementById("submitForm2").submit();
    }
</script>
<script>
    function shouye() {
        document.getElementById("submitForm_1").submit();
    }
</script>

<%--退票--%>
<script>
    function refund(index) {

        if (confirm("您确认退票吗？")) {

            var ticket_id = document.getElementById("tds"+index).innerText;
            var train_id = document.getElementById("tdss"+index).innerText;
            var train_carriage = document.getElementById("tdsss"+index).innerText;
            var train_location = document.getElementById("tdssss"+index).innerText;
            var ride_time = document.getElementById("tdsssss"+index).innerText;

            document.getElementById("ticket_id").value = ticket_id;
            document.getElementById("train_id").value = train_id;
            document.getElementById("train_carriage").value = train_carriage;
            document.getElementById("train_location").value = train_location;
            document.getElementById("ride_time").value = ride_time;

            document.getElementById("submitForm1").submit();

        } else {

        }

    }
</script>

<%--获得订单序号--%>
<input style="display: none" type="text" value="" id="changeTicket_index">
<script>
    function changeTicket(index) {

        document.getElementById("changeTicket").style.display = "block";

        document.getElementById("changeTicket_index").value = index;

    }
</script>
<script>
    function cancelChange() {

        document.getElementById("changeTicket").style.display = "none";

        $("#haveOrder").removeClass("disable");

    }
</script>
<%--改签更改出行时间--%>
<input style="display: none" type="text" value="<%=ride_time_static%>" id="ride_time_static"></input>
<script>
    function changeTime() {
        var txt;
        var time = prompt("请输入改签的时间：", "请在2020.10.10～2020.10.13中选择");

        var ride_time = document.getElementById("ride_time_static").value;

        if (time==ride_time){
            alert("您的车票就是这个时间！请重新选择");
        }else {
            if (time=="2020.10.10" || time=="2020.10.11" || time=="2020.10.12" || time=="2020.10.13") {
                txt=time;
            } else {
                txt="";
            }

            if (txt!=""){
                document.getElementById("ride_time_change_js").value = txt;

                var index = document.getElementById("changeTicket_index").value;

                var ticket_id = document.getElementById("tds"+index).innerText;
                var train_id = document.getElementById("tdss"+index).innerText;
                var train_carriage = document.getElementById("tdsss"+index).innerText;
                var train_location = document.getElementById("tdssss"+index).innerText;
                var ride_time = document.getElementById("tdsssss"+index).innerText;
                var start_station_name = document.getElementById("generate"+index).innerText;
                var end_station_name = document.getElementById("generates"+index).innerText;
                var seat_grade = document.getElementById("generatess"+index).innerText;

                document.getElementById("ticket_id2").value = ticket_id;
                document.getElementById("train_id2").value = train_id;
                document.getElementById("train_carriage2").value = train_carriage;
                document.getElementById("train_location2").value = train_location;
                document.getElementById("ride_time2").value = ride_time;
                document.getElementById("start_station_name2").value = start_station_name;
                document.getElementById("end_station_name2").value = end_station_name;
                document.getElementById("seat_grade2").value = seat_grade;

                document.getElementById("submitForm3").submit();

            }else {
                alert("您的输入的格式错误！请重新输入")
            }

        }
    }
</script>

<%--改签更改车票的位置--%>
<input style="display: none">
<script>
    function changeLocation() {

        //获得订单序号
        var index = document.getElementById("changeTicket_index").value;

        var ticket_id = document.getElementById("tds"+index).innerText;
        var train_id = document.getElementById("tdss"+index).innerText;
        var train_carriage = document.getElementById("tdsss"+index).innerText;
        var train_location = document.getElementById("tdssss"+index).innerText;
        var ride_time = document.getElementById("tdsssss"+index).innerText;
        var seat_grade = document.getElementById("generatess"+index).innerText;

        document.getElementById("location_ticket_id").value = ticket_id;
        document.getElementById("location_train_id").value = train_id;
        document.getElementById("location_carriage_old").value = train_carriage;
        document.getElementById("location_location_old").value = train_location;
        document.getElementById("location_ride_time").value = ride_time;
        document.getElementById("location_type").value = seat_grade;


        document.getElementById("submitForm4").submit();

    }
</script>
<script>
    $("#changeTicket_2").click(function () {
        $("#haveOrder").addClass("disable")
    })
</script>






<%--3.尾部--%>
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
