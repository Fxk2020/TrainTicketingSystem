package com.fxk.servelt;

import com.fxk.dao.GetAllTrain;
import com.fxk.entity.Stop_train;
import com.fxk.entity.Train_stopTable;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * 获取所有的未停运的火车 和 所有停运的火车
 */
@WebServlet("/GetAllTrainServlet")
public class GetAllTrainServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
        //终极版简单的方式设置编码，解决乱码问题  告诉浏览器你用的字符编码方式
        request.setCharacterEncoding("utf-8");
        //终极版简单的方式设置编码，解决乱码问题  告诉浏览器你用的字符编码方式
        response.setContentType("text/html;charset=utf-8");

        //2.查询所有未停运的火车
        String name = request.getParameter("namePeople");
        request.getSession(true).setAttribute("namePeople",name);
        String stop_run = request.getParameter("stop_run");

        if (stop_run.equals("run")){
            ArrayList<Train_stopTable> train_stopTables=GetAllTrain.getTrain_stopTable();
            request.getSession(true).setAttribute("allTrain",train_stopTables);

            response.sendRedirect("http://localhost:8080/TrainTicketingSystem/TrainList.jsp");
        }else if (stop_run.equals("stop")){
            ArrayList<Stop_train> train_stop=GetAllTrain.getStop_train();
            request.getSession(true).setAttribute("allStopTrain",train_stop);

            response.sendRedirect("http://localhost:8080/TrainTicketingSystem/StopTrainList.jsp");
        }



    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
