package com.fxk.servelt;

import com.fxk.dao.GetAllCity;
import com.fxk.entity.City;
import com.fxk.util.MyUTF;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * 获取所有开设火车站的城市
 */

@WebServlet("/GetCitiesServlet")
public class GetCitiesServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws javax.servlet.ServletException, IOException {

        //1.设置编码
        //终极版简单的方式设置编码，解决乱码问题  告诉浏览器你用的字符编码方式
        request.setCharacterEncoding("utf-8");
        //终极版简单的方式设置编码，解决乱码问题  告诉浏览器你用的字符编码方式
        response.setContentType("text/html;charset=utf-8");

        //2.查询所有城市并将其返回到指定页面
        ArrayList<City> list = GetAllCity.getCities();
        request.getSession(true).setAttribute("cities",list);

        String name = request.getParameter("namePeople");
        request.getSession(true).setAttribute("namePeople",name);

        String type_ticket = request.getParameter("Type_ticket");

        System.out.println(name+"**************servlet");

        if (type_ticket.equals("dancheng")){
            response.sendRedirect("http://localhost:8080/TrainTicketingSystem/buyTickets.jsp");
        }else if (type_ticket.equals("huancheng")){
            response.sendRedirect("http://localhost:8080/TrainTicketingSystem/Transfer.jsp");
        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws javax.servlet.ServletException, IOException {

        doPost(request,response);
    }

}
