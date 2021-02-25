package com.fxk.dao;

import com.fxk.util.JDBCTest;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * 获取联系人（可以帮他买票的联系人）,
 * 通过姓名获得注册人的user——id
 */
public class GetPeople {

    public static ArrayList<String> getPeople(String name){

        String sql = "select name from Users_message where user_id in (select purchasing_id from Purchasing_message where user_name='"+name+"')";

        ResultSet resultSet = JDBCTest.executeQuery(sql);

        ArrayList<String> names = new ArrayList<String>();


        try {
            while (resultSet.next()){
                names.add(resultSet.getString(1));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return names;


    }

    public static int getUserId(String name){
        String sql = "select user_id from Users_message where name='"+name+"'";

        ResultSet resultSet = JDBCTest.executeQuery(sql);

        int user_id = 0;

        try {
            while (resultSet.next()){
                user_id = resultSet.getInt(1);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return user_id;
    }

    public static String getIDNumber(String name){
        String sql = "select IDNumber from Users_message where name='"+name+"'";

        ResultSet resultSet = JDBCTest.executeQuery(sql);

        String IDNumber = "";

        try{
            while (resultSet.next()){
                IDNumber = resultSet.getString(1);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return IDNumber;
    }

    public static String getRealName(String IDNumber){

        String sql = "select name from Users_message where IDNumber='"+IDNumber+"'";

        ResultSet resultSet = JDBCTest.executeQuery(sql);

        String realName = "";

        try{
            while (resultSet.next()){
                realName = resultSet.getString(1);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return realName;

    }

}
