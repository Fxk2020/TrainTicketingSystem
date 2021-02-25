package com.fxk.servelt;

import com.fxk.dao.GetTransfer;
import com.fxk.entity.TransferMessage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * @// TODO: 2020/10/25 通过起止火车站对换乘进行查询 
 * 对换乘的火车进行查询
 */
@WebServlet("/GetTrainTransferServlet")
public class GetTrainTransferServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
        //终极版简单的方式设置编码，解决乱码问题  告诉浏览器你用的字符编码方式
        request.setCharacterEncoding("utf-8");
        //终极版简单的方式设置编码，解决乱码问题  告诉浏览器你用的字符编码方式
        response.setContentType("text/html;charset=utf-8");

        //2.获取所有符合条件的火车
        String startCity = request.getParameter("startStation");
        String endCity = request.getParameter("endStation");
        String ride_time = request.getParameter("ride_time");
        String seat_type = request.getParameter("ticket_type");

        ArrayList<TransferMessage> transferMessages = GetTransfer.getTransferMessage(startCity,endCity);

        request.getSession(true).setAttribute("transferMessage",transferMessages);
        request.getSession(true).setAttribute("startStation",startCity);
        request.getSession(true).setAttribute("endStation",endCity);
        request.getSession(true).setAttribute("rideTime",ride_time);
        request.getSession(true).setAttribute("seatType",seat_type);
        System.out.println(ride_time);

        response.sendRedirect("http://localhost:8080/TrainTicketingSystem/Transfer.jsp");

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
