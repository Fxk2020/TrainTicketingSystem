package com.fxk.dao;

import com.fxk.entity.Train_seatNumber;
import com.fxk.util.JDBCTest;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/*
得到火车的剩余座位
 */
public class GetTrainSeat {

    public static ArrayList<Train_seatNumber> getSeatNumber(String ride_time){

        String sql = "select train_id,seat_type,count(train_id) from Train_message natural join Train_seat where occupy=1 and ride_time='"+ride_time+"'  group by train_id,seat_type";

        ArrayList<Train_seatNumber> seatNumbers = new ArrayList<>();

        ResultSet resultSet = JDBCTest.executeQuery(sql);

        try{
            while (resultSet.next()){
                Train_seatNumber number = new Train_seatNumber();
                number.setTrain_id(resultSet.getString(1));
                number.setSeat_type(resultSet.getString(2));
                number.setSeat_number(resultSet.getInt(3));

                seatNumbers.add(number);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return seatNumbers;
    }

    //获得carriage和location
    public static ArrayList<String> getCarriageAndLocation(String train_id,String train_type,String ride_time){

        String sql = "select carriage,seat_location from Train_seat where Train_id='"+train_id+"' and seat_type='"+train_type+"' and ride_time='"+ride_time+"' and occupy=1";

        ArrayList<String> result = new ArrayList<>();

        ResultSet resultSet = JDBCTest.executeQuery(sql);
        String carriage = "";
        String location = "";
        try{
            while (resultSet.next()){
                carriage = String.valueOf(resultSet.getInt(1));
                location = resultSet.getString(2);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        result.add(carriage);
        result.add(location);
        return result;
    }
}
