package com.fxk.dao;

import com.fxk.entity.City;
import com.fxk.util.JDBCTest;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GetAllCity {

    public static ArrayList<City> getCities(){
        ArrayList<City> list = new ArrayList<City>();

        String sql = " select distinct city from Train_station;";

        ResultSet resultSet = JDBCTest.executeQuery(sql);

        try{
            while (resultSet.next()){
//                System.out.println(resultSet.getString(1));
                list.add(new City(resultSet.getString(1)));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return list;
    }

}
