package com.fxk.servelt;

import com.fxk.dao.ChangeTicket;
import com.fxk.dao.GenerateTicket;
import com.fxk.dao.GetOrder;
import com.fxk.dao.GetPeople;
import com.fxk.entity.Ticket;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * 处理改签
 */

@WebServlet("/ChangeTicketServlet")
public class ChangeTicketServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
        //终极版简单的方式设置编码，解决乱码问题  告诉浏览器你用的字符编码方式
        request.setCharacterEncoding("utf-8");
        //终极版简单的方式设置编码，解决乱码问题  告诉浏览器你用的字符编码方式
        response.setContentType("text/html;charset=utf-8");

        String changeWhat = request.getParameter("changeWhat");

        if (changeWhat.equals("time")){
            //2.更改车票时间的处理
            int ticket_id = Integer.parseInt(request.getParameter("ticket_id"));
            String train_id = request.getParameter("train_id");
            int carriage = Integer.parseInt(request.getParameter("train_carriage"));
            String location = request.getParameter("train_location");
            int user_id = Integer.parseInt(request.getParameter("user_id"));
            String name = request.getParameter("user_name");
            String ride_time = request.getParameter("ride_time");//更改前的出行时间
            String ride_time_change = request.getParameter("ride_time_change");//更改后的出行时间

            String start_station_name = request.getParameter("start_station_name");
            String end_station_name = request.getParameter("end_station_name");
            int seat_grade = Integer.parseInt(request.getParameter("seat_grade"));

            System.out.println("time1"+ride_time);
            System.out.println("time2"+ride_time_change);

            Ticket ticket = new Ticket();
            ticket.setTrain_id(train_id);
            ticket.setStart_station_name(start_station_name);
            ticket.setEnd_station_name(end_station_name);
            ticket.setSeat_grade(seat_grade);
            ticket.setRide_time(ride_time_change);
            ticket.setStart_time(GenerateTicket.getTime(train_id,start_station_name));
            ticket.setEnd_time(GenerateTicket.getTime(train_id,end_station_name));
            ticket.setSeat_location(location);
            ticket.setCarriage(carriage);

            //标志位
            String successfulChangeTime = "OK";
            //原子性
            //退票加买票必须同时完成或者都不完成
            if (ChangeTicket.changeTime(ticket_id,train_id,carriage,location,user_id,ride_time,ticket, GetPeople.getIDNumber(name))==-1){
                successfulChangeTime = "No";
            }

            ArrayList<Ticket> tickets = GetOrder.getTickets(name);
            request.getSession(true).setAttribute("orders",tickets);

            request.getSession(true).setAttribute("successfulChangeTime",successfulChangeTime);

            response.sendRedirect("http://localhost:8080/TrainTicketingSystem/UserCenter.jsp");
        }
        else if (changeWhat.equals("location")){
           //更改位置的处理
            int ticket_id = Integer.parseInt(request.getParameter("ticket_id"));
            String train_id = request.getParameter("train_id");
            String ride_time = request.getParameter("location_ride_time");
            int carriage_old = Integer.parseInt(request.getParameter("carriage_old"));
            String location_old = request.getParameter("location_old");
            int  carriage_new = Integer.parseInt(request.getParameter("carriage_new"));
            String location_new = request.getParameter("location_new");

            String IDNumber = request.getParameter("IDNumber");

            String successfulChangeLocation = "OK";
            if (ChangeTicket.changeLocation(ticket_id,train_id,ride_time,carriage_old,location_old,carriage_new,location_new)==-1){
                successfulChangeLocation = "No";
            }

            String name = GetPeople.getRealName(IDNumber);
            System.out.println(name);
            ArrayList<Ticket> tickets = GetOrder.getTickets(name);
            request.getSession(true).setAttribute("orders",tickets);

            request.getSession(true).setAttribute("successfulChangeLocation",successfulChangeLocation);

            response.sendRedirect("http://localhost:8080/TrainTicketingSystem/UserCenter.jsp");

        }else {

        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
