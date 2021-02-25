package com.fxk.dao;

import com.fxk.entity.TransferMessage;
import com.fxk.util.JDBCTest;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * 寻找符合条件的换乘火车
 */
public class GetTransfer {

    public static ArrayList<TransferMessage> getTransferMessage(String start_station_city,String end_station_city){

        String sql = "select a.train_id as first_tid, d.train_id as second_tid, e.train_id as first_tname, f.train_id as second_tname, b.station_id as transfer_station " +
                "from Stop as a,Stop as b, Stop as c,Stop as d, Train_message as e, Train_message as f " +
                "where a.city = '"+start_station_city+"' and d.city = '"+end_station_city+"' and a.train_id = b.train_id and b.station_name = c.station_name and c.train_id = d.train_id  " +
                "and a.mileage < b.mileage and c.mileage < d.mileage and b.arrive_time < c.arrive_time " +
                "and a.train_id not in (select train_id from Train_message where status = '0') and d.train_id not in (select train_id from Train_message where status = '0') " +
                "and a.train_id = e.train_id and d.train_id = f.train_id;";

        ArrayList<TransferMessage> transferMessages = new ArrayList<>();

        ResultSet resultSet = JDBCTest.executeQuery(sql);

        try {
            while (resultSet.next()){
                TransferMessage message = new TransferMessage();
                String a_train_id = resultSet.getString(1);
                String d_train_id = resultSet.getString(2);
                String transfer_station_id = resultSet.getString(5);

                message.setA_train_id(a_train_id);
                message.setB_train_id(d_train_id);

                message.setStart_station_name(getStationName2(a_train_id,start_station_city));
                message.setEnd_station_name(getStationName2(d_train_id,end_station_city));
                String transfer_station_name = getStationName(transfer_station_id);
                message.setTransfer_station_name(transfer_station_name);

                //四个时间
                String a_start_time = getTransferTime(a_train_id,start_station_city);
                String a_end_time = getTransferTime2(a_train_id,transfer_station_name);
                String b_start_time = getTransferTime2(d_train_id,transfer_station_name);
                String b_end_time = getTransferTime(d_train_id,end_station_city);
                message.setA_start_time(a_start_time);
                message.setA_end_time(a_end_time);
                message.setB_start_time(b_start_time);
                message.setB_end_time(b_end_time);

                transferMessages.add(message);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return transferMessages;

    }

    //通过火车号和城市获得站点名称
    private static String getStationName2(String train_id, String station_city) {

        String sql = "select station_name from stop where train_id='"+train_id+"' and city='"+station_city+"'";

        ResultSet resultSet = JDBCTest.executeQuery(sql);
        String stationName="";

        try {
            while (resultSet.next()){
                stationName = resultSet.getString(1);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return stationName;

    }

    //通过火车号和站点名称获得时间
    private static String getTransferTime2(String train_id, String station_name) {

        String sql = "select arrive_time from stop where train_id='"+train_id+"' and station_name='"+station_name+"'";

        ResultSet resultSet = JDBCTest.executeQuery(sql);
        String time = "";

        try{
            while (resultSet.next()){
                time = resultSet.getString(1);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return time;

    }

    //通过火车号和站点城市获得时间
    private static String getTransferTime(String train_id, String station_city) {

        String sql = "select arrive_time from stop where train_id='"+train_id+"' and city='"+station_city+"'";

        ResultSet resultSet = JDBCTest.executeQuery(sql);
        String time = "";

        try{
            while (resultSet.next()){
                time = resultSet.getString(1);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return time;

    }

    //通过站点id获得站点名称
    private static String getStationName(String station_id) {

        String sql = "select station_name from Train_station where station_id="+station_id+"";

        ResultSet resultSet = JDBCTest.executeQuery(sql);

        String station_name = "";

        try {
            while (resultSet.next()){
                station_name = resultSet.getString(1);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return station_name;

    }


}
