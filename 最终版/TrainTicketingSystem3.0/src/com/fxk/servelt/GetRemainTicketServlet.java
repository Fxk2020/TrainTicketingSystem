package com.fxk.servelt;

import com.fxk.dao.GetTrainSeat;
import com.fxk.entity.Train_seatNumber;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * 用于查询每辆火车的余票-添加出行日期
 */
@WebServlet("/GetRemainTicketServlet")
public class GetRemainTicketServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
        //终极版简单的方式设置编码，解决乱码问题  告诉浏览器你用的字符编码方式
        request.setCharacterEncoding("utf-8");
        //终极版简单的方式设置编码，解决乱码问题  告诉浏览器你用的字符编码方式
        response.setContentType("text/html;charset=utf-8");

        //2.查询每辆火车的余票
        String name = request.getParameter("namePeople");
        request.getSession(true).setAttribute("namePeople",name);
        String ride_time = request.getParameter("ride_time");

        ArrayList<Train_seatNumber> seatNumbers = GetTrainSeat.getSeatNumber(ride_time);
        request.getSession(true).setAttribute("seat_number",seatNumbers);

        response.sendRedirect("http://localhost:8080/TrainTicketingSystem/Remaining_tickets.jsp");

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
