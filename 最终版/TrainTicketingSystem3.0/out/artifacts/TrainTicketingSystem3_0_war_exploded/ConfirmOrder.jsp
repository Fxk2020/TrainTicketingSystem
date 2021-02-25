<%@ page import="java.util.ArrayList" %>
<%@ page import="com.fxk.dao.GetPeople" %>
<%@ page import="com.fxk.entity.User" %>
<%@ page import="com.fxk.dao.GenerateTicket" %>
<%@ page import="com.fxk.entity.Seat" %>
<%@ page import="com.fxk.dao.SelectSeat" %>
<%--
  Created by IntelliJ IDEA.
  User: yuanbao
  Date: 2020/9/20
  Time: 16:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>确认订单</title>

    <link rel="stylesheet" href="css/headerLogo.css" type="text/css">

    <link rel="stylesheet" href="css/footerFile.css" type="text/css">

    <link rel="stylesheet" href="css/tableBeautiful.css" type="text/css">

    <script src="js/jquery-1.11.0.min.js"type="text/javascript"></script>

    <style type="text/css">
        input.inputLine{
            width:226px;
            padding: .375rem .75rem;
            border-radius: .25rem;
            border: 1px solid #ced4da;
        }
        input.inputLine:focus{
            border-style:solid;
            border-color: #03a9f4;
            box-shadow: 0 0 5px #03a9f4;
        }
        input.inputLeft{
            width:130px;
        }
        .toubu{
            margin-top: 50px;
            max-width: 780px;
            float: right;
            position: relative;
        }
        .layout_train{
            width:1060px;
            font-size:14px;
            line-height:25px;
            overflow:hidden;
            left: 20%;
            top:25%;
            position: absolute;
            /*border-style:solid;  显示div的边框*/
            /*border-width:1px;*/
        }
        .layout_people{
            width:1060px;
            height: 45%;
            font-size:14px;
            line-height:25px;
            overflow:auto;/* 出现滚动条 */
            left: 20%;
            top:40%;
            position: absolute;
            padding-bottom: 40px;
            /*background-color: #3151A2;*/
        }
        #ticket_display{
            width: 20%;
            max-height: 500px;
            left: 40%;
            top: 20%;
            overflow:auto;
            position: absolute;
            padding-bottom: 40px;
            background-color: wheat;
        }
        .ml5{
            margin-left: 50px;
            font-size: 25px;
            font-family: "Arial Black";
        }
        .mr5{
            padding-left: 20px;
            font-size: 18px;
            font-family: 宋体;
            color: white;
            background: #2887CA;
            padding-top: 5px;padding-bottom: 5px;
            border-radius: 8px;/*圆角效果*/
        }
        .name_checkbox{

        }
        /* 按钮美化 */
        .submit_ordering2{
            width: fit-content; /* 宽度 */
            height: fit-content; /* 高度 */
            border-width: 0px; /* 边框宽度 */
            border-radius: 7px; /* 边框半径 */
            background: #1E90FF; /* 背景颜色 */
            cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
            outline: none; /* 不显示轮廓线 */
            font-family: Microsoft YaHei; /* 设置字体 */
            color: white; /* 字体颜色 */
            font-size: 17px; /* 字体大小 */
        }
        .submit_ordering2:hover { /* 鼠标移入按钮范围时改变颜色 */
            background: #d5982d;
        }
        #submit_ordering{
            display:block;
            margin:0 auto
        }

        /*冷冻div使其无法被点击*/
        .disable {
            pointer-events: none;
        }
        #addFriendDiv{
            width: 20%;
            max-height: 500px;
            left: 40%;
            top: 20%;
            overflow:auto;
            position: absolute;
            padding-bottom: 40px;
            background-color: wheat;
            text-align: center;

            display: none;
        }
    </style>

</head>
<body>

<%
    String train_id = (String) request.getSession(true).getAttribute("trainType");
    String start_station_name = (String) request.getSession(true).getAttribute("start_station_name");
    String end_station_name = (String) request.getSession(true).getAttribute("end_station_name");
    String ride_time = (String) request.getSession(true).getAttribute("ride_time");

    int seat_grade = (int) request.getSession(true).getAttribute("seat_grade");
    String namePeople = (String) request.getSession(true).getAttribute("realName");

    ArrayList<String> names_buy = GetPeople.getPeople(namePeople);

    ArrayList<User> users = (ArrayList<User>) request.getSession(true).getAttribute("users");//获取关联顾客的详细信息


    String seat_type = "";
    if (seat_grade==1){
        seat_type="一等座";
    }else if (seat_grade==2){
        seat_type="二等座";
    }else {
        seat_type="三等座";
    }

    ArrayList<Seat> seats = SelectSeat.selectSeat_byTrain_id(train_id,seat_type,ride_time);//获取空座位

    String repeat_ticket = (String) request.getSession(true).getAttribute("repeat_ticket");//是否重复购票
    session.removeAttribute("repeat_ticket");

    String  result = (String) session.getAttribute("results");
    session.removeAttribute("results");
%>

<%--重复购票的反应--%>
<%
    if (repeat_ticket!=null){
        if (repeat_ticket.equals("yes")){

            %>
<script>
    alert("不能重复购买同一车次的票sorry！");
    location.reload();//自动刷新页面，使session的值能够更新
</script>
<%


    }

    }
    %>

<%--添加朋友的返回结果   系统中并不存在这位用户--%>
<%
    if (result!=null){
        int results = Integer.parseInt(result);
        if (results==0){
%>
<script>
    alert("系统中并不存在这位用户！");
    location.reload();//自动刷新页面，使session的值能够更新
</script>
<%
}else if (results==-1){
%>
<script>
    alert("你早已添加过这位朋友了！");
    location.reload();//自动刷新页面，使session的值能够更新
</script>
<%
}else if (results==1){
%>
<script>
    alert("您已经成功添加朋友快去购票吧！");
    location.reload();//自动刷新页面，使session的值能够更新
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

<%--游客身份还是用户--%>
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

<%--页面主体开始--%>
<%--1.列车信息确认--%>
<div class="layout_train" style="">
    <div class="mr5" style="">
        列车信息
    </div>
    <div style="border-style:solid;border-width:1px;border-color: #3151A2">
        <p>
        <strong class="ml5"><%=ride_time%>        </strong><strong class="ml5"><%=train_id%></strong>次             <strong class="ml5"><%=start_station_name%>                <strong class="ml5">➡️</strong></strong><strong class="ml5"><%=end_station_name%></strong>
        </p>
    </div>
</div>

<%--2.乘客信息确认--%>
<div class="layout_people" style="padding-left: 15px;" id="people_informations">

    <div class="mr5">
        乘客信息<span class="small" id="psInfo">（填写说明）</span>
    </div>

<%--    2.1添加乘车人   --%>
    <div  style="border-style:solid;border-width:1px;border-color: #3151A2" >
    <div>
        <p style="font-size: medium;font-weight: bold">👤乘车人</p>
        <input class="name_checkbox" type="checkbox" name="name_buy_ticket" value="<%=namePeople%>"><%=namePeople%>
        <%
            for (int i = 0; i < names_buy.size(); i++) {
                String name_purchase = names_buy.get(i);
                %>
        <input class="name_checkbox" type="checkbox" name="name_buy_ticket" value="<%=name_purchase%>"><%=name_purchase%>
        <%
            }
        %>
        <input type="button" value="确认" id="confirm" class="submit_ordering2">
        <input type="button" value="添加新朋友" id="addFriend" class="submit_ordering2">
    </div>
    <DIV style="BORDER-TOP: #00686b 1px dashed; OVERFLOW: hidden; HEIGHT: 1px;margin: 8px"></DIV><%-- 分割线  --%>
<%--  2.2确认车票的信息  --%>
    <div>
        <table class="bordered" id="people_buyTicket">
            <tr>
                <th>票种</th>
                <th>席别</th>
                <th>票价</th>
                <th>姓名</th>
                <th>证件类型</th>
                <th>证件号码</th>
            </tr>
            <%
                if (users!=null){
                    for (int i = 0; i < users.size(); i++) {
                        User user = users.get(i);
                        String stu = "";
                        if (user.getStuStatus()==1){
                            stu="学生票";
                        }else {
                            stu="普通票";
                        }
                        String name = user.getName();
                        String IDNumber = user.getIDNumber();
                        double price = GenerateTicket.getPrice(train_id,start_station_name,end_station_name,seat_grade,user.getStuStatus());
                        %>
            <tr>
                <td><%=stu%></td>
                <td><%=seat_type%></td>
                <td><%=price%></td>
                <td><%=name%></td>
                <td>身份证</td>
                <td><%=IDNumber%></td>
            </tr>
            <%
                    }
                }
            %>
        </table>
    </div>
    </div>

<%--    提交订单 --%>
    <div style="margin: 10px">
        <input type="button" value="提交订单" id="submit_ordering" class="submit_ordering2">
    </div>

    </div>

</div>
<%--隐藏的form提交到servlet 该顾客的关联用户--%>
<div style="display: none" >
    <form action="http://localhost:8080/TrainTicketingSystem/GetUsersTicketServlet" method="post" id="submit_form2">
        <input value="" name="names" type="text" id="names_js">
    </form>
</div>

<%--隐藏的ticket信息提交到servlet--%>
<div style="display: none">
    <form action="http://localhost:8080/TrainTicketingSystem/GenerateTicketServlet" method="post" id="submit_form3">
        <input type="text" name="trainType" value="<%=train_id%>">
        <input type="text" name="start_station_name" value="<%=start_station_name%>">
        <input type="text" name="end_station_name" value="<%=end_station_name%>">
        <input type="text" name="ride_time" value="<%=ride_time%>">
        <input type="text" name="seat_grade" value="<%=seat_grade%>">
        <input type="text" name="carriage" value="" id="carriage_js">
        <input type="text" name="location" value="" id="location_js">
    </form>
</div>


<%--确认座位的隐藏div--%>
<div id="ticket_display" style="display: none">
    <table class="bordered" id="seat_left">
        <tr>
            <th>车厢</th>
            <th>位置</th>
            <th>选择</th>
        </tr>
    <%
        if (seats!=null){
            for (int i = 0; i < seats.size(); i++) {
                Seat seat = seats.get(i);
                int carriage = seat.getCarriage();
                String location = seat.getSeat_location();
                %>
        <tr>
            <td id="tds<%=i%>"><%=carriage%></td>
            <td id="tdss<%=i%>"><%=location%></td>
            <td><input type="checkbox" value="<%=i%>" name="checkboxName" class="checkboxStyle"></td>
        </tr>
<%
            }
        }else {
            %>

    <script>
        alert("票已售完！！！");
    </script>

    <%
        }
    %>
    </table>


    <p>本次列车，<%=seat_type%>剩余票<%=SelectSeat.select_ticketNumber(train_id,seat_type,ride_time)%>张</p>
    <%
        if (users!=null){
            %>
    <p>选座喽！已选座<span class="count">0</span>/<%=users.size()%></p>
    <%
        }
    %>

    <div style="display:block;margin:0 auto">
        <input type="button" value="返回修改" style="margin-left: 30%;margin-top: 5%" id="rectification">

        <input type="button" value="确认" class="submit_ordering2" id="confirm_order">
    </div>


</div>
<%--0。添加新朋友--%>
<div id="addFriendDiv">
    <p>请输入你的朋友👬的信息</p>
    <form action="http://localhost:8080/TrainTicketingSystem/AddFriendServlet" method="post" id="addFriendForm">
        真实姓名：<input type="text" name="name" class="inputLine"><br><br>
        身份证号：<input type="text" name="IDNumber" class="inputLine">
        <input type="text" name="buy_name" value="<%=namePeople%>" style="display: none">
    </form>
    <input type="button" value="确定添加" id="addFriend_ok" class="submit_ordering2">
    <input type="button" value="返回" id="cencel_add" class="submit_ordering2">
</div>

<%-- 选择座位并冷冻其他区域 --%>
<script>
    $("#submit_ordering").click(function () {
        <%
        if (users!=null){
            %>
        document.getElementById("ticket_display").style.display="block";
        //选票时使其他区域不能被点击
        $("#people_informations").addClass("disable");
        $("#top_bg").addClass("disable");

        //刚进入时不能点击提交按钮
        $("#confirm_order").addClass("disable");
        <%
        }
        %>
    })
</script>
<%--返回修改买票人信息--%>
<script>
    $("#rectification").click(function () {
        document.getElementById("ticket_display").style.display="none";
        //修正时使其他区域可以被点击
        $("#people_informations").removeClass("disable");
        $("#top_bg").removeClass("disable");
    })
</script>
<%--得到选中的checkbox个数，选中车票时，点击完成时显示已选个数--%>
<script>
    $(".checkboxStyle").click(function(){
        <% int size = 0;
        if (users!=null){
            size = users.size();
        }
        %>

        var chk=$(".checkboxStyle");
        var len = chk.filter(":checked").length;
        if(len><%=size%>){
            if($(this).prop('checked')) {
                return false;
            }
        }
        else{
            $(".count").html(len);
            if (len==<%=size%>){
                $("#confirm_order").removeClass("disable");
            }else {
                $("#confirm_order").addClass(".disable")
            }
        }

    })
</script>
<%--确认付款 提交所有车票--%>
<script>
    //    确认付款
    $("#confirm_order").click(function () {

        var carriage= '';
        var location = '';
        var tempC = '';
        var tempL = '';

        var radio = document.getElementsByName("checkboxName");
        for(var i = 0;i<radio.length;i++)
        {
            if(radio[i].checked==true)
            {
                tempC = document.getElementById("tds"+i).innerText;
                tempL = document.getElementById("tdss"+i).innerText;
                carriage = carriage+","+tempC;
                location = location+","+tempL;
            }
        }
        // alert(carriage+"**************"+location);

        //js获取的变量给java变量的套路
        document.getElementById("carriage_js").value = carriage;
        document.getElementById("location_js").value = location;

        $("#submit_form3").submit();


    })
</script>

<%--更改添加买票人，并且进行信息的储存--%>
<script>
    $(".name_checkbox").change(
        function () {
            var names= '';
            var name = '';
            var radio = document.getElementsByName("name_buy_ticket");
            for(var i = 0;i<radio.length;i++)
            {
                if(radio[i].checked==true)
                {
                    name = radio[i].value;
                    names = names+","+name;
                }
            }
            // alert(names)
            document.getElementById('names_js').value = names;
        }
    );
</script>

<%--提交买票人信息--%>
<script>
    $("#confirm").click(function () {
        names = document.getElementById('names_js').value;

        if (names != ""){
            document.getElementById('submit_form2').submit();
        }else {
            alert("请至少选择一位乘车人！")
        }
    })
</script>

<%--添加新朋友--%>
<script>
    $("#addFriend").click(function () {

        document.getElementById("addFriendDiv").style.display = "block";
        //选票时使其他区域不能被点击
        $("#people_informations").addClass("disable");
        $("#top_bg").addClass("disable");

    })
</script>
<script>
    $("#cencel_add").click(function () {
        document.getElementById("addFriendDiv").style.display = "none";
        //修正时使其他区域可以被点击
        $("#people_informations").removeClass("disable");
        $("#top_bg").removeClass("disable");
        $("#top_bg").removeClass("disable");
    })
</script>
<script>
    $("#addFriend_ok").click(function () {
        document.getElementById("addFriendForm").submit();
    })
</script>


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
