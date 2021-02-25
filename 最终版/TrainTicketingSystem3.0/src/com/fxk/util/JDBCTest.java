package com.fxk.util;

import java.sql.*;

public class JDBCTest {

    static Connection conn=null;
    static {
        conn=DBConnection.getConnection();
    }
    public static int executeUpdate(String sql) {
        int rows=0;//更新的行数
        try {
            Statement stmt=conn.createStatement();
            rows=stmt.executeUpdate(sql);
            System.out.println("更新数据操作完成");
        }
        catch (SQLIntegrityConstraintViolationException e2){
            System.out.println("主码冲突");
            return rows = -1;
        }
        catch (SQLException e) {
            // TODO: handle exception
            System.out.println("更新数据操作发生异常");

            e.printStackTrace();
            return rows = -2;
        }
        return rows;
    }



    public static int executeUpdate(String sql,Object[]params) {
        int rows=0;
        try {
            PreparedStatement pstmt=conn.prepareStatement(sql);
            for (int i = 0; i < params.length; i++) {
                pstmt.setObject(i+1,params[i]);
            }
            rows=pstmt.executeUpdate(sql);
        } catch (SQLException e) {
            // TODO: handle exception
            System.out.println("使用预编译语句更新数据操作发生异常");
        }
        return rows;
    }
    public static ResultSet executeQuery(String sql) {
        ResultSet rs=null;
        try {
            Statement stmt=conn.createStatement();
            rs=stmt.executeQuery(sql);
//            System.out.println("查询数据操作正常");
        } catch (SQLException e) {
            // TODO: handle exception
            System.out.println("查询数据操作发生异常");
        }
        return rs;
    }
    public static ResultSet executeQuery(String sql,Object[]params) {
        ResultSet rs=null;
        try {
            PreparedStatement pstmt=conn.prepareStatement(sql);
            for (int i = 0; i < params.length; i++) {
                pstmt.setObject(i+1,params[i]);
            }
            rs=pstmt.executeQuery(sql);
        } catch (SQLException e) {
            // TODO: handle exception
            System.out.println("使用预编译语句查询数据操作发生异常");
        }
        return rs;
    }




}
