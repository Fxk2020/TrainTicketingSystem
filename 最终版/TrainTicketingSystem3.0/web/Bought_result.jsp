<%--
  Created by IntelliJ IDEA.
  User: yuanbao
  Date: 2020/9/23
  Time: 20:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String successful = (String) request.getSession(true).getAttribute("successful");

    String namePeople = (String) request.getSession(true).getAttribute("realName");

    if (successful!=null){
        if (successful.equals("OK")){//成功插入车票

            System.out.println("支付成功thanks！");

            request.getSession(true).setAttribute("pay_successfully","OK");

            //清除某些不必要的缓存-火车的缓存
            request.getSession(true).setAttribute("trains",null);

            request.getSession(true).setAttribute("username_msg",namePeople);

            response.sendRedirect("http://localhost:8080/TrainTicketingSystem/index.jsp");

        }else if (successful.equals("NOT_BUY")){

            System.out.println("不能重复购买同一车次的票sorry！");

            //清除某些不必要的缓存-火车的缓存
            request.getSession(true).setAttribute("trains",null);

            //返回不能重复购票的标识位
            request.getSession(true).setAttribute("repeat_ticket","yes");

            response.sendRedirect("http://localhost:8080/TrainTicketingSystem/ConfirmOrder.jsp");

        }else if (successful.equals("NOT_TRANSFER")){
            System.out.println("换乘购票失败");

            request.getSession(true).setAttribute("transferMessage",null);
            request.getSession(true).setAttribute("startStation",null);
            request.getSession(true).setAttribute("repeat_transfer","yes");

            response.sendRedirect("http://localhost:8080/TrainTicketingSystem/Transfer.jsp");

        }
    }else {
        System.out.println("系统出错了！");
        response.sendRedirect("http://localhost:8080/TrainTicketingSystem/index.jsp");
    }
%>


</body>
</html>
