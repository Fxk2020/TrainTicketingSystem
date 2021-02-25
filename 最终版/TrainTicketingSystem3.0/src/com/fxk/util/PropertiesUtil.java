package com.fxk.util;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

public class PropertiesUtil {

    private static DataSource ds;

    static {
        //1.加载配置文件
        Properties pro = new Properties();
        //使用getClassLoader()加载配置文件，获取字节输出流
        InputStream input = PropertiesUtil.class.getClassLoader().getResourceAsStream("druid.properties");
        try {
            pro.load(input);//input字节输入流
        } catch (IOException e) {
            e.printStackTrace();
        }

        //2.初始化连接池对象
        try {
            ds = DruidDataSourceFactory.createDataSource(pro);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    //获取连接池对象
    public static DataSource getDataSource(){
        return ds;
    }

    //获取connection对象
    public static Connection getConnection() throws SQLException {
        return ds.getConnection();
    }
}
