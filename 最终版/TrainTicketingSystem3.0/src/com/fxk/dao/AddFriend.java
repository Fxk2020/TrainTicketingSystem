package com.fxk.dao;

import com.fxk.util.JDBCTest;

/**
 * 用于添加朋友
 */
public class AddFriend {

    public static int addFriends(String name_buy,String IDNumber){

        int user_id_buy = GetPeople.getUserId(name_buy);
        int user_id_friend = GetPeople.getUserId(GetPeople.getRealName(IDNumber));
        if (user_id_friend == 0){
            return 0;
        }else {
            String sql = "insert Purchasing_message values ("+user_id_buy+",'"+name_buy+"',"+user_id_friend+")";
            return JDBCTest.executeUpdate(sql);
        }

    }


}
