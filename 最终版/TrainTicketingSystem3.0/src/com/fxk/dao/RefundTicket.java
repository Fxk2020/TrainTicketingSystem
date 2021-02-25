package com.fxk.dao;

import com.fxk.util.Affairs;

public class RefundTicket {

    public static int refund_ticket(int ticket_id, String train_id, int carriage, String location, int user_id, String ride_time){

        String sql = "delete from Train_ticket where ticket_id="+ticket_id;

        String sql2 = " update Train_seat set occupy=1 where train_id='"+train_id+"' and carriage="+carriage+" and seat_location='"+location+"' and ride_time='"+ride_time+"'";

        String sql3 = "delete from Ride_train where user_id="+user_id+" and train_id='"+train_id+"' and date='"+ride_time+"'";

        //并发控制
        String sqls[] = new String[3];
        sqls[0] = sql;
        sqls[1] = sql2;
        sqls[2] = sql3;
        return Affairs.transaction_control(sqls);

    }
}
