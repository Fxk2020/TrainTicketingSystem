package com.fxk.servelt;

import com.fxk.dao.AddUser;
import com.fxk.dao.LoginAuthentication;
import com.fxk.entity.User;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 进行注册
 */

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws javax.servlet.ServletException, IOException {

        //1.设置编码
        //终极版简单的方式设置编码，解决乱码问题  告诉浏览器你用的字符编码方式Transfer
        request.setCharacterEncoding("utf-8");
        //终极版简单的方式设置编码，解决乱码问题  告诉浏览器你用的字符编码方式
        response.setContentType("text/html;charset=utf-8");

        //2.获取用户的注册信息
        String username = request.getParameter("iptNickName");
        String password = request.getParameter("t_UserPass");
        String name = request.getParameter("iptName");
        String IDNumber = request.getParameter("iptCard");
        int stuStatus = Integer.parseInt(request.getParameter("rb_stu"));

        User register_user = new User();
        register_user.setUser_name(username);
        register_user.setUser_password(password);
        register_user.setName(name);
        register_user.setIDNumber(IDNumber);
        register_user.setStuStatus(stuStatus);

        int successful = AddUser.addUsers(register_user);

        //3.根据验证结果确定返回的页面
        if (successful==1){
            //注册成功
            response.sendRedirect("http://localhost:8080/TrainTicketingSystem/LoginInterface.jsp");
            System.out.println(name);

        }else {
            //注册失败
            response.sendRedirect("http://localhost:8080/TrainTicketingSystem/RegisterInterface.jsp?successful=null");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doPost(request,response);
    }


}
