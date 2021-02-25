<%@ page import="com.fxk.entity.Seat" %>
<%@ page import="com.fxk.dao.SelectSeat" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: yuanbao
  Date: 2020/10/19
  Time: 21:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>位置改签</title>

    <link rel="stylesheet" href="css/tableBeautiful.css" type="text/css">
    <script src="js/jquery-1.11.0.min.js"type="text/javascript"></script>

    <style>
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
    </style>

    <%

        String ticket_id = request.getParameter("ticket_id");
        String train_id = request.getParameter("train_id");
        String ride_time = request.getParameter("location_ride_time");
        String carriage_old = request.getParameter("carriage_old");
        String location_old = request.getParameter("location_old");
        int seat_types = Integer.parseInt(request.getParameter("location_type"));

        String IDNumber = request.getParameter("IDNumber_people");

        String seat_type = "";
        if (seat_types==1){
            seat_type="一等座";
        }else  if (seat_types==2){
            seat_type="二等座";
        }else {
            seat_type="三等座";
        }

        //直接调用方法获得空位置
        ArrayList<Seat> seats = SelectSeat.selectSeat_byTrain_id(train_id,seat_type,ride_time);//获取空座位
    %>

</head>
<body>

<%--确认座位的隐藏div--%>
<div id="ticket_display">
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
    <div>
        <input type="button" value="确认" class="submit_ordering2" id="confirm_order" style="margin:0 auto">
    </div>
</div>

<form id="submit_form" action="http://localhost:8080/TrainTicketingSystem/ChangeTicketServlet" method="post" style="display: none">
    <input type="text" id="location_ticket_id" name="ticket_id" value="<%=ticket_id%>">
    <input type="text" id="location_train_id" name="train_id" value="<%=train_id%>">
    <input type="text" id="location_ride_time" name="location_ride_time" value="<%=ride_time%>">
    <input type="text" id="location_carriage_old" name="carriage_old" value="<%=carriage_old%>">
    <input type="text" id="location_location_old" name="location_old" value="<%=location_old%>">

    <input type="text" id="carriage_new" name="carriage_new" value="">
    <input type="text" id="location_new" name="location_new" value="">

    <input type="text" name="changeWhat" value="location">
    <input type="text" name="IDNumber" value="<%=IDNumber%>">
</form>

<%--确认付款 提交所有车票--%>
<script>
    //    确认修改
    $("#confirm_order").click(function () {
        var carriage= '';
        var location = '';

        var radio = document.getElementsByName("checkboxName");
        for(var i = 0;i<radio.length;i++)
        {
            if(radio[i].checked==true)
            {
                carriage = document.getElementById("tds"+i).innerText;
                location = document.getElementById("tdss"+i).innerText;
            }
        }
        // alert(carriage+"**************"+location);

        //js获取的变量给java变量的套路
        document.getElementById("carriage_new").value = carriage;
        document.getElementById("location_new").value = location;

        $("#submit_form").submit();
    })
</script>

</body>
</html>
