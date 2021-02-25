package com.fxk.servelt;


import com.fxk.dao.GetTrain;
import com.fxk.entity.Train;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * 通过始发站和终点站确定火车-直达火车
 */
@WebServlet("/GetTrainServlet")
public class GetTrainServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //1.设置编码
        //终极版简单的方式设置编码，解决乱码问题  告诉浏览器你用的字符编码方式
        request.setCharacterEncoding("utf-8");
        //终极版简单的方式设置编码，解决乱码问题  告诉浏览器你用的字符编码方式
        response.setContentType("text/html;charset=utf-8");

        //2.获取所有符合条件的火车
        int status = Integer.parseInt(request.getParameter("status"));
        String startCity = request.getParameter("startStation");
        String endCity = request.getParameter("endStation");
        String ride_time = request.getParameter("ride_time");

        ArrayList<Train> list = GetTrain.getTrains(startCity,endCity);
        request.getSession(true).setAttribute("ride_time",ride_time);

        request.getSession(true).setAttribute("trains",list);
        response.sendRedirect("http://localhost:8080/TrainTicketingSystem/buyTickets.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }
}
