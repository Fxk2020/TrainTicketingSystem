package com.fxk.servelt;

import com.fxk.dao.GetOrder;
import com.fxk.entity.Ticket;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * 将姓名传给用户中心
 */

@WebServlet("/Session_message_userCenter")
public class Session_message_userCenter extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
        //终极版简单的方式设置编码，解决乱码问题  告诉浏览器你用的字符编码方式
        request.setCharacterEncoding("utf-8");
        //终极版简单的方式设置编码，解决乱码问题  告诉浏览器你用的字符编码方式
        response.setContentType("text/html;charset=utf-8");

        //2.获取有关信息并将其放到session中

        String name = request.getParameter("namePeople");

        request.getSession(true).setAttribute("namePeople",name);
        System.out.println("servlet:"+name);

        ArrayList<Ticket> tickets = GetOrder.getTickets(name);
        request.getSession(true).setAttribute("orders",tickets);

        response.sendRedirect("http://localhost:8080/TrainTicketingSystem/UserCenter.jsp");

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
