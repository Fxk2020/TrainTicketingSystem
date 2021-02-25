package com.fxk.servelt;

import com.fxk.dao.GenerateTicket;
import com.fxk.dao.GetPeople;
import com.fxk.dao.GetTrainSeat;
import com.fxk.entity.Ticket;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/GenerateTransferTicketServlet")
public class GenerateTransferTicketServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
        //终极版简单的方式设置编码，解决乱码问题  告诉浏览器你用的字符编码方式
        request.setCharacterEncoding("utf-8");
        //终极版简单的方式设置编码，解决乱码问题  告诉浏览器你用的字符编码方式
        response.setContentType("text/html;charset=utf-8");

        //2.生成换乘的车票
        String start_station = request.getParameter("start_station");
        String start_time1 = request.getParameter("start_time1");
        String start_train_id = request.getParameter("start_train_id");
        String end_time1 = request.getParameter("end_time1");
        String transfer_station = request.getParameter("transfer_station");
        String start_time2 = request.getParameter("start_time2");
        String end_train_id = request.getParameter("end_train_id");
        String end_time2 = request.getParameter("end_time2");
        String end_station = request.getParameter("end_station");
        String ride_time =request.getParameter("ride_time");
        String IDNumber = request.getParameter("IDNumber");
        int seat_grade = Integer.parseInt(request.getParameter("seat_grade"));
        String seat_type = "";
        switch (seat_grade){
            case 1:
                seat_type = "一等座";
                break;
            case 2:
                seat_type = "二等座";
                break;
            default:
                seat_type = "三等座";
                break;
        }

        System.out.println(start_station);System.out.println(start_time1);System.out.println(end_time1);System.out.println(start_train_id);
        System.out.println(transfer_station);System.out.println(ride_time);System.out.println(IDNumber);System.out.println(seat_type);
        System.out.println(end_station);System.out.println(start_time2);System.out.println(end_time2);System.out.println(end_train_id);



        ArrayList<String> carriage_location1 = GetTrainSeat.getCarriageAndLocation(start_train_id,seat_type,ride_time);
        ArrayList<String> carriage_location2 = GetTrainSeat.getCarriageAndLocation(end_train_id,seat_type,ride_time);

        Ticket ticket1 = new Ticket();
        ticket1.setTrain_id(start_train_id);
        ticket1.setStart_station_name(start_station);
        ticket1.setEnd_station_name(transfer_station);
        ticket1.setSeat_grade(seat_grade);
        ticket1.setCarriage(Integer.parseInt(carriage_location1.get(0)));
        ticket1.setSeat_location(carriage_location1.get(1));
        ticket1.setRide_time(ride_time);
        ticket1.setStart_time(start_time1);
        ticket1.setEnd_time(end_time1);

        Ticket ticket2 = new Ticket();
        ticket2.setTrain_id(end_train_id);
        ticket2.setStart_station_name(transfer_station);
        ticket2.setEnd_station_name(end_station);
        ticket2.setSeat_grade(seat_grade);
        ticket2.setCarriage(Integer.parseInt(carriage_location2.get(0)));
        ticket2.setSeat_location(carriage_location2.get(1));
        ticket2.setRide_time(ride_time);
        ticket2.setStart_time(start_time2);
        ticket2.setEnd_time(end_time2);

        //标志位
        String successful = "OK";
        if (GenerateTicket.insertTransferTicket(ticket1,ticket2,IDNumber) == -1){
            successful = "NOT_TRANSFER";
        }

        request.getSession(true).setAttribute("successful",successful);
        request.getSession(true).setAttribute("realName", GetPeople.getRealName(IDNumber));

        response.sendRedirect("http://localhost:8080/TrainTicketingSystem/Bought_result.jsp");

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
