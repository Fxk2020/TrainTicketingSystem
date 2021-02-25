package com.fxk.util;

import java.sql.*;

/***
 * 数据库的事务并发控制
 */
public class Affairs {

    static Connection conn=null;
    static {
        conn=DBConnection.getConnection();
    }

    public static int  transaction_control(String sql[]){

        Statement stmt = null;

        int result = 0;

        try {

            // 开启事务
            //不把其设置为true之前都是一个当作一个事务来处理
            conn.setAutoCommit(false);

            // 创造SQL语句

            // 执行SQL语句
            stmt = conn.createStatement();
            for (int i = 0; i < sql.length; i++) {
//                System.out.println(i+"*****************");
                stmt.executeUpdate(sql[i]);
            }

            // 提交事务
            conn.commit();

//            System.out.println( "OK!" );
        }
        //发生任何错误均需回滚
        catch (SQLIntegrityConstraintViolationException e3) {

            result = -1;//主码冲突，返回支付失败
            try {
                // 回滚事务
                //撤销上面对事务的所有操作哈！
                conn.rollback();
            }  catch (SQLException e2){
                e2.printStackTrace();
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("有错误！");

            try {
                // 回滚事务
                //撤销上面对事务的所有操作哈！
                conn.rollback();
            }  catch (SQLException e2){

            }
        }

        return result;

    }

}
