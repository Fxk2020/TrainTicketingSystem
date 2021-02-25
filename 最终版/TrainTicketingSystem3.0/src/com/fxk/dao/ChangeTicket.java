package com.fxk.dao;

import com.fxk.entity.Ticket;
import com.fxk.util.Affairs;
import com.fxk.util.JDBCTest;

import java.sql.ResultSet;
import java.sql.SQLException;

import static com.fxk.dao.GenerateTicket.getPrice;
import static com.fxk.dao.GenerateTicket.getUser;

/**
 * 处理改签
 */
public class ChangeTicket {


    //改签时间
    public static int changeTime(int ticket_id, String train_id, int carriage, String location, int user_id, String ride_time,Ticket ticket, String IDNumber){

        String sql0 = "select * from Train_seat where train_id='"+train_id+"' and carriage="+carriage+" and seat_location='"+location+"' and ride_time='"+ticket.getRide_time()+"' and occupy=1";//确保该时间段该位置有余票

        int successful = -1;

        ResultSet resultSet = JDBCTest.executeQuery(sql0);
        try{
            if (resultSet.isAfterLast()!=resultSet.isBeforeFirst()){//如果该时间该位置票还在
                //1.退票
                String sql = "delete from Train_ticket where ticket_id="+ticket_id;

                String sql2 = " update Train_seat set occupy=1 where train_id='"+train_id+"' and carriage="+carriage+" and seat_location='"+location+"' and ride_time='"+ride_time+"'";

                String sql3 = "delete from Ride_train where user_id="+user_id+" and train_id='"+train_id+"' and date='"+ride_time+"'";

                //2.添加票

                ticket.setPrice(getPrice(ticket,IDNumber));

                ticket.setUser_id(getUser(IDNumber));

                System.out.println("time3 is not null"+ticket.getRide_time());

                String sqlTwo = "insert into Train_ticket (user_id,train_id,start_station_name,end_station_name,carriage,seat_grade,seat_location,ride_time,start_time,end_time,price) " +
                        "values ('"+ticket.getUser_id()+"','"+ticket.getTrain_id()+"','"+ticket.getStart_station_name()+"','"+ticket.getEnd_station_name()+"',"+ticket.getCarriage()+","+ticket.getSeat_grade()+"," +
                        "'"+ticket.getSeat_location()+"','"+ticket.getRide_time()+"','"+ticket.getStart_time()+"','"+ticket.getEnd_time()+"',"+ticket.getPrice()+");";

                String sqlTwo2 = "update Train_seat set occupy=0 where train_id='"+ticket.getTrain_id()+"' and carriage="+ticket.getCarriage()+" and seat_location='"+ticket.getSeat_location()+"' and ride_time='"+ticket.getRide_time()+"'";
                String sqlTwo3 = "insert into Ride_train values ('"+ticket.getUser_id()+"','"+ticket.getTrain_id()+"','"+ticket.getRide_time()+"')";

                //并发控制
                String sqls[] = new String[6];
                sqls[0] = sql;
                sqls[1] = sql2;
                sqls[2] = sql3;
                sqls[3] = sqlTwo;
                sqls[4] = sqlTwo2;
                sqls[5] = sqlTwo3;
                return Affairs.transaction_control(sqls);

            }else {
                successful = -1;
                System.out.println("time3 is null"+ticket.getRide_time());
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return successful;

    }


    //改签位置
    public static int changeLocation(int ticket_id,String train_id,String ride_time,int carriage_old,String location_old,int  carriage_new,String location_new){


//        System.out.println(ticket_id+"   "+train_id+"   "+ride_time+"     "+carriage_old+"   "+location_old+"   "+carriage_new+"   "+location_new);


        String sql1 = "update Train_ticket set carriage="+carriage_new+",seat_location='"+location_new+"' where ticket_id="+ticket_id+"";
        String sql2 = "update Train_seat set occupy=1 where train_id='"+train_id+"' and carriage="+carriage_old+" and seat_location='"+location_old+"' and ride_time='"+ride_time+"';";
        String sql3 = "update Train_seat set occupy=0 where train_id='"+train_id+"' and carriage="+carriage_new+" and seat_location='"+location_new+"' and ride_time='"+ride_time+"'";

        String[] sqls = new String[3];
        sqls[0] = sql1;
        sqls[1] = sql2;
        sqls[2] = sql3;

        return Affairs.transaction_control(sqls);
    }

}
