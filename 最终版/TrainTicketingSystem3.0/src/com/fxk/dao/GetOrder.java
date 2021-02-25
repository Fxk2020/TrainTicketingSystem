package com.fxk.dao;

import com.fxk.entity.Ticket;
import com.fxk.util.JDBCTest;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GetOrder {

    public static ArrayList<Ticket> getTickets(String name){

        String sql = "select * from Train_ticket where user_id in (select user_id from Users_message where name='"+name+"')";

        ArrayList<Ticket> tickets = new ArrayList<>();

        ResultSet resultSet = JDBCTest.executeQuery(sql);

        try{
            while (resultSet.next()){
                Ticket ticket = new Ticket();
                ticket.setTicket_id(resultSet.getInt(1));
                ticket.setTrain_id(resultSet.getString(3));
                ticket.setStart_station_name(resultSet.getString(4));
                ticket.setEnd_station_name(resultSet.getString(5));
                ticket.setCarriage(resultSet.getInt(6));
                ticket.setSeat_grade(resultSet.getInt(7));
                ticket.setSeat_location(resultSet.getString(8));
                ticket.setRide_time(resultSet.getString(9));
                ticket.setStart_time(resultSet.getString(10));
                ticket.setEnd_time(resultSet.getString(11));
                ticket.setPrice(resultSet.getInt(12));
                ticket.setOrderTime(resultSet.getString(13));

                tickets.add(ticket);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return tickets;

    }


}
