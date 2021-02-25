package com.fxk.servelt;

import com.fxk.dao.GetOrder;
import com.fxk.dao.RefundTicket;
import com.fxk.entity.Ticket;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * 处理退票
 */
@WebServlet("/RefundServlet")
public class RefundServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //1.设置编码
        //终极版简单的方式设置编码，解决乱码问题  告诉浏览器你用的字符编码方式
        request.setCharacterEncoding("utf-8");
        //终极版简单的方式设置编码，解决乱码问题  告诉浏览器你用的字符编码方式
        response.setContentType("text/html;charset=utf-8");

        //2.处理退票
        int ticket_id = Integer.parseInt(request.getParameter("ticket_id"));
        String train_id = request.getParameter("train_id");
        int carriage = Integer.parseInt(request.getParameter("train_carriage"));
        String location = request.getParameter("train_location");
        int user_id = Integer.parseInt(request.getParameter("user_id"));
        String name = request.getParameter("user_name");
        String ride_time = request.getParameter("ride_time");

        //标志位
        String successful = "OK";
        //原子性
        //将每个得到的人加入车票
        if (RefundTicket.refund_ticket(ticket_id,train_id,carriage,location,user_id,ride_time) ==-1){
            successful = "NOT";
        }

        request.getSession(true).setAttribute("successful_refund",successful);

        ArrayList<Ticket> tickets = GetOrder.getTickets(name);
        request.getSession(true).setAttribute("orders",tickets);

        response.sendRedirect("http://localhost:8080/TrainTicketingSystem/UserCenter.jsp");

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
