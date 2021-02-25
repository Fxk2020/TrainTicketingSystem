package com.fxk.dao;

import com.fxk.entity.Seat;
import com.fxk.util.JDBCTest;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
/*
1.查询剩余车票的位置+ride_time
2.查询剩余车票的总数
 */
public class SelectSeat {

    public static ArrayList<Seat> selectSeat_byTrain_id(String train_id,String seat_type,String ride_time){
        String sql = "select carriage,seat_location from Train_seat where train_id='"+train_id+"' and seat_type='"+seat_type+"' and occupy=1 and ride_time='"+ride_time+"'";

        ResultSet resultSet = JDBCTest.executeQuery(sql);

        ArrayList<Seat> seats= new ArrayList<>();

        try {
            while (resultSet.next()){
                int carriage = resultSet.getInt(1);
                String seat_location = resultSet.getString(2);
                Seat seat = new Seat();
                seat.setCarriage(carriage);
                seat.setSeat_location(seat_location);

                seats.add(seat);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return seats;

    }

    public static int select_ticketNumber(String train_id,String seat_type,String ride_time){
        String sql = "select count(*) from Train_seat where train_id='"+train_id+"'and seat_type='"+seat_type+"' and occupy=1 and ride_time='"+ride_time+"'";

        ResultSet resultSet = JDBCTest.executeQuery(sql);

        int number = 0;

        try {
            while (resultSet.next()){
                number = resultSet.getInt(1);
                return number;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return number;
    }

}
