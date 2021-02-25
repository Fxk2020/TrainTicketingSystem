package com.fxk.servelt;

import com.fxk.dao.GetUsers_buyTicket;
import com.fxk.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * 获取相关联的用户
 */

@WebServlet("/GetUsersTicketServlet")
public class GetUsersTicketServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//1.设置编码
        //终极版简单的方式设置编码，解决乱码问题  告诉浏览器你用的字符编码方式
        request.setCharacterEncoding("utf-8");
        //终极版简单的方式设置编码，解决乱码问题  告诉浏览器你用的字符编码方式
        response.setContentType("text/html;charset=utf-8");

        //2.生成买票人
        String names = request.getParameter("names");
        ArrayList<User> users = GetUsers_buyTicket.getTicketUsers(names);

        request.getSession(true).setAttribute("users",users);

//        response.sendRedirect("http://localhost:8080/TrainTicketingSystem/ConfirmOrder.jsp?trainType="+train_id+"&start_station_name="+
//                start_station_name+"&end_station_name="+end_station_name+"&ride_time="+ride_time+"&seat_grade="+seat_grade+"&realName="+namePeople);

        response.sendRedirect("http://localhost:8080/TrainTicketingSystem/ConfirmOrder.jsp");

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
