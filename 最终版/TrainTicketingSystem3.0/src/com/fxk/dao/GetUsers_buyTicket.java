package com.fxk.dao;

import com.fxk.entity.User;
import com.fxk.util.JDBCTest;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * 获取买票人的信息-ID，name，是否是学生
 */

public class GetUsers_buyTicket {

    public static ArrayList<User> getTicketUsers(String names){

        String[] reStrings = names.split(",");
        if (reStrings.length<2){
            return null;//没有选择买票人时
        }
        String sql = "select name,IDNumber,stuStatus  from Users_message where  ";
        for (int i = 0; i < reStrings.length; i++) {
            if(reStrings[i]!=""){
                if(i==1){
                    sql += "name='"+reStrings[i]+"'";
                }
                if(i>1){
                    sql += " or name='"+reStrings[i]+"'" ;
                }
            }
        }

        ResultSet resultSet = JDBCTest.executeQuery(sql);
        ArrayList<User> users = new ArrayList<>();


        try{
            while (resultSet.next()){
                String name = resultSet.getString(1);
                String IDNumber = resultSet.getString(2);
                int stuStatus = resultSet.getInt(3);
                User user = new User();
                user.setStuStatus(stuStatus);
                user.setIDNumber(IDNumber);
                user.setName(name);

                System.out.println("***********************"+name);

                users.add(user);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return users;
    }
}
