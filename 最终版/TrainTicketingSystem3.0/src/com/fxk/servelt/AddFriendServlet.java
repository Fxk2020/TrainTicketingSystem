package com.fxk.servelt;

import com.fxk.dao.AddFriend;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AddFriendServlet")
public class AddFriendServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
        //终极版简单的方式设置编码，解决乱码问题  告诉浏览器你用的字符编码方式
        request.setCharacterEncoding("utf-8");
        //终极版简单的方式设置编码，解决乱码问题  告诉浏览器你用的字符编码方式
        response.setContentType("text/html;charset=utf-8");


        //2.添加新朋友
        String name_buy = request.getParameter("buy_name");
        String name_friend = request.getParameter("name");
        String IDNumber = request.getParameter("IDNumber");

        int result = AddFriend.addFriends(name_buy,IDNumber);
        String result_str = result+"";
        request.getSession(true).setAttribute("results",result_str);
        request.getSession(true).setAttribute("users",null);

        response.sendRedirect("http://localhost:8080/TrainTicketingSystem/ConfirmOrder.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
