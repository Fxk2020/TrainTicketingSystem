package com.fxk.servelt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 负责将信息存到session中
 */

@WebServlet("/Session_message")
public class Session_message extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //1.设置编码
        //终极版简单的方式设置编码，解决乱码问题  告诉浏览器你用的字符编码方式
        request.setCharacterEncoding("utf-8");
        //终极版简单的方式设置编码，解决乱码问题  告诉浏览器你用的字符编码方式
        response.setContentType("text/html;charset=utf-8");

        //2.获取有关信息并将其放到session中
        String train_id = request.getParameter("trainType");
        String start_station_name = request.getParameter("start_station_name");
        String end_station_name = request.getParameter("end_station_name");
        String ride_time = request.getParameter("ride_time");

        int seat_grade = Integer.parseInt(request.getParameter("seat_grade"));
        String namePeople = request.getParameter("realName");

        System.out.println("****************************出行时间servlet"+ride_time);

        request.getSession(true).setAttribute("trainType",train_id);
        request.getSession(true).setAttribute("start_station_name",start_station_name);
        request.getSession(true).setAttribute("end_station_name",end_station_name);
        request.getSession(true).setAttribute("ride_time2",ride_time);
        request.getSession(true).setAttribute("seat_grade",seat_grade);
        request.getSession(true).setAttribute("realName",namePeople);

        response.sendRedirect("http://localhost:8080/TrainTicketingSystem/ConfirmOrder.jsp");//重定向至ConfirmOrder.jsp
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
