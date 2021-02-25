package com.fxk.dao;

import com.fxk.entity.User;
import com.fxk.util.JDBCTest;

public class AddUser {

    public static int addUsers(User regisUser){
        String sql = "insert into Users_message (user_name,user_password,name,IDNumber,stuStatus) values ('"+regisUser.getUser_name()+"','"+regisUser.getUser_password()+"','"+regisUser.getName()+"','"+regisUser.getIDNumber()+"',"+regisUser.getStuStatus()+");";

        int successful = JDBCTest.executeUpdate(sql);

        return successful;
    }


}
