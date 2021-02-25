package com.fxk.servelt;

import com.fxk.dao.LoginAuthentication;
import com.fxk.entity.User;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 验证登录
 */

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws javax.servlet.ServletException, IOException {

        //1.设置编码
        //终极版简单的方式设置编码，解决乱码问题  告诉浏览器你用的字符编码方式
        request.setCharacterEncoding("utf-8");
        //终极版简单的方式设置编码，解决乱码问题  告诉浏览器你用的字符编码方式
        response.setHeader("content-type", "text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        //2.获取用户的登录信息并验证是否存在
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User login_user = new User();
        login_user.setUser_name(username);
        login_user.setUser_password(password);

        LoginAuthentication login_check = new LoginAuthentication();
        User return_user = login_check.login_check(login_user);

        //3.根据验证结果确定返回的页面
        if (return_user==null){
            //登陆失败
            response.sendRedirect("http://localhost:8080/TrainTicketingSystem/LoginInterface.jsp?username=null");
        }else {
            //登陆成功

            //登录成功时，把真实姓名存储到session中
            request.getSession(true).setAttribute("username_msg",return_user.getName());
            response.sendRedirect("http://localhost:8080/TrainTicketingSystem/index.jsp");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doPost(request,response);
    }

}
