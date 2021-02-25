package com.fxk.test;

import com.fxk.dao.*;
import com.fxk.entity.*;
import com.fxk.util.Affairs;
import com.fxk.util.DBConnection;
import com.fxk.util.JDBCTest;

import java.sql.*;
import java.util.ArrayList;

public class Test {

    public static void main(String[] args) {
//        try {
//
//            ResultSet rs;
//            rs = JDBCTest.executeQuery("SELECT * FROM Users_message;");
//
//            while (rs.next()) {
//                String nameT = rs.getString("name").trim();
//
//                System.out.println(nameT);
//
//            }
//        } catch (SQLException e) {
//            // TODO 自动生成的 catch 块
//            e.printStackTrace();
//        }
//    }
//        User regisUser = new User();
//        regisUser.setUser_name("ssss");
//        regisUser.setUser_password("sssssss");
//        regisUser.setName("小S");
//        regisUser.setIDNumber("220203200201010537");
//        regisUser.setStuStatus(1);
//
//
//        String sql = "insert into Users_message (user_name,user_password,name,IDNumber,stuStatus) values ('"+regisUser.getUser_name()+"','"+regisUser.getUser_password()+"','"+regisUser.getName()+"','"+regisUser.getIDNumber()+"',"+regisUser.getStuStatus()+");";
//
//        int successful = JDBCTest.executeUpdate(sql);
//
//        System.out.println(successful);

        /**
         * 检验查询所有城市
         */

//        ArrayList<City> cities = GetAllCity.getCities();
//
//        for (int i=0;i<cities.size();i++){
//            System.out.println(cities.get(i).getName());
//        }

        /*
        获取经过某两个城市的所有火车信息
         */
//        ArrayList<Train> list = GetTrain.getTrains("北京","南京");
//
//        for (int i = 0; i < list.size(); i++) {
//            System.out.println(list.get(i).getTrainType());
//            System.out.println(list.get(i).getSeat1());
//        }

        /*
        生成火车票
         */

//        Ticket ticket = new Ticket();
//        ticket.setTrain_id("G2");
//        ticket.setStart_station_name("北京北站");
//        ticket.setEnd_station_name("南京西站");
//        ticket.setSeat_grade(1);
//        ticket.setRide_time("2020.10.10");
//        ticket.setStart_time(GenerateTicket.getTime("G2","北京北站"));
//        ticket.setEnd_time(GenerateTicket.getTime("G2","南京西站"));
//
//        GenerateTicket.insertTicket(ticket,"傅显坤");
//        System.out.println(Math.abs(-9));

        /*
        查找代购人
         */

//        ArrayList<String> names = GetPeople.getPeople("罗翔");
//        for (int i = 0; i < names.size() ; i++) {
//            System.out.println(names.get(i));
//        }

//        ArrayList<User> list = GetUsers_buyTicket.getTicketUsers("");
//        if (list!=null){
//            for (int i = 0; i <list.size() ; i++) {
//                System.out.println(list.get(i).getIDNumber());
//            }
//        }else {
//            System.out.println("null");
//        }

//        ArrayList<Seat> seats = SelectSeat.selectSeat_byTrain_id("G1","一等座");
//        if (seats!=null){
//            for (int i = 0; i <seats.size() ; i++) {
//                System.out.println(seats.get(i).getCarriage()+":"+seats.get(i).getSeat_location());
//            }
//        }else {
//            System.out.println("null");
//        }


        // 创造SQL语句 测试数据库的并发控制
//        String sql1 = "update Train_seat set occupy=0 where occupy=1";
//        String sql2 = "update Train_seat set occupy=1 where occupy=0";
//
//        String sqls[] = new String[2];
//        sqls[0] = sql1;
//        sqls[1] = sql2;
//
//        Affairs.transaction_control(sqls);

//        ArrayList<Ticket> orders = GetOrder.getTickets("傅显坤");
//        for (int i = 0; i < orders.size(); i++) {
//            System.out.println(orders.get(i).getTicket_id());
//        }

//        ArrayList<Train_seatNumber> numbers = GetTrainSeat.getSeatNumber();
//        for (int i = 0; i < numbers.size(); i++) {
//            System.out.println(numbers.get(i).getSeat_number());
//        }

//        ArrayList<Train_stopTable> tables = GetAllTrain.getTrain_stopTable();
//        for (int i = 0; i < tables.size(); i++) {
//            System.out.println(tables.get(i).getStop_time());
//        }

//        ArrayList<String> carriage_location1 = GetTrainSeat.getCarriageAndLocation("G4","一等座","2020.10.11");
//        System.out.println(carriage_location1.get(0)+carriage_location1.get(1));

        System.out.println(AddFriend.addFriends("罗翔","dddd"));//如果IDNumber错误返回的是0

        System.out.println(AddFriend.addFriends("罗翔","37068319990622501X"));//如果已经有这位朋友了返回-1

        System.out.println(AddFriend.addFriends("罗翔","130102200201017276"));//成功添加返回1


    }


    }
