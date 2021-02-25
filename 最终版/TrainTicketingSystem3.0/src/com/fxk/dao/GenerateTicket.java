package com.fxk.dao;

import com.fxk.entity.Ticket;
import com.fxk.util.Affairs;
import com.fxk.util.JDBCTest;

import java.sql.ResultSet;
import java.sql.SQLException;

public class GenerateTicket {

    /*
    获取车票
     */
    public static int insertTicket(Ticket ticket,String IDNumber){
        
        ticket.setPrice(getPrice(ticket,IDNumber));

        ticket.setUser_id(getUser(IDNumber));

        String sql = "insert into Train_ticket (user_id,train_id,start_station_name,end_station_name,carriage,seat_grade,seat_location,ride_time,start_time,end_time,price) " +
                "values ('"+ticket.getUser_id()+"','"+ticket.getTrain_id()+"','"+ticket.getStart_station_name()+"','"+ticket.getEnd_station_name()+"',"+ticket.getCarriage()+","+ticket.getSeat_grade()+"," +
                "'"+ticket.getSeat_location()+"','"+ticket.getRide_time()+"','"+ticket.getStart_time()+"','"+ticket.getEnd_time()+"',"+ticket.getPrice()+");";

        String sql2 = "update Train_seat set occupy=0 where train_id='"+ticket.getTrain_id()+"' and carriage="+ticket.getCarriage()+" and seat_location='"+ticket.getSeat_location()+"' and ride_time='"+ticket.getRide_time()+"'";
        String sql3 = "insert into Ride_train values ('"+ticket.getUser_id()+"','"+ticket.getTrain_id()+"','"+ticket.getRide_time()+"')";

        String sqls[] = new String[3];
        sqls[0] = sql;
        sqls[1] = sql2;
        sqls[2] = sql3;
         return Affairs.transaction_control(sqls);

    }

    public static int insertTransferTicket(Ticket ticket,Ticket ticket2,String IDNumber){

        ticket.setPrice(getPrice(ticket,IDNumber));
        ticket2.setPrice(getPrice(ticket2,IDNumber));

        ticket.setUser_id(getUser(IDNumber));
        ticket2.setUser_id(getUser(IDNumber));

        String sql = "insert into Train_ticket (user_id,train_id,start_station_name,end_station_name,carriage,seat_grade,seat_location,ride_time,start_time,end_time,price) " +
                "values ('"+ticket.getUser_id()+"','"+ticket.getTrain_id()+"','"+ticket.getStart_station_name()+"','"+ticket.getEnd_station_name()+"',"+ticket.getCarriage()+","+ticket.getSeat_grade()+"," +
                "'"+ticket.getSeat_location()+"','"+ticket.getRide_time()+"','"+ticket.getStart_time()+"','"+ticket.getEnd_time()+"',"+ticket.getPrice()+");";
        String sql_2 = "insert into Train_ticket (user_id,train_id,start_station_name,end_station_name,carriage,seat_grade,seat_location,ride_time,start_time,end_time,price) " +
                "values ('"+ticket2.getUser_id()+"','"+ticket2.getTrain_id()+"','"+ticket2.getStart_station_name()+"','"+ticket2.getEnd_station_name()+"',"+ticket2.getCarriage()+","+ticket2.getSeat_grade()+"," +
                "'"+ticket2.getSeat_location()+"','"+ticket2.getRide_time()+"','"+ticket2.getStart_time()+"','"+ticket2.getEnd_time()+"',"+ticket2.getPrice()+");";

        String sql2 = "update Train_seat set occupy=0 where train_id='"+ticket.getTrain_id()+"' and carriage="+ticket.getCarriage()+" and seat_location='"+ticket.getSeat_location()+"' and ride_time='"+ticket.getRide_time()+"'";

        String sql3 = "insert into Ride_train values ('"+ticket.getUser_id()+"','"+ticket.getTrain_id()+"','"+ticket.getRide_time()+"')";

        String sql2_2 = "update Train_seat set occupy=0 where train_id='"+ticket2.getTrain_id()+"' and carriage="+ticket2.getCarriage()+" and seat_location='"+ticket2.getSeat_location()+"' and ride_time='"+ticket2.getRide_time()+"'";

        String sql3_2 = "insert into Ride_train values ('"+ticket2.getUser_id()+"','"+ticket2.getTrain_id()+"','"+ticket2.getRide_time()+"')";

        String sqls[] = new String[6];
        sqls[0] = sql;
        sqls[1] = sql2;
        sqls[2] = sql3;
        sqls[3] = sql_2;
        sqls[4] = sql2_2;
        sqls[5] = sql3_2;

        return Affairs.transaction_control(sqls);

    }

    //获取用户的user_id
    public static int getUser(String IDNumber) {

        String sql = " select user_id from Users_message where IDNumber='"+IDNumber+"'";

        int user_id = 0;

        try {
            ResultSet resultSet = JDBCTest.executeQuery(sql);

            while (resultSet.next()){
                user_id = resultSet.getInt(1);
                return user_id;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return user_id;

    }

    /*
    在前端,显示票价
     */
    public static double getPrice(String train_id,String start_station_name,String end_station_name,int seat,int stu){
        int start_mileage = getMileage(train_id,start_station_name);
        int end_mileage = getMileage(train_id,end_station_name);

        int mileage = Math.abs(start_mileage-end_mileage);

        double seat_grade = 0;
        if (seat==1){
            seat_grade = 2;
        }else if (seat==2){
            seat_grade = 1.5;
        }else {
            seat_grade = 1;
        }

        double train_grade = 0;
        switch (getTrainGrade(train_id)){
            case "G":
                train_grade = 2;
                break;
            case "D":
                train_grade = 1.5;
                break;
            case "Z":
                train_grade = 1.0;
                break;
            case "T":
                train_grade = 0.8;
                break;

            default:
                train_grade = 1;
                break;
        }

        double price = 0;
        if (stu==1){
            price = mileage/5*seat_grade*train_grade*0.7;
        }else {
            price = mileage/5*train_grade*seat_grade;
        }
        return price;
    }

    /*
    获得车票价格，在后端
     */
    public static double getPrice(Ticket ticket, String IDNumber) {
        int start_mileage = getMileage(ticket.getTrain_id(),ticket.getStart_station_name());
        int end_mileage = getMileage(ticket.getTrain_id(),ticket.getEnd_station_name());

        int mileage = Math.abs(start_mileage-end_mileage);

        double seat_grade = 0;
        if (ticket.getSeat_grade()==1){
            seat_grade = 2;
        }else if (ticket.getSeat_grade()==2){
            seat_grade = 1.5;
        }else {
            seat_grade = 1;
        }

        double train_grade = 0;
        switch (getTrainGrade(ticket.getTrain_id())){
            case "G":
                train_grade = 2;
                break;
            case "D":
                train_grade = 1.5;
                break;
            case "Z":
                train_grade = 1.0;
                break;
            case "T":
                train_grade = 0.8;
                break;

            default:
                train_grade = 1;
                break;
        }

        double price = 0;
        if (getStudent(IDNumber)==1){
            price = mileage/5*seat_grade*train_grade*0.7;
        }else {
            price = mileage/5*train_grade*seat_grade;
        }
        return price;
    }

    /*
    获得火车类型
     */
    private static String getTrainGrade(String train_id) {
        String sql = "select train_type from Train_message where train_id='"+train_id+"'";

        ResultSet resultSet = JDBCTest.executeQuery(sql);

        String train_type = "";

        try{
            while (resultSet.next()){
                train_type = resultSet.getString(1);
                return train_type;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return train_type;

    }

    /*
    判断是否是学生
     */
    private static int getStudent(String IDNumber) {

        String sql = "select stuStatus from Users_message where IDNumber='"+IDNumber+"'";

        ResultSet resultSet = JDBCTest.executeQuery(sql);

        int stu = 0;

        try{
            while (resultSet.next()){
                stu = resultSet.getInt(1);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return stu;

    }

    /*
    获得火车路程，train_id+station_name 返回 路程mileage
     */
    private static int getMileage(String train_id,String station_name){
        String sql = "select mileage from Train_message natural join Train_station natural join Stop_table where train_id='"+train_id+"' and station_name='"+station_name+"'";

        ResultSet resultSet = JDBCTest.executeQuery(sql);

        int mileage = 0;
        try{
            while (resultSet.next()){
                mileage = resultSet.getInt(1);
                return mileage;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return mileage;

    }

    /*
    获得火车到站时间
     */
    public static String getTime(String train_id,String station_name){
        String sql = "select arrive_time from Train_message natural join Train_station natural join Stop_table where train_id='"+train_id+"' and station_name='"+station_name+"'";

        ResultSet resultSet = JDBCTest.executeQuery(sql);

        String time = "";

        try{
            while (resultSet.next()){

                time = resultSet.getString(1);

                return time;

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return time;
    }






//    /*更改了数据库不再使用该方法
//    获取座位号和对剩余车座-1
//     */
//    private static String getLocation(String train_id, int seat_grade) {
//
//        String seat_grade_ticket;
//        if (seat_grade==1){
//            seat_grade_ticket = "a_remaining_seats";
//        }else if (seat_grade==2){
//            seat_grade_ticket = "b_remaining_seats";
//        }else {
//            seat_grade_ticket = "c_remaining_seats";
//        }
//
//        String sql = "select "+seat_grade_ticket+" from Train_message where train_id='"+train_id+"'";
//
//        ResultSet resultSet = JDBCTest.executeQuery(sql);
//
//        int number = 0;
//
//        try{
//            while (resultSet.next()){
//                number = resultSet.getInt(1);
//            }
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }
//
//        String location = "";
//
//        if (seat_grade==1){
//            location = number+"A";
//        }else if (seat_grade==2){
//            location = number+"B";
//        }else {
//            location = number+"C";
//        }
//
//        /*
//        确保操作的原子性,对车票-1
//         */
//        String sql2 = "update Train_message set "+seat_grade_ticket+"="+seat_grade_ticket+"-1 where train_id='"+train_id+"'";
//        JDBCTest.executeUpdate(sql2);
//
//        if (number<10){
//            location = "0" + location;
//        }
//
//        return location;
//
//    }


    


}
