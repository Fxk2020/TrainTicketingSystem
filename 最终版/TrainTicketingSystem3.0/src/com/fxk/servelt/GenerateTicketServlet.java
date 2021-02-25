package com.fxk.servelt;

import com.fxk.dao.GenerateTicket;
import com.fxk.entity.Ticket;
import com.fxk.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * 生成订单
 */
@WebServlet("/GenerateTicketServlet")
public class GenerateTicketServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
        //终极版简单的方式设置编码，解决乱码问题  告诉浏览器你用的字符编码方式
        request.setCharacterEncoding("utf-8");
        //终极版简单的方式设置编码，解决乱码问题  告诉浏览器你用的字符编码方式
        response.setContentType("text/html;charset=utf-8");

        //2.生成车票

        String train_id = request.getParameter("trainType");
        String start_station_name = request.getParameter("start_station_name");
        String end_station_name = request.getParameter("end_station_name");
        String ride_time = request.getParameter("ride_time");

        int seat_grade = Integer.parseInt(request.getParameter("seat_grade"));

        ArrayList<User> users = (ArrayList<User>) request.getSession(true).getAttribute("users");//获取关联顾客的详细信息
//        System.out.println(users.size());

        //获取车票-车厢和具体位置
        String carriage = request.getParameter("carriage");
        String location = request.getParameter("location");

        String[] reCarriages = carriage.split(",");
        String[] reLocations = location.split(",");


        Ticket ticket = new Ticket();
        ticket.setTrain_id(train_id);
        ticket.setStart_station_name(start_station_name);
        ticket.setEnd_station_name(end_station_name);
        ticket.setSeat_grade(seat_grade);
        ticket.setRide_time(ride_time);
        ticket.setStart_time(GenerateTicket.getTime(train_id,start_station_name));
        ticket.setEnd_time(GenerateTicket.getTime(train_id,end_station_name));

        //标志位
        String successful = "OK";

        for (int i = 0; i < users.size(); i++) {

            ticket.setCarriage(Integer.parseInt(reCarriages[i+1]));
            ticket.setSeat_location(reLocations[i+1]);

            //原子性
            //将每个得到的人加入车票
            if (GenerateTicket.insertTicket(ticket,users.get(i).getIDNumber())==-1){
                successful = "NOT_BUY";
            }
        }

        request.getSession(true).setAttribute("successful",successful);

        request.getSession(true).setAttribute("users",null);//销毁缓存的users

        response.sendRedirect("http://localhost:8080/TrainTicketingSystem/Bought_result.jsp");

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
